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
-- Submodules: 104
entity sft2_0CLK_d29b8e2d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sft2_0CLK_d29b8e2d;
architecture arch of sft2_0CLK_d29b8e2d is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2546_c6_4af6]
signal BIN_OP_EQ_uxn_opcodes_h_l2546_c6_4af6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2546_c6_4af6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2546_c6_4af6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2546_c1_210f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_210f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_210f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_210f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_210f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2546_c2_c2a6]
signal n16_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2546_c2_c2a6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2546_c2_c2a6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2546_c2_c2a6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2546_c2_c2a6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2546_c2_c2a6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2546_c2_c2a6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2546_c2_c2a6]
signal result_stack_value_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2546_c2_c2a6]
signal t8_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2546_c2_c2a6]
signal tmp16_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2547_c3_04d3[uxn_opcodes_h_l2547_c3_04d3]
signal printf_uxn_opcodes_h_l2547_c3_04d3_uxn_opcodes_h_l2547_c3_04d3_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2552_c11_f637]
signal BIN_OP_EQ_uxn_opcodes_h_l2552_c11_f637_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2552_c11_f637_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2552_c11_f637_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2552_c7_cbc9]
signal n16_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2552_c7_cbc9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2552_c7_cbc9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2552_c7_cbc9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2552_c7_cbc9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2552_c7_cbc9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2552_c7_cbc9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2552_c7_cbc9]
signal result_stack_value_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2552_c7_cbc9]
signal t8_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2552_c7_cbc9]
signal tmp16_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2555_c11_4e81]
signal BIN_OP_EQ_uxn_opcodes_h_l2555_c11_4e81_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2555_c11_4e81_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2555_c11_4e81_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2555_c7_6332]
signal n16_MUX_uxn_opcodes_h_l2555_c7_6332_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2555_c7_6332_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2555_c7_6332]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_6332_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_6332_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2555_c7_6332]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2555_c7_6332_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2555_c7_6332_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2555_c7_6332]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_6332_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_6332_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2555_c7_6332]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_6332_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_6332_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2555_c7_6332]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_6332_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_6332_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2555_c7_6332]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_6332_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_6332_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2555_c7_6332]
signal result_stack_value_MUX_uxn_opcodes_h_l2555_c7_6332_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2555_c7_6332_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2555_c7_6332]
signal t8_MUX_uxn_opcodes_h_l2555_c7_6332_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2555_c7_6332_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2555_c7_6332]
signal tmp16_MUX_uxn_opcodes_h_l2555_c7_6332_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2555_c7_6332_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2559_c11_b19f]
signal BIN_OP_EQ_uxn_opcodes_h_l2559_c11_b19f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2559_c11_b19f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2559_c11_b19f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2559_c7_7d50]
signal n16_MUX_uxn_opcodes_h_l2559_c7_7d50_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2559_c7_7d50]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2559_c7_7d50_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2559_c7_7d50]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2559_c7_7d50_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2559_c7_7d50]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2559_c7_7d50_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2559_c7_7d50]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2559_c7_7d50_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2559_c7_7d50]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2559_c7_7d50_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2559_c7_7d50]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2559_c7_7d50_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2559_c7_7d50]
signal result_stack_value_MUX_uxn_opcodes_h_l2559_c7_7d50_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2559_c7_7d50]
signal tmp16_MUX_uxn_opcodes_h_l2559_c7_7d50_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2562_c11_41cd]
signal BIN_OP_EQ_uxn_opcodes_h_l2562_c11_41cd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2562_c11_41cd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2562_c11_41cd_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2562_c7_0028]
signal n16_MUX_uxn_opcodes_h_l2562_c7_0028_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2562_c7_0028_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2562_c7_0028]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_0028_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_0028_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2562_c7_0028]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2562_c7_0028_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2562_c7_0028_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2562_c7_0028]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_0028_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_0028_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2562_c7_0028]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_0028_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_0028_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2562_c7_0028]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_0028_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_0028_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2562_c7_0028]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_0028_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_0028_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2562_c7_0028]
signal result_stack_value_MUX_uxn_opcodes_h_l2562_c7_0028_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2562_c7_0028_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2562_c7_0028]
signal tmp16_MUX_uxn_opcodes_h_l2562_c7_0028_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2562_c7_0028_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2564_c3_33c2]
signal CONST_SL_8_uxn_opcodes_h_l2564_c3_33c2_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2564_c3_33c2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2567_c11_8b37]
signal BIN_OP_EQ_uxn_opcodes_h_l2567_c11_8b37_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2567_c11_8b37_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2567_c11_8b37_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2567_c7_ffae]
signal n16_MUX_uxn_opcodes_h_l2567_c7_ffae_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2567_c7_ffae]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_ffae_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2567_c7_ffae]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2567_c7_ffae_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2567_c7_ffae]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_ffae_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2567_c7_ffae]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_ffae_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2567_c7_ffae]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_ffae_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2567_c7_ffae]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_ffae_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2567_c7_ffae]
signal result_stack_value_MUX_uxn_opcodes_h_l2567_c7_ffae_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2567_c7_ffae]
signal tmp16_MUX_uxn_opcodes_h_l2567_c7_ffae_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2570_c11_af87]
signal BIN_OP_EQ_uxn_opcodes_h_l2570_c11_af87_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2570_c11_af87_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2570_c11_af87_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2570_c7_430c]
signal n16_MUX_uxn_opcodes_h_l2570_c7_430c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2570_c7_430c_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2570_c7_430c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c7_430c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c7_430c_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2570_c7_430c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2570_c7_430c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2570_c7_430c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2570_c7_430c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_430c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_430c_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2570_c7_430c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2570_c7_430c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2570_c7_430c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2570_c7_430c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_430c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_430c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2570_c7_430c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_430c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_430c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2570_c7_430c]
signal result_stack_value_MUX_uxn_opcodes_h_l2570_c7_430c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2570_c7_430c_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2570_c7_430c]
signal tmp16_MUX_uxn_opcodes_h_l2570_c7_430c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2570_c7_430c_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2571_c3_e2b2]
signal BIN_OP_OR_uxn_opcodes_h_l2571_c3_e2b2_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2571_c3_e2b2_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2571_c3_e2b2_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2574_c32_5aa3]
signal BIN_OP_AND_uxn_opcodes_h_l2574_c32_5aa3_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2574_c32_5aa3_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2574_c32_5aa3_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2574_c32_1216]
signal BIN_OP_GT_uxn_opcodes_h_l2574_c32_1216_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2574_c32_1216_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2574_c32_1216_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2574_c32_923b]
signal MUX_uxn_opcodes_h_l2574_c32_923b_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2574_c32_923b_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2574_c32_923b_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2574_c32_923b_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2576_c11_0576]
signal BIN_OP_EQ_uxn_opcodes_h_l2576_c11_0576_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2576_c11_0576_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2576_c11_0576_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2576_c7_3e5a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_3e5a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_3e5a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_3e5a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_3e5a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2576_c7_3e5a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_3e5a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_3e5a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_3e5a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_3e5a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2576_c7_3e5a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_3e5a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_3e5a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_3e5a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_3e5a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2576_c7_3e5a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_3e5a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_3e5a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_3e5a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_3e5a_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2576_c7_3e5a]
signal result_stack_value_MUX_uxn_opcodes_h_l2576_c7_3e5a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2576_c7_3e5a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2576_c7_3e5a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2576_c7_3e5a_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2576_c7_3e5a]
signal tmp16_MUX_uxn_opcodes_h_l2576_c7_3e5a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2576_c7_3e5a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2576_c7_3e5a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2576_c7_3e5a_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2577_c20_f363]
signal BIN_OP_AND_uxn_opcodes_h_l2577_c20_f363_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2577_c20_f363_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2577_c20_f363_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l2577_c12_c2fa]
signal BIN_OP_SR_uxn_opcodes_h_l2577_c12_c2fa_left : unsigned(15 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2577_c12_c2fa_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2577_c12_c2fa_return_output : unsigned(15 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l2577_c36_a586]
signal CONST_SR_4_uxn_opcodes_h_l2577_c36_a586_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l2577_c36_a586_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l2577_c12_c9cb]
signal BIN_OP_SL_uxn_opcodes_h_l2577_c12_c9cb_left : unsigned(15 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2577_c12_c9cb_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2577_c12_c9cb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2583_c11_a9fc]
signal BIN_OP_EQ_uxn_opcodes_h_l2583_c11_a9fc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2583_c11_a9fc_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2583_c11_a9fc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2583_c7_d6b7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_d6b7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_d6b7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_d6b7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_d6b7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2583_c7_d6b7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_d6b7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_d6b7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_d6b7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_d6b7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2583_c7_d6b7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_d6b7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_d6b7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_d6b7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_d6b7_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2583_c7_d6b7]
signal result_stack_value_MUX_uxn_opcodes_h_l2583_c7_d6b7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2583_c7_d6b7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2583_c7_d6b7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2583_c7_d6b7_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2585_c34_d4e4]
signal CONST_SR_8_uxn_opcodes_h_l2585_c34_d4e4_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2585_c34_d4e4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2587_c11_b971]
signal BIN_OP_EQ_uxn_opcodes_h_l2587_c11_b971_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2587_c11_b971_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2587_c11_b971_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2587_c7_1daf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1daf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1daf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1daf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1daf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2587_c7_1daf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1daf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1daf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1daf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1daf_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2546_c6_4af6
BIN_OP_EQ_uxn_opcodes_h_l2546_c6_4af6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2546_c6_4af6_left,
BIN_OP_EQ_uxn_opcodes_h_l2546_c6_4af6_right,
BIN_OP_EQ_uxn_opcodes_h_l2546_c6_4af6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_210f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_210f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_210f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_210f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_210f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_210f_return_output);

-- n16_MUX_uxn_opcodes_h_l2546_c2_c2a6
n16_MUX_uxn_opcodes_h_l2546_c2_c2a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond,
n16_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue,
n16_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse,
n16_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6
result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2546_c2_c2a6
result_is_stack_read_MUX_uxn_opcodes_h_l2546_c2_c2a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_c2a6
result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_c2a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_c2a6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_c2a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_c2a6
result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_c2a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2546_c2_c2a6
result_stack_value_MUX_uxn_opcodes_h_l2546_c2_c2a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond,
result_stack_value_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output);

-- t8_MUX_uxn_opcodes_h_l2546_c2_c2a6
t8_MUX_uxn_opcodes_h_l2546_c2_c2a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond,
t8_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue,
t8_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse,
t8_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2546_c2_c2a6
tmp16_MUX_uxn_opcodes_h_l2546_c2_c2a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond,
tmp16_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue,
tmp16_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse,
tmp16_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output);

-- printf_uxn_opcodes_h_l2547_c3_04d3_uxn_opcodes_h_l2547_c3_04d3
printf_uxn_opcodes_h_l2547_c3_04d3_uxn_opcodes_h_l2547_c3_04d3 : entity work.printf_uxn_opcodes_h_l2547_c3_04d3_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2547_c3_04d3_uxn_opcodes_h_l2547_c3_04d3_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2552_c11_f637
BIN_OP_EQ_uxn_opcodes_h_l2552_c11_f637 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2552_c11_f637_left,
BIN_OP_EQ_uxn_opcodes_h_l2552_c11_f637_right,
BIN_OP_EQ_uxn_opcodes_h_l2552_c11_f637_return_output);

-- n16_MUX_uxn_opcodes_h_l2552_c7_cbc9
n16_MUX_uxn_opcodes_h_l2552_c7_cbc9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond,
n16_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue,
n16_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse,
n16_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9
result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2552_c7_cbc9
result_is_stack_read_MUX_uxn_opcodes_h_l2552_c7_cbc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_cbc9
result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_cbc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_cbc9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_cbc9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_cbc9
result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_cbc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2552_c7_cbc9
result_stack_value_MUX_uxn_opcodes_h_l2552_c7_cbc9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond,
result_stack_value_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output);

-- t8_MUX_uxn_opcodes_h_l2552_c7_cbc9
t8_MUX_uxn_opcodes_h_l2552_c7_cbc9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond,
t8_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue,
t8_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse,
t8_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2552_c7_cbc9
tmp16_MUX_uxn_opcodes_h_l2552_c7_cbc9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond,
tmp16_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue,
tmp16_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse,
tmp16_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2555_c11_4e81
BIN_OP_EQ_uxn_opcodes_h_l2555_c11_4e81 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2555_c11_4e81_left,
BIN_OP_EQ_uxn_opcodes_h_l2555_c11_4e81_right,
BIN_OP_EQ_uxn_opcodes_h_l2555_c11_4e81_return_output);

-- n16_MUX_uxn_opcodes_h_l2555_c7_6332
n16_MUX_uxn_opcodes_h_l2555_c7_6332 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2555_c7_6332_cond,
n16_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue,
n16_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse,
n16_MUX_uxn_opcodes_h_l2555_c7_6332_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_6332
result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_6332 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_6332_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_6332_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2555_c7_6332
result_is_stack_read_MUX_uxn_opcodes_h_l2555_c7_6332 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2555_c7_6332_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2555_c7_6332_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_6332
result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_6332 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_6332_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_6332_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_6332
result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_6332 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_6332_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_6332_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_6332
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_6332 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_6332_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_6332_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_6332
result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_6332 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_6332_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_6332_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2555_c7_6332
result_stack_value_MUX_uxn_opcodes_h_l2555_c7_6332 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2555_c7_6332_cond,
result_stack_value_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2555_c7_6332_return_output);

-- t8_MUX_uxn_opcodes_h_l2555_c7_6332
t8_MUX_uxn_opcodes_h_l2555_c7_6332 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2555_c7_6332_cond,
t8_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue,
t8_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse,
t8_MUX_uxn_opcodes_h_l2555_c7_6332_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2555_c7_6332
tmp16_MUX_uxn_opcodes_h_l2555_c7_6332 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2555_c7_6332_cond,
tmp16_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue,
tmp16_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse,
tmp16_MUX_uxn_opcodes_h_l2555_c7_6332_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2559_c11_b19f
BIN_OP_EQ_uxn_opcodes_h_l2559_c11_b19f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2559_c11_b19f_left,
BIN_OP_EQ_uxn_opcodes_h_l2559_c11_b19f_right,
BIN_OP_EQ_uxn_opcodes_h_l2559_c11_b19f_return_output);

-- n16_MUX_uxn_opcodes_h_l2559_c7_7d50
n16_MUX_uxn_opcodes_h_l2559_c7_7d50 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2559_c7_7d50_cond,
n16_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue,
n16_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse,
n16_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2559_c7_7d50
result_is_sp_shift_MUX_uxn_opcodes_h_l2559_c7_7d50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2559_c7_7d50_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2559_c7_7d50
result_is_stack_read_MUX_uxn_opcodes_h_l2559_c7_7d50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2559_c7_7d50_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2559_c7_7d50
result_sp_relative_shift_MUX_uxn_opcodes_h_l2559_c7_7d50 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2559_c7_7d50_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2559_c7_7d50
result_is_stack_write_MUX_uxn_opcodes_h_l2559_c7_7d50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2559_c7_7d50_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2559_c7_7d50
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2559_c7_7d50 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2559_c7_7d50_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2559_c7_7d50
result_is_opc_done_MUX_uxn_opcodes_h_l2559_c7_7d50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2559_c7_7d50_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2559_c7_7d50
result_stack_value_MUX_uxn_opcodes_h_l2559_c7_7d50 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2559_c7_7d50_cond,
result_stack_value_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2559_c7_7d50
tmp16_MUX_uxn_opcodes_h_l2559_c7_7d50 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2559_c7_7d50_cond,
tmp16_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue,
tmp16_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse,
tmp16_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2562_c11_41cd
BIN_OP_EQ_uxn_opcodes_h_l2562_c11_41cd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2562_c11_41cd_left,
BIN_OP_EQ_uxn_opcodes_h_l2562_c11_41cd_right,
BIN_OP_EQ_uxn_opcodes_h_l2562_c11_41cd_return_output);

-- n16_MUX_uxn_opcodes_h_l2562_c7_0028
n16_MUX_uxn_opcodes_h_l2562_c7_0028 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2562_c7_0028_cond,
n16_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue,
n16_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse,
n16_MUX_uxn_opcodes_h_l2562_c7_0028_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_0028
result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_0028 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_0028_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_0028_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2562_c7_0028
result_is_stack_read_MUX_uxn_opcodes_h_l2562_c7_0028 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2562_c7_0028_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2562_c7_0028_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_0028
result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_0028 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_0028_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_0028_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_0028
result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_0028 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_0028_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_0028_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_0028
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_0028 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_0028_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_0028_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_0028
result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_0028 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_0028_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_0028_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2562_c7_0028
result_stack_value_MUX_uxn_opcodes_h_l2562_c7_0028 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2562_c7_0028_cond,
result_stack_value_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2562_c7_0028_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2562_c7_0028
tmp16_MUX_uxn_opcodes_h_l2562_c7_0028 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2562_c7_0028_cond,
tmp16_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue,
tmp16_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse,
tmp16_MUX_uxn_opcodes_h_l2562_c7_0028_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2564_c3_33c2
CONST_SL_8_uxn_opcodes_h_l2564_c3_33c2 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2564_c3_33c2_x,
CONST_SL_8_uxn_opcodes_h_l2564_c3_33c2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2567_c11_8b37
BIN_OP_EQ_uxn_opcodes_h_l2567_c11_8b37 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2567_c11_8b37_left,
BIN_OP_EQ_uxn_opcodes_h_l2567_c11_8b37_right,
BIN_OP_EQ_uxn_opcodes_h_l2567_c11_8b37_return_output);

-- n16_MUX_uxn_opcodes_h_l2567_c7_ffae
n16_MUX_uxn_opcodes_h_l2567_c7_ffae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2567_c7_ffae_cond,
n16_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue,
n16_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse,
n16_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_ffae
result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_ffae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_ffae_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2567_c7_ffae
result_is_stack_read_MUX_uxn_opcodes_h_l2567_c7_ffae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2567_c7_ffae_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_ffae
result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_ffae : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_ffae_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_ffae
result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_ffae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_ffae_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_ffae
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_ffae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_ffae_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_ffae
result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_ffae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_ffae_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2567_c7_ffae
result_stack_value_MUX_uxn_opcodes_h_l2567_c7_ffae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2567_c7_ffae_cond,
result_stack_value_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2567_c7_ffae
tmp16_MUX_uxn_opcodes_h_l2567_c7_ffae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2567_c7_ffae_cond,
tmp16_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue,
tmp16_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse,
tmp16_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2570_c11_af87
BIN_OP_EQ_uxn_opcodes_h_l2570_c11_af87 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2570_c11_af87_left,
BIN_OP_EQ_uxn_opcodes_h_l2570_c11_af87_right,
BIN_OP_EQ_uxn_opcodes_h_l2570_c11_af87_return_output);

-- n16_MUX_uxn_opcodes_h_l2570_c7_430c
n16_MUX_uxn_opcodes_h_l2570_c7_430c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2570_c7_430c_cond,
n16_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue,
n16_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse,
n16_MUX_uxn_opcodes_h_l2570_c7_430c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c7_430c
result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c7_430c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c7_430c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c7_430c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2570_c7_430c
result_is_stack_read_MUX_uxn_opcodes_h_l2570_c7_430c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2570_c7_430c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2570_c7_430c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_430c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_430c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_430c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_430c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2570_c7_430c
result_is_stack_write_MUX_uxn_opcodes_h_l2570_c7_430c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2570_c7_430c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2570_c7_430c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_430c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_430c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_430c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_430c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_430c
result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_430c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_430c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_430c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2570_c7_430c
result_stack_value_MUX_uxn_opcodes_h_l2570_c7_430c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2570_c7_430c_cond,
result_stack_value_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2570_c7_430c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2570_c7_430c
tmp16_MUX_uxn_opcodes_h_l2570_c7_430c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2570_c7_430c_cond,
tmp16_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue,
tmp16_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse,
tmp16_MUX_uxn_opcodes_h_l2570_c7_430c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2571_c3_e2b2
BIN_OP_OR_uxn_opcodes_h_l2571_c3_e2b2 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2571_c3_e2b2_left,
BIN_OP_OR_uxn_opcodes_h_l2571_c3_e2b2_right,
BIN_OP_OR_uxn_opcodes_h_l2571_c3_e2b2_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2574_c32_5aa3
BIN_OP_AND_uxn_opcodes_h_l2574_c32_5aa3 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2574_c32_5aa3_left,
BIN_OP_AND_uxn_opcodes_h_l2574_c32_5aa3_right,
BIN_OP_AND_uxn_opcodes_h_l2574_c32_5aa3_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2574_c32_1216
BIN_OP_GT_uxn_opcodes_h_l2574_c32_1216 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2574_c32_1216_left,
BIN_OP_GT_uxn_opcodes_h_l2574_c32_1216_right,
BIN_OP_GT_uxn_opcodes_h_l2574_c32_1216_return_output);

-- MUX_uxn_opcodes_h_l2574_c32_923b
MUX_uxn_opcodes_h_l2574_c32_923b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2574_c32_923b_cond,
MUX_uxn_opcodes_h_l2574_c32_923b_iftrue,
MUX_uxn_opcodes_h_l2574_c32_923b_iffalse,
MUX_uxn_opcodes_h_l2574_c32_923b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2576_c11_0576
BIN_OP_EQ_uxn_opcodes_h_l2576_c11_0576 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2576_c11_0576_left,
BIN_OP_EQ_uxn_opcodes_h_l2576_c11_0576_right,
BIN_OP_EQ_uxn_opcodes_h_l2576_c11_0576_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_3e5a
result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_3e5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_3e5a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_3e5a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_3e5a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_3e5a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_3e5a
result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_3e5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_3e5a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_3e5a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_3e5a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_3e5a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_3e5a
result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_3e5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_3e5a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_3e5a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_3e5a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_3e5a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_3e5a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_3e5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_3e5a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_3e5a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_3e5a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_3e5a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2576_c7_3e5a
result_stack_value_MUX_uxn_opcodes_h_l2576_c7_3e5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2576_c7_3e5a_cond,
result_stack_value_MUX_uxn_opcodes_h_l2576_c7_3e5a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2576_c7_3e5a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2576_c7_3e5a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2576_c7_3e5a
tmp16_MUX_uxn_opcodes_h_l2576_c7_3e5a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2576_c7_3e5a_cond,
tmp16_MUX_uxn_opcodes_h_l2576_c7_3e5a_iftrue,
tmp16_MUX_uxn_opcodes_h_l2576_c7_3e5a_iffalse,
tmp16_MUX_uxn_opcodes_h_l2576_c7_3e5a_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2577_c20_f363
BIN_OP_AND_uxn_opcodes_h_l2577_c20_f363 : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2577_c20_f363_left,
BIN_OP_AND_uxn_opcodes_h_l2577_c20_f363_right,
BIN_OP_AND_uxn_opcodes_h_l2577_c20_f363_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l2577_c12_c2fa
BIN_OP_SR_uxn_opcodes_h_l2577_c12_c2fa : entity work.BIN_OP_SR_uint16_t_uint8_t_0CLK_295015b8 port map (
BIN_OP_SR_uxn_opcodes_h_l2577_c12_c2fa_left,
BIN_OP_SR_uxn_opcodes_h_l2577_c12_c2fa_right,
BIN_OP_SR_uxn_opcodes_h_l2577_c12_c2fa_return_output);

-- CONST_SR_4_uxn_opcodes_h_l2577_c36_a586
CONST_SR_4_uxn_opcodes_h_l2577_c36_a586 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l2577_c36_a586_x,
CONST_SR_4_uxn_opcodes_h_l2577_c36_a586_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l2577_c12_c9cb
BIN_OP_SL_uxn_opcodes_h_l2577_c12_c9cb : entity work.BIN_OP_SL_uint16_t_uint8_t_0CLK_b6546dec port map (
BIN_OP_SL_uxn_opcodes_h_l2577_c12_c9cb_left,
BIN_OP_SL_uxn_opcodes_h_l2577_c12_c9cb_right,
BIN_OP_SL_uxn_opcodes_h_l2577_c12_c9cb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2583_c11_a9fc
BIN_OP_EQ_uxn_opcodes_h_l2583_c11_a9fc : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2583_c11_a9fc_left,
BIN_OP_EQ_uxn_opcodes_h_l2583_c11_a9fc_right,
BIN_OP_EQ_uxn_opcodes_h_l2583_c11_a9fc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_d6b7
result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_d6b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_d6b7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_d6b7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_d6b7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_d6b7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_d6b7
result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_d6b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_d6b7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_d6b7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_d6b7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_d6b7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_d6b7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_d6b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_d6b7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_d6b7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_d6b7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_d6b7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2583_c7_d6b7
result_stack_value_MUX_uxn_opcodes_h_l2583_c7_d6b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2583_c7_d6b7_cond,
result_stack_value_MUX_uxn_opcodes_h_l2583_c7_d6b7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2583_c7_d6b7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2583_c7_d6b7_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2585_c34_d4e4
CONST_SR_8_uxn_opcodes_h_l2585_c34_d4e4 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2585_c34_d4e4_x,
CONST_SR_8_uxn_opcodes_h_l2585_c34_d4e4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2587_c11_b971
BIN_OP_EQ_uxn_opcodes_h_l2587_c11_b971 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2587_c11_b971_left,
BIN_OP_EQ_uxn_opcodes_h_l2587_c11_b971_right,
BIN_OP_EQ_uxn_opcodes_h_l2587_c11_b971_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1daf
result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1daf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1daf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1daf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1daf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1daf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1daf
result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1daf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1daf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1daf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1daf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1daf_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2546_c6_4af6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_210f_return_output,
 n16_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output,
 t8_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output,
 tmp16_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2552_c11_f637_return_output,
 n16_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output,
 t8_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output,
 tmp16_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2555_c11_4e81_return_output,
 n16_MUX_uxn_opcodes_h_l2555_c7_6332_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_6332_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2555_c7_6332_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_6332_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_6332_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_6332_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_6332_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2555_c7_6332_return_output,
 t8_MUX_uxn_opcodes_h_l2555_c7_6332_return_output,
 tmp16_MUX_uxn_opcodes_h_l2555_c7_6332_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2559_c11_b19f_return_output,
 n16_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output,
 tmp16_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2562_c11_41cd_return_output,
 n16_MUX_uxn_opcodes_h_l2562_c7_0028_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_0028_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2562_c7_0028_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_0028_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_0028_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_0028_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_0028_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2562_c7_0028_return_output,
 tmp16_MUX_uxn_opcodes_h_l2562_c7_0028_return_output,
 CONST_SL_8_uxn_opcodes_h_l2564_c3_33c2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2567_c11_8b37_return_output,
 n16_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output,
 tmp16_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2570_c11_af87_return_output,
 n16_MUX_uxn_opcodes_h_l2570_c7_430c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c7_430c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2570_c7_430c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_430c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2570_c7_430c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_430c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_430c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2570_c7_430c_return_output,
 tmp16_MUX_uxn_opcodes_h_l2570_c7_430c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2571_c3_e2b2_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2574_c32_5aa3_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2574_c32_1216_return_output,
 MUX_uxn_opcodes_h_l2574_c32_923b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2576_c11_0576_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_3e5a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_3e5a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_3e5a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_3e5a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2576_c7_3e5a_return_output,
 tmp16_MUX_uxn_opcodes_h_l2576_c7_3e5a_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2577_c20_f363_return_output,
 BIN_OP_SR_uxn_opcodes_h_l2577_c12_c2fa_return_output,
 CONST_SR_4_uxn_opcodes_h_l2577_c36_a586_return_output,
 BIN_OP_SL_uxn_opcodes_h_l2577_c12_c9cb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2583_c11_a9fc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_d6b7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_d6b7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_d6b7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2583_c7_d6b7_return_output,
 CONST_SR_8_uxn_opcodes_h_l2585_c34_d4e4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2587_c11_b971_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1daf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1daf_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c6_4af6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c6_4af6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c6_4af6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_210f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_210f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_210f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_210f_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2549_c3_9447 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2547_c3_04d3_uxn_opcodes_h_l2547_c3_04d3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_f637_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_f637_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_f637_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2555_c7_6332_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_6332_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2555_c7_6332_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_6332_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_6332_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2553_c3_c48c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_6332_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_6332_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2555_c7_6332_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2555_c7_6332_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2555_c7_6332_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_4e81_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_4e81_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_4e81_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2555_c7_6332_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_6332_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2555_c7_6332_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_6332_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_6332_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2557_c3_ad2b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_6332_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_6332_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2555_c7_6332_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2555_c7_6332_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2555_c7_6332_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2559_c11_b19f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2559_c11_b19f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2559_c11_b19f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2562_c7_0028_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2559_c7_7d50_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_0028_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2559_c7_7d50_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2562_c7_0028_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2559_c7_7d50_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_0028_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2559_c7_7d50_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_0028_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2559_c7_7d50_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2560_c3_cd60 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_0028_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2559_c7_7d50_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_0028_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2559_c7_7d50_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2562_c7_0028_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2559_c7_7d50_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2562_c7_0028_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2559_c7_7d50_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2562_c11_41cd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2562_c11_41cd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2562_c11_41cd_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2562_c7_0028_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_0028_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2562_c7_0028_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_0028_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_0028_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2565_c3_564f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_0028_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_0028_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2562_c7_0028_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2562_c7_0028_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2564_c3_33c2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2564_c3_33c2_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2567_c11_8b37_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2567_c11_8b37_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2567_c11_8b37_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2570_c7_430c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2567_c7_ffae_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c7_430c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_ffae_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2570_c7_430c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2567_c7_ffae_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_430c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_ffae_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2570_c7_430c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_ffae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2568_c3_fb68 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_430c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_ffae_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_430c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_ffae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2570_c7_430c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2567_c7_ffae_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2570_c7_430c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2567_c7_ffae_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_af87_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_af87_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_af87_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2570_c7_430c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_3e5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c7_430c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2570_c7_430c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_430c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_3e5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2570_c7_430c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_3e5a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_430c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_3e5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_430c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2576_c7_3e5a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2570_c7_430c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2576_c7_3e5a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2570_c7_430c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2571_c3_e2b2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2571_c3_e2b2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2571_c3_e2b2_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2574_c32_923b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2574_c32_923b_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2574_c32_923b_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2574_c32_5aa3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2574_c32_5aa3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2574_c32_5aa3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2574_c32_1216_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2574_c32_1216_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2574_c32_1216_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2574_c32_923b_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_0576_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_0576_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_0576_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_3e5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_3e5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_3e5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_3e5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_3e5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_d6b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_3e5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_3e5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_3e5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_d6b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_3e5a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_3e5a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2580_c3_fba2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_3e5a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_d6b7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_3e5a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2576_c7_3e5a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2576_c7_3e5a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2583_c7_d6b7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2576_c7_3e5a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2576_c7_3e5a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2576_c7_3e5a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2576_c7_3e5a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2577_c12_c2fa_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2577_c20_f363_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2577_c20_f363_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2577_c20_f363_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2577_c12_c2fa_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2577_c12_c2fa_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2577_c12_c9cb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2577_c12_c9cb_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2577_c36_a586_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2577_c36_a586_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2577_c12_c9cb_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2581_c24_3b55_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_a9fc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_a9fc_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_a9fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_d6b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_d6b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1daf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_d6b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_d6b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_d6b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1daf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_d6b7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_d6b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2584_c3_dd06 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_d6b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_d6b7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2583_c7_d6b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2583_c7_d6b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2583_c7_d6b7_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2585_c34_d4e4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2585_c34_d4e4_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2585_c24_9987_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_b971_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_b971_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_b971_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1daf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1daf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1daf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1daf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1daf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1daf_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2562_l2559_l2555_l2552_l2576_l2546_l2567_DUPLICATE_8221_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2562_l2559_l2555_l2552_l2546_l2570_l2567_DUPLICATE_a2d0_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2562_l2559_l2587_l2555_l2583_l2552_l2546_l2570_l2567_DUPLICATE_4418_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2562_l2559_l2555_l2583_l2552_l2546_l2570_l2567_DUPLICATE_03b1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2562_l2559_l2555_l2552_l2570_l2567_DUPLICATE_1028_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2562_l2559_l2587_l2555_l2583_l2552_l2576_l2570_l2567_DUPLICATE_ca27_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2571_l2563_DUPLICATE_5443_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2583_l2570_DUPLICATE_c103_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2592_l2541_DUPLICATE_7ded_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2559_c11_b19f_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1daf_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_0576_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c6_4af6_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2574_c32_1216_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_af87_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2580_c3_fba2 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_3e5a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2580_c3_fba2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_a9fc_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_4e81_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2557_c3_ad2b := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2557_c3_ad2b;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2577_c20_f363_right := to_unsigned(15, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2565_c3_564f := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2565_c3_564f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2567_c11_8b37_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2549_c3_9447 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2549_c3_9447;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_3e5a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2553_c3_c48c := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2553_c3_c48c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2568_c3_fb68 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2568_c3_fb68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_f637_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2574_c32_923b_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1daf_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_b971_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2584_c3_dd06 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_d6b7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2584_c3_dd06;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2574_c32_5aa3_right := to_unsigned(128, 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_3e5a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2560_c3_cd60 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2560_c3_cd60;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_210f_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2574_c32_923b_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2562_c11_41cd_right := to_unsigned(4, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_210f_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2574_c32_5aa3_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2571_c3_e2b2_left := n16;
     VAR_BIN_OP_SR_uxn_opcodes_h_l2577_c12_c2fa_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c6_4af6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_f637_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_4e81_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2559_c11_b19f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2562_c11_41cd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2567_c11_8b37_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_af87_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_0576_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_a9fc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_b971_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2577_c20_f363_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l2577_c36_a586_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse := t8;
     VAR_CONST_SR_8_uxn_opcodes_h_l2585_c34_d4e4_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2576_c7_3e5a_iffalse := tmp16;
     -- CONST_SR_4[uxn_opcodes_h_l2577_c36_a586] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l2577_c36_a586_x <= VAR_CONST_SR_4_uxn_opcodes_h_l2577_c36_a586_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l2577_c36_a586_return_output := CONST_SR_4_uxn_opcodes_h_l2577_c36_a586_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2570_c11_af87] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2570_c11_af87_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_af87_left;
     BIN_OP_EQ_uxn_opcodes_h_l2570_c11_af87_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_af87_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_af87_return_output := BIN_OP_EQ_uxn_opcodes_h_l2570_c11_af87_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2562_l2559_l2555_l2552_l2546_l2570_l2567_DUPLICATE_a2d0 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2562_l2559_l2555_l2552_l2546_l2570_l2567_DUPLICATE_a2d0_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2562_l2559_l2555_l2552_l2570_l2567_DUPLICATE_1028 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2562_l2559_l2555_l2552_l2570_l2567_DUPLICATE_1028_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l2576_c11_0576] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2576_c11_0576_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_0576_left;
     BIN_OP_EQ_uxn_opcodes_h_l2576_c11_0576_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_0576_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_0576_return_output := BIN_OP_EQ_uxn_opcodes_h_l2576_c11_0576_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2574_c32_5aa3] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2574_c32_5aa3_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2574_c32_5aa3_left;
     BIN_OP_AND_uxn_opcodes_h_l2574_c32_5aa3_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2574_c32_5aa3_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2574_c32_5aa3_return_output := BIN_OP_AND_uxn_opcodes_h_l2574_c32_5aa3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2555_c11_4e81] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2555_c11_4e81_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_4e81_left;
     BIN_OP_EQ_uxn_opcodes_h_l2555_c11_4e81_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_4e81_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_4e81_return_output := BIN_OP_EQ_uxn_opcodes_h_l2555_c11_4e81_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2562_l2559_l2587_l2555_l2583_l2552_l2576_l2570_l2567_DUPLICATE_ca27 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2562_l2559_l2587_l2555_l2583_l2552_l2576_l2570_l2567_DUPLICATE_ca27_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2583_c11_a9fc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2583_c11_a9fc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_a9fc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2583_c11_a9fc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_a9fc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_a9fc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2583_c11_a9fc_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2562_l2559_l2555_l2583_l2552_l2546_l2570_l2567_DUPLICATE_03b1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2562_l2559_l2555_l2583_l2552_l2546_l2570_l2567_DUPLICATE_03b1_return_output := result.stack_value;

     -- BIN_OP_AND[uxn_opcodes_h_l2577_c20_f363] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2577_c20_f363_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2577_c20_f363_left;
     BIN_OP_AND_uxn_opcodes_h_l2577_c20_f363_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2577_c20_f363_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2577_c20_f363_return_output := BIN_OP_AND_uxn_opcodes_h_l2577_c20_f363_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2552_c11_f637] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2552_c11_f637_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_f637_left;
     BIN_OP_EQ_uxn_opcodes_h_l2552_c11_f637_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_f637_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_f637_return_output := BIN_OP_EQ_uxn_opcodes_h_l2552_c11_f637_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2562_l2559_l2587_l2555_l2583_l2552_l2546_l2570_l2567_DUPLICATE_4418 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2562_l2559_l2587_l2555_l2583_l2552_l2546_l2570_l2567_DUPLICATE_4418_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2583_l2570_DUPLICATE_c103 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2583_l2570_DUPLICATE_c103_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2571_l2563_DUPLICATE_5443 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2571_l2563_DUPLICATE_5443_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2559_c11_b19f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2559_c11_b19f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2559_c11_b19f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2559_c11_b19f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2559_c11_b19f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2559_c11_b19f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2559_c11_b19f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2587_c11_b971] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2587_c11_b971_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_b971_left;
     BIN_OP_EQ_uxn_opcodes_h_l2587_c11_b971_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_b971_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_b971_return_output := BIN_OP_EQ_uxn_opcodes_h_l2587_c11_b971_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2567_c11_8b37] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2567_c11_8b37_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2567_c11_8b37_left;
     BIN_OP_EQ_uxn_opcodes_h_l2567_c11_8b37_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2567_c11_8b37_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2567_c11_8b37_return_output := BIN_OP_EQ_uxn_opcodes_h_l2567_c11_8b37_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2546_c6_4af6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2546_c6_4af6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c6_4af6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2546_c6_4af6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c6_4af6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c6_4af6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2546_c6_4af6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2562_c11_41cd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2562_c11_41cd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2562_c11_41cd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2562_c11_41cd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2562_c11_41cd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2562_c11_41cd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2562_c11_41cd_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2562_l2559_l2555_l2552_l2576_l2546_l2567_DUPLICATE_8221 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2562_l2559_l2555_l2552_l2576_l2546_l2567_DUPLICATE_8221_return_output := result.is_sp_shift;

     -- CONST_SR_8[uxn_opcodes_h_l2585_c34_d4e4] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2585_c34_d4e4_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2585_c34_d4e4_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2585_c34_d4e4_return_output := CONST_SR_8_uxn_opcodes_h_l2585_c34_d4e4_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2574_c32_1216_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2574_c32_5aa3_return_output;
     VAR_BIN_OP_SR_uxn_opcodes_h_l2577_c12_c2fa_right := VAR_BIN_OP_AND_uxn_opcodes_h_l2577_c20_f363_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_210f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c6_4af6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c6_4af6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c6_4af6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c6_4af6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c6_4af6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c6_4af6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c6_4af6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c6_4af6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c6_4af6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c6_4af6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c6_4af6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_f637_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_f637_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_f637_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_f637_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_f637_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_f637_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_f637_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_f637_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_f637_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_f637_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2555_c7_6332_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_4e81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_6332_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_4e81_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_6332_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_4e81_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2555_c7_6332_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_4e81_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_6332_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_4e81_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_6332_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_4e81_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_6332_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_4e81_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2555_c7_6332_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_4e81_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2555_c7_6332_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_4e81_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2555_c7_6332_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_4e81_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2559_c7_7d50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2559_c11_b19f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2559_c7_7d50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2559_c11_b19f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2559_c7_7d50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2559_c11_b19f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2559_c7_7d50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2559_c11_b19f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2559_c7_7d50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2559_c11_b19f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2559_c7_7d50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2559_c11_b19f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2559_c7_7d50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2559_c11_b19f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2559_c7_7d50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2559_c11_b19f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2559_c7_7d50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2559_c11_b19f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2562_c7_0028_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2562_c11_41cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_0028_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2562_c11_41cd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_0028_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2562_c11_41cd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2562_c7_0028_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2562_c11_41cd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_0028_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2562_c11_41cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_0028_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2562_c11_41cd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_0028_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2562_c11_41cd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2562_c7_0028_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2562_c11_41cd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2562_c7_0028_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2562_c11_41cd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2567_c7_ffae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2567_c11_8b37_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_ffae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2567_c11_8b37_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_ffae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2567_c11_8b37_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2567_c7_ffae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2567_c11_8b37_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_ffae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2567_c11_8b37_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_ffae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2567_c11_8b37_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_ffae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2567_c11_8b37_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2567_c7_ffae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2567_c11_8b37_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2567_c7_ffae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2567_c11_8b37_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2570_c7_430c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_af87_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_430c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_af87_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c7_430c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_af87_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2570_c7_430c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_af87_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2570_c7_430c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_af87_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_430c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_af87_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_430c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_af87_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2570_c7_430c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_af87_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2570_c7_430c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_af87_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_3e5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_0576_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_3e5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_0576_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_3e5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_0576_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_3e5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_0576_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2576_c7_3e5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_0576_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2576_c7_3e5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_0576_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_d6b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_a9fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_d6b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_a9fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_d6b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_a9fc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2583_c7_d6b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_a9fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1daf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_b971_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1daf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_b971_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2571_c3_e2b2_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2571_l2563_DUPLICATE_5443_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2564_c3_33c2_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2571_l2563_DUPLICATE_5443_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2562_l2559_l2555_l2552_l2546_l2570_l2567_DUPLICATE_a2d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2562_l2559_l2555_l2552_l2546_l2570_l2567_DUPLICATE_a2d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2562_l2559_l2555_l2552_l2546_l2570_l2567_DUPLICATE_a2d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2562_l2559_l2555_l2552_l2546_l2570_l2567_DUPLICATE_a2d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2562_l2559_l2555_l2552_l2546_l2570_l2567_DUPLICATE_a2d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2562_l2559_l2555_l2552_l2546_l2570_l2567_DUPLICATE_a2d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2562_l2559_l2555_l2552_l2546_l2570_l2567_DUPLICATE_a2d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2562_l2559_l2587_l2555_l2583_l2552_l2576_l2570_l2567_DUPLICATE_ca27_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2562_l2559_l2587_l2555_l2583_l2552_l2576_l2570_l2567_DUPLICATE_ca27_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2562_l2559_l2587_l2555_l2583_l2552_l2576_l2570_l2567_DUPLICATE_ca27_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2562_l2559_l2587_l2555_l2583_l2552_l2576_l2570_l2567_DUPLICATE_ca27_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2562_l2559_l2587_l2555_l2583_l2552_l2576_l2570_l2567_DUPLICATE_ca27_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2562_l2559_l2587_l2555_l2583_l2552_l2576_l2570_l2567_DUPLICATE_ca27_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_3e5a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2562_l2559_l2587_l2555_l2583_l2552_l2576_l2570_l2567_DUPLICATE_ca27_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_d6b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2562_l2559_l2587_l2555_l2583_l2552_l2576_l2570_l2567_DUPLICATE_ca27_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1daf_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2562_l2559_l2587_l2555_l2583_l2552_l2576_l2570_l2567_DUPLICATE_ca27_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2562_l2559_l2555_l2552_l2576_l2546_l2567_DUPLICATE_8221_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2562_l2559_l2555_l2552_l2576_l2546_l2567_DUPLICATE_8221_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2562_l2559_l2555_l2552_l2576_l2546_l2567_DUPLICATE_8221_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2562_l2559_l2555_l2552_l2576_l2546_l2567_DUPLICATE_8221_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2562_l2559_l2555_l2552_l2576_l2546_l2567_DUPLICATE_8221_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2562_l2559_l2555_l2552_l2576_l2546_l2567_DUPLICATE_8221_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_3e5a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2562_l2559_l2555_l2552_l2576_l2546_l2567_DUPLICATE_8221_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2562_l2559_l2555_l2552_l2570_l2567_DUPLICATE_1028_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2562_l2559_l2555_l2552_l2570_l2567_DUPLICATE_1028_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2562_l2559_l2555_l2552_l2570_l2567_DUPLICATE_1028_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2562_l2559_l2555_l2552_l2570_l2567_DUPLICATE_1028_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2562_l2559_l2555_l2552_l2570_l2567_DUPLICATE_1028_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2562_l2559_l2555_l2552_l2570_l2567_DUPLICATE_1028_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2562_l2559_l2587_l2555_l2583_l2552_l2546_l2570_l2567_DUPLICATE_4418_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2562_l2559_l2587_l2555_l2583_l2552_l2546_l2570_l2567_DUPLICATE_4418_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2562_l2559_l2587_l2555_l2583_l2552_l2546_l2570_l2567_DUPLICATE_4418_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2562_l2559_l2587_l2555_l2583_l2552_l2546_l2570_l2567_DUPLICATE_4418_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2562_l2559_l2587_l2555_l2583_l2552_l2546_l2570_l2567_DUPLICATE_4418_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2562_l2559_l2587_l2555_l2583_l2552_l2546_l2570_l2567_DUPLICATE_4418_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2562_l2559_l2587_l2555_l2583_l2552_l2546_l2570_l2567_DUPLICATE_4418_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_d6b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2562_l2559_l2587_l2555_l2583_l2552_l2546_l2570_l2567_DUPLICATE_4418_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1daf_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2562_l2559_l2587_l2555_l2583_l2552_l2546_l2570_l2567_DUPLICATE_4418_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2583_l2570_DUPLICATE_c103_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_d6b7_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2583_l2570_DUPLICATE_c103_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2562_l2559_l2555_l2583_l2552_l2546_l2570_l2567_DUPLICATE_03b1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2562_l2559_l2555_l2583_l2552_l2546_l2570_l2567_DUPLICATE_03b1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2562_l2559_l2555_l2583_l2552_l2546_l2570_l2567_DUPLICATE_03b1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2562_l2559_l2555_l2583_l2552_l2546_l2570_l2567_DUPLICATE_03b1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2562_l2559_l2555_l2583_l2552_l2546_l2570_l2567_DUPLICATE_03b1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2562_l2559_l2555_l2583_l2552_l2546_l2570_l2567_DUPLICATE_03b1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2562_l2559_l2555_l2583_l2552_l2546_l2570_l2567_DUPLICATE_03b1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2583_c7_d6b7_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2562_l2559_l2555_l2583_l2552_l2546_l2570_l2567_DUPLICATE_03b1_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2577_c12_c9cb_right := VAR_CONST_SR_4_uxn_opcodes_h_l2577_c36_a586_return_output;
     -- t8_MUX[uxn_opcodes_h_l2555_c7_6332] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2555_c7_6332_cond <= VAR_t8_MUX_uxn_opcodes_h_l2555_c7_6332_cond;
     t8_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue;
     t8_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2555_c7_6332_return_output := t8_MUX_uxn_opcodes_h_l2555_c7_6332_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2583_c7_d6b7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_d6b7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_d6b7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_d6b7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_d6b7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_d6b7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_d6b7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_d6b7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_d6b7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2587_c7_1daf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1daf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1daf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1daf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1daf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1daf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1daf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1daf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1daf_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2571_c3_e2b2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2571_c3_e2b2_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2571_c3_e2b2_left;
     BIN_OP_OR_uxn_opcodes_h_l2571_c3_e2b2_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2571_c3_e2b2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2571_c3_e2b2_return_output := BIN_OP_OR_uxn_opcodes_h_l2571_c3_e2b2_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2570_c7_430c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2570_c7_430c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2570_c7_430c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2570_c7_430c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2570_c7_430c_return_output;

     -- BIN_OP_SR[uxn_opcodes_h_l2577_c12_c2fa] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l2577_c12_c2fa_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l2577_c12_c2fa_left;
     BIN_OP_SR_uxn_opcodes_h_l2577_c12_c2fa_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l2577_c12_c2fa_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l2577_c12_c2fa_return_output := BIN_OP_SR_uxn_opcodes_h_l2577_c12_c2fa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2587_c7_1daf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1daf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1daf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1daf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1daf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1daf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1daf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1daf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1daf_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2564_c3_33c2] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2564_c3_33c2_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2564_c3_33c2_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2564_c3_33c2_return_output := CONST_SL_8_uxn_opcodes_h_l2564_c3_33c2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2576_c7_3e5a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_3e5a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_3e5a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_3e5a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_3e5a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_3e5a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_3e5a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_3e5a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_3e5a_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2574_c32_1216] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2574_c32_1216_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2574_c32_1216_left;
     BIN_OP_GT_uxn_opcodes_h_l2574_c32_1216_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2574_c32_1216_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2574_c32_1216_return_output := BIN_OP_GT_uxn_opcodes_h_l2574_c32_1216_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2546_c1_210f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_210f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_210f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_210f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_210f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_210f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_210f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_210f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_210f_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2585_c24_9987] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2585_c24_9987_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2585_c34_d4e4_return_output);

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2574_c32_923b_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2574_c32_1216_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2571_c3_e2b2_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2577_c12_c9cb_left := VAR_BIN_OP_SR_uxn_opcodes_h_l2577_c12_c2fa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2583_c7_d6b7_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2585_c24_9987_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2564_c3_33c2_return_output;
     VAR_printf_uxn_opcodes_h_l2547_c3_04d3_uxn_opcodes_h_l2547_c3_04d3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_210f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_d6b7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1daf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_3e5a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2570_c7_430c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_d6b7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1daf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_3e5a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_d6b7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2555_c7_6332_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2583_c7_d6b7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_d6b7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_d6b7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_d6b7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_d6b7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_d6b7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_d6b7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_d6b7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_d6b7_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2567_c7_ffae] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2567_c7_ffae_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2567_c7_ffae_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2583_c7_d6b7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_d6b7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_d6b7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_d6b7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_d6b7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_d6b7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_d6b7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_d6b7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_d6b7_return_output;

     -- printf_uxn_opcodes_h_l2547_c3_04d3[uxn_opcodes_h_l2547_c3_04d3] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2547_c3_04d3_uxn_opcodes_h_l2547_c3_04d3_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2547_c3_04d3_uxn_opcodes_h_l2547_c3_04d3_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_value_MUX[uxn_opcodes_h_l2583_c7_d6b7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2583_c7_d6b7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2583_c7_d6b7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2583_c7_d6b7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2583_c7_d6b7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2583_c7_d6b7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2583_c7_d6b7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2583_c7_d6b7_return_output := result_stack_value_MUX_uxn_opcodes_h_l2583_c7_d6b7_return_output;

     -- MUX[uxn_opcodes_h_l2574_c32_923b] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2574_c32_923b_cond <= VAR_MUX_uxn_opcodes_h_l2574_c32_923b_cond;
     MUX_uxn_opcodes_h_l2574_c32_923b_iftrue <= VAR_MUX_uxn_opcodes_h_l2574_c32_923b_iftrue;
     MUX_uxn_opcodes_h_l2574_c32_923b_iffalse <= VAR_MUX_uxn_opcodes_h_l2574_c32_923b_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2574_c32_923b_return_output := MUX_uxn_opcodes_h_l2574_c32_923b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2570_c7_430c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c7_430c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c7_430c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c7_430c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c7_430c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2570_c7_430c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2570_c7_430c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2570_c7_430c_cond;
     n16_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue;
     n16_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2570_c7_430c_return_output := n16_MUX_uxn_opcodes_h_l2570_c7_430c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2576_c7_3e5a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_3e5a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_3e5a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_3e5a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_3e5a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_3e5a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_3e5a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_3e5a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_3e5a_return_output;

     -- BIN_OP_SL[uxn_opcodes_h_l2577_c12_c9cb] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l2577_c12_c9cb_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l2577_c12_c9cb_left;
     BIN_OP_SL_uxn_opcodes_h_l2577_c12_c9cb_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l2577_c12_c9cb_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l2577_c12_c9cb_return_output := BIN_OP_SL_uxn_opcodes_h_l2577_c12_c9cb_return_output;

     -- t8_MUX[uxn_opcodes_h_l2552_c7_cbc9] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond <= VAR_t8_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond;
     t8_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue;
     t8_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output := t8_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l2576_c7_3e5a_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2577_c12_c9cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue := VAR_MUX_uxn_opcodes_h_l2574_c32_923b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2570_c7_430c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_3e5a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_d6b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c7_430c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_3e5a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_d6b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_3e5a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2576_c7_3e5a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2583_c7_d6b7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2576_c7_3e5a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_3e5a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_3e5a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_3e5a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_3e5a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_3e5a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_3e5a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_3e5a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_3e5a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2570_c7_430c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_430c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_430c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_430c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_430c_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2581_c24_3b55] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2581_c24_3b55_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_SL_uxn_opcodes_h_l2577_c12_c9cb_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2570_c7_430c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_430c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_430c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_430c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_430c_return_output;

     -- t8_MUX[uxn_opcodes_h_l2546_c2_c2a6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond <= VAR_t8_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond;
     t8_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue;
     t8_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output := t8_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2567_c7_ffae] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_ffae_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_ffae_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output;

     -- n16_MUX[uxn_opcodes_h_l2567_c7_ffae] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2567_c7_ffae_cond <= VAR_n16_MUX_uxn_opcodes_h_l2567_c7_ffae_cond;
     n16_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue;
     n16_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output := n16_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2576_c7_3e5a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2576_c7_3e5a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2576_c7_3e5a_cond;
     tmp16_MUX_uxn_opcodes_h_l2576_c7_3e5a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2576_c7_3e5a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2576_c7_3e5a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2576_c7_3e5a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2576_c7_3e5a_return_output := tmp16_MUX_uxn_opcodes_h_l2576_c7_3e5a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2576_c7_3e5a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_3e5a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_3e5a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_3e5a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_3e5a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_3e5a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_3e5a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_3e5a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_3e5a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2562_c7_0028] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2562_c7_0028_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2562_c7_0028_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2562_c7_0028_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2562_c7_0028_return_output;

     -- Submodule level 4
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2576_c7_3e5a_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2581_c24_3b55_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_3e5a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2562_c7_0028_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_3e5a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_430c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_430c_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2576_c7_3e5a_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2559_c7_7d50] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2559_c7_7d50_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2559_c7_7d50_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2567_c7_ffae] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_ffae_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_ffae_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output;

     -- n16_MUX[uxn_opcodes_h_l2562_c7_0028] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2562_c7_0028_cond <= VAR_n16_MUX_uxn_opcodes_h_l2562_c7_0028_cond;
     n16_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue;
     n16_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2562_c7_0028_return_output := n16_MUX_uxn_opcodes_h_l2562_c7_0028_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2570_c7_430c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2570_c7_430c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2570_c7_430c_cond;
     tmp16_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2570_c7_430c_return_output := tmp16_MUX_uxn_opcodes_h_l2570_c7_430c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2562_c7_0028] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_0028_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_0028_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_0028_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_0028_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2576_c7_3e5a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2576_c7_3e5a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2576_c7_3e5a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2576_c7_3e5a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2576_c7_3e5a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2576_c7_3e5a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2576_c7_3e5a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2576_c7_3e5a_return_output := result_stack_value_MUX_uxn_opcodes_h_l2576_c7_3e5a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2570_c7_430c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_430c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_430c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_430c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_430c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2567_c7_ffae] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_ffae_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_ffae_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2570_c7_430c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2570_c7_430c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2570_c7_430c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2570_c7_430c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2570_c7_430c_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2562_c7_0028_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_430c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_0028_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2570_c7_430c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2576_c7_3e5a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2570_c7_430c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2567_c7_ffae] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_ffae_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_ffae_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2555_c7_6332] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2555_c7_6332_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2555_c7_6332_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2555_c7_6332_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2555_c7_6332_return_output;

     -- n16_MUX[uxn_opcodes_h_l2559_c7_7d50] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2559_c7_7d50_cond <= VAR_n16_MUX_uxn_opcodes_h_l2559_c7_7d50_cond;
     n16_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue;
     n16_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output := n16_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2567_c7_ffae] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_ffae_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_ffae_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2562_c7_0028] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_0028_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_0028_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_0028_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_0028_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2567_c7_ffae] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2567_c7_ffae_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2567_c7_ffae_cond;
     tmp16_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output := tmp16_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2562_c7_0028] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_0028_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_0028_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_0028_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_0028_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2570_c7_430c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2570_c7_430c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2570_c7_430c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2570_c7_430c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2570_c7_430c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2570_c7_430c_return_output := result_stack_value_MUX_uxn_opcodes_h_l2570_c7_430c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2559_c7_7d50] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2559_c7_7d50_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2559_c7_7d50_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2555_c7_6332_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_0028_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_0028_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2570_c7_430c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2567_c7_ffae] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2567_c7_ffae_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2567_c7_ffae_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2567_c7_ffae_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2567_c7_ffae_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output := result_stack_value_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2559_c7_7d50] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2559_c7_7d50_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2559_c7_7d50_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2552_c7_cbc9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2555_c7_6332] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_6332_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_6332_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_6332_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_6332_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2562_c7_0028] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_0028_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_0028_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_0028_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_0028_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2562_c7_0028] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_0028_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_0028_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_0028_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_0028_return_output;

     -- n16_MUX[uxn_opcodes_h_l2555_c7_6332] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2555_c7_6332_cond <= VAR_n16_MUX_uxn_opcodes_h_l2555_c7_6332_cond;
     n16_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue;
     n16_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2555_c7_6332_return_output := n16_MUX_uxn_opcodes_h_l2555_c7_6332_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2559_c7_7d50] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2559_c7_7d50_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2559_c7_7d50_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2562_c7_0028] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2562_c7_0028_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2562_c7_0028_cond;
     tmp16_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2562_c7_0028_return_output := tmp16_MUX_uxn_opcodes_h_l2562_c7_0028_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2555_c7_6332_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_0028_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_6332_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_0028_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2567_c7_ffae_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2562_c7_0028_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2552_c7_cbc9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2546_c2_c2a6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output;

     -- n16_MUX[uxn_opcodes_h_l2552_c7_cbc9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond <= VAR_n16_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond;
     n16_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue;
     n16_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output := n16_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2559_c7_7d50] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2559_c7_7d50_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2559_c7_7d50_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2555_c7_6332] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_6332_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_6332_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_6332_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_6332_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2555_c7_6332] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_6332_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_6332_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_6332_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_6332_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2562_c7_0028] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2562_c7_0028_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2562_c7_0028_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2562_c7_0028_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2562_c7_0028_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2562_c7_0028_return_output := result_stack_value_MUX_uxn_opcodes_h_l2562_c7_0028_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2559_c7_7d50] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2559_c7_7d50_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2559_c7_7d50_cond;
     tmp16_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output := tmp16_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2559_c7_7d50] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2559_c7_7d50_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2559_c7_7d50_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_6332_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_6332_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2562_c7_0028_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2552_c7_cbc9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2546_c2_c2a6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2555_c7_6332] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_6332_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_6332_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_6332_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_6332_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2552_c7_cbc9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2559_c7_7d50] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2559_c7_7d50_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2559_c7_7d50_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2559_c7_7d50_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2559_c7_7d50_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output := result_stack_value_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output;

     -- n16_MUX[uxn_opcodes_h_l2546_c2_c2a6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond <= VAR_n16_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond;
     n16_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue;
     n16_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output := n16_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2555_c7_6332] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_6332_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_6332_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_6332_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_6332_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2555_c7_6332] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2555_c7_6332_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2555_c7_6332_cond;
     tmp16_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2555_c7_6332_return_output := tmp16_MUX_uxn_opcodes_h_l2555_c7_6332_return_output;

     -- Submodule level 9
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_6332_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_6332_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2559_c7_7d50_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2555_c7_6332_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2552_c7_cbc9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2546_c2_c2a6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2546_c2_c2a6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2555_c7_6332] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2555_c7_6332_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2555_c7_6332_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2555_c7_6332_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2555_c7_6332_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2555_c7_6332_return_output := result_stack_value_MUX_uxn_opcodes_h_l2555_c7_6332_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2552_c7_cbc9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond;
     tmp16_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output := tmp16_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2552_c7_cbc9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2555_c7_6332_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2546_c2_c2a6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond;
     tmp16_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output := tmp16_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2546_c2_c2a6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2546_c2_c2a6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2552_c7_cbc9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2552_c7_cbc9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2552_c7_cbc9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2552_c7_cbc9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output := result_stack_value_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output;

     -- Submodule level 11
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2552_c7_cbc9_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2546_c2_c2a6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2546_c2_c2a6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2546_c2_c2a6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2546_c2_c2a6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output := result_stack_value_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2592_l2541_DUPLICATE_7ded LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2592_l2541_DUPLICATE_7ded_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1ade(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2546_c2_c2a6_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2592_l2541_DUPLICATE_7ded_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2592_l2541_DUPLICATE_7ded_return_output;
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
