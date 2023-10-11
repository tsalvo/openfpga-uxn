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
-- Submodules: 61
entity div_0CLK_d8848769 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end div_0CLK_d8848769;
architecture arch of div_0CLK_d8848769 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2232_c6_d2a2]
signal BIN_OP_EQ_uxn_opcodes_h_l2232_c6_d2a2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2232_c6_d2a2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2232_c6_d2a2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2232_c1_508c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2232_c1_508c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2232_c1_508c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2232_c1_508c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2232_c1_508c_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2232_c2_4197]
signal t8_MUX_uxn_opcodes_h_l2232_c2_4197_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2232_c2_4197_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2232_c2_4197_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2232_c2_4197_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2232_c2_4197]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2232_c2_4197_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2232_c2_4197_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2232_c2_4197_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2232_c2_4197_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2232_c2_4197]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c2_4197_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c2_4197_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c2_4197_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c2_4197_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2232_c2_4197]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c2_4197_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c2_4197_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c2_4197_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c2_4197_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2232_c2_4197]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2232_c2_4197_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2232_c2_4197_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2232_c2_4197_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2232_c2_4197_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2232_c2_4197]
signal result_stack_value_MUX_uxn_opcodes_h_l2232_c2_4197_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2232_c2_4197_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2232_c2_4197_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2232_c2_4197_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2232_c2_4197]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c2_4197_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c2_4197_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c2_4197_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c2_4197_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2232_c2_4197]
signal n8_MUX_uxn_opcodes_h_l2232_c2_4197_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2232_c2_4197_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2232_c2_4197_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2232_c2_4197_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l2233_c3_86cc[uxn_opcodes_h_l2233_c3_86cc]
signal printf_uxn_opcodes_h_l2233_c3_86cc_uxn_opcodes_h_l2233_c3_86cc_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2237_c11_94af]
signal BIN_OP_EQ_uxn_opcodes_h_l2237_c11_94af_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2237_c11_94af_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2237_c11_94af_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2237_c7_04b0]
signal t8_MUX_uxn_opcodes_h_l2237_c7_04b0_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2237_c7_04b0_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2237_c7_04b0_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2237_c7_04b0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_04b0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_04b0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_04b0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2237_c7_04b0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_04b0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_04b0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_04b0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2237_c7_04b0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_04b0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_04b0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_04b0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2237_c7_04b0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_04b0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_04b0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_04b0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2237_c7_04b0]
signal result_stack_value_MUX_uxn_opcodes_h_l2237_c7_04b0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2237_c7_04b0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2237_c7_04b0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2237_c7_04b0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_04b0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_04b0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_04b0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2237_c7_04b0]
signal n8_MUX_uxn_opcodes_h_l2237_c7_04b0_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2237_c7_04b0_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2237_c7_04b0_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2240_c11_9670]
signal BIN_OP_EQ_uxn_opcodes_h_l2240_c11_9670_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2240_c11_9670_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2240_c11_9670_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2240_c7_a46b]
signal t8_MUX_uxn_opcodes_h_l2240_c7_a46b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2240_c7_a46b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2240_c7_a46b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2240_c7_a46b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_a46b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_a46b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_a46b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2240_c7_a46b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_a46b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_a46b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_a46b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2240_c7_a46b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_a46b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_a46b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_a46b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2240_c7_a46b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_a46b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_a46b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_a46b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2240_c7_a46b]
signal result_stack_value_MUX_uxn_opcodes_h_l2240_c7_a46b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2240_c7_a46b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2240_c7_a46b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2240_c7_a46b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_a46b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_a46b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_a46b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2240_c7_a46b]
signal n8_MUX_uxn_opcodes_h_l2240_c7_a46b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2240_c7_a46b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2240_c7_a46b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2244_c11_bd4c]
signal BIN_OP_EQ_uxn_opcodes_h_l2244_c11_bd4c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2244_c11_bd4c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2244_c11_bd4c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2244_c7_9c2f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_9c2f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_9c2f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_9c2f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_9c2f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2244_c7_9c2f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_9c2f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_9c2f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_9c2f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_9c2f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2244_c7_9c2f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2244_c7_9c2f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_9c2f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_9c2f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_9c2f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_9c2f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2244_c7_9c2f]
signal result_stack_value_MUX_uxn_opcodes_h_l2244_c7_9c2f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2244_c7_9c2f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2244_c7_9c2f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2244_c7_9c2f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2244_c7_9c2f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2244_c7_9c2f]
signal n8_MUX_uxn_opcodes_h_l2244_c7_9c2f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2244_c7_9c2f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2244_c7_9c2f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2244_c7_9c2f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2247_c11_94f4]
signal BIN_OP_EQ_uxn_opcodes_h_l2247_c11_94f4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2247_c11_94f4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2247_c11_94f4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2247_c7_3e4c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_3e4c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_3e4c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_3e4c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_3e4c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2247_c7_3e4c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_3e4c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_3e4c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_3e4c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_3e4c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2247_c7_3e4c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2247_c7_3e4c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_3e4c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_3e4c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_3e4c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_3e4c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2247_c7_3e4c]
signal result_stack_value_MUX_uxn_opcodes_h_l2247_c7_3e4c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2247_c7_3e4c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2247_c7_3e4c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2247_c7_3e4c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2247_c7_3e4c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2247_c7_3e4c]
signal n8_MUX_uxn_opcodes_h_l2247_c7_3e4c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2247_c7_3e4c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2247_c7_3e4c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2247_c7_3e4c_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2250_c32_d8e0]
signal BIN_OP_AND_uxn_opcodes_h_l2250_c32_d8e0_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2250_c32_d8e0_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2250_c32_d8e0_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2250_c32_0694]
signal BIN_OP_GT_uxn_opcodes_h_l2250_c32_0694_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2250_c32_0694_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2250_c32_0694_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2250_c32_6103]
signal MUX_uxn_opcodes_h_l2250_c32_6103_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2250_c32_6103_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2250_c32_6103_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2250_c32_6103_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2252_c11_2912]
signal BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2912_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2912_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2912_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2252_c7_5289]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_5289_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_5289_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_5289_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_5289_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2252_c7_5289]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_5289_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_5289_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_5289_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_5289_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2252_c7_5289]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_5289_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_5289_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_5289_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_5289_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2252_c7_5289]
signal result_stack_value_MUX_uxn_opcodes_h_l2252_c7_5289_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2252_c7_5289_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2252_c7_5289_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2252_c7_5289_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2252_c7_5289]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_5289_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_5289_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_5289_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_5289_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2256_c24_f37b]
signal BIN_OP_EQ_uxn_opcodes_h_l2256_c24_f37b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2256_c24_f37b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2256_c24_f37b_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l2256_c38_352f]
signal BIN_OP_DIV_uxn_opcodes_h_l2256_c38_352f_left : unsigned(7 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2256_c38_352f_right : unsigned(7 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2256_c38_352f_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l2256_c24_37da]
signal MUX_uxn_opcodes_h_l2256_c24_37da_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2256_c24_37da_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2256_c24_37da_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2256_c24_37da_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2258_c11_ead1]
signal BIN_OP_EQ_uxn_opcodes_h_l2258_c11_ead1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2258_c11_ead1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2258_c11_ead1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2258_c7_31e5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2258_c7_31e5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2258_c7_31e5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2258_c7_31e5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2258_c7_31e5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2258_c7_31e5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2258_c7_31e5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2258_c7_31e5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2258_c7_31e5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2258_c7_31e5_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2232_c6_d2a2
BIN_OP_EQ_uxn_opcodes_h_l2232_c6_d2a2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2232_c6_d2a2_left,
BIN_OP_EQ_uxn_opcodes_h_l2232_c6_d2a2_right,
BIN_OP_EQ_uxn_opcodes_h_l2232_c6_d2a2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2232_c1_508c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2232_c1_508c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2232_c1_508c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2232_c1_508c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2232_c1_508c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2232_c1_508c_return_output);

-- t8_MUX_uxn_opcodes_h_l2232_c2_4197
t8_MUX_uxn_opcodes_h_l2232_c2_4197 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2232_c2_4197_cond,
t8_MUX_uxn_opcodes_h_l2232_c2_4197_iftrue,
t8_MUX_uxn_opcodes_h_l2232_c2_4197_iffalse,
t8_MUX_uxn_opcodes_h_l2232_c2_4197_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2232_c2_4197
result_is_stack_write_MUX_uxn_opcodes_h_l2232_c2_4197 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2232_c2_4197_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2232_c2_4197_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2232_c2_4197_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2232_c2_4197_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c2_4197
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c2_4197 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c2_4197_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c2_4197_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c2_4197_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c2_4197_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c2_4197
result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c2_4197 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c2_4197_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c2_4197_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c2_4197_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c2_4197_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2232_c2_4197
result_is_opc_done_MUX_uxn_opcodes_h_l2232_c2_4197 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2232_c2_4197_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2232_c2_4197_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2232_c2_4197_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2232_c2_4197_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2232_c2_4197
result_stack_value_MUX_uxn_opcodes_h_l2232_c2_4197 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2232_c2_4197_cond,
result_stack_value_MUX_uxn_opcodes_h_l2232_c2_4197_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2232_c2_4197_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2232_c2_4197_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c2_4197
result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c2_4197 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c2_4197_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c2_4197_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c2_4197_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c2_4197_return_output);

-- n8_MUX_uxn_opcodes_h_l2232_c2_4197
n8_MUX_uxn_opcodes_h_l2232_c2_4197 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2232_c2_4197_cond,
n8_MUX_uxn_opcodes_h_l2232_c2_4197_iftrue,
n8_MUX_uxn_opcodes_h_l2232_c2_4197_iffalse,
n8_MUX_uxn_opcodes_h_l2232_c2_4197_return_output);

-- printf_uxn_opcodes_h_l2233_c3_86cc_uxn_opcodes_h_l2233_c3_86cc
printf_uxn_opcodes_h_l2233_c3_86cc_uxn_opcodes_h_l2233_c3_86cc : entity work.printf_uxn_opcodes_h_l2233_c3_86cc_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2233_c3_86cc_uxn_opcodes_h_l2233_c3_86cc_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2237_c11_94af
BIN_OP_EQ_uxn_opcodes_h_l2237_c11_94af : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2237_c11_94af_left,
BIN_OP_EQ_uxn_opcodes_h_l2237_c11_94af_right,
BIN_OP_EQ_uxn_opcodes_h_l2237_c11_94af_return_output);

-- t8_MUX_uxn_opcodes_h_l2237_c7_04b0
t8_MUX_uxn_opcodes_h_l2237_c7_04b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2237_c7_04b0_cond,
t8_MUX_uxn_opcodes_h_l2237_c7_04b0_iftrue,
t8_MUX_uxn_opcodes_h_l2237_c7_04b0_iffalse,
t8_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_04b0
result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_04b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_04b0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_04b0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_04b0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_04b0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_04b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_04b0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_04b0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_04b0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_04b0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_04b0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_04b0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_04b0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_04b0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_04b0
result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_04b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_04b0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_04b0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_04b0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2237_c7_04b0
result_stack_value_MUX_uxn_opcodes_h_l2237_c7_04b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2237_c7_04b0_cond,
result_stack_value_MUX_uxn_opcodes_h_l2237_c7_04b0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2237_c7_04b0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_04b0
result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_04b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_04b0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_04b0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_04b0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output);

-- n8_MUX_uxn_opcodes_h_l2237_c7_04b0
n8_MUX_uxn_opcodes_h_l2237_c7_04b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2237_c7_04b0_cond,
n8_MUX_uxn_opcodes_h_l2237_c7_04b0_iftrue,
n8_MUX_uxn_opcodes_h_l2237_c7_04b0_iffalse,
n8_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2240_c11_9670
BIN_OP_EQ_uxn_opcodes_h_l2240_c11_9670 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2240_c11_9670_left,
BIN_OP_EQ_uxn_opcodes_h_l2240_c11_9670_right,
BIN_OP_EQ_uxn_opcodes_h_l2240_c11_9670_return_output);

-- t8_MUX_uxn_opcodes_h_l2240_c7_a46b
t8_MUX_uxn_opcodes_h_l2240_c7_a46b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2240_c7_a46b_cond,
t8_MUX_uxn_opcodes_h_l2240_c7_a46b_iftrue,
t8_MUX_uxn_opcodes_h_l2240_c7_a46b_iffalse,
t8_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_a46b
result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_a46b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_a46b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_a46b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_a46b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_a46b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_a46b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_a46b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_a46b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_a46b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_a46b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_a46b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_a46b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_a46b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_a46b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_a46b
result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_a46b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_a46b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_a46b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_a46b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2240_c7_a46b
result_stack_value_MUX_uxn_opcodes_h_l2240_c7_a46b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2240_c7_a46b_cond,
result_stack_value_MUX_uxn_opcodes_h_l2240_c7_a46b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2240_c7_a46b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_a46b
result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_a46b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_a46b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_a46b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_a46b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output);

-- n8_MUX_uxn_opcodes_h_l2240_c7_a46b
n8_MUX_uxn_opcodes_h_l2240_c7_a46b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2240_c7_a46b_cond,
n8_MUX_uxn_opcodes_h_l2240_c7_a46b_iftrue,
n8_MUX_uxn_opcodes_h_l2240_c7_a46b_iffalse,
n8_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2244_c11_bd4c
BIN_OP_EQ_uxn_opcodes_h_l2244_c11_bd4c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2244_c11_bd4c_left,
BIN_OP_EQ_uxn_opcodes_h_l2244_c11_bd4c_right,
BIN_OP_EQ_uxn_opcodes_h_l2244_c11_bd4c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_9c2f
result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_9c2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_9c2f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_9c2f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_9c2f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_9c2f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_9c2f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_9c2f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_9c2f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_9c2f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_9c2f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_9c2f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_9c2f
result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_9c2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_9c2f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_9c2f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_9c2f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_9c2f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2244_c7_9c2f
result_stack_value_MUX_uxn_opcodes_h_l2244_c7_9c2f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2244_c7_9c2f_cond,
result_stack_value_MUX_uxn_opcodes_h_l2244_c7_9c2f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2244_c7_9c2f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2244_c7_9c2f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f
result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f_return_output);

-- n8_MUX_uxn_opcodes_h_l2244_c7_9c2f
n8_MUX_uxn_opcodes_h_l2244_c7_9c2f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2244_c7_9c2f_cond,
n8_MUX_uxn_opcodes_h_l2244_c7_9c2f_iftrue,
n8_MUX_uxn_opcodes_h_l2244_c7_9c2f_iffalse,
n8_MUX_uxn_opcodes_h_l2244_c7_9c2f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2247_c11_94f4
BIN_OP_EQ_uxn_opcodes_h_l2247_c11_94f4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2247_c11_94f4_left,
BIN_OP_EQ_uxn_opcodes_h_l2247_c11_94f4_right,
BIN_OP_EQ_uxn_opcodes_h_l2247_c11_94f4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_3e4c
result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_3e4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_3e4c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_3e4c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_3e4c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_3e4c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_3e4c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_3e4c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_3e4c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_3e4c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_3e4c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_3e4c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_3e4c
result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_3e4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_3e4c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_3e4c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_3e4c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_3e4c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2247_c7_3e4c
result_stack_value_MUX_uxn_opcodes_h_l2247_c7_3e4c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2247_c7_3e4c_cond,
result_stack_value_MUX_uxn_opcodes_h_l2247_c7_3e4c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2247_c7_3e4c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2247_c7_3e4c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c
result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c_return_output);

-- n8_MUX_uxn_opcodes_h_l2247_c7_3e4c
n8_MUX_uxn_opcodes_h_l2247_c7_3e4c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2247_c7_3e4c_cond,
n8_MUX_uxn_opcodes_h_l2247_c7_3e4c_iftrue,
n8_MUX_uxn_opcodes_h_l2247_c7_3e4c_iffalse,
n8_MUX_uxn_opcodes_h_l2247_c7_3e4c_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2250_c32_d8e0
BIN_OP_AND_uxn_opcodes_h_l2250_c32_d8e0 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2250_c32_d8e0_left,
BIN_OP_AND_uxn_opcodes_h_l2250_c32_d8e0_right,
BIN_OP_AND_uxn_opcodes_h_l2250_c32_d8e0_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2250_c32_0694
BIN_OP_GT_uxn_opcodes_h_l2250_c32_0694 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2250_c32_0694_left,
BIN_OP_GT_uxn_opcodes_h_l2250_c32_0694_right,
BIN_OP_GT_uxn_opcodes_h_l2250_c32_0694_return_output);

-- MUX_uxn_opcodes_h_l2250_c32_6103
MUX_uxn_opcodes_h_l2250_c32_6103 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2250_c32_6103_cond,
MUX_uxn_opcodes_h_l2250_c32_6103_iftrue,
MUX_uxn_opcodes_h_l2250_c32_6103_iffalse,
MUX_uxn_opcodes_h_l2250_c32_6103_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2912
BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2912 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2912_left,
BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2912_right,
BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2912_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_5289
result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_5289 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_5289_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_5289_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_5289_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_5289_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_5289
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_5289 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_5289_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_5289_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_5289_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_5289_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_5289
result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_5289 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_5289_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_5289_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_5289_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_5289_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2252_c7_5289
result_stack_value_MUX_uxn_opcodes_h_l2252_c7_5289 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2252_c7_5289_cond,
result_stack_value_MUX_uxn_opcodes_h_l2252_c7_5289_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2252_c7_5289_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2252_c7_5289_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_5289
result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_5289 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_5289_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_5289_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_5289_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_5289_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2256_c24_f37b
BIN_OP_EQ_uxn_opcodes_h_l2256_c24_f37b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2256_c24_f37b_left,
BIN_OP_EQ_uxn_opcodes_h_l2256_c24_f37b_right,
BIN_OP_EQ_uxn_opcodes_h_l2256_c24_f37b_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l2256_c38_352f
BIN_OP_DIV_uxn_opcodes_h_l2256_c38_352f : entity work.BIN_OP_DIV_uint8_t_uint8_t_0CLK_a148083c port map (
BIN_OP_DIV_uxn_opcodes_h_l2256_c38_352f_left,
BIN_OP_DIV_uxn_opcodes_h_l2256_c38_352f_right,
BIN_OP_DIV_uxn_opcodes_h_l2256_c38_352f_return_output);

-- MUX_uxn_opcodes_h_l2256_c24_37da
MUX_uxn_opcodes_h_l2256_c24_37da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2256_c24_37da_cond,
MUX_uxn_opcodes_h_l2256_c24_37da_iftrue,
MUX_uxn_opcodes_h_l2256_c24_37da_iffalse,
MUX_uxn_opcodes_h_l2256_c24_37da_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2258_c11_ead1
BIN_OP_EQ_uxn_opcodes_h_l2258_c11_ead1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2258_c11_ead1_left,
BIN_OP_EQ_uxn_opcodes_h_l2258_c11_ead1_right,
BIN_OP_EQ_uxn_opcodes_h_l2258_c11_ead1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2258_c7_31e5
result_is_stack_write_MUX_uxn_opcodes_h_l2258_c7_31e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2258_c7_31e5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2258_c7_31e5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2258_c7_31e5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2258_c7_31e5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2258_c7_31e5
result_is_opc_done_MUX_uxn_opcodes_h_l2258_c7_31e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2258_c7_31e5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2258_c7_31e5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2258_c7_31e5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2258_c7_31e5_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2232_c6_d2a2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2232_c1_508c_return_output,
 t8_MUX_uxn_opcodes_h_l2232_c2_4197_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2232_c2_4197_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c2_4197_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c2_4197_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2232_c2_4197_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2232_c2_4197_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c2_4197_return_output,
 n8_MUX_uxn_opcodes_h_l2232_c2_4197_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2237_c11_94af_return_output,
 t8_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output,
 n8_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2240_c11_9670_return_output,
 t8_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output,
 n8_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2244_c11_bd4c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_9c2f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_9c2f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_9c2f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2244_c7_9c2f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f_return_output,
 n8_MUX_uxn_opcodes_h_l2244_c7_9c2f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2247_c11_94f4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_3e4c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_3e4c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_3e4c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2247_c7_3e4c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c_return_output,
 n8_MUX_uxn_opcodes_h_l2247_c7_3e4c_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2250_c32_d8e0_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2250_c32_0694_return_output,
 MUX_uxn_opcodes_h_l2250_c32_6103_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2912_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_5289_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_5289_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_5289_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2252_c7_5289_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_5289_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2256_c24_f37b_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l2256_c38_352f_return_output,
 MUX_uxn_opcodes_h_l2256_c24_37da_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2258_c11_ead1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2258_c7_31e5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2258_c7_31e5_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2232_c6_d2a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2232_c6_d2a2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2232_c6_d2a2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2232_c1_508c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2232_c1_508c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2232_c1_508c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2232_c1_508c_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2232_c2_4197_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2232_c2_4197_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2232_c2_4197_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2232_c2_4197_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2232_c2_4197_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2232_c2_4197_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2232_c2_4197_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2232_c2_4197_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c2_4197_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2234_c3_c710 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c2_4197_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c2_4197_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c2_4197_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c2_4197_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c2_4197_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c2_4197_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c2_4197_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2232_c2_4197_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2232_c2_4197_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2232_c2_4197_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2232_c2_4197_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2232_c2_4197_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2232_c2_4197_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2232_c2_4197_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2232_c2_4197_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c2_4197_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c2_4197_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c2_4197_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c2_4197_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2232_c2_4197_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2232_c2_4197_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2232_c2_4197_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2232_c2_4197_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2233_c3_86cc_uxn_opcodes_h_l2233_c3_86cc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_94af_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_94af_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_94af_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2237_c7_04b0_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2237_c7_04b0_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2237_c7_04b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_04b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_04b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_04b0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_04b0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2238_c3_e76e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_04b0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_04b0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_04b0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_04b0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_04b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_04b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_04b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_04b0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2237_c7_04b0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2237_c7_04b0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2237_c7_04b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_04b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_04b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_04b0_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2237_c7_04b0_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2237_c7_04b0_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2237_c7_04b0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2240_c11_9670_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2240_c11_9670_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2240_c11_9670_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2240_c7_a46b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2240_c7_a46b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2240_c7_a46b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_a46b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_a46b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_9c2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_a46b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_a46b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2242_c3_eb6f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_a46b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_9c2f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_a46b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_a46b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_a46b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_a46b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_a46b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_a46b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_9c2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_a46b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2240_c7_a46b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2240_c7_a46b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2244_c7_9c2f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2240_c7_a46b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_a46b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_a46b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_a46b_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2240_c7_a46b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2240_c7_a46b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2244_c7_9c2f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2240_c7_a46b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_bd4c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_bd4c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_bd4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_9c2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_9c2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_3e4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_9c2f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_9c2f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2245_c3_de66 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_9c2f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_3e4c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_9c2f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_9c2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_9c2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_3e4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_9c2f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2244_c7_9c2f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2244_c7_9c2f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2247_c7_3e4c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2244_c7_9c2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2244_c7_9c2f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2244_c7_9c2f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2247_c7_3e4c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2244_c7_9c2f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_94f4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_94f4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_94f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_3e4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_3e4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_5289_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_3e4c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_3e4c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_3e4c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_5289_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_3e4c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_3e4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_3e4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_5289_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_3e4c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2247_c7_3e4c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2247_c7_3e4c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2252_c7_5289_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2247_c7_3e4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_5289_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2247_c7_3e4c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2247_c7_3e4c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2247_c7_3e4c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2250_c32_6103_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2250_c32_6103_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2250_c32_6103_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2250_c32_d8e0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2250_c32_d8e0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2250_c32_d8e0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2250_c32_0694_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2250_c32_0694_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2250_c32_0694_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2250_c32_6103_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2912_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2912_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2912_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_5289_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_5289_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2258_c7_31e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_5289_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_5289_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2255_c3_980b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_5289_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_5289_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_5289_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_5289_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2258_c7_31e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_5289_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2252_c7_5289_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2252_c7_5289_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2252_c7_5289_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_5289_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_5289_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_5289_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2256_c24_37da_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2256_c24_37da_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2256_c24_37da_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c24_f37b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c24_f37b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c24_f37b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2256_c38_352f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2256_c38_352f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2256_c38_352f_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2256_c24_37da_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2258_c11_ead1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2258_c11_ead1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2258_c11_ead1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2258_c7_31e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2258_c7_31e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2258_c7_31e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2258_c7_31e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2258_c7_31e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2258_c7_31e5_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2240_l2237_l2232_l2258_l2247_l2244_DUPLICATE_ac57_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2240_l2237_l2232_l2247_l2244_DUPLICATE_b109_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2240_l2237_l2232_l2252_l2247_l2244_DUPLICATE_6304_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2240_l2237_l2232_l2252_l2244_DUPLICATE_3e4a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2240_l2237_l2258_l2252_l2247_l2244_DUPLICATE_462d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2252_l2247_DUPLICATE_e3dd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2263_l2228_DUPLICATE_31c2_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2255_c3_980b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_5289_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2255_c3_980b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2232_c6_d2a2_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2232_c2_4197_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2240_c11_9670_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2245_c3_de66 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_9c2f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2245_c3_de66;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_5289_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_94f4_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2258_c11_ead1_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c24_f37b_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2250_c32_6103_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2242_c3_eb6f := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_a46b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2242_c3_eb6f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2238_c3_e76e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_04b0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2238_c3_e76e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_94af_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_5289_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2250_c32_d8e0_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2234_c3_c710 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c2_4197_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2234_c3_c710;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2250_c32_0694_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2258_c7_31e5_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2256_c24_37da_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2258_c7_31e5_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2912_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_bd4c_right := to_unsigned(3, 2);
     VAR_MUX_uxn_opcodes_h_l2250_c32_6103_iffalse := resize(to_signed(-1, 2), 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2232_c1_508c_iffalse := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2232_c1_508c_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2250_c32_d8e0_left := VAR_ins;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2256_c38_352f_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2232_c2_4197_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2237_c7_04b0_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2240_c7_a46b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2244_c7_9c2f_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2247_c7_3e4c_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2232_c6_d2a2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_94af_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2240_c11_9670_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_bd4c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_94f4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2912_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2258_c11_ead1_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2247_c7_3e4c_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2240_c7_a46b_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2256_c38_352f_right := t8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c24_f37b_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2232_c2_4197_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2237_c7_04b0_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2240_c7_a46b_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l2232_c6_d2a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2232_c6_d2a2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2232_c6_d2a2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2232_c6_d2a2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2232_c6_d2a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2232_c6_d2a2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2232_c6_d2a2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2256_c24_f37b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2256_c24_f37b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c24_f37b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2256_c24_f37b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c24_f37b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c24_f37b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2256_c24_f37b_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2240_l2237_l2232_l2247_l2244_DUPLICATE_b109 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2240_l2237_l2232_l2247_l2244_DUPLICATE_b109_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2240_l2237_l2232_l2252_l2244_DUPLICATE_3e4a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2240_l2237_l2232_l2252_l2244_DUPLICATE_3e4a_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2240_c11_9670] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2240_c11_9670_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2240_c11_9670_left;
     BIN_OP_EQ_uxn_opcodes_h_l2240_c11_9670_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2240_c11_9670_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2240_c11_9670_return_output := BIN_OP_EQ_uxn_opcodes_h_l2240_c11_9670_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2237_c11_94af] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2237_c11_94af_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_94af_left;
     BIN_OP_EQ_uxn_opcodes_h_l2237_c11_94af_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_94af_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_94af_return_output := BIN_OP_EQ_uxn_opcodes_h_l2237_c11_94af_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2258_c11_ead1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2258_c11_ead1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2258_c11_ead1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2258_c11_ead1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2258_c11_ead1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2258_c11_ead1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2258_c11_ead1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2247_c11_94f4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2247_c11_94f4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_94f4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2247_c11_94f4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_94f4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_94f4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2247_c11_94f4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2244_c11_bd4c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2244_c11_bd4c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_bd4c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2244_c11_bd4c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_bd4c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_bd4c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2244_c11_bd4c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2252_c11_2912] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2912_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2912_left;
     BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2912_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2912_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2912_return_output := BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2912_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2240_l2237_l2232_l2258_l2247_l2244_DUPLICATE_ac57 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2240_l2237_l2232_l2258_l2247_l2244_DUPLICATE_ac57_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2240_l2237_l2232_l2252_l2247_l2244_DUPLICATE_6304 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2240_l2237_l2232_l2252_l2247_l2244_DUPLICATE_6304_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2240_l2237_l2258_l2252_l2247_l2244_DUPLICATE_462d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2240_l2237_l2258_l2252_l2247_l2244_DUPLICATE_462d_return_output := result.is_opc_done;

     -- BIN_OP_DIV[uxn_opcodes_h_l2256_c38_352f] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l2256_c38_352f_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2256_c38_352f_left;
     BIN_OP_DIV_uxn_opcodes_h_l2256_c38_352f_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2256_c38_352f_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2256_c38_352f_return_output := BIN_OP_DIV_uxn_opcodes_h_l2256_c38_352f_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2252_l2247_DUPLICATE_e3dd LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2252_l2247_DUPLICATE_e3dd_return_output := result.stack_address_sp_offset;

     -- BIN_OP_AND[uxn_opcodes_h_l2250_c32_d8e0] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2250_c32_d8e0_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2250_c32_d8e0_left;
     BIN_OP_AND_uxn_opcodes_h_l2250_c32_d8e0_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2250_c32_d8e0_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2250_c32_d8e0_return_output := BIN_OP_AND_uxn_opcodes_h_l2250_c32_d8e0_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2250_c32_0694_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2250_c32_d8e0_return_output;
     VAR_MUX_uxn_opcodes_h_l2256_c24_37da_iffalse := VAR_BIN_OP_DIV_uxn_opcodes_h_l2256_c38_352f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2232_c1_508c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2232_c6_d2a2_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2232_c2_4197_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2232_c6_d2a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2232_c2_4197_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2232_c6_d2a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c2_4197_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2232_c6_d2a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2232_c2_4197_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2232_c6_d2a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c2_4197_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2232_c6_d2a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c2_4197_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2232_c6_d2a2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2232_c2_4197_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2232_c6_d2a2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2232_c2_4197_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2232_c6_d2a2_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2237_c7_04b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_94af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_04b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_94af_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_04b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_94af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_04b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_94af_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_04b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_94af_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_04b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_94af_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2237_c7_04b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_94af_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2237_c7_04b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_94af_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2240_c7_a46b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2240_c11_9670_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_a46b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2240_c11_9670_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_a46b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2240_c11_9670_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_a46b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2240_c11_9670_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_a46b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2240_c11_9670_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_a46b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2240_c11_9670_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2240_c7_a46b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2240_c11_9670_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2240_c7_a46b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2240_c11_9670_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2244_c7_9c2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_bd4c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_9c2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_bd4c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_bd4c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_9c2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_bd4c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_bd4c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_9c2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_bd4c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2244_c7_9c2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_bd4c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2247_c7_3e4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_94f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_3e4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_94f4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_94f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_3e4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_94f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_94f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_3e4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_94f4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2247_c7_3e4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_94f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_5289_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2912_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_5289_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2912_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_5289_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2912_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_5289_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2912_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2252_c7_5289_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2912_return_output;
     VAR_MUX_uxn_opcodes_h_l2256_c24_37da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c24_f37b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2258_c7_31e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2258_c11_ead1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2258_c7_31e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2258_c11_ead1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c2_4197_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2240_l2237_l2232_l2247_l2244_DUPLICATE_b109_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_04b0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2240_l2237_l2232_l2247_l2244_DUPLICATE_b109_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_a46b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2240_l2237_l2232_l2247_l2244_DUPLICATE_b109_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2240_l2237_l2232_l2247_l2244_DUPLICATE_b109_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2240_l2237_l2232_l2247_l2244_DUPLICATE_b109_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_04b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2240_l2237_l2258_l2252_l2247_l2244_DUPLICATE_462d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_a46b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2240_l2237_l2258_l2252_l2247_l2244_DUPLICATE_462d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_9c2f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2240_l2237_l2258_l2252_l2247_l2244_DUPLICATE_462d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_3e4c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2240_l2237_l2258_l2252_l2247_l2244_DUPLICATE_462d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_5289_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2240_l2237_l2258_l2252_l2247_l2244_DUPLICATE_462d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2258_c7_31e5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2240_l2237_l2258_l2252_l2247_l2244_DUPLICATE_462d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c2_4197_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2240_l2237_l2232_l2252_l2244_DUPLICATE_3e4a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_04b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2240_l2237_l2232_l2252_l2244_DUPLICATE_3e4a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_a46b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2240_l2237_l2232_l2252_l2244_DUPLICATE_3e4a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2240_l2237_l2232_l2252_l2244_DUPLICATE_3e4a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_5289_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2240_l2237_l2232_l2252_l2244_DUPLICATE_3e4a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2232_c2_4197_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2240_l2237_l2232_l2258_l2247_l2244_DUPLICATE_ac57_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_04b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2240_l2237_l2232_l2258_l2247_l2244_DUPLICATE_ac57_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_a46b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2240_l2237_l2232_l2258_l2247_l2244_DUPLICATE_ac57_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_9c2f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2240_l2237_l2232_l2258_l2247_l2244_DUPLICATE_ac57_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_3e4c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2240_l2237_l2232_l2258_l2247_l2244_DUPLICATE_ac57_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2258_c7_31e5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2240_l2237_l2232_l2258_l2247_l2244_DUPLICATE_ac57_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_3e4c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2252_l2247_DUPLICATE_e3dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_5289_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2252_l2247_DUPLICATE_e3dd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2232_c2_4197_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2240_l2237_l2232_l2252_l2247_l2244_DUPLICATE_6304_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2237_c7_04b0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2240_l2237_l2232_l2252_l2247_l2244_DUPLICATE_6304_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2240_c7_a46b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2240_l2237_l2232_l2252_l2247_l2244_DUPLICATE_6304_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2244_c7_9c2f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2240_l2237_l2232_l2252_l2247_l2244_DUPLICATE_6304_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2247_c7_3e4c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2240_l2237_l2232_l2252_l2247_l2244_DUPLICATE_6304_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2252_c7_5289_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2240_l2237_l2232_l2252_l2247_l2244_DUPLICATE_6304_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2232_c1_508c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2232_c1_508c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2232_c1_508c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2232_c1_508c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2232_c1_508c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2232_c1_508c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2232_c1_508c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2232_c1_508c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2232_c1_508c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2258_c7_31e5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2258_c7_31e5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2258_c7_31e5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2258_c7_31e5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2258_c7_31e5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2258_c7_31e5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2258_c7_31e5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2258_c7_31e5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2258_c7_31e5_return_output;

     -- t8_MUX[uxn_opcodes_h_l2240_c7_a46b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2240_c7_a46b_cond <= VAR_t8_MUX_uxn_opcodes_h_l2240_c7_a46b_cond;
     t8_MUX_uxn_opcodes_h_l2240_c7_a46b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2240_c7_a46b_iftrue;
     t8_MUX_uxn_opcodes_h_l2240_c7_a46b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2240_c7_a46b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output := t8_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2250_c32_0694] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2250_c32_0694_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2250_c32_0694_left;
     BIN_OP_GT_uxn_opcodes_h_l2250_c32_0694_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2250_c32_0694_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2250_c32_0694_return_output := BIN_OP_GT_uxn_opcodes_h_l2250_c32_0694_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2252_c7_5289] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_5289_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_5289_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_5289_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_5289_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_5289_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_5289_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_5289_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_5289_return_output;

     -- n8_MUX[uxn_opcodes_h_l2247_c7_3e4c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2247_c7_3e4c_cond <= VAR_n8_MUX_uxn_opcodes_h_l2247_c7_3e4c_cond;
     n8_MUX_uxn_opcodes_h_l2247_c7_3e4c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2247_c7_3e4c_iftrue;
     n8_MUX_uxn_opcodes_h_l2247_c7_3e4c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2247_c7_3e4c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2247_c7_3e4c_return_output := n8_MUX_uxn_opcodes_h_l2247_c7_3e4c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2252_c7_5289] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_5289_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_5289_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_5289_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_5289_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_5289_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_5289_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_5289_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_5289_return_output;

     -- MUX[uxn_opcodes_h_l2256_c24_37da] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2256_c24_37da_cond <= VAR_MUX_uxn_opcodes_h_l2256_c24_37da_cond;
     MUX_uxn_opcodes_h_l2256_c24_37da_iftrue <= VAR_MUX_uxn_opcodes_h_l2256_c24_37da_iftrue;
     MUX_uxn_opcodes_h_l2256_c24_37da_iffalse <= VAR_MUX_uxn_opcodes_h_l2256_c24_37da_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2256_c24_37da_return_output := MUX_uxn_opcodes_h_l2256_c24_37da_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2258_c7_31e5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2258_c7_31e5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2258_c7_31e5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2258_c7_31e5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2258_c7_31e5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2258_c7_31e5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2258_c7_31e5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2258_c7_31e5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2258_c7_31e5_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2250_c32_6103_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2250_c32_0694_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2252_c7_5289_iftrue := VAR_MUX_uxn_opcodes_h_l2256_c24_37da_return_output;
     VAR_printf_uxn_opcodes_h_l2233_c3_86cc_uxn_opcodes_h_l2233_c3_86cc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2232_c1_508c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2244_c7_9c2f_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2247_c7_3e4c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_5289_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2258_c7_31e5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_5289_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_5289_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2258_c7_31e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_3e4c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_5289_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2237_c7_04b0_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output;
     -- t8_MUX[uxn_opcodes_h_l2237_c7_04b0] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2237_c7_04b0_cond <= VAR_t8_MUX_uxn_opcodes_h_l2237_c7_04b0_cond;
     t8_MUX_uxn_opcodes_h_l2237_c7_04b0_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2237_c7_04b0_iftrue;
     t8_MUX_uxn_opcodes_h_l2237_c7_04b0_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2237_c7_04b0_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output := t8_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2252_c7_5289] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_5289_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_5289_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_5289_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_5289_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_5289_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_5289_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_5289_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_5289_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2247_c7_3e4c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2252_c7_5289] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_5289_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_5289_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_5289_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_5289_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_5289_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_5289_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_5289_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_5289_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2247_c7_3e4c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_3e4c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_3e4c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_3e4c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_3e4c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_3e4c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_3e4c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_3e4c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_3e4c_return_output;

     -- MUX[uxn_opcodes_h_l2250_c32_6103] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2250_c32_6103_cond <= VAR_MUX_uxn_opcodes_h_l2250_c32_6103_cond;
     MUX_uxn_opcodes_h_l2250_c32_6103_iftrue <= VAR_MUX_uxn_opcodes_h_l2250_c32_6103_iftrue;
     MUX_uxn_opcodes_h_l2250_c32_6103_iffalse <= VAR_MUX_uxn_opcodes_h_l2250_c32_6103_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2250_c32_6103_return_output := MUX_uxn_opcodes_h_l2250_c32_6103_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2252_c7_5289] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2252_c7_5289_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2252_c7_5289_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2252_c7_5289_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2252_c7_5289_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2252_c7_5289_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2252_c7_5289_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2252_c7_5289_return_output := result_stack_value_MUX_uxn_opcodes_h_l2252_c7_5289_return_output;

     -- n8_MUX[uxn_opcodes_h_l2244_c7_9c2f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2244_c7_9c2f_cond <= VAR_n8_MUX_uxn_opcodes_h_l2244_c7_9c2f_cond;
     n8_MUX_uxn_opcodes_h_l2244_c7_9c2f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2244_c7_9c2f_iftrue;
     n8_MUX_uxn_opcodes_h_l2244_c7_9c2f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2244_c7_9c2f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2244_c7_9c2f_return_output := n8_MUX_uxn_opcodes_h_l2244_c7_9c2f_return_output;

     -- printf_uxn_opcodes_h_l2233_c3_86cc[uxn_opcodes_h_l2233_c3_86cc] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2233_c3_86cc_uxn_opcodes_h_l2233_c3_86cc_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2233_c3_86cc_uxn_opcodes_h_l2233_c3_86cc_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c_iftrue := VAR_MUX_uxn_opcodes_h_l2250_c32_6103_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2240_c7_a46b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2244_c7_9c2f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_3e4c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_5289_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_3e4c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_5289_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_9c2f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_3e4c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2247_c7_3e4c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2252_c7_5289_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2232_c2_4197_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output;
     -- t8_MUX[uxn_opcodes_h_l2232_c2_4197] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2232_c2_4197_cond <= VAR_t8_MUX_uxn_opcodes_h_l2232_c2_4197_cond;
     t8_MUX_uxn_opcodes_h_l2232_c2_4197_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2232_c2_4197_iftrue;
     t8_MUX_uxn_opcodes_h_l2232_c2_4197_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2232_c2_4197_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2232_c2_4197_return_output := t8_MUX_uxn_opcodes_h_l2232_c2_4197_return_output;

     -- n8_MUX[uxn_opcodes_h_l2240_c7_a46b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2240_c7_a46b_cond <= VAR_n8_MUX_uxn_opcodes_h_l2240_c7_a46b_cond;
     n8_MUX_uxn_opcodes_h_l2240_c7_a46b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2240_c7_a46b_iftrue;
     n8_MUX_uxn_opcodes_h_l2240_c7_a46b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2240_c7_a46b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output := n8_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2247_c7_3e4c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_3e4c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_3e4c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_3e4c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_3e4c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_3e4c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_3e4c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_3e4c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_3e4c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2247_c7_3e4c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2247_c7_3e4c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_3e4c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_3e4c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_3e4c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_3e4c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_3e4c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_3e4c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_3e4c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_3e4c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2244_c7_9c2f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_9c2f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_9c2f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_9c2f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_9c2f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_9c2f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_9c2f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_9c2f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_9c2f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2247_c7_3e4c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2247_c7_3e4c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2247_c7_3e4c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2247_c7_3e4c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2247_c7_3e4c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2247_c7_3e4c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2247_c7_3e4c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2247_c7_3e4c_return_output := result_stack_value_MUX_uxn_opcodes_h_l2247_c7_3e4c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2244_c7_9c2f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2237_c7_04b0_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_9c2f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_3e4c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_a46b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_9c2f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_3e4c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_3e4c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_a46b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_9c2f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2244_c7_9c2f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2247_c7_3e4c_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2232_c2_4197_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2244_c7_9c2f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_9c2f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_9c2f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_9c2f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_9c2f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_9c2f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_9c2f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_9c2f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_9c2f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2244_c7_9c2f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_9c2f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_9c2f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_9c2f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_9c2f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_9c2f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_9c2f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_9c2f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_9c2f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2240_c7_a46b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_a46b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_a46b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_a46b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_a46b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_a46b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_a46b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2244_c7_9c2f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2244_c7_9c2f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2244_c7_9c2f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2244_c7_9c2f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2244_c7_9c2f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2244_c7_9c2f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2244_c7_9c2f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2244_c7_9c2f_return_output := result_stack_value_MUX_uxn_opcodes_h_l2244_c7_9c2f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2240_c7_a46b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_a46b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_a46b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_a46b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_a46b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_a46b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_a46b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output;

     -- n8_MUX[uxn_opcodes_h_l2237_c7_04b0] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2237_c7_04b0_cond <= VAR_n8_MUX_uxn_opcodes_h_l2237_c7_04b0_cond;
     n8_MUX_uxn_opcodes_h_l2237_c7_04b0_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2237_c7_04b0_iftrue;
     n8_MUX_uxn_opcodes_h_l2237_c7_04b0_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2237_c7_04b0_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output := n8_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2244_c7_9c2f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2232_c2_4197_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_a46b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_9c2f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_04b0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_a46b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_9c2f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_a46b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_9c2f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_04b0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2240_c7_a46b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2244_c7_9c2f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2237_c7_04b0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_04b0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_04b0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_04b0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_04b0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_04b0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_04b0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output;

     -- n8_MUX[uxn_opcodes_h_l2232_c2_4197] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2232_c2_4197_cond <= VAR_n8_MUX_uxn_opcodes_h_l2232_c2_4197_cond;
     n8_MUX_uxn_opcodes_h_l2232_c2_4197_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2232_c2_4197_iftrue;
     n8_MUX_uxn_opcodes_h_l2232_c2_4197_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2232_c2_4197_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2232_c2_4197_return_output := n8_MUX_uxn_opcodes_h_l2232_c2_4197_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2240_c7_a46b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2240_c7_a46b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2240_c7_a46b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2240_c7_a46b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2240_c7_a46b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2240_c7_a46b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2240_c7_a46b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output := result_stack_value_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2240_c7_a46b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_a46b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_a46b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_a46b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_a46b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_a46b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_a46b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2240_c7_a46b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_a46b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_a46b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_a46b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_a46b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_a46b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_a46b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2240_c7_a46b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_a46b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_a46b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_a46b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_a46b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_a46b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_a46b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2237_c7_04b0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_04b0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_04b0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_04b0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_04b0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_04b0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_04b0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2232_c2_4197_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_04b0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c2_4197_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_04b0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_04b0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c2_4197_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2237_c7_04b0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2240_c7_a46b_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2237_c7_04b0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_04b0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_04b0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_04b0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_04b0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_04b0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_04b0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2232_c2_4197] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c2_4197_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c2_4197_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c2_4197_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c2_4197_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c2_4197_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c2_4197_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c2_4197_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c2_4197_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2232_c2_4197] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c2_4197_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c2_4197_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c2_4197_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c2_4197_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c2_4197_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c2_4197_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c2_4197_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c2_4197_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2237_c7_04b0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_04b0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_04b0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_04b0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_04b0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_04b0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_04b0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2237_c7_04b0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2237_c7_04b0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2237_c7_04b0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2237_c7_04b0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2237_c7_04b0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2237_c7_04b0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2237_c7_04b0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output := result_stack_value_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2237_c7_04b0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_04b0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_04b0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_04b0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_04b0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_04b0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_04b0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2232_c2_4197_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2232_c2_4197_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c2_4197_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2232_c2_4197_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2237_c7_04b0_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2232_c2_4197] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2232_c2_4197_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2232_c2_4197_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2232_c2_4197_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2232_c2_4197_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2232_c2_4197_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2232_c2_4197_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2232_c2_4197_return_output := result_stack_value_MUX_uxn_opcodes_h_l2232_c2_4197_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2232_c2_4197] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c2_4197_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c2_4197_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c2_4197_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c2_4197_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c2_4197_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c2_4197_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c2_4197_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c2_4197_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2232_c2_4197] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2232_c2_4197_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2232_c2_4197_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2232_c2_4197_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2232_c2_4197_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2232_c2_4197_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2232_c2_4197_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2232_c2_4197_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2232_c2_4197_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2232_c2_4197] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2232_c2_4197_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2232_c2_4197_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2232_c2_4197_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2232_c2_4197_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2232_c2_4197_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2232_c2_4197_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2232_c2_4197_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2232_c2_4197_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2263_l2228_DUPLICATE_31c2 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2263_l2228_DUPLICATE_31c2_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_53ff(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2232_c2_4197_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c2_4197_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c2_4197_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2232_c2_4197_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2232_c2_4197_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c2_4197_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2263_l2228_DUPLICATE_31c2_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2263_l2228_DUPLICATE_31c2_return_output;
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
