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
-- Submodules: 79
entity sub2_0CLK_f74041be is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sub2_0CLK_f74041be;
architecture arch of sub2_0CLK_f74041be is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2367_c6_744d]
signal BIN_OP_EQ_uxn_opcodes_h_l2367_c6_744d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2367_c6_744d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2367_c6_744d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2367_c1_71f1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_71f1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_71f1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_71f1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_71f1_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2367_c2_bb2b]
signal tmp16_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2367_c2_bb2b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2367_c2_bb2b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2367_c2_bb2b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2367_c2_bb2b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2367_c2_bb2b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2367_c2_bb2b]
signal result_u8_value_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2367_c2_bb2b]
signal t16_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2367_c2_bb2b]
signal n16_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2368_c3_dad7[uxn_opcodes_h_l2368_c3_dad7]
signal printf_uxn_opcodes_h_l2368_c3_dad7_uxn_opcodes_h_l2368_c3_dad7_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2372_c11_bc8d]
signal BIN_OP_EQ_uxn_opcodes_h_l2372_c11_bc8d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2372_c11_bc8d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2372_c11_bc8d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2372_c7_4317]
signal tmp16_MUX_uxn_opcodes_h_l2372_c7_4317_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2372_c7_4317_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2372_c7_4317]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_4317_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_4317_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2372_c7_4317]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_4317_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_4317_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2372_c7_4317]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_4317_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_4317_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2372_c7_4317]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_4317_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_4317_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2372_c7_4317]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_4317_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_4317_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2372_c7_4317]
signal result_u8_value_MUX_uxn_opcodes_h_l2372_c7_4317_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2372_c7_4317_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2372_c7_4317]
signal t16_MUX_uxn_opcodes_h_l2372_c7_4317_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2372_c7_4317_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2372_c7_4317]
signal n16_MUX_uxn_opcodes_h_l2372_c7_4317_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2372_c7_4317_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2375_c11_d586]
signal BIN_OP_EQ_uxn_opcodes_h_l2375_c11_d586_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2375_c11_d586_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2375_c11_d586_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2375_c7_ce2b]
signal tmp16_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2375_c7_ce2b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2375_c7_ce2b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2375_c7_ce2b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2375_c7_ce2b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2375_c7_ce2b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2375_c7_ce2b]
signal result_u8_value_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2375_c7_ce2b]
signal t16_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2375_c7_ce2b]
signal n16_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2380_c11_7d45]
signal BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7d45_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7d45_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7d45_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2380_c7_57aa]
signal tmp16_MUX_uxn_opcodes_h_l2380_c7_57aa_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2380_c7_57aa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_57aa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2380_c7_57aa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_57aa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2380_c7_57aa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_57aa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2380_c7_57aa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_57aa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2380_c7_57aa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_57aa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2380_c7_57aa]
signal result_u8_value_MUX_uxn_opcodes_h_l2380_c7_57aa_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2380_c7_57aa]
signal t16_MUX_uxn_opcodes_h_l2380_c7_57aa_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2380_c7_57aa]
signal n16_MUX_uxn_opcodes_h_l2380_c7_57aa_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2381_c3_ef28]
signal BIN_OP_OR_uxn_opcodes_h_l2381_c3_ef28_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2381_c3_ef28_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2381_c3_ef28_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2384_c11_de87]
signal BIN_OP_EQ_uxn_opcodes_h_l2384_c11_de87_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2384_c11_de87_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2384_c11_de87_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2384_c7_e05f]
signal tmp16_MUX_uxn_opcodes_h_l2384_c7_e05f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2384_c7_e05f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2384_c7_e05f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2384_c7_e05f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_e05f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_e05f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_e05f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2384_c7_e05f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_e05f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_e05f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_e05f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2384_c7_e05f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_e05f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_e05f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_e05f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2384_c7_e05f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_e05f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_e05f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_e05f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2384_c7_e05f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_e05f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_e05f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_e05f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2384_c7_e05f]
signal result_u8_value_MUX_uxn_opcodes_h_l2384_c7_e05f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2384_c7_e05f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2384_c7_e05f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2384_c7_e05f]
signal n16_MUX_uxn_opcodes_h_l2384_c7_e05f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2384_c7_e05f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2384_c7_e05f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2388_c11_8fdb]
signal BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fdb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fdb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fdb_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2388_c7_b172]
signal tmp16_MUX_uxn_opcodes_h_l2388_c7_b172_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2388_c7_b172_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2388_c7_b172_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2388_c7_b172_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2388_c7_b172]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_b172_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_b172_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_b172_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_b172_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2388_c7_b172]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_b172_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_b172_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_b172_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_b172_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2388_c7_b172]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_b172_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_b172_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_b172_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_b172_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2388_c7_b172]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_b172_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_b172_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_b172_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_b172_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2388_c7_b172]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_b172_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_b172_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_b172_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_b172_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2388_c7_b172]
signal result_u8_value_MUX_uxn_opcodes_h_l2388_c7_b172_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2388_c7_b172_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2388_c7_b172_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2388_c7_b172_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2388_c7_b172]
signal n16_MUX_uxn_opcodes_h_l2388_c7_b172_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2388_c7_b172_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2388_c7_b172_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2388_c7_b172_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2389_c3_91f8]
signal BIN_OP_OR_uxn_opcodes_h_l2389_c3_91f8_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2389_c3_91f8_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2389_c3_91f8_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2390_c11_300f]
signal BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_300f_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_300f_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_300f_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2392_c30_a186]
signal sp_relative_shift_uxn_opcodes_h_l2392_c30_a186_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2392_c30_a186_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2392_c30_a186_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2392_c30_a186_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2397_c11_ffc2]
signal BIN_OP_EQ_uxn_opcodes_h_l2397_c11_ffc2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2397_c11_ffc2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2397_c11_ffc2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2397_c7_9d60]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_9d60_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_9d60_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_9d60_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_9d60_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2397_c7_9d60]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_9d60_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_9d60_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_9d60_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_9d60_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2397_c7_9d60]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_9d60_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_9d60_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_9d60_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_9d60_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2397_c7_9d60]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_9d60_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_9d60_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_9d60_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_9d60_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2397_c7_9d60]
signal result_u8_value_MUX_uxn_opcodes_h_l2397_c7_9d60_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2397_c7_9d60_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2397_c7_9d60_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2397_c7_9d60_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2400_c31_ccb1]
signal CONST_SR_8_uxn_opcodes_h_l2400_c31_ccb1_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2400_c31_ccb1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2402_c11_8541]
signal BIN_OP_EQ_uxn_opcodes_h_l2402_c11_8541_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2402_c11_8541_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2402_c11_8541_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2402_c7_c73c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c73c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c73c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c73c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c73c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2402_c7_c73c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c73c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c73c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c73c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c73c_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2386_l2377_DUPLICATE_43bd
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2386_l2377_DUPLICATE_43bd_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2386_l2377_DUPLICATE_43bd_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_8c29( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2367_c6_744d
BIN_OP_EQ_uxn_opcodes_h_l2367_c6_744d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2367_c6_744d_left,
BIN_OP_EQ_uxn_opcodes_h_l2367_c6_744d_right,
BIN_OP_EQ_uxn_opcodes_h_l2367_c6_744d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_71f1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_71f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_71f1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_71f1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_71f1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_71f1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2367_c2_bb2b
tmp16_MUX_uxn_opcodes_h_l2367_c2_bb2b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond,
tmp16_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue,
tmp16_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse,
tmp16_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_bb2b
result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_bb2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b
result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_bb2b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_bb2b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_bb2b
result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_bb2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2367_c2_bb2b
result_u8_value_MUX_uxn_opcodes_h_l2367_c2_bb2b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output);

-- t16_MUX_uxn_opcodes_h_l2367_c2_bb2b
t16_MUX_uxn_opcodes_h_l2367_c2_bb2b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond,
t16_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue,
t16_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse,
t16_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output);

-- n16_MUX_uxn_opcodes_h_l2367_c2_bb2b
n16_MUX_uxn_opcodes_h_l2367_c2_bb2b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond,
n16_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue,
n16_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse,
n16_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output);

-- printf_uxn_opcodes_h_l2368_c3_dad7_uxn_opcodes_h_l2368_c3_dad7
printf_uxn_opcodes_h_l2368_c3_dad7_uxn_opcodes_h_l2368_c3_dad7 : entity work.printf_uxn_opcodes_h_l2368_c3_dad7_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2368_c3_dad7_uxn_opcodes_h_l2368_c3_dad7_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2372_c11_bc8d
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_bc8d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_bc8d_left,
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_bc8d_right,
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_bc8d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2372_c7_4317
tmp16_MUX_uxn_opcodes_h_l2372_c7_4317 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2372_c7_4317_cond,
tmp16_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue,
tmp16_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse,
tmp16_MUX_uxn_opcodes_h_l2372_c7_4317_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_4317
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_4317 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_4317_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_4317_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_4317
result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_4317 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_4317_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_4317_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_4317
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_4317 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_4317_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_4317_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_4317
result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_4317 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_4317_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_4317_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_4317
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_4317 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_4317_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_4317_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2372_c7_4317
result_u8_value_MUX_uxn_opcodes_h_l2372_c7_4317 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2372_c7_4317_cond,
result_u8_value_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2372_c7_4317_return_output);

-- t16_MUX_uxn_opcodes_h_l2372_c7_4317
t16_MUX_uxn_opcodes_h_l2372_c7_4317 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2372_c7_4317_cond,
t16_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue,
t16_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse,
t16_MUX_uxn_opcodes_h_l2372_c7_4317_return_output);

-- n16_MUX_uxn_opcodes_h_l2372_c7_4317
n16_MUX_uxn_opcodes_h_l2372_c7_4317 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2372_c7_4317_cond,
n16_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue,
n16_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse,
n16_MUX_uxn_opcodes_h_l2372_c7_4317_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2375_c11_d586
BIN_OP_EQ_uxn_opcodes_h_l2375_c11_d586 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2375_c11_d586_left,
BIN_OP_EQ_uxn_opcodes_h_l2375_c11_d586_right,
BIN_OP_EQ_uxn_opcodes_h_l2375_c11_d586_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2375_c7_ce2b
tmp16_MUX_uxn_opcodes_h_l2375_c7_ce2b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond,
tmp16_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue,
tmp16_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse,
tmp16_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_ce2b
result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_ce2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b
result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_ce2b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_ce2b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_ce2b
result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_ce2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2375_c7_ce2b
result_u8_value_MUX_uxn_opcodes_h_l2375_c7_ce2b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output);

-- t16_MUX_uxn_opcodes_h_l2375_c7_ce2b
t16_MUX_uxn_opcodes_h_l2375_c7_ce2b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond,
t16_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue,
t16_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse,
t16_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output);

-- n16_MUX_uxn_opcodes_h_l2375_c7_ce2b
n16_MUX_uxn_opcodes_h_l2375_c7_ce2b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond,
n16_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue,
n16_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse,
n16_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7d45
BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7d45 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7d45_left,
BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7d45_right,
BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7d45_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2380_c7_57aa
tmp16_MUX_uxn_opcodes_h_l2380_c7_57aa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2380_c7_57aa_cond,
tmp16_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue,
tmp16_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse,
tmp16_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_57aa
result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_57aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_57aa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_57aa
result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_57aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_57aa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_57aa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_57aa : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_57aa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_57aa
result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_57aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_57aa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_57aa
result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_57aa : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_57aa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2380_c7_57aa
result_u8_value_MUX_uxn_opcodes_h_l2380_c7_57aa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2380_c7_57aa_cond,
result_u8_value_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output);

-- t16_MUX_uxn_opcodes_h_l2380_c7_57aa
t16_MUX_uxn_opcodes_h_l2380_c7_57aa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2380_c7_57aa_cond,
t16_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue,
t16_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse,
t16_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output);

-- n16_MUX_uxn_opcodes_h_l2380_c7_57aa
n16_MUX_uxn_opcodes_h_l2380_c7_57aa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2380_c7_57aa_cond,
n16_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue,
n16_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse,
n16_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2381_c3_ef28
BIN_OP_OR_uxn_opcodes_h_l2381_c3_ef28 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2381_c3_ef28_left,
BIN_OP_OR_uxn_opcodes_h_l2381_c3_ef28_right,
BIN_OP_OR_uxn_opcodes_h_l2381_c3_ef28_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2384_c11_de87
BIN_OP_EQ_uxn_opcodes_h_l2384_c11_de87 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2384_c11_de87_left,
BIN_OP_EQ_uxn_opcodes_h_l2384_c11_de87_right,
BIN_OP_EQ_uxn_opcodes_h_l2384_c11_de87_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2384_c7_e05f
tmp16_MUX_uxn_opcodes_h_l2384_c7_e05f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2384_c7_e05f_cond,
tmp16_MUX_uxn_opcodes_h_l2384_c7_e05f_iftrue,
tmp16_MUX_uxn_opcodes_h_l2384_c7_e05f_iffalse,
tmp16_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_e05f
result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_e05f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_e05f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_e05f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_e05f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_e05f
result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_e05f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_e05f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_e05f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_e05f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_e05f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_e05f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_e05f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_e05f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_e05f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_e05f
result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_e05f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_e05f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_e05f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_e05f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_e05f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_e05f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_e05f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_e05f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_e05f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2384_c7_e05f
result_u8_value_MUX_uxn_opcodes_h_l2384_c7_e05f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2384_c7_e05f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2384_c7_e05f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2384_c7_e05f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output);

-- n16_MUX_uxn_opcodes_h_l2384_c7_e05f
n16_MUX_uxn_opcodes_h_l2384_c7_e05f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2384_c7_e05f_cond,
n16_MUX_uxn_opcodes_h_l2384_c7_e05f_iftrue,
n16_MUX_uxn_opcodes_h_l2384_c7_e05f_iffalse,
n16_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fdb
BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fdb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fdb_left,
BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fdb_right,
BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fdb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2388_c7_b172
tmp16_MUX_uxn_opcodes_h_l2388_c7_b172 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2388_c7_b172_cond,
tmp16_MUX_uxn_opcodes_h_l2388_c7_b172_iftrue,
tmp16_MUX_uxn_opcodes_h_l2388_c7_b172_iffalse,
tmp16_MUX_uxn_opcodes_h_l2388_c7_b172_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_b172
result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_b172 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_b172_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_b172_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_b172_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_b172_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_b172
result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_b172 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_b172_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_b172_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_b172_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_b172_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_b172
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_b172 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_b172_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_b172_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_b172_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_b172_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_b172
result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_b172 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_b172_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_b172_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_b172_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_b172_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_b172
result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_b172 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_b172_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_b172_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_b172_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_b172_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2388_c7_b172
result_u8_value_MUX_uxn_opcodes_h_l2388_c7_b172 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2388_c7_b172_cond,
result_u8_value_MUX_uxn_opcodes_h_l2388_c7_b172_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2388_c7_b172_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2388_c7_b172_return_output);

-- n16_MUX_uxn_opcodes_h_l2388_c7_b172
n16_MUX_uxn_opcodes_h_l2388_c7_b172 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2388_c7_b172_cond,
n16_MUX_uxn_opcodes_h_l2388_c7_b172_iftrue,
n16_MUX_uxn_opcodes_h_l2388_c7_b172_iffalse,
n16_MUX_uxn_opcodes_h_l2388_c7_b172_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2389_c3_91f8
BIN_OP_OR_uxn_opcodes_h_l2389_c3_91f8 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2389_c3_91f8_left,
BIN_OP_OR_uxn_opcodes_h_l2389_c3_91f8_right,
BIN_OP_OR_uxn_opcodes_h_l2389_c3_91f8_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_300f
BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_300f : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_300f_left,
BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_300f_right,
BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_300f_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2392_c30_a186
sp_relative_shift_uxn_opcodes_h_l2392_c30_a186 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2392_c30_a186_ins,
sp_relative_shift_uxn_opcodes_h_l2392_c30_a186_x,
sp_relative_shift_uxn_opcodes_h_l2392_c30_a186_y,
sp_relative_shift_uxn_opcodes_h_l2392_c30_a186_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2397_c11_ffc2
BIN_OP_EQ_uxn_opcodes_h_l2397_c11_ffc2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2397_c11_ffc2_left,
BIN_OP_EQ_uxn_opcodes_h_l2397_c11_ffc2_right,
BIN_OP_EQ_uxn_opcodes_h_l2397_c11_ffc2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_9d60
result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_9d60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_9d60_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_9d60_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_9d60_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_9d60_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_9d60
result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_9d60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_9d60_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_9d60_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_9d60_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_9d60_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_9d60
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_9d60 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_9d60_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_9d60_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_9d60_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_9d60_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_9d60
result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_9d60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_9d60_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_9d60_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_9d60_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_9d60_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2397_c7_9d60
result_u8_value_MUX_uxn_opcodes_h_l2397_c7_9d60 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2397_c7_9d60_cond,
result_u8_value_MUX_uxn_opcodes_h_l2397_c7_9d60_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2397_c7_9d60_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2397_c7_9d60_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2400_c31_ccb1
CONST_SR_8_uxn_opcodes_h_l2400_c31_ccb1 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2400_c31_ccb1_x,
CONST_SR_8_uxn_opcodes_h_l2400_c31_ccb1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2402_c11_8541
BIN_OP_EQ_uxn_opcodes_h_l2402_c11_8541 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2402_c11_8541_left,
BIN_OP_EQ_uxn_opcodes_h_l2402_c11_8541_right,
BIN_OP_EQ_uxn_opcodes_h_l2402_c11_8541_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c73c
result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c73c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c73c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c73c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c73c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c73c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c73c
result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c73c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c73c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c73c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c73c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c73c_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2386_l2377_DUPLICATE_43bd
CONST_SL_8_uint16_t_uxn_opcodes_h_l2386_l2377_DUPLICATE_43bd : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2386_l2377_DUPLICATE_43bd_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2386_l2377_DUPLICATE_43bd_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2367_c6_744d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_71f1_return_output,
 tmp16_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output,
 t16_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output,
 n16_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2372_c11_bc8d_return_output,
 tmp16_MUX_uxn_opcodes_h_l2372_c7_4317_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_4317_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_4317_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_4317_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_4317_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_4317_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2372_c7_4317_return_output,
 t16_MUX_uxn_opcodes_h_l2372_c7_4317_return_output,
 n16_MUX_uxn_opcodes_h_l2372_c7_4317_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2375_c11_d586_return_output,
 tmp16_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output,
 t16_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output,
 n16_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7d45_return_output,
 tmp16_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output,
 t16_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output,
 n16_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2381_c3_ef28_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2384_c11_de87_return_output,
 tmp16_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output,
 n16_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fdb_return_output,
 tmp16_MUX_uxn_opcodes_h_l2388_c7_b172_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_b172_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_b172_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_b172_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_b172_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_b172_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2388_c7_b172_return_output,
 n16_MUX_uxn_opcodes_h_l2388_c7_b172_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2389_c3_91f8_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_300f_return_output,
 sp_relative_shift_uxn_opcodes_h_l2392_c30_a186_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2397_c11_ffc2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_9d60_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_9d60_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_9d60_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_9d60_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2397_c7_9d60_return_output,
 CONST_SR_8_uxn_opcodes_h_l2400_c31_ccb1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2402_c11_8541_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c73c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c73c_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2386_l2377_DUPLICATE_43bd_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_744d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_744d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_744d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_71f1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_71f1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_71f1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_71f1_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2372_c7_4317_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_4317_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_4317_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2369_c3_2df1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_4317_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_4317_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_4317_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_4317_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2372_c7_4317_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2372_c7_4317_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2368_c3_dad7_uxn_opcodes_h_l2368_c3_dad7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_bc8d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_bc8d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_bc8d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2372_c7_4317_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_4317_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_4317_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2373_c3_fa49 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_4317_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_4317_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_4317_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_4317_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2372_c7_4317_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2372_c7_4317_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_d586_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_d586_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_d586_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2378_c3_2435 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7d45_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7d45_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7d45_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2380_c7_57aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_57aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_57aa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2382_c3_1b7e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_57aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_57aa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_57aa_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2380_c7_57aa_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2380_c7_57aa_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2380_c7_57aa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_ef28_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_ef28_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_ef28_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2384_c11_de87_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2384_c11_de87_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2384_c11_de87_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2384_c7_e05f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2384_c7_e05f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2388_c7_b172_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2384_c7_e05f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_e05f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_e05f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_b172_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_e05f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_e05f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_e05f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_b172_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_e05f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_e05f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_e05f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_b172_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_e05f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_e05f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_e05f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_b172_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_e05f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_e05f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_e05f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_b172_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_e05f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2384_c7_e05f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2384_c7_e05f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_b172_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2384_c7_e05f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2384_c7_e05f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2384_c7_e05f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2388_c7_b172_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2384_c7_e05f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fdb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fdb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fdb_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2388_c7_b172_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2388_c7_b172_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2388_c7_b172_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_b172_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_b172_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_9d60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_b172_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_b172_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_b172_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_9d60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_b172_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_b172_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2394_c3_d4cd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_b172_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_9d60_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_b172_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_b172_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_b172_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_9d60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_b172_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_b172_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_b172_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_b172_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_b172_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_b172_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2397_c7_9d60_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_b172_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2388_c7_b172_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2388_c7_b172_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2388_c7_b172_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2389_c3_91f8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2389_c3_91f8_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2389_c3_91f8_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_300f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_300f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_300f_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2392_c30_a186_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2392_c30_a186_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2392_c30_a186_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2392_c30_a186_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2395_c21_6d5d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_ffc2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_ffc2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_ffc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_9d60_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_9d60_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c73c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_9d60_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_9d60_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_9d60_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_9d60_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_9d60_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2399_c3_4fb4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_9d60_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_9d60_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_9d60_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_9d60_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c73c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_9d60_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2397_c7_9d60_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2397_c7_9d60_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2397_c7_9d60_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2400_c31_ccb1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2400_c31_ccb1_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2400_c21_5989_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_8541_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_8541_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_8541_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c73c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c73c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c73c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c73c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c73c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c73c_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2372_l2367_l2397_l2384_l2380_l2375_DUPLICATE_54d7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2372_l2402_l2367_l2397_l2384_l2380_l2375_DUPLICATE_c383_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2372_l2367_l2388_l2384_l2380_l2375_DUPLICATE_065f_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2372_l2367_l2397_l2384_l2380_l2375_DUPLICATE_991a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2402_l2397_l2388_l2384_l2380_l2375_DUPLICATE_147d_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2381_l2376_l2389_l2385_DUPLICATE_6b76_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2386_l2377_DUPLICATE_43bd_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2386_l2377_DUPLICATE_43bd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2397_l2384_DUPLICATE_c154_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l2363_l2407_DUPLICATE_3f0d_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2373_c3_fa49 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2373_c3_fa49;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2369_c3_2df1 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2369_c3_2df1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_ffc2_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2378_c3_2435 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2378_c3_2435;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7d45_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2382_c3_1b7e := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2382_c3_1b7e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_8541_right := to_unsigned(7, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_9d60_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2392_c30_a186_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2394_c3_d4cd := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_b172_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2394_c3_d4cd;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_bc8d_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fdb_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c73c_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_b172_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_b172_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2392_c30_a186_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2399_c3_4fb4 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_9d60_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2399_c3_4fb4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2384_c11_de87_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_744d_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_71f1_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c73c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_d586_right := to_unsigned(2, 2);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_71f1_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2392_c30_a186_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2389_c3_91f8_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2388_c7_b172_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_744d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_bc8d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_d586_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7d45_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2384_c11_de87_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fdb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_ffc2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_8541_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_300f_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_ef28_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2400_c31_ccb1_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2384_c7_e05f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2388_c7_b172_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2367_c6_744d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2367_c6_744d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_744d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2367_c6_744d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_744d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_744d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2367_c6_744d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2397_c11_ffc2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2397_c11_ffc2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_ffc2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2397_c11_ffc2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_ffc2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_ffc2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2397_c11_ffc2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2372_c11_bc8d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2372_c11_bc8d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_bc8d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2372_c11_bc8d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_bc8d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_bc8d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2372_c11_bc8d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2380_c11_7d45] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7d45_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7d45_left;
     BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7d45_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7d45_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7d45_return_output := BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7d45_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2375_c11_d586] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2375_c11_d586_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_d586_left;
     BIN_OP_EQ_uxn_opcodes_h_l2375_c11_d586_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_d586_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_d586_return_output := BIN_OP_EQ_uxn_opcodes_h_l2375_c11_d586_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2372_l2367_l2388_l2384_l2380_l2375_DUPLICATE_065f LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2372_l2367_l2388_l2384_l2380_l2375_DUPLICATE_065f_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2384_c11_de87] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2384_c11_de87_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2384_c11_de87_left;
     BIN_OP_EQ_uxn_opcodes_h_l2384_c11_de87_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2384_c11_de87_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2384_c11_de87_return_output := BIN_OP_EQ_uxn_opcodes_h_l2384_c11_de87_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2402_c11_8541] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2402_c11_8541_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_8541_left;
     BIN_OP_EQ_uxn_opcodes_h_l2402_c11_8541_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_8541_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_8541_return_output := BIN_OP_EQ_uxn_opcodes_h_l2402_c11_8541_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2372_l2402_l2367_l2397_l2384_l2380_l2375_DUPLICATE_c383 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2372_l2402_l2367_l2397_l2384_l2380_l2375_DUPLICATE_c383_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2372_l2367_l2397_l2384_l2380_l2375_DUPLICATE_54d7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2372_l2367_l2397_l2384_l2380_l2375_DUPLICATE_54d7_return_output := result.is_sp_shift;

     -- CONST_SR_8[uxn_opcodes_h_l2400_c31_ccb1] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2400_c31_ccb1_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2400_c31_ccb1_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2400_c31_ccb1_return_output := CONST_SR_8_uxn_opcodes_h_l2400_c31_ccb1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2388_c11_8fdb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fdb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fdb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fdb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fdb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fdb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fdb_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2392_c30_a186] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2392_c30_a186_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2392_c30_a186_ins;
     sp_relative_shift_uxn_opcodes_h_l2392_c30_a186_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2392_c30_a186_x;
     sp_relative_shift_uxn_opcodes_h_l2392_c30_a186_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2392_c30_a186_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2392_c30_a186_return_output := sp_relative_shift_uxn_opcodes_h_l2392_c30_a186_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2402_l2397_l2388_l2384_l2380_l2375_DUPLICATE_147d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2402_l2397_l2388_l2384_l2380_l2375_DUPLICATE_147d_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2397_l2384_DUPLICATE_c154 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2397_l2384_DUPLICATE_c154_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2381_l2376_l2389_l2385_DUPLICATE_6b76 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2381_l2376_l2389_l2385_DUPLICATE_6b76_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2372_l2367_l2397_l2384_l2380_l2375_DUPLICATE_991a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2372_l2367_l2397_l2384_l2380_l2375_DUPLICATE_991a_return_output := result.u8_value;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_71f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_744d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_744d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_744d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_744d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_744d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_744d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_744d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_744d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_744d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_744d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2372_c7_4317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_bc8d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_4317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_bc8d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_4317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_bc8d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_4317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_bc8d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_4317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_bc8d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_4317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_bc8d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_4317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_bc8d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2372_c7_4317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_bc8d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2372_c7_4317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_bc8d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_d586_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_d586_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_d586_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_d586_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_d586_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_d586_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_d586_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_d586_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_d586_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2380_c7_57aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7d45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_57aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7d45_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_57aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7d45_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_57aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7d45_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_57aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7d45_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_57aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7d45_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2380_c7_57aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7d45_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2380_c7_57aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7d45_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2380_c7_57aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7d45_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2384_c7_e05f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2384_c11_de87_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_e05f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2384_c11_de87_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_e05f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2384_c11_de87_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_e05f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2384_c11_de87_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_e05f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2384_c11_de87_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_e05f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2384_c11_de87_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2384_c7_e05f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2384_c11_de87_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2384_c7_e05f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2384_c11_de87_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2388_c7_b172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fdb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_b172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fdb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_b172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fdb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_b172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fdb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_b172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fdb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_b172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fdb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_b172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fdb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2388_c7_b172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fdb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_9d60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_ffc2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_9d60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_ffc2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_9d60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_ffc2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_9d60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_ffc2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2397_c7_9d60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_ffc2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c73c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_8541_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c73c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_8541_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_ef28_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2381_l2376_l2389_l2385_DUPLICATE_6b76_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2389_c3_91f8_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2381_l2376_l2389_l2385_DUPLICATE_6b76_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2386_l2377_DUPLICATE_43bd_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2381_l2376_l2389_l2385_DUPLICATE_6b76_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2372_l2367_l2388_l2384_l2380_l2375_DUPLICATE_065f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2372_l2367_l2388_l2384_l2380_l2375_DUPLICATE_065f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2372_l2367_l2388_l2384_l2380_l2375_DUPLICATE_065f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2372_l2367_l2388_l2384_l2380_l2375_DUPLICATE_065f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_e05f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2372_l2367_l2388_l2384_l2380_l2375_DUPLICATE_065f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_b172_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2372_l2367_l2388_l2384_l2380_l2375_DUPLICATE_065f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2402_l2397_l2388_l2384_l2380_l2375_DUPLICATE_147d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2402_l2397_l2388_l2384_l2380_l2375_DUPLICATE_147d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2402_l2397_l2388_l2384_l2380_l2375_DUPLICATE_147d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_e05f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2402_l2397_l2388_l2384_l2380_l2375_DUPLICATE_147d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_b172_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2402_l2397_l2388_l2384_l2380_l2375_DUPLICATE_147d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_9d60_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2402_l2397_l2388_l2384_l2380_l2375_DUPLICATE_147d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c73c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2402_l2397_l2388_l2384_l2380_l2375_DUPLICATE_147d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2372_l2367_l2397_l2384_l2380_l2375_DUPLICATE_54d7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2372_l2367_l2397_l2384_l2380_l2375_DUPLICATE_54d7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2372_l2367_l2397_l2384_l2380_l2375_DUPLICATE_54d7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2372_l2367_l2397_l2384_l2380_l2375_DUPLICATE_54d7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_e05f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2372_l2367_l2397_l2384_l2380_l2375_DUPLICATE_54d7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_9d60_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2372_l2367_l2397_l2384_l2380_l2375_DUPLICATE_54d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2372_l2402_l2367_l2397_l2384_l2380_l2375_DUPLICATE_c383_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2372_l2402_l2367_l2397_l2384_l2380_l2375_DUPLICATE_c383_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2372_l2402_l2367_l2397_l2384_l2380_l2375_DUPLICATE_c383_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2372_l2402_l2367_l2397_l2384_l2380_l2375_DUPLICATE_c383_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_e05f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2372_l2402_l2367_l2397_l2384_l2380_l2375_DUPLICATE_c383_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_9d60_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2372_l2402_l2367_l2397_l2384_l2380_l2375_DUPLICATE_c383_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c73c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2372_l2402_l2367_l2397_l2384_l2380_l2375_DUPLICATE_c383_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_e05f_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2397_l2384_DUPLICATE_c154_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_9d60_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2397_l2384_DUPLICATE_c154_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2372_l2367_l2397_l2384_l2380_l2375_DUPLICATE_991a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2372_l2367_l2397_l2384_l2380_l2375_DUPLICATE_991a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2372_l2367_l2397_l2384_l2380_l2375_DUPLICATE_991a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2372_l2367_l2397_l2384_l2380_l2375_DUPLICATE_991a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2384_c7_e05f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2372_l2367_l2397_l2384_l2380_l2375_DUPLICATE_991a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2397_c7_9d60_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2372_l2367_l2397_l2384_l2380_l2375_DUPLICATE_991a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_b172_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2392_c30_a186_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2389_c3_91f8] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2389_c3_91f8_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2389_c3_91f8_left;
     BIN_OP_OR_uxn_opcodes_h_l2389_c3_91f8_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2389_c3_91f8_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2389_c3_91f8_return_output := BIN_OP_OR_uxn_opcodes_h_l2389_c3_91f8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2402_c7_c73c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c73c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c73c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c73c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c73c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c73c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c73c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c73c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c73c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2397_c7_9d60] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_9d60_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_9d60_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_9d60_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_9d60_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_9d60_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_9d60_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_9d60_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_9d60_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2388_c7_b172] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_b172_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_b172_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_b172_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_b172_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_b172_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_b172_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_b172_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_b172_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2381_c3_ef28] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2381_c3_ef28_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_ef28_left;
     BIN_OP_OR_uxn_opcodes_h_l2381_c3_ef28_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_ef28_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_ef28_return_output := BIN_OP_OR_uxn_opcodes_h_l2381_c3_ef28_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2386_l2377_DUPLICATE_43bd LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2386_l2377_DUPLICATE_43bd_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2386_l2377_DUPLICATE_43bd_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2386_l2377_DUPLICATE_43bd_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2386_l2377_DUPLICATE_43bd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2402_c7_c73c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c73c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c73c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c73c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c73c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c73c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c73c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c73c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c73c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2397_c7_9d60] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_9d60_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_9d60_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_9d60_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_9d60_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_9d60_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_9d60_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_9d60_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_9d60_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2367_c1_71f1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_71f1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_71f1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_71f1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_71f1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_71f1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_71f1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_71f1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_71f1_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2400_c21_5989] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2400_c21_5989_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2400_c31_ccb1_return_output);

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_ef28_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_300f_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2389_c3_91f8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2388_c7_b172_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2389_c3_91f8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2397_c7_9d60_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2400_c21_5989_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2384_c7_e05f_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2386_l2377_DUPLICATE_43bd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2386_l2377_DUPLICATE_43bd_return_output;
     VAR_printf_uxn_opcodes_h_l2368_c3_dad7_uxn_opcodes_h_l2368_c3_dad7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_71f1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_9d60_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c73c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_b172_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_9d60_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_9d60_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c73c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_e05f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_b172_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_b172_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_9d60_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2388_c7_b172] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_b172_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_b172_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_b172_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_b172_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_b172_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_b172_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_b172_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_b172_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2397_c7_9d60] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_9d60_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_9d60_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_9d60_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_9d60_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_9d60_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_9d60_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_9d60_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_9d60_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2388_c7_b172] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_b172_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_b172_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_b172_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_b172_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_b172_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_b172_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_b172_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_b172_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2384_c7_e05f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_e05f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_e05f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_e05f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_e05f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_e05f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_e05f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output;

     -- printf_uxn_opcodes_h_l2368_c3_dad7[uxn_opcodes_h_l2368_c3_dad7] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2368_c3_dad7_uxn_opcodes_h_l2368_c3_dad7_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2368_c3_dad7_uxn_opcodes_h_l2368_c3_dad7_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n16_MUX[uxn_opcodes_h_l2388_c7_b172] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2388_c7_b172_cond <= VAR_n16_MUX_uxn_opcodes_h_l2388_c7_b172_cond;
     n16_MUX_uxn_opcodes_h_l2388_c7_b172_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2388_c7_b172_iftrue;
     n16_MUX_uxn_opcodes_h_l2388_c7_b172_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2388_c7_b172_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2388_c7_b172_return_output := n16_MUX_uxn_opcodes_h_l2388_c7_b172_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2397_c7_9d60] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_9d60_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_9d60_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_9d60_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_9d60_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_9d60_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_9d60_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_9d60_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_9d60_return_output;

     -- t16_MUX[uxn_opcodes_h_l2380_c7_57aa] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2380_c7_57aa_cond <= VAR_t16_MUX_uxn_opcodes_h_l2380_c7_57aa_cond;
     t16_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue;
     t16_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output := t16_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l2390_c11_300f] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_300f_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_300f_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_300f_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_300f_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_300f_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_300f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2397_c7_9d60] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2397_c7_9d60_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2397_c7_9d60_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2397_c7_9d60_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2397_c7_9d60_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2397_c7_9d60_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2397_c7_9d60_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2397_c7_9d60_return_output := result_u8_value_MUX_uxn_opcodes_h_l2397_c7_9d60_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l2388_c7_b172_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_300f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2384_c7_e05f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2388_c7_b172_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_b172_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_9d60_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_e05f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_b172_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_b172_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_9d60_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_e05f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_b172_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_b172_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2397_c7_9d60_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2384_c7_e05f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_e05f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_e05f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_e05f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_e05f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_e05f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_e05f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2380_c7_57aa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_57aa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_57aa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2388_c7_b172] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_b172_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_b172_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_b172_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_b172_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_b172_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_b172_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_b172_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_b172_return_output;

     -- n16_MUX[uxn_opcodes_h_l2384_c7_e05f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2384_c7_e05f_cond <= VAR_n16_MUX_uxn_opcodes_h_l2384_c7_e05f_cond;
     n16_MUX_uxn_opcodes_h_l2384_c7_e05f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2384_c7_e05f_iftrue;
     n16_MUX_uxn_opcodes_h_l2384_c7_e05f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2384_c7_e05f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output := n16_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2384_c7_e05f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_e05f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_e05f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_e05f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_e05f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_e05f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_e05f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2395_c21_6d5d] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2395_c21_6d5d_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_300f_return_output);

     -- t16_MUX[uxn_opcodes_h_l2375_c7_ce2b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond <= VAR_t16_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond;
     t16_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue;
     t16_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output := t16_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2388_c7_b172] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_b172_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_b172_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_b172_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_b172_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_b172_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_b172_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_b172_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_b172_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2388_c7_b172] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2388_c7_b172_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2388_c7_b172_cond;
     tmp16_MUX_uxn_opcodes_h_l2388_c7_b172_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2388_c7_b172_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2388_c7_b172_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2388_c7_b172_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2388_c7_b172_return_output := tmp16_MUX_uxn_opcodes_h_l2388_c7_b172_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_b172_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2395_c21_6d5d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_e05f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_b172_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_e05f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_b172_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2384_c7_e05f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2388_c7_b172_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2380_c7_57aa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_57aa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_57aa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2384_c7_e05f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_e05f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_e05f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_e05f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_e05f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_e05f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_e05f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2380_c7_57aa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_57aa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_57aa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output;

     -- n16_MUX[uxn_opcodes_h_l2380_c7_57aa] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2380_c7_57aa_cond <= VAR_n16_MUX_uxn_opcodes_h_l2380_c7_57aa_cond;
     n16_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue;
     n16_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output := n16_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2388_c7_b172] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2388_c7_b172_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_b172_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2388_c7_b172_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_b172_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2388_c7_b172_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_b172_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_b172_return_output := result_u8_value_MUX_uxn_opcodes_h_l2388_c7_b172_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2375_c7_ce2b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output;

     -- t16_MUX[uxn_opcodes_h_l2372_c7_4317] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2372_c7_4317_cond <= VAR_t16_MUX_uxn_opcodes_h_l2372_c7_4317_cond;
     t16_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue;
     t16_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2372_c7_4317_return_output := t16_MUX_uxn_opcodes_h_l2372_c7_4317_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2384_c7_e05f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2384_c7_e05f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2384_c7_e05f_cond;
     tmp16_MUX_uxn_opcodes_h_l2384_c7_e05f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2384_c7_e05f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2384_c7_e05f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2384_c7_e05f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output := tmp16_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2384_c7_e05f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_e05f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_e05f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_e05f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_e05f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_e05f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_e05f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2384_c7_e05f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_b172_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2372_c7_4317_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output;
     -- t16_MUX[uxn_opcodes_h_l2367_c2_bb2b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond <= VAR_t16_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond;
     t16_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue;
     t16_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output := t16_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2380_c7_57aa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_57aa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_57aa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2372_c7_4317] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_4317_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_4317_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_4317_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_4317_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2380_c7_57aa] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2380_c7_57aa_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2380_c7_57aa_cond;
     tmp16_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output := tmp16_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2375_c7_ce2b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2375_c7_ce2b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output;

     -- n16_MUX[uxn_opcodes_h_l2375_c7_ce2b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond;
     n16_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue;
     n16_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output := n16_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2380_c7_57aa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_57aa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_57aa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2384_c7_e05f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2384_c7_e05f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2384_c7_e05f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2384_c7_e05f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2384_c7_e05f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2384_c7_e05f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2384_c7_e05f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_4317_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2384_c7_e05f_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2375_c7_ce2b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond;
     tmp16_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output := tmp16_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2375_c7_ce2b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output;

     -- n16_MUX[uxn_opcodes_h_l2372_c7_4317] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2372_c7_4317_cond <= VAR_n16_MUX_uxn_opcodes_h_l2372_c7_4317_cond;
     n16_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue;
     n16_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2372_c7_4317_return_output := n16_MUX_uxn_opcodes_h_l2372_c7_4317_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2367_c2_bb2b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2380_c7_57aa] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2380_c7_57aa_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2380_c7_57aa_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2380_c7_57aa_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2380_c7_57aa_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output := result_u8_value_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2375_c7_ce2b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2372_c7_4317] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_4317_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_4317_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_4317_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_4317_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2372_c7_4317] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_4317_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_4317_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_4317_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_4317_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2372_c7_4317_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_4317_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_4317_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2380_c7_57aa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2375_c7_ce2b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_ce2b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_ce2b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_ce2b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2372_c7_4317] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2372_c7_4317_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2372_c7_4317_cond;
     tmp16_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2372_c7_4317_return_output := tmp16_MUX_uxn_opcodes_h_l2372_c7_4317_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2372_c7_4317] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_4317_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_4317_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_4317_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_4317_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2367_c2_bb2b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output;

     -- n16_MUX[uxn_opcodes_h_l2367_c2_bb2b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond;
     n16_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue;
     n16_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output := n16_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2367_c2_bb2b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2372_c7_4317] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_4317_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_4317_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_4317_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_4317_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_4317_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_4317_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_ce2b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2372_c7_4317_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2367_c2_bb2b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2372_c7_4317] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2372_c7_4317_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_4317_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_4317_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_4317_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_4317_return_output := result_u8_value_MUX_uxn_opcodes_h_l2372_c7_4317_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2367_c2_bb2b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2367_c2_bb2b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond;
     tmp16_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output := tmp16_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_4317_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2367_c2_bb2b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c2_bb2b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c2_bb2b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c2_bb2b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l2363_l2407_DUPLICATE_3f0d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l2363_l2407_DUPLICATE_3f0d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8c29(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c2_bb2b_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l2363_l2407_DUPLICATE_3f0d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l2363_l2407_DUPLICATE_3f0d_return_output;
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
