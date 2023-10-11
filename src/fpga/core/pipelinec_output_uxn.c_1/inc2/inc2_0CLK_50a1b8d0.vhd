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
-- Submodules: 72
entity inc2_0CLK_50a1b8d0 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end inc2_0CLK_50a1b8d0;
architecture arch of inc2_0CLK_50a1b8d0 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1468_c6_9ada]
signal BIN_OP_EQ_uxn_opcodes_h_l1468_c6_9ada_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1468_c6_9ada_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1468_c6_9ada_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1468_c1_ddef]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1468_c1_ddef_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1468_c1_ddef_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1468_c1_ddef_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1468_c1_ddef_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1468_c2_f30e]
signal tmp16_MUX_uxn_opcodes_h_l1468_c2_f30e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1468_c2_f30e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1468_c2_f30e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1468_c2_f30e]
signal t16_MUX_uxn_opcodes_h_l1468_c2_f30e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1468_c2_f30e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1468_c2_f30e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1468_c2_f30e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_f30e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_f30e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_f30e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1468_c2_f30e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_f30e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_f30e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_f30e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1468_c2_f30e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_f30e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_f30e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_f30e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1468_c2_f30e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_f30e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_f30e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_f30e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1468_c2_f30e]
signal result_stack_value_MUX_uxn_opcodes_h_l1468_c2_f30e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1468_c2_f30e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1468_c2_f30e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1468_c2_f30e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_f30e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_f30e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_f30e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1469_c3_1b53[uxn_opcodes_h_l1469_c3_1b53]
signal printf_uxn_opcodes_h_l1469_c3_1b53_uxn_opcodes_h_l1469_c3_1b53_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1473_c11_c372]
signal BIN_OP_EQ_uxn_opcodes_h_l1473_c11_c372_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1473_c11_c372_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1473_c11_c372_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1473_c7_6d5b]
signal tmp16_MUX_uxn_opcodes_h_l1473_c7_6d5b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1473_c7_6d5b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1473_c7_6d5b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1473_c7_6d5b]
signal t16_MUX_uxn_opcodes_h_l1473_c7_6d5b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1473_c7_6d5b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1473_c7_6d5b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1473_c7_6d5b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_6d5b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_6d5b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_6d5b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1473_c7_6d5b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1473_c7_6d5b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_6d5b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_6d5b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_6d5b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1473_c7_6d5b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1473_c7_6d5b]
signal result_stack_value_MUX_uxn_opcodes_h_l1473_c7_6d5b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1473_c7_6d5b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1473_c7_6d5b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1473_c7_6d5b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_6d5b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_6d5b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_6d5b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1476_c11_e26a]
signal BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e26a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e26a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e26a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1476_c7_faf5]
signal tmp16_MUX_uxn_opcodes_h_l1476_c7_faf5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1476_c7_faf5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1476_c7_faf5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1476_c7_faf5]
signal t16_MUX_uxn_opcodes_h_l1476_c7_faf5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1476_c7_faf5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1476_c7_faf5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1476_c7_faf5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_faf5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_faf5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_faf5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1476_c7_faf5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_faf5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_faf5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_faf5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1476_c7_faf5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_faf5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_faf5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_faf5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1476_c7_faf5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_faf5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_faf5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_faf5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1476_c7_faf5]
signal result_stack_value_MUX_uxn_opcodes_h_l1476_c7_faf5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1476_c7_faf5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1476_c7_faf5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1476_c7_faf5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_faf5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_faf5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_faf5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1478_c3_0111]
signal CONST_SL_8_uxn_opcodes_h_l1478_c3_0111_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1478_c3_0111_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1481_c11_82dc]
signal BIN_OP_EQ_uxn_opcodes_h_l1481_c11_82dc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1481_c11_82dc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1481_c11_82dc_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1481_c7_ff06]
signal tmp16_MUX_uxn_opcodes_h_l1481_c7_ff06_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1481_c7_ff06_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1481_c7_ff06_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1481_c7_ff06]
signal t16_MUX_uxn_opcodes_h_l1481_c7_ff06_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1481_c7_ff06_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1481_c7_ff06_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1481_c7_ff06]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_ff06_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_ff06_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_ff06_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1481_c7_ff06]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_ff06_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_ff06_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_ff06_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1481_c7_ff06]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_ff06_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_ff06_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_ff06_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1481_c7_ff06]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_ff06_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_ff06_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_ff06_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1481_c7_ff06]
signal result_stack_value_MUX_uxn_opcodes_h_l1481_c7_ff06_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1481_c7_ff06_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1481_c7_ff06_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1481_c7_ff06]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_ff06_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_ff06_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_ff06_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1484_c11_9344]
signal BIN_OP_EQ_uxn_opcodes_h_l1484_c11_9344_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1484_c11_9344_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1484_c11_9344_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1484_c7_208c]
signal tmp16_MUX_uxn_opcodes_h_l1484_c7_208c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1484_c7_208c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1484_c7_208c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1484_c7_208c_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1484_c7_208c]
signal t16_MUX_uxn_opcodes_h_l1484_c7_208c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1484_c7_208c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1484_c7_208c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1484_c7_208c_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1484_c7_208c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_208c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_208c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_208c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_208c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1484_c7_208c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_208c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_208c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_208c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_208c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1484_c7_208c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_208c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_208c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_208c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_208c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1484_c7_208c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_208c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_208c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_208c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_208c_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1484_c7_208c]
signal result_stack_value_MUX_uxn_opcodes_h_l1484_c7_208c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1484_c7_208c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1484_c7_208c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1484_c7_208c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1484_c7_208c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_208c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_208c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_208c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_208c_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1485_c3_530b]
signal BIN_OP_OR_uxn_opcodes_h_l1485_c3_530b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1485_c3_530b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1485_c3_530b_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1486_c11_c823]
signal BIN_OP_PLUS_uxn_opcodes_h_l1486_c11_c823_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1486_c11_c823_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1486_c11_c823_return_output : unsigned(16 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1488_c32_8eeb]
signal BIN_OP_AND_uxn_opcodes_h_l1488_c32_8eeb_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1488_c32_8eeb_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1488_c32_8eeb_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1488_c32_6e61]
signal BIN_OP_GT_uxn_opcodes_h_l1488_c32_6e61_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1488_c32_6e61_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1488_c32_6e61_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1488_c32_3a20]
signal MUX_uxn_opcodes_h_l1488_c32_3a20_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1488_c32_3a20_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1488_c32_3a20_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1488_c32_3a20_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1490_c11_aecb]
signal BIN_OP_EQ_uxn_opcodes_h_l1490_c11_aecb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1490_c11_aecb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1490_c11_aecb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1490_c7_3fa8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_3fa8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_3fa8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_3fa8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_3fa8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1490_c7_3fa8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_3fa8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_3fa8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_3fa8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_3fa8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1490_c7_3fa8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_3fa8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_3fa8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_3fa8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_3fa8_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1490_c7_3fa8]
signal result_stack_value_MUX_uxn_opcodes_h_l1490_c7_3fa8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1490_c7_3fa8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1490_c7_3fa8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1490_c7_3fa8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1490_c7_3fa8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_3fa8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_3fa8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_3fa8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_3fa8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1496_c11_0ae4]
signal BIN_OP_EQ_uxn_opcodes_h_l1496_c11_0ae4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1496_c11_0ae4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1496_c11_0ae4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1496_c7_f0af]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_f0af_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_f0af_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_f0af_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_f0af_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1496_c7_f0af]
signal result_stack_value_MUX_uxn_opcodes_h_l1496_c7_f0af_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1496_c7_f0af_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1496_c7_f0af_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1496_c7_f0af_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1496_c7_f0af]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_f0af_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_f0af_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_f0af_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_f0af_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1496_c7_f0af]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_f0af_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_f0af_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_f0af_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_f0af_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1498_c34_132d]
signal CONST_SR_8_uxn_opcodes_h_l1498_c34_132d_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1498_c34_132d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1500_c11_3ee8]
signal BIN_OP_EQ_uxn_opcodes_h_l1500_c11_3ee8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1500_c11_3ee8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1500_c11_3ee8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1500_c7_bcc8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_bcc8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_bcc8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_bcc8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_bcc8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1500_c7_bcc8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_bcc8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_bcc8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_bcc8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_bcc8_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1468_c6_9ada
BIN_OP_EQ_uxn_opcodes_h_l1468_c6_9ada : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1468_c6_9ada_left,
BIN_OP_EQ_uxn_opcodes_h_l1468_c6_9ada_right,
BIN_OP_EQ_uxn_opcodes_h_l1468_c6_9ada_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1468_c1_ddef
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1468_c1_ddef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1468_c1_ddef_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1468_c1_ddef_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1468_c1_ddef_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1468_c1_ddef_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1468_c2_f30e
tmp16_MUX_uxn_opcodes_h_l1468_c2_f30e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1468_c2_f30e_cond,
tmp16_MUX_uxn_opcodes_h_l1468_c2_f30e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1468_c2_f30e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output);

-- t16_MUX_uxn_opcodes_h_l1468_c2_f30e
t16_MUX_uxn_opcodes_h_l1468_c2_f30e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1468_c2_f30e_cond,
t16_MUX_uxn_opcodes_h_l1468_c2_f30e_iftrue,
t16_MUX_uxn_opcodes_h_l1468_c2_f30e_iffalse,
t16_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_f30e
result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_f30e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_f30e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_f30e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_f30e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_f30e
result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_f30e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_f30e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_f30e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_f30e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_f30e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_f30e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_f30e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_f30e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_f30e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_f30e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_f30e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_f30e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_f30e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_f30e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1468_c2_f30e
result_stack_value_MUX_uxn_opcodes_h_l1468_c2_f30e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1468_c2_f30e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1468_c2_f30e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1468_c2_f30e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_f30e
result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_f30e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_f30e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_f30e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_f30e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output);

-- printf_uxn_opcodes_h_l1469_c3_1b53_uxn_opcodes_h_l1469_c3_1b53
printf_uxn_opcodes_h_l1469_c3_1b53_uxn_opcodes_h_l1469_c3_1b53 : entity work.printf_uxn_opcodes_h_l1469_c3_1b53_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1469_c3_1b53_uxn_opcodes_h_l1469_c3_1b53_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1473_c11_c372
BIN_OP_EQ_uxn_opcodes_h_l1473_c11_c372 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1473_c11_c372_left,
BIN_OP_EQ_uxn_opcodes_h_l1473_c11_c372_right,
BIN_OP_EQ_uxn_opcodes_h_l1473_c11_c372_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1473_c7_6d5b
tmp16_MUX_uxn_opcodes_h_l1473_c7_6d5b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1473_c7_6d5b_cond,
tmp16_MUX_uxn_opcodes_h_l1473_c7_6d5b_iftrue,
tmp16_MUX_uxn_opcodes_h_l1473_c7_6d5b_iffalse,
tmp16_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output);

-- t16_MUX_uxn_opcodes_h_l1473_c7_6d5b
t16_MUX_uxn_opcodes_h_l1473_c7_6d5b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1473_c7_6d5b_cond,
t16_MUX_uxn_opcodes_h_l1473_c7_6d5b_iftrue,
t16_MUX_uxn_opcodes_h_l1473_c7_6d5b_iffalse,
t16_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_6d5b
result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_6d5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_6d5b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_6d5b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_6d5b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b
result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_6d5b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_6d5b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_6d5b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_6d5b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_6d5b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1473_c7_6d5b
result_stack_value_MUX_uxn_opcodes_h_l1473_c7_6d5b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1473_c7_6d5b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1473_c7_6d5b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1473_c7_6d5b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_6d5b
result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_6d5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_6d5b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_6d5b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_6d5b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e26a
BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e26a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e26a_left,
BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e26a_right,
BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e26a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1476_c7_faf5
tmp16_MUX_uxn_opcodes_h_l1476_c7_faf5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1476_c7_faf5_cond,
tmp16_MUX_uxn_opcodes_h_l1476_c7_faf5_iftrue,
tmp16_MUX_uxn_opcodes_h_l1476_c7_faf5_iffalse,
tmp16_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output);

-- t16_MUX_uxn_opcodes_h_l1476_c7_faf5
t16_MUX_uxn_opcodes_h_l1476_c7_faf5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1476_c7_faf5_cond,
t16_MUX_uxn_opcodes_h_l1476_c7_faf5_iftrue,
t16_MUX_uxn_opcodes_h_l1476_c7_faf5_iffalse,
t16_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_faf5
result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_faf5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_faf5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_faf5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_faf5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_faf5
result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_faf5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_faf5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_faf5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_faf5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_faf5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_faf5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_faf5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_faf5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_faf5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_faf5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_faf5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_faf5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_faf5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_faf5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1476_c7_faf5
result_stack_value_MUX_uxn_opcodes_h_l1476_c7_faf5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1476_c7_faf5_cond,
result_stack_value_MUX_uxn_opcodes_h_l1476_c7_faf5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1476_c7_faf5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_faf5
result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_faf5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_faf5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_faf5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_faf5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1478_c3_0111
CONST_SL_8_uxn_opcodes_h_l1478_c3_0111 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1478_c3_0111_x,
CONST_SL_8_uxn_opcodes_h_l1478_c3_0111_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1481_c11_82dc
BIN_OP_EQ_uxn_opcodes_h_l1481_c11_82dc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1481_c11_82dc_left,
BIN_OP_EQ_uxn_opcodes_h_l1481_c11_82dc_right,
BIN_OP_EQ_uxn_opcodes_h_l1481_c11_82dc_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1481_c7_ff06
tmp16_MUX_uxn_opcodes_h_l1481_c7_ff06 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1481_c7_ff06_cond,
tmp16_MUX_uxn_opcodes_h_l1481_c7_ff06_iftrue,
tmp16_MUX_uxn_opcodes_h_l1481_c7_ff06_iffalse,
tmp16_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output);

-- t16_MUX_uxn_opcodes_h_l1481_c7_ff06
t16_MUX_uxn_opcodes_h_l1481_c7_ff06 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1481_c7_ff06_cond,
t16_MUX_uxn_opcodes_h_l1481_c7_ff06_iftrue,
t16_MUX_uxn_opcodes_h_l1481_c7_ff06_iffalse,
t16_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_ff06
result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_ff06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_ff06_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_ff06_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_ff06_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_ff06
result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_ff06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_ff06_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_ff06_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_ff06_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_ff06
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_ff06 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_ff06_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_ff06_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_ff06_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_ff06
result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_ff06 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_ff06_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_ff06_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_ff06_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1481_c7_ff06
result_stack_value_MUX_uxn_opcodes_h_l1481_c7_ff06 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1481_c7_ff06_cond,
result_stack_value_MUX_uxn_opcodes_h_l1481_c7_ff06_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1481_c7_ff06_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_ff06
result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_ff06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_ff06_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_ff06_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_ff06_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1484_c11_9344
BIN_OP_EQ_uxn_opcodes_h_l1484_c11_9344 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1484_c11_9344_left,
BIN_OP_EQ_uxn_opcodes_h_l1484_c11_9344_right,
BIN_OP_EQ_uxn_opcodes_h_l1484_c11_9344_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1484_c7_208c
tmp16_MUX_uxn_opcodes_h_l1484_c7_208c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1484_c7_208c_cond,
tmp16_MUX_uxn_opcodes_h_l1484_c7_208c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1484_c7_208c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1484_c7_208c_return_output);

-- t16_MUX_uxn_opcodes_h_l1484_c7_208c
t16_MUX_uxn_opcodes_h_l1484_c7_208c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1484_c7_208c_cond,
t16_MUX_uxn_opcodes_h_l1484_c7_208c_iftrue,
t16_MUX_uxn_opcodes_h_l1484_c7_208c_iffalse,
t16_MUX_uxn_opcodes_h_l1484_c7_208c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_208c
result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_208c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_208c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_208c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_208c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_208c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_208c
result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_208c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_208c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_208c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_208c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_208c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_208c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_208c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_208c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_208c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_208c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_208c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_208c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_208c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_208c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_208c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_208c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_208c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1484_c7_208c
result_stack_value_MUX_uxn_opcodes_h_l1484_c7_208c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1484_c7_208c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1484_c7_208c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1484_c7_208c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1484_c7_208c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_208c
result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_208c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_208c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_208c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_208c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_208c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1485_c3_530b
BIN_OP_OR_uxn_opcodes_h_l1485_c3_530b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1485_c3_530b_left,
BIN_OP_OR_uxn_opcodes_h_l1485_c3_530b_right,
BIN_OP_OR_uxn_opcodes_h_l1485_c3_530b_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1486_c11_c823
BIN_OP_PLUS_uxn_opcodes_h_l1486_c11_c823 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1486_c11_c823_left,
BIN_OP_PLUS_uxn_opcodes_h_l1486_c11_c823_right,
BIN_OP_PLUS_uxn_opcodes_h_l1486_c11_c823_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1488_c32_8eeb
BIN_OP_AND_uxn_opcodes_h_l1488_c32_8eeb : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1488_c32_8eeb_left,
BIN_OP_AND_uxn_opcodes_h_l1488_c32_8eeb_right,
BIN_OP_AND_uxn_opcodes_h_l1488_c32_8eeb_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1488_c32_6e61
BIN_OP_GT_uxn_opcodes_h_l1488_c32_6e61 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1488_c32_6e61_left,
BIN_OP_GT_uxn_opcodes_h_l1488_c32_6e61_right,
BIN_OP_GT_uxn_opcodes_h_l1488_c32_6e61_return_output);

-- MUX_uxn_opcodes_h_l1488_c32_3a20
MUX_uxn_opcodes_h_l1488_c32_3a20 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1488_c32_3a20_cond,
MUX_uxn_opcodes_h_l1488_c32_3a20_iftrue,
MUX_uxn_opcodes_h_l1488_c32_3a20_iffalse,
MUX_uxn_opcodes_h_l1488_c32_3a20_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1490_c11_aecb
BIN_OP_EQ_uxn_opcodes_h_l1490_c11_aecb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1490_c11_aecb_left,
BIN_OP_EQ_uxn_opcodes_h_l1490_c11_aecb_right,
BIN_OP_EQ_uxn_opcodes_h_l1490_c11_aecb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_3fa8
result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_3fa8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_3fa8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_3fa8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_3fa8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_3fa8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_3fa8
result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_3fa8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_3fa8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_3fa8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_3fa8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_3fa8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_3fa8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_3fa8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_3fa8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_3fa8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_3fa8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_3fa8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1490_c7_3fa8
result_stack_value_MUX_uxn_opcodes_h_l1490_c7_3fa8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1490_c7_3fa8_cond,
result_stack_value_MUX_uxn_opcodes_h_l1490_c7_3fa8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1490_c7_3fa8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1490_c7_3fa8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_3fa8
result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_3fa8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_3fa8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_3fa8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_3fa8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_3fa8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1496_c11_0ae4
BIN_OP_EQ_uxn_opcodes_h_l1496_c11_0ae4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1496_c11_0ae4_left,
BIN_OP_EQ_uxn_opcodes_h_l1496_c11_0ae4_right,
BIN_OP_EQ_uxn_opcodes_h_l1496_c11_0ae4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_f0af
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_f0af : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_f0af_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_f0af_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_f0af_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_f0af_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1496_c7_f0af
result_stack_value_MUX_uxn_opcodes_h_l1496_c7_f0af : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1496_c7_f0af_cond,
result_stack_value_MUX_uxn_opcodes_h_l1496_c7_f0af_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1496_c7_f0af_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1496_c7_f0af_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_f0af
result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_f0af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_f0af_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_f0af_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_f0af_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_f0af_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_f0af
result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_f0af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_f0af_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_f0af_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_f0af_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_f0af_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1498_c34_132d
CONST_SR_8_uxn_opcodes_h_l1498_c34_132d : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1498_c34_132d_x,
CONST_SR_8_uxn_opcodes_h_l1498_c34_132d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1500_c11_3ee8
BIN_OP_EQ_uxn_opcodes_h_l1500_c11_3ee8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1500_c11_3ee8_left,
BIN_OP_EQ_uxn_opcodes_h_l1500_c11_3ee8_right,
BIN_OP_EQ_uxn_opcodes_h_l1500_c11_3ee8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_bcc8
result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_bcc8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_bcc8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_bcc8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_bcc8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_bcc8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_bcc8
result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_bcc8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_bcc8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_bcc8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_bcc8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_bcc8_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1468_c6_9ada_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1468_c1_ddef_return_output,
 tmp16_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output,
 t16_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1473_c11_c372_return_output,
 tmp16_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output,
 t16_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e26a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output,
 t16_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output,
 CONST_SL_8_uxn_opcodes_h_l1478_c3_0111_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1481_c11_82dc_return_output,
 tmp16_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output,
 t16_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1484_c11_9344_return_output,
 tmp16_MUX_uxn_opcodes_h_l1484_c7_208c_return_output,
 t16_MUX_uxn_opcodes_h_l1484_c7_208c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_208c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_208c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_208c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_208c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1484_c7_208c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_208c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1485_c3_530b_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1486_c11_c823_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1488_c32_8eeb_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1488_c32_6e61_return_output,
 MUX_uxn_opcodes_h_l1488_c32_3a20_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1490_c11_aecb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_3fa8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_3fa8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_3fa8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1490_c7_3fa8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_3fa8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1496_c11_0ae4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_f0af_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1496_c7_f0af_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_f0af_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_f0af_return_output,
 CONST_SR_8_uxn_opcodes_h_l1498_c34_132d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1500_c11_3ee8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_bcc8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_bcc8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c6_9ada_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c6_9ada_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c6_9ada_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1468_c1_ddef_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1468_c1_ddef_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1468_c1_ddef_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1468_c1_ddef_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1468_c2_f30e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1468_c2_f30e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1468_c2_f30e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1468_c2_f30e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1468_c2_f30e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1468_c2_f30e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_f30e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_f30e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_f30e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_f30e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_f30e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_f30e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_f30e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1470_c3_4201 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_f30e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_f30e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_f30e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_f30e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_f30e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1468_c2_f30e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1468_c2_f30e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1468_c2_f30e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_f30e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_f30e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_f30e_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1469_c3_1b53_uxn_opcodes_h_l1469_c3_1b53_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1473_c11_c372_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1473_c11_c372_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1473_c11_c372_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1473_c7_6d5b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1473_c7_6d5b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1473_c7_6d5b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1473_c7_6d5b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1473_c7_6d5b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1473_c7_6d5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_6d5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_6d5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_6d5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_6d5b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1474_c3_2e94 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_6d5b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_6d5b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1473_c7_6d5b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1473_c7_6d5b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1473_c7_6d5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_6d5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_6d5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_6d5b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e26a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e26a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e26a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1476_c7_faf5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1476_c7_faf5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1476_c7_faf5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1476_c7_faf5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1476_c7_faf5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1476_c7_faf5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_faf5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_faf5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_faf5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_faf5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_faf5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_faf5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_faf5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1479_c3_b8a9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_faf5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_faf5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_faf5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_faf5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_faf5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1476_c7_faf5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1476_c7_faf5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1476_c7_faf5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_faf5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_faf5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_faf5_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1478_c3_0111_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1478_c3_0111_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1481_c11_82dc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1481_c11_82dc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1481_c11_82dc_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1481_c7_ff06_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1481_c7_ff06_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1484_c7_208c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1481_c7_ff06_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1481_c7_ff06_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1481_c7_ff06_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1484_c7_208c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1481_c7_ff06_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_ff06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_ff06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_208c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_ff06_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_ff06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_ff06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_208c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_ff06_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_ff06_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1482_c3_c5b1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_ff06_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_208c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_ff06_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_ff06_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_ff06_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_208c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_ff06_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1481_c7_ff06_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1481_c7_ff06_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1484_c7_208c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1481_c7_ff06_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_ff06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_ff06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_208c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_ff06_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c11_9344_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c11_9344_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c11_9344_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1484_c7_208c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l1486_c3_c016 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1484_c7_208c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1484_c7_208c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1484_c7_208c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1484_c7_208c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1484_c7_208c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_208c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_208c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_3fa8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_208c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_208c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_208c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_3fa8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_208c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_208c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_208c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_3fa8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_208c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_208c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_208c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_208c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1484_c7_208c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1484_c7_208c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1490_c7_3fa8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1484_c7_208c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_208c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_208c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_3fa8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_208c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1485_c3_530b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1485_c3_530b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1485_c3_530b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1486_c11_c823_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1486_c11_c823_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1486_c11_c823_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1488_c32_3a20_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1488_c32_3a20_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1488_c32_3a20_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1488_c32_8eeb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1488_c32_8eeb_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1488_c32_8eeb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1488_c32_6e61_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1488_c32_6e61_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1488_c32_6e61_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1488_c32_3a20_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_aecb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_aecb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_aecb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_3fa8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_3fa8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_f0af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_3fa8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_3fa8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_3fa8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_3fa8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_3fa8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1493_c3_1bda : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_3fa8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_f0af_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_3fa8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1490_c7_3fa8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1490_c7_3fa8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1496_c7_f0af_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1490_c7_3fa8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_3fa8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_3fa8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_f0af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_3fa8_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1494_c24_fdc6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_0ae4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_0ae4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_0ae4_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_f0af_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1497_c3_f331 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_f0af_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_f0af_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1496_c7_f0af_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1496_c7_f0af_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1496_c7_f0af_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_f0af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_f0af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_bcc8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_f0af_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_f0af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_f0af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_bcc8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_f0af_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1498_c34_132d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1498_c34_132d_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1498_c24_c115_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_3ee8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_3ee8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_3ee8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_bcc8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_bcc8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_bcc8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_bcc8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_bcc8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_bcc8_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1476_l1468_l1496_l1484_l1500_l1481_l1473_DUPLICATE_88e5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1476_l1468_l1490_l1481_l1473_DUPLICATE_ce7c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1476_l1468_l1484_l1481_l1473_DUPLICATE_c316_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1476_l1468_l1496_l1484_l1481_l1473_DUPLICATE_bf2e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1476_l1496_l1490_l1484_l1500_l1481_l1473_DUPLICATE_db0d_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1485_l1477_DUPLICATE_91f9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1484_l1496_DUPLICATE_1a63_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1505_l1464_DUPLICATE_8e73_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_MUX_uxn_opcodes_h_l1488_c32_3a20_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1493_c3_1bda := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_3fa8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1493_c3_1bda;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_208c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_0ae4_right := to_unsigned(6, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1468_c1_ddef_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1488_c32_8eeb_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c11_9344_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1482_c3_c5b1 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_ff06_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1482_c3_c5b1;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1479_c3_b8a9 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_faf5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1479_c3_b8a9;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_bcc8_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1486_c11_c823_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_3ee8_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1474_c3_2e94 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_6d5b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1474_c3_2e94;
     VAR_MUX_uxn_opcodes_h_l1488_c32_3a20_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1473_c11_c372_right := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1488_c32_6e61_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_3fa8_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1497_c3_f331 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_f0af_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1497_c3_f331;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_aecb_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_3fa8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c6_9ada_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e26a_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_f30e_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_bcc8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1481_c11_82dc_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1470_c3_4201 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_f30e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1470_c3_4201;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1468_c1_ddef_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1488_c32_8eeb_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c6_9ada_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1473_c11_c372_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e26a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1481_c11_82dc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c11_9344_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_aecb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_0ae4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_3ee8_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1485_c3_530b_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1468_c2_f30e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1473_c7_6d5b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1481_c7_ff06_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1484_c7_208c_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1498_c34_132d_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1468_c2_f30e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1473_c7_6d5b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1476_c7_faf5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1481_c7_ff06_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1484_c7_208c_iffalse := tmp16;
     -- CONST_SR_8[uxn_opcodes_h_l1498_c34_132d] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1498_c34_132d_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1498_c34_132d_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1498_c34_132d_return_output := CONST_SR_8_uxn_opcodes_h_l1498_c34_132d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1490_c11_aecb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1490_c11_aecb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_aecb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1490_c11_aecb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_aecb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_aecb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1490_c11_aecb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1481_c11_82dc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1481_c11_82dc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1481_c11_82dc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1481_c11_82dc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1481_c11_82dc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1481_c11_82dc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1481_c11_82dc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1473_c11_c372] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1473_c11_c372_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1473_c11_c372_left;
     BIN_OP_EQ_uxn_opcodes_h_l1473_c11_c372_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1473_c11_c372_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1473_c11_c372_return_output := BIN_OP_EQ_uxn_opcodes_h_l1473_c11_c372_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1476_l1468_l1496_l1484_l1481_l1473_DUPLICATE_bf2e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1476_l1468_l1496_l1484_l1481_l1473_DUPLICATE_bf2e_return_output := result.stack_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1484_l1496_DUPLICATE_1a63 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1484_l1496_DUPLICATE_1a63_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1496_c11_0ae4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1496_c11_0ae4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_0ae4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1496_c11_0ae4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_0ae4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_0ae4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1496_c11_0ae4_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1485_l1477_DUPLICATE_91f9 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1485_l1477_DUPLICATE_91f9_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1484_c11_9344] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1484_c11_9344_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c11_9344_left;
     BIN_OP_EQ_uxn_opcodes_h_l1484_c11_9344_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c11_9344_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c11_9344_return_output := BIN_OP_EQ_uxn_opcodes_h_l1484_c11_9344_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1476_l1468_l1484_l1481_l1473_DUPLICATE_c316 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1476_l1468_l1484_l1481_l1473_DUPLICATE_c316_return_output := result.sp_relative_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l1488_c32_8eeb] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1488_c32_8eeb_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1488_c32_8eeb_left;
     BIN_OP_AND_uxn_opcodes_h_l1488_c32_8eeb_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1488_c32_8eeb_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1488_c32_8eeb_return_output := BIN_OP_AND_uxn_opcodes_h_l1488_c32_8eeb_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1476_l1496_l1490_l1484_l1500_l1481_l1473_DUPLICATE_db0d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1476_l1496_l1490_l1484_l1500_l1481_l1473_DUPLICATE_db0d_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1468_c6_9ada] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1468_c6_9ada_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c6_9ada_left;
     BIN_OP_EQ_uxn_opcodes_h_l1468_c6_9ada_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c6_9ada_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c6_9ada_return_output := BIN_OP_EQ_uxn_opcodes_h_l1468_c6_9ada_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1494_c24_fdc6] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1494_c24_fdc6_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1476_l1468_l1496_l1484_l1500_l1481_l1473_DUPLICATE_88e5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1476_l1468_l1496_l1484_l1500_l1481_l1473_DUPLICATE_88e5_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1476_c11_e26a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e26a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e26a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e26a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e26a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e26a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e26a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1500_c11_3ee8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1500_c11_3ee8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_3ee8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1500_c11_3ee8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_3ee8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_3ee8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1500_c11_3ee8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1476_l1468_l1490_l1481_l1473_DUPLICATE_ce7c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1476_l1468_l1490_l1481_l1473_DUPLICATE_ce7c_return_output := result.is_sp_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1488_c32_6e61_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1488_c32_8eeb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1468_c1_ddef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c6_9ada_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_f30e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c6_9ada_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_f30e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c6_9ada_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_f30e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c6_9ada_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_f30e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c6_9ada_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_f30e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c6_9ada_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1468_c2_f30e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c6_9ada_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1468_c2_f30e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c6_9ada_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1468_c2_f30e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c6_9ada_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_6d5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1473_c11_c372_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1473_c11_c372_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_6d5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1473_c11_c372_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1473_c11_c372_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_6d5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1473_c11_c372_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1473_c7_6d5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1473_c11_c372_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1473_c7_6d5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1473_c11_c372_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1473_c7_6d5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1473_c11_c372_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_faf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e26a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_faf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e26a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_faf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e26a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_faf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e26a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_faf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e26a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1476_c7_faf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e26a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1476_c7_faf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e26a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1476_c7_faf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e26a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_ff06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1481_c11_82dc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_ff06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1481_c11_82dc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_ff06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1481_c11_82dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_ff06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1481_c11_82dc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_ff06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1481_c11_82dc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1481_c7_ff06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1481_c11_82dc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1481_c7_ff06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1481_c11_82dc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1481_c7_ff06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1481_c11_82dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_208c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c11_9344_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_208c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c11_9344_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_208c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c11_9344_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_208c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c11_9344_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_208c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c11_9344_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1484_c7_208c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c11_9344_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1484_c7_208c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c11_9344_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1484_c7_208c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c11_9344_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_3fa8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_aecb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_3fa8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_aecb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_3fa8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_aecb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_3fa8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_aecb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1490_c7_3fa8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_aecb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_f0af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_0ae4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_f0af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_0ae4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_f0af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_0ae4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1496_c7_f0af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_0ae4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_bcc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_3ee8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_bcc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_3ee8_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1485_c3_530b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1485_l1477_DUPLICATE_91f9_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1478_c3_0111_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1485_l1477_DUPLICATE_91f9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1490_c7_3fa8_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1494_c24_fdc6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_f30e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1476_l1468_l1484_l1481_l1473_DUPLICATE_c316_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1476_l1468_l1484_l1481_l1473_DUPLICATE_c316_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_faf5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1476_l1468_l1484_l1481_l1473_DUPLICATE_c316_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_ff06_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1476_l1468_l1484_l1481_l1473_DUPLICATE_c316_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_208c_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1476_l1468_l1484_l1481_l1473_DUPLICATE_c316_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_6d5b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1476_l1496_l1490_l1484_l1500_l1481_l1473_DUPLICATE_db0d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_faf5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1476_l1496_l1490_l1484_l1500_l1481_l1473_DUPLICATE_db0d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_ff06_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1476_l1496_l1490_l1484_l1500_l1481_l1473_DUPLICATE_db0d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_208c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1476_l1496_l1490_l1484_l1500_l1481_l1473_DUPLICATE_db0d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_3fa8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1476_l1496_l1490_l1484_l1500_l1481_l1473_DUPLICATE_db0d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_f0af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1476_l1496_l1490_l1484_l1500_l1481_l1473_DUPLICATE_db0d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_bcc8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1476_l1496_l1490_l1484_l1500_l1481_l1473_DUPLICATE_db0d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_f30e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1476_l1468_l1490_l1481_l1473_DUPLICATE_ce7c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1476_l1468_l1490_l1481_l1473_DUPLICATE_ce7c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_faf5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1476_l1468_l1490_l1481_l1473_DUPLICATE_ce7c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_ff06_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1476_l1468_l1490_l1481_l1473_DUPLICATE_ce7c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_3fa8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1476_l1468_l1490_l1481_l1473_DUPLICATE_ce7c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_f30e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1476_l1468_l1496_l1484_l1500_l1481_l1473_DUPLICATE_88e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_6d5b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1476_l1468_l1496_l1484_l1500_l1481_l1473_DUPLICATE_88e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_faf5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1476_l1468_l1496_l1484_l1500_l1481_l1473_DUPLICATE_88e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_ff06_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1476_l1468_l1496_l1484_l1500_l1481_l1473_DUPLICATE_88e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_208c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1476_l1468_l1496_l1484_l1500_l1481_l1473_DUPLICATE_88e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_f0af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1476_l1468_l1496_l1484_l1500_l1481_l1473_DUPLICATE_88e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_bcc8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1476_l1468_l1496_l1484_l1500_l1481_l1473_DUPLICATE_88e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_208c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1484_l1496_DUPLICATE_1a63_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_f0af_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1484_l1496_DUPLICATE_1a63_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1468_c2_f30e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1476_l1468_l1496_l1484_l1481_l1473_DUPLICATE_bf2e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1473_c7_6d5b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1476_l1468_l1496_l1484_l1481_l1473_DUPLICATE_bf2e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1476_c7_faf5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1476_l1468_l1496_l1484_l1481_l1473_DUPLICATE_bf2e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1481_c7_ff06_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1476_l1468_l1496_l1484_l1481_l1473_DUPLICATE_bf2e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1484_c7_208c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1476_l1468_l1496_l1484_l1481_l1473_DUPLICATE_bf2e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1496_c7_f0af_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1476_l1468_l1496_l1484_l1481_l1473_DUPLICATE_bf2e_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l1498_c24_c115] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1498_c24_c115_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1498_c34_132d_return_output);

     -- BIN_OP_GT[uxn_opcodes_h_l1488_c32_6e61] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1488_c32_6e61_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1488_c32_6e61_left;
     BIN_OP_GT_uxn_opcodes_h_l1488_c32_6e61_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1488_c32_6e61_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1488_c32_6e61_return_output := BIN_OP_GT_uxn_opcodes_h_l1488_c32_6e61_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1496_c7_f0af] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_f0af_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_f0af_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_f0af_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_f0af_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_f0af_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_f0af_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_f0af_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_f0af_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1500_c7_bcc8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_bcc8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_bcc8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_bcc8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_bcc8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_bcc8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_bcc8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_bcc8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_bcc8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1500_c7_bcc8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_bcc8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_bcc8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_bcc8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_bcc8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_bcc8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_bcc8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_bcc8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_bcc8_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1485_c3_530b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1485_c3_530b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1485_c3_530b_left;
     BIN_OP_OR_uxn_opcodes_h_l1485_c3_530b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1485_c3_530b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1485_c3_530b_return_output := BIN_OP_OR_uxn_opcodes_h_l1485_c3_530b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1468_c1_ddef] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1468_c1_ddef_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1468_c1_ddef_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1468_c1_ddef_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1468_c1_ddef_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1468_c1_ddef_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1468_c1_ddef_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1468_c1_ddef_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1468_c1_ddef_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1478_c3_0111] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1478_c3_0111_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1478_c3_0111_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1478_c3_0111_return_output := CONST_SL_8_uxn_opcodes_h_l1478_c3_0111_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1490_c7_3fa8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_3fa8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_3fa8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_3fa8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_3fa8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_3fa8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_3fa8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_3fa8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_3fa8_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1488_c32_3a20_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1488_c32_6e61_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1486_c11_c823_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1485_c3_530b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1484_c7_208c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1485_c3_530b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1496_c7_f0af_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1498_c24_c115_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1476_c7_faf5_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1478_c3_0111_return_output;
     VAR_printf_uxn_opcodes_h_l1469_c3_1b53_uxn_opcodes_h_l1469_c3_1b53_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1468_c1_ddef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_f0af_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_bcc8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_208c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_3fa8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_f0af_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_bcc8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_3fa8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_f0af_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1496_c7_f0af] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1496_c7_f0af_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1496_c7_f0af_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1496_c7_f0af_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1496_c7_f0af_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1496_c7_f0af_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1496_c7_f0af_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1496_c7_f0af_return_output := result_stack_value_MUX_uxn_opcodes_h_l1496_c7_f0af_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1484_c7_208c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_208c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_208c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_208c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_208c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_208c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_208c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_208c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_208c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1496_c7_f0af] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_f0af_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_f0af_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_f0af_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_f0af_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_f0af_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_f0af_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_f0af_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_f0af_return_output;

     -- t16_MUX[uxn_opcodes_h_l1484_c7_208c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1484_c7_208c_cond <= VAR_t16_MUX_uxn_opcodes_h_l1484_c7_208c_cond;
     t16_MUX_uxn_opcodes_h_l1484_c7_208c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1484_c7_208c_iftrue;
     t16_MUX_uxn_opcodes_h_l1484_c7_208c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1484_c7_208c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1484_c7_208c_return_output := t16_MUX_uxn_opcodes_h_l1484_c7_208c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1490_c7_3fa8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_3fa8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_3fa8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_3fa8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_3fa8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_3fa8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_3fa8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_3fa8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_3fa8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1496_c7_f0af] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_f0af_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_f0af_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_f0af_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_f0af_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_f0af_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_f0af_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_f0af_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_f0af_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1486_c11_c823] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1486_c11_c823_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1486_c11_c823_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1486_c11_c823_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1486_c11_c823_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1486_c11_c823_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1486_c11_c823_return_output;

     -- printf_uxn_opcodes_h_l1469_c3_1b53[uxn_opcodes_h_l1469_c3_1b53] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1469_c3_1b53_uxn_opcodes_h_l1469_c3_1b53_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1469_c3_1b53_uxn_opcodes_h_l1469_c3_1b53_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- MUX[uxn_opcodes_h_l1488_c32_3a20] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1488_c32_3a20_cond <= VAR_MUX_uxn_opcodes_h_l1488_c32_3a20_cond;
     MUX_uxn_opcodes_h_l1488_c32_3a20_iftrue <= VAR_MUX_uxn_opcodes_h_l1488_c32_3a20_iftrue;
     MUX_uxn_opcodes_h_l1488_c32_3a20_iffalse <= VAR_MUX_uxn_opcodes_h_l1488_c32_3a20_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1488_c32_3a20_return_output := MUX_uxn_opcodes_h_l1488_c32_3a20_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l1486_c3_c016 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1486_c11_c823_return_output, 16);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_208c_iftrue := VAR_MUX_uxn_opcodes_h_l1488_c32_3a20_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_3fa8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_f0af_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_ff06_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_208c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_3fa8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_f0af_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_208c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_3fa8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1490_c7_3fa8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1496_c7_f0af_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1481_c7_ff06_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1484_c7_208c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1484_c7_208c_iftrue := VAR_tmp16_uxn_opcodes_h_l1486_c3_c016;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1481_c7_ff06] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_ff06_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_ff06_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_ff06_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_ff06_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_ff06_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_ff06_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1484_c7_208c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_208c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_208c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_208c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_208c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_208c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_208c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_208c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_208c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1490_c7_3fa8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1490_c7_3fa8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1490_c7_3fa8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1490_c7_3fa8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1490_c7_3fa8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1490_c7_3fa8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1490_c7_3fa8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1490_c7_3fa8_return_output := result_stack_value_MUX_uxn_opcodes_h_l1490_c7_3fa8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1484_c7_208c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1484_c7_208c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1484_c7_208c_cond;
     tmp16_MUX_uxn_opcodes_h_l1484_c7_208c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1484_c7_208c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1484_c7_208c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1484_c7_208c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1484_c7_208c_return_output := tmp16_MUX_uxn_opcodes_h_l1484_c7_208c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1481_c7_ff06] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1481_c7_ff06_cond <= VAR_t16_MUX_uxn_opcodes_h_l1481_c7_ff06_cond;
     t16_MUX_uxn_opcodes_h_l1481_c7_ff06_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1481_c7_ff06_iftrue;
     t16_MUX_uxn_opcodes_h_l1481_c7_ff06_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1481_c7_ff06_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output := t16_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1484_c7_208c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_208c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_208c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_208c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_208c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_208c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_208c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_208c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_208c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1490_c7_3fa8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_3fa8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_3fa8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_3fa8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_3fa8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_3fa8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_3fa8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_3fa8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_3fa8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1490_c7_3fa8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_3fa8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_3fa8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_3fa8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_3fa8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_3fa8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_3fa8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_3fa8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_3fa8_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_208c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_3fa8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_faf5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_208c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_3fa8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_ff06_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_208c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_ff06_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_208c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1484_c7_208c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1490_c7_3fa8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1476_c7_faf5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1481_c7_ff06_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1484_c7_208c_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1476_c7_faf5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_faf5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_faf5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_faf5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_faf5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_faf5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_faf5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1481_c7_ff06] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1481_c7_ff06_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1481_c7_ff06_cond;
     tmp16_MUX_uxn_opcodes_h_l1481_c7_ff06_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1481_c7_ff06_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1481_c7_ff06_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1481_c7_ff06_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output := tmp16_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1484_c7_208c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_208c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_208c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_208c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_208c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_208c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_208c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_208c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_208c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1481_c7_ff06] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_ff06_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_ff06_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_ff06_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_ff06_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_ff06_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_ff06_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output;

     -- t16_MUX[uxn_opcodes_h_l1476_c7_faf5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1476_c7_faf5_cond <= VAR_t16_MUX_uxn_opcodes_h_l1476_c7_faf5_cond;
     t16_MUX_uxn_opcodes_h_l1476_c7_faf5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1476_c7_faf5_iftrue;
     t16_MUX_uxn_opcodes_h_l1476_c7_faf5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1476_c7_faf5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output := t16_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1481_c7_ff06] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_ff06_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_ff06_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_ff06_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_ff06_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_ff06_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_ff06_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1484_c7_208c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_208c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_208c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_208c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_208c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_208c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_208c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_208c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_208c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1484_c7_208c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1484_c7_208c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1484_c7_208c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1484_c7_208c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1484_c7_208c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1484_c7_208c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1484_c7_208c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1484_c7_208c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1484_c7_208c_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_ff06_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_208c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_ff06_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_208c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_faf5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_faf5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1481_c7_ff06_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1484_c7_208c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1473_c7_6d5b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1476_c7_faf5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1476_c7_faf5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_faf5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_faf5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_faf5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_faf5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_faf5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_faf5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output;

     -- t16_MUX[uxn_opcodes_h_l1473_c7_6d5b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1473_c7_6d5b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1473_c7_6d5b_cond;
     t16_MUX_uxn_opcodes_h_l1473_c7_6d5b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1473_c7_6d5b_iftrue;
     t16_MUX_uxn_opcodes_h_l1473_c7_6d5b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1473_c7_6d5b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output := t16_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1476_c7_faf5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_faf5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_faf5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_faf5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_faf5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_faf5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_faf5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1476_c7_faf5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1476_c7_faf5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1476_c7_faf5_cond;
     tmp16_MUX_uxn_opcodes_h_l1476_c7_faf5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1476_c7_faf5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1476_c7_faf5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1476_c7_faf5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output := tmp16_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1473_c7_6d5b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1481_c7_ff06] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_ff06_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_ff06_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_ff06_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_ff06_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_ff06_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_ff06_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1481_c7_ff06] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_ff06_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_ff06_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_ff06_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_ff06_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_ff06_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_ff06_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1481_c7_ff06] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1481_c7_ff06_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1481_c7_ff06_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1481_c7_ff06_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1481_c7_ff06_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1481_c7_ff06_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1481_c7_ff06_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output := result_stack_value_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_faf5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_f30e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_faf5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_6d5b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1476_c7_faf5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1481_c7_ff06_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1468_c2_f30e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1473_c7_6d5b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1473_c7_6d5b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_6d5b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_6d5b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_6d5b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_6d5b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_6d5b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_6d5b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1476_c7_faf5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_faf5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_faf5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_faf5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_faf5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_faf5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_faf5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1473_c7_6d5b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1473_c7_6d5b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1473_c7_6d5b_cond;
     tmp16_MUX_uxn_opcodes_h_l1473_c7_6d5b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1473_c7_6d5b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1473_c7_6d5b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1473_c7_6d5b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output := tmp16_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1476_c7_faf5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1476_c7_faf5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1476_c7_faf5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1476_c7_faf5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1476_c7_faf5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1476_c7_faf5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1476_c7_faf5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output := result_stack_value_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1476_c7_faf5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_faf5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_faf5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_faf5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_faf5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_faf5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_faf5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1468_c2_f30e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_f30e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_f30e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_f30e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_f30e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_f30e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_f30e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1473_c7_6d5b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output;

     -- t16_MUX[uxn_opcodes_h_l1468_c2_f30e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1468_c2_f30e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1468_c2_f30e_cond;
     t16_MUX_uxn_opcodes_h_l1468_c2_f30e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1468_c2_f30e_iftrue;
     t16_MUX_uxn_opcodes_h_l1468_c2_f30e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1468_c2_f30e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output := t16_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_6d5b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_6d5b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_f30e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_f30e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1473_c7_6d5b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1476_c7_faf5_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1468_c2_f30e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1473_c7_6d5b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_6d5b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_6d5b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_6d5b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_6d5b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_6d5b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_6d5b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1473_c7_6d5b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_6d5b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_6d5b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_6d5b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_6d5b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_6d5b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_6d5b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1468_c2_f30e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_f30e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_f30e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_f30e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_f30e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_f30e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_f30e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1468_c2_f30e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1468_c2_f30e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1468_c2_f30e_cond;
     tmp16_MUX_uxn_opcodes_h_l1468_c2_f30e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1468_c2_f30e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1468_c2_f30e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1468_c2_f30e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output := tmp16_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1468_c2_f30e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_f30e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_f30e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_f30e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_f30e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_f30e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_f30e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1473_c7_6d5b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1473_c7_6d5b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1473_c7_6d5b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1473_c7_6d5b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1473_c7_6d5b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1473_c7_6d5b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1473_c7_6d5b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_f30e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_f30e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1468_c2_f30e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1473_c7_6d5b_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1468_c2_f30e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1468_c2_f30e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1468_c2_f30e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1468_c2_f30e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1468_c2_f30e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1468_c2_f30e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1468_c2_f30e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1468_c2_f30e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_f30e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_f30e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_f30e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_f30e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_f30e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_f30e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1468_c2_f30e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_f30e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_f30e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_f30e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_f30e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_f30e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_f30e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1505_l1464_DUPLICATE_8e73 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1505_l1464_DUPLICATE_8e73_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_09c5(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_f30e_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1505_l1464_DUPLICATE_8e73_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1505_l1464_DUPLICATE_8e73_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
