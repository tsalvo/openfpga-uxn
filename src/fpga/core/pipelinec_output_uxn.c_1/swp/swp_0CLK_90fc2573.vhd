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
-- BIN_OP_EQ[uxn_opcodes_h_l2307_c6_f43c]
signal BIN_OP_EQ_uxn_opcodes_h_l2307_c6_f43c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2307_c6_f43c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2307_c6_f43c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2307_c1_4643]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2307_c1_4643_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2307_c1_4643_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2307_c1_4643_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2307_c1_4643_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2307_c2_f8c0]
signal t8_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2307_c2_f8c0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2307_c2_f8c0]
signal result_stack_value_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2307_c2_f8c0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2307_c2_f8c0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2307_c2_f8c0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2307_c2_f8c0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2307_c2_f8c0]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2307_c2_f8c0]
signal n8_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l2308_c3_b999[uxn_opcodes_h_l2308_c3_b999]
signal printf_uxn_opcodes_h_l2308_c3_b999_uxn_opcodes_h_l2308_c3_b999_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2313_c11_4c75]
signal BIN_OP_EQ_uxn_opcodes_h_l2313_c11_4c75_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2313_c11_4c75_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2313_c11_4c75_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2313_c7_2829]
signal t8_MUX_uxn_opcodes_h_l2313_c7_2829_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2313_c7_2829_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2313_c7_2829]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_2829_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_2829_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2313_c7_2829]
signal result_stack_value_MUX_uxn_opcodes_h_l2313_c7_2829_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2313_c7_2829_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2313_c7_2829]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_2829_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_2829_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2313_c7_2829]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_2829_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_2829_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2313_c7_2829]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_2829_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_2829_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2313_c7_2829]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_2829_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_2829_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2313_c7_2829]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_2829_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_2829_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2313_c7_2829]
signal n8_MUX_uxn_opcodes_h_l2313_c7_2829_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2313_c7_2829_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2316_c11_2ab1]
signal BIN_OP_EQ_uxn_opcodes_h_l2316_c11_2ab1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2316_c11_2ab1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2316_c11_2ab1_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2316_c7_a82c]
signal t8_MUX_uxn_opcodes_h_l2316_c7_a82c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2316_c7_a82c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_a82c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2316_c7_a82c]
signal result_stack_value_MUX_uxn_opcodes_h_l2316_c7_a82c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2316_c7_a82c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_a82c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2316_c7_a82c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_a82c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2316_c7_a82c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_a82c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2316_c7_a82c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_a82c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2316_c7_a82c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_a82c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2316_c7_a82c]
signal n8_MUX_uxn_opcodes_h_l2316_c7_a82c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2320_c11_d5b4]
signal BIN_OP_EQ_uxn_opcodes_h_l2320_c11_d5b4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2320_c11_d5b4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2320_c11_d5b4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2320_c7_9f8d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2320_c7_9f8d]
signal result_stack_value_MUX_uxn_opcodes_h_l2320_c7_9f8d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2320_c7_9f8d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2320_c7_9f8d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2320_c7_9f8d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2320_c7_9f8d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_9f8d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_9f8d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_9f8d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2320_c7_9f8d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_9f8d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_9f8d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_9f8d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2320_c7_9f8d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_9f8d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_9f8d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_9f8d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2320_c7_9f8d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2320_c7_9f8d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2320_c7_9f8d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2320_c7_9f8d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2320_c7_9f8d]
signal n8_MUX_uxn_opcodes_h_l2320_c7_9f8d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2320_c7_9f8d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2320_c7_9f8d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2323_c11_d42a]
signal BIN_OP_EQ_uxn_opcodes_h_l2323_c11_d42a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2323_c11_d42a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2323_c11_d42a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2323_c7_e9f2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2323_c7_e9f2]
signal result_stack_value_MUX_uxn_opcodes_h_l2323_c7_e9f2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2323_c7_e9f2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2323_c7_e9f2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2323_c7_e9f2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2323_c7_e9f2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_e9f2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_e9f2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_e9f2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2323_c7_e9f2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_e9f2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_e9f2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_e9f2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2323_c7_e9f2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2323_c7_e9f2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2323_c7_e9f2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2323_c7_e9f2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2323_c7_e9f2]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2323_c7_e9f2_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2323_c7_e9f2_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2323_c7_e9f2_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2323_c7_e9f2]
signal n8_MUX_uxn_opcodes_h_l2323_c7_e9f2_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2323_c7_e9f2_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2323_c7_e9f2_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2327_c32_0b99]
signal BIN_OP_AND_uxn_opcodes_h_l2327_c32_0b99_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2327_c32_0b99_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2327_c32_0b99_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2327_c32_6624]
signal BIN_OP_GT_uxn_opcodes_h_l2327_c32_6624_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2327_c32_6624_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2327_c32_6624_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2327_c32_92a6]
signal MUX_uxn_opcodes_h_l2327_c32_92a6_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2327_c32_92a6_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2327_c32_92a6_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2327_c32_92a6_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2329_c11_869c]
signal BIN_OP_EQ_uxn_opcodes_h_l2329_c11_869c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2329_c11_869c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2329_c11_869c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2329_c7_575e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2329_c7_575e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2329_c7_575e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2329_c7_575e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2329_c7_575e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2329_c7_575e]
signal result_stack_value_MUX_uxn_opcodes_h_l2329_c7_575e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2329_c7_575e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2329_c7_575e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2329_c7_575e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2329_c7_575e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2329_c7_575e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2329_c7_575e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2329_c7_575e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2329_c7_575e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2329_c7_575e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2329_c7_575e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2329_c7_575e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2329_c7_575e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2329_c7_575e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2329_c7_575e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2329_c7_575e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2329_c7_575e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2329_c7_575e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2329_c7_575e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2335_c11_f8a6]
signal BIN_OP_EQ_uxn_opcodes_h_l2335_c11_f8a6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2335_c11_f8a6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2335_c11_f8a6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2335_c7_fc6b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2335_c7_fc6b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2335_c7_fc6b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2335_c7_fc6b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2335_c7_fc6b_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2335_c7_fc6b]
signal result_stack_value_MUX_uxn_opcodes_h_l2335_c7_fc6b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2335_c7_fc6b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2335_c7_fc6b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2335_c7_fc6b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2335_c7_fc6b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2335_c7_fc6b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2335_c7_fc6b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2335_c7_fc6b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2335_c7_fc6b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2335_c7_fc6b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2335_c7_fc6b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2335_c7_fc6b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2335_c7_fc6b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2335_c7_fc6b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2339_c11_1d69]
signal BIN_OP_EQ_uxn_opcodes_h_l2339_c11_1d69_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2339_c11_1d69_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2339_c11_1d69_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2339_c7_20a5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2339_c7_20a5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2339_c7_20a5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2339_c7_20a5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2339_c7_20a5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2339_c7_20a5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2339_c7_20a5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2339_c7_20a5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2339_c7_20a5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2339_c7_20a5_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_e56b( ref_toks_0 : opcode_result_t;
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
      base.stack_value := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2307_c6_f43c
BIN_OP_EQ_uxn_opcodes_h_l2307_c6_f43c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2307_c6_f43c_left,
BIN_OP_EQ_uxn_opcodes_h_l2307_c6_f43c_right,
BIN_OP_EQ_uxn_opcodes_h_l2307_c6_f43c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2307_c1_4643
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2307_c1_4643 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2307_c1_4643_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2307_c1_4643_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2307_c1_4643_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2307_c1_4643_return_output);

-- t8_MUX_uxn_opcodes_h_l2307_c2_f8c0
t8_MUX_uxn_opcodes_h_l2307_c2_f8c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond,
t8_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue,
t8_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse,
t8_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0
result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2307_c2_f8c0
result_stack_value_MUX_uxn_opcodes_h_l2307_c2_f8c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond,
result_stack_value_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2307_c2_f8c0
result_is_stack_write_MUX_uxn_opcodes_h_l2307_c2_f8c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2307_c2_f8c0
result_is_opc_done_MUX_uxn_opcodes_h_l2307_c2_f8c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c2_f8c0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c2_f8c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2307_c2_f8c0
result_is_stack_read_MUX_uxn_opcodes_h_l2307_c2_f8c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output);

-- n8_MUX_uxn_opcodes_h_l2307_c2_f8c0
n8_MUX_uxn_opcodes_h_l2307_c2_f8c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond,
n8_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue,
n8_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse,
n8_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output);

-- printf_uxn_opcodes_h_l2308_c3_b999_uxn_opcodes_h_l2308_c3_b999
printf_uxn_opcodes_h_l2308_c3_b999_uxn_opcodes_h_l2308_c3_b999 : entity work.printf_uxn_opcodes_h_l2308_c3_b999_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2308_c3_b999_uxn_opcodes_h_l2308_c3_b999_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2313_c11_4c75
BIN_OP_EQ_uxn_opcodes_h_l2313_c11_4c75 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2313_c11_4c75_left,
BIN_OP_EQ_uxn_opcodes_h_l2313_c11_4c75_right,
BIN_OP_EQ_uxn_opcodes_h_l2313_c11_4c75_return_output);

-- t8_MUX_uxn_opcodes_h_l2313_c7_2829
t8_MUX_uxn_opcodes_h_l2313_c7_2829 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2313_c7_2829_cond,
t8_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue,
t8_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse,
t8_MUX_uxn_opcodes_h_l2313_c7_2829_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_2829
result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_2829 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_2829_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_2829_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2313_c7_2829
result_stack_value_MUX_uxn_opcodes_h_l2313_c7_2829 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2313_c7_2829_cond,
result_stack_value_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2313_c7_2829_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_2829
result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_2829 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_2829_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_2829_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_2829
result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_2829 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_2829_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_2829_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_2829
result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_2829 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_2829_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_2829_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_2829
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_2829 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_2829_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_2829_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_2829
result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_2829 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_2829_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_2829_return_output);

-- n8_MUX_uxn_opcodes_h_l2313_c7_2829
n8_MUX_uxn_opcodes_h_l2313_c7_2829 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2313_c7_2829_cond,
n8_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue,
n8_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse,
n8_MUX_uxn_opcodes_h_l2313_c7_2829_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2316_c11_2ab1
BIN_OP_EQ_uxn_opcodes_h_l2316_c11_2ab1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2316_c11_2ab1_left,
BIN_OP_EQ_uxn_opcodes_h_l2316_c11_2ab1_right,
BIN_OP_EQ_uxn_opcodes_h_l2316_c11_2ab1_return_output);

-- t8_MUX_uxn_opcodes_h_l2316_c7_a82c
t8_MUX_uxn_opcodes_h_l2316_c7_a82c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2316_c7_a82c_cond,
t8_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue,
t8_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse,
t8_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_a82c
result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_a82c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_a82c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2316_c7_a82c
result_stack_value_MUX_uxn_opcodes_h_l2316_c7_a82c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2316_c7_a82c_cond,
result_stack_value_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_a82c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_a82c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_a82c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_a82c
result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_a82c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_a82c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_a82c
result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_a82c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_a82c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_a82c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_a82c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_a82c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_a82c
result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_a82c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_a82c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output);

-- n8_MUX_uxn_opcodes_h_l2316_c7_a82c
n8_MUX_uxn_opcodes_h_l2316_c7_a82c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2316_c7_a82c_cond,
n8_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue,
n8_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse,
n8_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2320_c11_d5b4
BIN_OP_EQ_uxn_opcodes_h_l2320_c11_d5b4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2320_c11_d5b4_left,
BIN_OP_EQ_uxn_opcodes_h_l2320_c11_d5b4_right,
BIN_OP_EQ_uxn_opcodes_h_l2320_c11_d5b4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d
result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2320_c7_9f8d
result_stack_value_MUX_uxn_opcodes_h_l2320_c7_9f8d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2320_c7_9f8d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2320_c7_9f8d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2320_c7_9f8d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_9f8d
result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_9f8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_9f8d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_9f8d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_9f8d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_9f8d
result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_9f8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_9f8d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_9f8d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_9f8d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_9f8d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_9f8d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_9f8d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_9f8d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_9f8d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2320_c7_9f8d
result_is_stack_read_MUX_uxn_opcodes_h_l2320_c7_9f8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2320_c7_9f8d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2320_c7_9f8d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2320_c7_9f8d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output);

-- n8_MUX_uxn_opcodes_h_l2320_c7_9f8d
n8_MUX_uxn_opcodes_h_l2320_c7_9f8d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2320_c7_9f8d_cond,
n8_MUX_uxn_opcodes_h_l2320_c7_9f8d_iftrue,
n8_MUX_uxn_opcodes_h_l2320_c7_9f8d_iffalse,
n8_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2323_c11_d42a
BIN_OP_EQ_uxn_opcodes_h_l2323_c11_d42a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2323_c11_d42a_left,
BIN_OP_EQ_uxn_opcodes_h_l2323_c11_d42a_right,
BIN_OP_EQ_uxn_opcodes_h_l2323_c11_d42a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2
result_is_sp_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2323_c7_e9f2
result_stack_value_MUX_uxn_opcodes_h_l2323_c7_e9f2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2323_c7_e9f2_cond,
result_stack_value_MUX_uxn_opcodes_h_l2323_c7_e9f2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2323_c7_e9f2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_e9f2
result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_e9f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_e9f2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_e9f2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_e9f2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_e9f2
result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_e9f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_e9f2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_e9f2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_e9f2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2323_c7_e9f2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2323_c7_e9f2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2323_c7_e9f2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2323_c7_e9f2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2323_c7_e9f2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2323_c7_e9f2
result_is_stack_read_MUX_uxn_opcodes_h_l2323_c7_e9f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2323_c7_e9f2_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2323_c7_e9f2_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2323_c7_e9f2_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output);

-- n8_MUX_uxn_opcodes_h_l2323_c7_e9f2
n8_MUX_uxn_opcodes_h_l2323_c7_e9f2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2323_c7_e9f2_cond,
n8_MUX_uxn_opcodes_h_l2323_c7_e9f2_iftrue,
n8_MUX_uxn_opcodes_h_l2323_c7_e9f2_iffalse,
n8_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2327_c32_0b99
BIN_OP_AND_uxn_opcodes_h_l2327_c32_0b99 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2327_c32_0b99_left,
BIN_OP_AND_uxn_opcodes_h_l2327_c32_0b99_right,
BIN_OP_AND_uxn_opcodes_h_l2327_c32_0b99_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2327_c32_6624
BIN_OP_GT_uxn_opcodes_h_l2327_c32_6624 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2327_c32_6624_left,
BIN_OP_GT_uxn_opcodes_h_l2327_c32_6624_right,
BIN_OP_GT_uxn_opcodes_h_l2327_c32_6624_return_output);

-- MUX_uxn_opcodes_h_l2327_c32_92a6
MUX_uxn_opcodes_h_l2327_c32_92a6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2327_c32_92a6_cond,
MUX_uxn_opcodes_h_l2327_c32_92a6_iftrue,
MUX_uxn_opcodes_h_l2327_c32_92a6_iffalse,
MUX_uxn_opcodes_h_l2327_c32_92a6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2329_c11_869c
BIN_OP_EQ_uxn_opcodes_h_l2329_c11_869c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2329_c11_869c_left,
BIN_OP_EQ_uxn_opcodes_h_l2329_c11_869c_right,
BIN_OP_EQ_uxn_opcodes_h_l2329_c11_869c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2329_c7_575e
result_is_sp_shift_MUX_uxn_opcodes_h_l2329_c7_575e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2329_c7_575e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2329_c7_575e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2329_c7_575e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2329_c7_575e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2329_c7_575e
result_stack_value_MUX_uxn_opcodes_h_l2329_c7_575e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2329_c7_575e_cond,
result_stack_value_MUX_uxn_opcodes_h_l2329_c7_575e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2329_c7_575e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2329_c7_575e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2329_c7_575e
result_is_opc_done_MUX_uxn_opcodes_h_l2329_c7_575e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2329_c7_575e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2329_c7_575e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2329_c7_575e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2329_c7_575e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2329_c7_575e
result_is_stack_write_MUX_uxn_opcodes_h_l2329_c7_575e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2329_c7_575e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2329_c7_575e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2329_c7_575e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2329_c7_575e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2329_c7_575e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2329_c7_575e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2329_c7_575e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2329_c7_575e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2329_c7_575e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2329_c7_575e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2335_c11_f8a6
BIN_OP_EQ_uxn_opcodes_h_l2335_c11_f8a6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2335_c11_f8a6_left,
BIN_OP_EQ_uxn_opcodes_h_l2335_c11_f8a6_right,
BIN_OP_EQ_uxn_opcodes_h_l2335_c11_f8a6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2335_c7_fc6b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2335_c7_fc6b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2335_c7_fc6b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2335_c7_fc6b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2335_c7_fc6b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2335_c7_fc6b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2335_c7_fc6b
result_stack_value_MUX_uxn_opcodes_h_l2335_c7_fc6b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2335_c7_fc6b_cond,
result_stack_value_MUX_uxn_opcodes_h_l2335_c7_fc6b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2335_c7_fc6b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2335_c7_fc6b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2335_c7_fc6b
result_is_opc_done_MUX_uxn_opcodes_h_l2335_c7_fc6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2335_c7_fc6b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2335_c7_fc6b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2335_c7_fc6b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2335_c7_fc6b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2335_c7_fc6b
result_is_stack_write_MUX_uxn_opcodes_h_l2335_c7_fc6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2335_c7_fc6b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2335_c7_fc6b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2335_c7_fc6b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2335_c7_fc6b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2339_c11_1d69
BIN_OP_EQ_uxn_opcodes_h_l2339_c11_1d69 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2339_c11_1d69_left,
BIN_OP_EQ_uxn_opcodes_h_l2339_c11_1d69_right,
BIN_OP_EQ_uxn_opcodes_h_l2339_c11_1d69_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2339_c7_20a5
result_is_opc_done_MUX_uxn_opcodes_h_l2339_c7_20a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2339_c7_20a5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2339_c7_20a5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2339_c7_20a5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2339_c7_20a5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2339_c7_20a5
result_is_stack_write_MUX_uxn_opcodes_h_l2339_c7_20a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2339_c7_20a5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2339_c7_20a5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2339_c7_20a5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2339_c7_20a5_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2307_c6_f43c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2307_c1_4643_return_output,
 t8_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output,
 n8_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2313_c11_4c75_return_output,
 t8_MUX_uxn_opcodes_h_l2313_c7_2829_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_2829_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2313_c7_2829_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_2829_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_2829_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_2829_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_2829_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_2829_return_output,
 n8_MUX_uxn_opcodes_h_l2313_c7_2829_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2316_c11_2ab1_return_output,
 t8_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output,
 n8_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2320_c11_d5b4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output,
 n8_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2323_c11_d42a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output,
 n8_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2327_c32_0b99_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2327_c32_6624_return_output,
 MUX_uxn_opcodes_h_l2327_c32_92a6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2329_c11_869c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2329_c7_575e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2329_c7_575e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2329_c7_575e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2329_c7_575e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2329_c7_575e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2335_c11_f8a6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2335_c7_fc6b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2335_c7_fc6b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2335_c7_fc6b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2335_c7_fc6b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2339_c11_1d69_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2339_c7_20a5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2339_c7_20a5_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c6_f43c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c6_f43c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c6_f43c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2307_c1_4643_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2307_c1_4643_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2307_c1_4643_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2307_c1_4643_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2313_c7_2829_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_2829_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2313_c7_2829_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_2829_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_2829_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_2829_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2310_c3_44fc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_2829_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_2829_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2313_c7_2829_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2308_c3_b999_uxn_opcodes_h_l2308_c3_b999_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2313_c11_4c75_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2313_c11_4c75_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2313_c11_4c75_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2313_c7_2829_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_2829_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2313_c7_2829_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_2829_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_2829_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_2829_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2314_c3_ca7e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_2829_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_2829_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2313_c7_2829_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_2ab1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_2ab1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_2ab1_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2316_c7_a82c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_a82c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2316_c7_a82c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_a82c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_a82c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_a82c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2318_c3_977c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_a82c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_a82c_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2316_c7_a82c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_d5b4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_d5b4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_d5b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2320_c7_9f8d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2320_c7_9f8d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2320_c7_9f8d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_9f8d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_9f8d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_9f8d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_9f8d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_9f8d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_9f8d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_9f8d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2321_c3_d95c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_9f8d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_9f8d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2320_c7_9f8d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2320_c7_9f8d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2320_c7_9f8d_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2320_c7_9f8d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2320_c7_9f8d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2320_c7_9f8d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2323_c11_d42a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2323_c11_d42a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2323_c11_d42a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2329_c7_575e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2323_c7_e9f2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2323_c7_e9f2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2329_c7_575e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2323_c7_e9f2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_e9f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_e9f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2329_c7_575e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_e9f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_e9f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_e9f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2329_c7_575e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_e9f2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2323_c7_e9f2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2323_c7_e9f2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2329_c7_575e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2323_c7_e9f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2323_c7_e9f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2323_c7_e9f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2323_c7_e9f2_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2323_c7_e9f2_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2323_c7_e9f2_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2323_c7_e9f2_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2327_c32_92a6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2327_c32_92a6_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2327_c32_92a6_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2327_c32_0b99_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2327_c32_0b99_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2327_c32_0b99_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2327_c32_6624_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2327_c32_6624_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2327_c32_6624_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2327_c32_92a6_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2329_c11_869c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2329_c11_869c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2329_c11_869c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2329_c7_575e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2329_c7_575e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2329_c7_575e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2329_c7_575e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2329_c7_575e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2335_c7_fc6b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2329_c7_575e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2329_c7_575e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2329_c7_575e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2335_c7_fc6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2329_c7_575e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2329_c7_575e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2329_c7_575e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2335_c7_fc6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2329_c7_575e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2329_c7_575e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2332_c3_6eab : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2329_c7_575e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2335_c7_fc6b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2329_c7_575e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2335_c11_f8a6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2335_c11_f8a6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2335_c11_f8a6_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2335_c7_fc6b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2336_c3_8115 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2335_c7_fc6b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2335_c7_fc6b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2335_c7_fc6b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2335_c7_fc6b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2335_c7_fc6b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2335_c7_fc6b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2335_c7_fc6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c7_20a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2335_c7_fc6b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2335_c7_fc6b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2335_c7_fc6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c7_20a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2335_c7_fc6b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c11_1d69_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c11_1d69_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c11_1d69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c7_20a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c7_20a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c7_20a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c7_20a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c7_20a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c7_20a5_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2307_l2329_l2320_l2316_l2313_DUPLICATE_3272_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2307_l2335_l2323_l2320_l2316_l2313_DUPLICATE_a6c7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2307_l2323_l2320_l2316_l2313_DUPLICATE_b231_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2307_l2335_l2323_l2320_l2316_l2339_l2313_DUPLICATE_dcdc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2335_l2329_l2323_l2320_l2316_l2339_l2313_DUPLICATE_762c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2316_l2320_l2313_l2323_DUPLICATE_700f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2335_l2323_DUPLICATE_b6d9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l2344_l2303_DUPLICATE_e917_return_output : opcode_result_t;
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
     VAR_MUX_uxn_opcodes_h_l2327_c32_92a6_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2313_c11_4c75_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_2ab1_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2336_c3_8115 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2335_c7_fc6b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2336_c3_8115;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2327_c32_92a6_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c7_20a5_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2335_c11_f8a6_right := to_unsigned(6, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2329_c7_575e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2329_c11_869c_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2310_c3_44fc := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2310_c3_44fc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c11_1d69_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_d5b4_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2332_c3_6eab := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2329_c7_575e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2332_c3_6eab;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2318_c3_977c := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2318_c3_977c;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2329_c7_575e_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2321_c3_d95c := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_9f8d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2321_c3_d95c;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2323_c7_e9f2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c6_f43c_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2314_c3_ca7e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2314_c3_ca7e;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c7_20a5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2307_c1_4643_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2323_c11_d42a_right := to_unsigned(4, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2327_c32_0b99_right := to_unsigned(128, 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2327_c32_6624_right := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2307_c1_4643_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2327_c32_0b99_left := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2320_c7_9f8d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2323_c7_e9f2_iffalse := n8;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2329_c7_575e_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c6_f43c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2313_c11_4c75_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_2ab1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_d5b4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2323_c11_d42a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2329_c11_869c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2335_c11_f8a6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c11_1d69_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2323_c7_e9f2_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue := VAR_previous_stack_read;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2335_c7_fc6b_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse := t8;
     -- BIN_OP_AND[uxn_opcodes_h_l2327_c32_0b99] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2327_c32_0b99_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2327_c32_0b99_left;
     BIN_OP_AND_uxn_opcodes_h_l2327_c32_0b99_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2327_c32_0b99_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2327_c32_0b99_return_output := BIN_OP_AND_uxn_opcodes_h_l2327_c32_0b99_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2339_c11_1d69] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2339_c11_1d69_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c11_1d69_left;
     BIN_OP_EQ_uxn_opcodes_h_l2339_c11_1d69_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c11_1d69_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c11_1d69_return_output := BIN_OP_EQ_uxn_opcodes_h_l2339_c11_1d69_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2307_l2335_l2323_l2320_l2316_l2339_l2313_DUPLICATE_dcdc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2307_l2335_l2323_l2320_l2316_l2339_l2313_DUPLICATE_dcdc_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2335_c11_f8a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2335_c11_f8a6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2335_c11_f8a6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2335_c11_f8a6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2335_c11_f8a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2335_c11_f8a6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2335_c11_f8a6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2307_c6_f43c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2307_c6_f43c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c6_f43c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2307_c6_f43c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c6_f43c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c6_f43c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2307_c6_f43c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2316_c11_2ab1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2316_c11_2ab1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_2ab1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2316_c11_2ab1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_2ab1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_2ab1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2316_c11_2ab1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2313_c11_4c75] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2313_c11_4c75_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2313_c11_4c75_left;
     BIN_OP_EQ_uxn_opcodes_h_l2313_c11_4c75_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2313_c11_4c75_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2313_c11_4c75_return_output := BIN_OP_EQ_uxn_opcodes_h_l2313_c11_4c75_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2335_l2329_l2323_l2320_l2316_l2339_l2313_DUPLICATE_762c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2335_l2329_l2323_l2320_l2316_l2339_l2313_DUPLICATE_762c_return_output := result.is_opc_done;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2307_l2323_l2320_l2316_l2313_DUPLICATE_b231 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2307_l2323_l2320_l2316_l2313_DUPLICATE_b231_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2323_c11_d42a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2323_c11_d42a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2323_c11_d42a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2323_c11_d42a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2323_c11_d42a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2323_c11_d42a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2323_c11_d42a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2329_c11_869c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2329_c11_869c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2329_c11_869c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2329_c11_869c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2329_c11_869c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2329_c11_869c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2329_c11_869c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2307_l2329_l2320_l2316_l2313_DUPLICATE_3272 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2307_l2329_l2320_l2316_l2313_DUPLICATE_3272_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2335_l2323_DUPLICATE_b6d9 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2335_l2323_DUPLICATE_b6d9_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2320_c11_d5b4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2320_c11_d5b4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_d5b4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2320_c11_d5b4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_d5b4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_d5b4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2320_c11_d5b4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2316_l2320_l2313_l2323_DUPLICATE_700f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2316_l2320_l2313_l2323_DUPLICATE_700f_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2307_l2335_l2323_l2320_l2316_l2313_DUPLICATE_a6c7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2307_l2335_l2323_l2320_l2316_l2313_DUPLICATE_a6c7_return_output := result.stack_value;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2327_c32_6624_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2327_c32_0b99_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2307_c1_4643_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c6_f43c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c6_f43c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c6_f43c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c6_f43c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c6_f43c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c6_f43c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c6_f43c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c6_f43c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c6_f43c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c6_f43c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2313_c7_2829_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2313_c11_4c75_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_2829_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2313_c11_4c75_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_2829_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2313_c11_4c75_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_2829_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2313_c11_4c75_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_2829_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2313_c11_4c75_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_2829_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2313_c11_4c75_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_2829_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2313_c11_4c75_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2313_c7_2829_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2313_c11_4c75_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2313_c7_2829_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2313_c11_4c75_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2316_c7_a82c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_2ab1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_a82c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_2ab1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_a82c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_2ab1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_a82c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_2ab1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_a82c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_2ab1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_a82c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_2ab1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_a82c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_2ab1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2316_c7_a82c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_2ab1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2316_c7_a82c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_2ab1_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2320_c7_9f8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_d5b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_9f8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_d5b4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_d5b4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2320_c7_9f8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_d5b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_9f8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_d5b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_d5b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_9f8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_d5b4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2320_c7_9f8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_d5b4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2323_c7_e9f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2323_c11_d42a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_e9f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2323_c11_d42a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2323_c11_d42a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2323_c7_e9f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2323_c11_d42a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_e9f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2323_c11_d42a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2323_c11_d42a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2323_c7_e9f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2323_c11_d42a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2323_c7_e9f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2323_c11_d42a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2329_c7_575e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2329_c11_869c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2329_c7_575e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2329_c11_869c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2329_c7_575e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2329_c11_869c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2329_c7_575e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2329_c11_869c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2329_c7_575e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2329_c11_869c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2335_c7_fc6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2335_c11_f8a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2335_c7_fc6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2335_c11_f8a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2335_c7_fc6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2335_c11_f8a6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2335_c7_fc6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2335_c11_f8a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c7_20a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c11_1d69_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c7_20a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c11_1d69_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2307_l2323_l2320_l2316_l2313_DUPLICATE_b231_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2307_l2323_l2320_l2316_l2313_DUPLICATE_b231_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2307_l2323_l2320_l2316_l2313_DUPLICATE_b231_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2307_l2323_l2320_l2316_l2313_DUPLICATE_b231_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2307_l2323_l2320_l2316_l2313_DUPLICATE_b231_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2335_l2329_l2323_l2320_l2316_l2339_l2313_DUPLICATE_762c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2335_l2329_l2323_l2320_l2316_l2339_l2313_DUPLICATE_762c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_9f8d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2335_l2329_l2323_l2320_l2316_l2339_l2313_DUPLICATE_762c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_e9f2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2335_l2329_l2323_l2320_l2316_l2339_l2313_DUPLICATE_762c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2329_c7_575e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2335_l2329_l2323_l2320_l2316_l2339_l2313_DUPLICATE_762c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2335_c7_fc6b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2335_l2329_l2323_l2320_l2316_l2339_l2313_DUPLICATE_762c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c7_20a5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2335_l2329_l2323_l2320_l2316_l2339_l2313_DUPLICATE_762c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2307_l2329_l2320_l2316_l2313_DUPLICATE_3272_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2307_l2329_l2320_l2316_l2313_DUPLICATE_3272_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2307_l2329_l2320_l2316_l2313_DUPLICATE_3272_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2307_l2329_l2320_l2316_l2313_DUPLICATE_3272_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2329_c7_575e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2307_l2329_l2320_l2316_l2313_DUPLICATE_3272_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2316_l2320_l2313_l2323_DUPLICATE_700f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2316_l2320_l2313_l2323_DUPLICATE_700f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2320_c7_9f8d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2316_l2320_l2313_l2323_DUPLICATE_700f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2323_c7_e9f2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2316_l2320_l2313_l2323_DUPLICATE_700f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2307_l2335_l2323_l2320_l2316_l2339_l2313_DUPLICATE_dcdc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2307_l2335_l2323_l2320_l2316_l2339_l2313_DUPLICATE_dcdc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2307_l2335_l2323_l2320_l2316_l2339_l2313_DUPLICATE_dcdc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_9f8d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2307_l2335_l2323_l2320_l2316_l2339_l2313_DUPLICATE_dcdc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_e9f2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2307_l2335_l2323_l2320_l2316_l2339_l2313_DUPLICATE_dcdc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2335_c7_fc6b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2307_l2335_l2323_l2320_l2316_l2339_l2313_DUPLICATE_dcdc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c7_20a5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2307_l2335_l2323_l2320_l2316_l2339_l2313_DUPLICATE_dcdc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2323_c7_e9f2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2335_l2323_DUPLICATE_b6d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2335_c7_fc6b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2335_l2323_DUPLICATE_b6d9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2307_l2335_l2323_l2320_l2316_l2313_DUPLICATE_a6c7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2307_l2335_l2323_l2320_l2316_l2313_DUPLICATE_a6c7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2307_l2335_l2323_l2320_l2316_l2313_DUPLICATE_a6c7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2320_c7_9f8d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2307_l2335_l2323_l2320_l2316_l2313_DUPLICATE_a6c7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2323_c7_e9f2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2307_l2335_l2323_l2320_l2316_l2313_DUPLICATE_a6c7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2335_c7_fc6b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2307_l2335_l2323_l2320_l2316_l2313_DUPLICATE_a6c7_return_output;
     -- n8_MUX[uxn_opcodes_h_l2323_c7_e9f2] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2323_c7_e9f2_cond <= VAR_n8_MUX_uxn_opcodes_h_l2323_c7_e9f2_cond;
     n8_MUX_uxn_opcodes_h_l2323_c7_e9f2_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2323_c7_e9f2_iftrue;
     n8_MUX_uxn_opcodes_h_l2323_c7_e9f2_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2323_c7_e9f2_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output := n8_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2339_c7_20a5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2339_c7_20a5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c7_20a5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2339_c7_20a5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c7_20a5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2339_c7_20a5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c7_20a5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c7_20a5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2339_c7_20a5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2335_c7_fc6b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2335_c7_fc6b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2335_c7_fc6b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2335_c7_fc6b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2335_c7_fc6b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2335_c7_fc6b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2335_c7_fc6b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2335_c7_fc6b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2335_c7_fc6b_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2327_c32_6624] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2327_c32_6624_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2327_c32_6624_left;
     BIN_OP_GT_uxn_opcodes_h_l2327_c32_6624_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2327_c32_6624_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2327_c32_6624_return_output := BIN_OP_GT_uxn_opcodes_h_l2327_c32_6624_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2339_c7_20a5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2339_c7_20a5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c7_20a5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2339_c7_20a5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c7_20a5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2339_c7_20a5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c7_20a5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c7_20a5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2339_c7_20a5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2323_c7_e9f2] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2323_c7_e9f2_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2323_c7_e9f2_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2323_c7_e9f2_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2323_c7_e9f2_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2323_c7_e9f2_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2323_c7_e9f2_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output;

     -- t8_MUX[uxn_opcodes_h_l2316_c7_a82c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2316_c7_a82c_cond <= VAR_t8_MUX_uxn_opcodes_h_l2316_c7_a82c_cond;
     t8_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue;
     t8_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output := t8_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2335_c7_fc6b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2335_c7_fc6b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2335_c7_fc6b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2335_c7_fc6b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2335_c7_fc6b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2335_c7_fc6b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2335_c7_fc6b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2335_c7_fc6b_return_output := result_stack_value_MUX_uxn_opcodes_h_l2335_c7_fc6b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2329_c7_575e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2329_c7_575e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2329_c7_575e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2329_c7_575e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2329_c7_575e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2329_c7_575e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2329_c7_575e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2329_c7_575e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2329_c7_575e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2307_c1_4643] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2307_c1_4643_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2307_c1_4643_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2307_c1_4643_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2307_c1_4643_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2307_c1_4643_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2307_c1_4643_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2307_c1_4643_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2307_c1_4643_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2327_c32_92a6_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2327_c32_6624_return_output;
     VAR_printf_uxn_opcodes_h_l2308_c3_b999_uxn_opcodes_h_l2308_c3_b999_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2307_c1_4643_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2320_c7_9f8d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2335_c7_fc6b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c7_20a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2329_c7_575e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2320_c7_9f8d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2335_c7_fc6b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c7_20a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2329_c7_575e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2335_c7_fc6b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2329_c7_575e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2335_c7_fc6b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output;
     -- MUX[uxn_opcodes_h_l2327_c32_92a6] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2327_c32_92a6_cond <= VAR_MUX_uxn_opcodes_h_l2327_c32_92a6_cond;
     MUX_uxn_opcodes_h_l2327_c32_92a6_iftrue <= VAR_MUX_uxn_opcodes_h_l2327_c32_92a6_iftrue;
     MUX_uxn_opcodes_h_l2327_c32_92a6_iffalse <= VAR_MUX_uxn_opcodes_h_l2327_c32_92a6_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2327_c32_92a6_return_output := MUX_uxn_opcodes_h_l2327_c32_92a6_return_output;

     -- t8_MUX[uxn_opcodes_h_l2313_c7_2829] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2313_c7_2829_cond <= VAR_t8_MUX_uxn_opcodes_h_l2313_c7_2829_cond;
     t8_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue;
     t8_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2313_c7_2829_return_output := t8_MUX_uxn_opcodes_h_l2313_c7_2829_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2320_c7_9f8d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2320_c7_9f8d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2320_c7_9f8d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2320_c7_9f8d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2320_c7_9f8d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2320_c7_9f8d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2320_c7_9f8d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2329_c7_575e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2329_c7_575e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2329_c7_575e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2329_c7_575e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2329_c7_575e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2329_c7_575e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2329_c7_575e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2329_c7_575e_return_output := result_stack_value_MUX_uxn_opcodes_h_l2329_c7_575e_return_output;

     -- printf_uxn_opcodes_h_l2308_c3_b999[uxn_opcodes_h_l2308_c3_b999] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2308_c3_b999_uxn_opcodes_h_l2308_c3_b999_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2308_c3_b999_uxn_opcodes_h_l2308_c3_b999_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2335_c7_fc6b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2335_c7_fc6b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2335_c7_fc6b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2335_c7_fc6b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2335_c7_fc6b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2335_c7_fc6b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2335_c7_fc6b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2335_c7_fc6b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2335_c7_fc6b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2323_c7_e9f2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2335_c7_fc6b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2335_c7_fc6b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2335_c7_fc6b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2335_c7_fc6b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2335_c7_fc6b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2335_c7_fc6b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2335_c7_fc6b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2335_c7_fc6b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2335_c7_fc6b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2329_c7_575e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2329_c7_575e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2329_c7_575e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2329_c7_575e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2329_c7_575e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2329_c7_575e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2329_c7_575e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2329_c7_575e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2329_c7_575e_return_output;

     -- n8_MUX[uxn_opcodes_h_l2320_c7_9f8d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2320_c7_9f8d_cond <= VAR_n8_MUX_uxn_opcodes_h_l2320_c7_9f8d_cond;
     n8_MUX_uxn_opcodes_h_l2320_c7_9f8d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2320_c7_9f8d_iftrue;
     n8_MUX_uxn_opcodes_h_l2320_c7_9f8d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2320_c7_9f8d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output := n8_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2_iftrue := VAR_MUX_uxn_opcodes_h_l2327_c32_92a6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2329_c7_575e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2335_c7_fc6b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2329_c7_575e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2335_c7_fc6b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2323_c7_e9f2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2329_c7_575e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2323_c7_e9f2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2329_c7_575e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2313_c7_2829_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2323_c7_e9f2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2323_c7_e9f2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2323_c7_e9f2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2323_c7_e9f2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2323_c7_e9f2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2323_c7_e9f2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2323_c7_e9f2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output := result_stack_value_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output;

     -- t8_MUX[uxn_opcodes_h_l2307_c2_f8c0] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond <= VAR_t8_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond;
     t8_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue;
     t8_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output := t8_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2320_c7_9f8d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2329_c7_575e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2329_c7_575e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2329_c7_575e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2329_c7_575e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2329_c7_575e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2329_c7_575e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2329_c7_575e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2329_c7_575e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2329_c7_575e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2329_c7_575e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2329_c7_575e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2329_c7_575e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2329_c7_575e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2329_c7_575e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2329_c7_575e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2329_c7_575e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2329_c7_575e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2329_c7_575e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2323_c7_e9f2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2323_c7_e9f2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2323_c7_e9f2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2323_c7_e9f2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2323_c7_e9f2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2323_c7_e9f2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2323_c7_e9f2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2323_c7_e9f2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output;

     -- n8_MUX[uxn_opcodes_h_l2316_c7_a82c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2316_c7_a82c_cond <= VAR_n8_MUX_uxn_opcodes_h_l2316_c7_a82c_cond;
     n8_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue;
     n8_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output := n8_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2316_c7_a82c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_a82c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_a82c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_e9f2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2329_c7_575e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_e9f2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2329_c7_575e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_9f8d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2320_c7_9f8d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2323_c7_e9f2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_e9f2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_e9f2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_e9f2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_e9f2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_e9f2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_e9f2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2320_c7_9f8d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_9f8d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_9f8d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_9f8d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_9f8d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_9f8d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_9f8d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2316_c7_a82c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_a82c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_a82c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2320_c7_9f8d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2320_c7_9f8d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2320_c7_9f8d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2320_c7_9f8d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2320_c7_9f8d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2320_c7_9f8d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2320_c7_9f8d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output;

     -- n8_MUX[uxn_opcodes_h_l2313_c7_2829] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2313_c7_2829_cond <= VAR_n8_MUX_uxn_opcodes_h_l2313_c7_2829_cond;
     n8_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue;
     n8_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2313_c7_2829_return_output := n8_MUX_uxn_opcodes_h_l2313_c7_2829_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2313_c7_2829] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_2829_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_2829_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_2829_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_2829_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2323_c7_e9f2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_e9f2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_e9f2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_e9f2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_e9f2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_e9f2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_e9f2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2320_c7_9f8d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2313_c7_2829_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_9f8d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_2829_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_9f8d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2323_c7_e9f2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2316_c7_a82c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2316_c7_a82c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2316_c7_a82c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output := result_stack_value_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2316_c7_a82c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_a82c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_a82c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output;

     -- n8_MUX[uxn_opcodes_h_l2307_c2_f8c0] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond <= VAR_n8_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond;
     n8_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue;
     n8_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output := n8_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2313_c7_2829] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_2829_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_2829_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_2829_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_2829_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2320_c7_9f8d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_9f8d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_9f8d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_9f8d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_9f8d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_9f8d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_9f8d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2307_c2_f8c0] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2320_c7_9f8d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_9f8d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_9f8d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_9f8d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_9f8d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_9f8d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_9f8d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2316_c7_a82c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_a82c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_a82c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_2829_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_9f8d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2307_c2_f8c0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2316_c7_a82c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_a82c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_a82c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2316_c7_a82c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_a82c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_a82c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_a82c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_a82c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2313_c7_2829] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2313_c7_2829_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2313_c7_2829_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2313_c7_2829_return_output := result_stack_value_MUX_uxn_opcodes_h_l2313_c7_2829_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2313_c7_2829] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_2829_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_2829_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_2829_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_2829_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2313_c7_2829] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_2829_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_2829_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_2829_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_2829_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_a82c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_2829_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_2829_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2313_c7_2829_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2307_c2_f8c0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2307_c2_f8c0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output := result_stack_value_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2313_c7_2829] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_2829_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_2829_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_2829_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_2829_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2307_c2_f8c0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2313_c7_2829] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_2829_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_2829_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_2829_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_2829_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_2829_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_2829_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_2829_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_2829_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2307_c2_f8c0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2307_c2_f8c0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2307_c2_f8c0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2307_c2_f8c0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2307_c2_f8c0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l2344_l2303_DUPLICATE_e917 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l2344_l2303_DUPLICATE_e917_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e56b(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2307_c2_f8c0_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l2344_l2303_DUPLICATE_e917_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l2344_l2303_DUPLICATE_e917_return_output;
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
