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
-- Submodules: 64
entity eor_0CLK_fd2391e7 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end eor_0CLK_fd2391e7;
architecture arch of eor_0CLK_fd2391e7 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1234_c6_e4b4]
signal BIN_OP_EQ_uxn_opcodes_h_l1234_c6_e4b4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1234_c6_e4b4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1234_c6_e4b4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1234_c1_1317]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1234_c1_1317_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1234_c1_1317_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1234_c1_1317_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1234_c1_1317_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1234_c2_3ffa]
signal t8_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1234_c2_3ffa]
signal n8_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1234_c2_3ffa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1234_c2_3ffa]
signal result_stack_value_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1234_c2_3ffa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1234_c2_3ffa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1234_c2_3ffa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1234_c2_3ffa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1234_c2_3ffa]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1235_c3_b582[uxn_opcodes_h_l1235_c3_b582]
signal printf_uxn_opcodes_h_l1235_c3_b582_uxn_opcodes_h_l1235_c3_b582_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1240_c11_6361]
signal BIN_OP_EQ_uxn_opcodes_h_l1240_c11_6361_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1240_c11_6361_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1240_c11_6361_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1240_c7_2754]
signal t8_MUX_uxn_opcodes_h_l1240_c7_2754_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1240_c7_2754_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1240_c7_2754]
signal n8_MUX_uxn_opcodes_h_l1240_c7_2754_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1240_c7_2754_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1240_c7_2754]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1240_c7_2754_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1240_c7_2754_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1240_c7_2754]
signal result_stack_value_MUX_uxn_opcodes_h_l1240_c7_2754_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1240_c7_2754_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1240_c7_2754]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_2754_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_2754_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1240_c7_2754]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_2754_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_2754_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1240_c7_2754]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_2754_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_2754_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1240_c7_2754]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_2754_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_2754_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1240_c7_2754]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1240_c7_2754_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1240_c7_2754_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1243_c11_99c8]
signal BIN_OP_EQ_uxn_opcodes_h_l1243_c11_99c8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1243_c11_99c8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1243_c11_99c8_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1243_c7_b95b]
signal t8_MUX_uxn_opcodes_h_l1243_c7_b95b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1243_c7_b95b]
signal n8_MUX_uxn_opcodes_h_l1243_c7_b95b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1243_c7_b95b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1243_c7_b95b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1243_c7_b95b]
signal result_stack_value_MUX_uxn_opcodes_h_l1243_c7_b95b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1243_c7_b95b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_b95b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1243_c7_b95b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_b95b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1243_c7_b95b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_b95b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1243_c7_b95b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_b95b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1243_c7_b95b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1243_c7_b95b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1247_c11_c2d6]
signal BIN_OP_EQ_uxn_opcodes_h_l1247_c11_c2d6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1247_c11_c2d6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1247_c11_c2d6_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1247_c7_7bff]
signal n8_MUX_uxn_opcodes_h_l1247_c7_7bff_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1247_c7_7bff_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1247_c7_7bff_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1247_c7_7bff]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1247_c7_7bff_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1247_c7_7bff_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1247_c7_7bff_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1247_c7_7bff]
signal result_stack_value_MUX_uxn_opcodes_h_l1247_c7_7bff_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1247_c7_7bff_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1247_c7_7bff_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1247_c7_7bff]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1247_c7_7bff_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1247_c7_7bff_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1247_c7_7bff_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1247_c7_7bff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1247_c7_7bff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1247_c7_7bff_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1247_c7_7bff_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1247_c7_7bff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1247_c7_7bff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1247_c7_7bff_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1247_c7_7bff_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1247_c7_7bff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1247_c7_7bff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1247_c7_7bff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1247_c7_7bff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1247_c7_7bff]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1247_c7_7bff_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1247_c7_7bff_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1247_c7_7bff_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1250_c11_46cf]
signal BIN_OP_EQ_uxn_opcodes_h_l1250_c11_46cf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1250_c11_46cf_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1250_c11_46cf_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1250_c7_6b5b]
signal n8_MUX_uxn_opcodes_h_l1250_c7_6b5b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1250_c7_6b5b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1250_c7_6b5b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1250_c7_6b5b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1250_c7_6b5b]
signal result_stack_value_MUX_uxn_opcodes_h_l1250_c7_6b5b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1250_c7_6b5b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1250_c7_6b5b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1250_c7_6b5b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_6b5b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_6b5b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_6b5b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1250_c7_6b5b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1250_c7_6b5b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_6b5b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_6b5b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_6b5b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1250_c7_6b5b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_6b5b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_6b5b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_6b5b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1250_c7_6b5b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_6b5b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_6b5b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_6b5b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1254_c32_c042]
signal BIN_OP_AND_uxn_opcodes_h_l1254_c32_c042_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1254_c32_c042_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1254_c32_c042_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1254_c32_9111]
signal BIN_OP_GT_uxn_opcodes_h_l1254_c32_9111_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1254_c32_9111_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1254_c32_9111_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1254_c32_879a]
signal MUX_uxn_opcodes_h_l1254_c32_879a_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1254_c32_879a_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1254_c32_879a_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1254_c32_879a_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1256_c11_cd40]
signal BIN_OP_EQ_uxn_opcodes_h_l1256_c11_cd40_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1256_c11_cd40_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1256_c11_cd40_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1256_c7_d9d6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_d9d6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_d9d6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_d9d6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_d9d6_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1256_c7_d9d6]
signal result_stack_value_MUX_uxn_opcodes_h_l1256_c7_d9d6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1256_c7_d9d6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1256_c7_d9d6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1256_c7_d9d6_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1256_c7_d9d6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_d9d6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_d9d6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_d9d6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_d9d6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1256_c7_d9d6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_d9d6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_d9d6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_d9d6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_d9d6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1256_c7_d9d6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_d9d6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_d9d6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_d9d6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_d9d6_return_output : unsigned(0 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l1260_c24_2b48]
signal BIN_OP_XOR_uxn_opcodes_h_l1260_c24_2b48_left : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1260_c24_2b48_right : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1260_c24_2b48_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1262_c11_5759]
signal BIN_OP_EQ_uxn_opcodes_h_l1262_c11_5759_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1262_c11_5759_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1262_c11_5759_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1262_c7_26fa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_26fa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_26fa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_26fa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_26fa_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1262_c7_26fa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_26fa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_26fa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_26fa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_26fa_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_287e( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1234_c6_e4b4
BIN_OP_EQ_uxn_opcodes_h_l1234_c6_e4b4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1234_c6_e4b4_left,
BIN_OP_EQ_uxn_opcodes_h_l1234_c6_e4b4_right,
BIN_OP_EQ_uxn_opcodes_h_l1234_c6_e4b4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1234_c1_1317
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1234_c1_1317 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1234_c1_1317_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1234_c1_1317_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1234_c1_1317_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1234_c1_1317_return_output);

-- t8_MUX_uxn_opcodes_h_l1234_c2_3ffa
t8_MUX_uxn_opcodes_h_l1234_c2_3ffa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond,
t8_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue,
t8_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse,
t8_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output);

-- n8_MUX_uxn_opcodes_h_l1234_c2_3ffa
n8_MUX_uxn_opcodes_h_l1234_c2_3ffa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond,
n8_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue,
n8_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse,
n8_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa
result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1234_c2_3ffa
result_stack_value_MUX_uxn_opcodes_h_l1234_c2_3ffa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond,
result_stack_value_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1234_c2_3ffa
result_is_stack_write_MUX_uxn_opcodes_h_l1234_c2_3ffa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa
result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c2_3ffa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c2_3ffa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1234_c2_3ffa
result_is_opc_done_MUX_uxn_opcodes_h_l1234_c2_3ffa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1234_c2_3ffa
result_is_stack_read_MUX_uxn_opcodes_h_l1234_c2_3ffa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output);

-- printf_uxn_opcodes_h_l1235_c3_b582_uxn_opcodes_h_l1235_c3_b582
printf_uxn_opcodes_h_l1235_c3_b582_uxn_opcodes_h_l1235_c3_b582 : entity work.printf_uxn_opcodes_h_l1235_c3_b582_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1235_c3_b582_uxn_opcodes_h_l1235_c3_b582_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1240_c11_6361
BIN_OP_EQ_uxn_opcodes_h_l1240_c11_6361 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1240_c11_6361_left,
BIN_OP_EQ_uxn_opcodes_h_l1240_c11_6361_right,
BIN_OP_EQ_uxn_opcodes_h_l1240_c11_6361_return_output);

-- t8_MUX_uxn_opcodes_h_l1240_c7_2754
t8_MUX_uxn_opcodes_h_l1240_c7_2754 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1240_c7_2754_cond,
t8_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue,
t8_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse,
t8_MUX_uxn_opcodes_h_l1240_c7_2754_return_output);

-- n8_MUX_uxn_opcodes_h_l1240_c7_2754
n8_MUX_uxn_opcodes_h_l1240_c7_2754 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1240_c7_2754_cond,
n8_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue,
n8_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse,
n8_MUX_uxn_opcodes_h_l1240_c7_2754_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1240_c7_2754
result_is_sp_shift_MUX_uxn_opcodes_h_l1240_c7_2754 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1240_c7_2754_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1240_c7_2754_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1240_c7_2754
result_stack_value_MUX_uxn_opcodes_h_l1240_c7_2754 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1240_c7_2754_cond,
result_stack_value_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1240_c7_2754_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_2754
result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_2754 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_2754_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_2754_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_2754
result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_2754 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_2754_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_2754_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_2754
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_2754 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_2754_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_2754_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_2754
result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_2754 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_2754_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_2754_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1240_c7_2754
result_is_stack_read_MUX_uxn_opcodes_h_l1240_c7_2754 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1240_c7_2754_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1240_c7_2754_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1243_c11_99c8
BIN_OP_EQ_uxn_opcodes_h_l1243_c11_99c8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1243_c11_99c8_left,
BIN_OP_EQ_uxn_opcodes_h_l1243_c11_99c8_right,
BIN_OP_EQ_uxn_opcodes_h_l1243_c11_99c8_return_output);

-- t8_MUX_uxn_opcodes_h_l1243_c7_b95b
t8_MUX_uxn_opcodes_h_l1243_c7_b95b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1243_c7_b95b_cond,
t8_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue,
t8_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse,
t8_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output);

-- n8_MUX_uxn_opcodes_h_l1243_c7_b95b
n8_MUX_uxn_opcodes_h_l1243_c7_b95b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1243_c7_b95b_cond,
n8_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue,
n8_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse,
n8_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1243_c7_b95b
result_is_sp_shift_MUX_uxn_opcodes_h_l1243_c7_b95b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1243_c7_b95b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1243_c7_b95b
result_stack_value_MUX_uxn_opcodes_h_l1243_c7_b95b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1243_c7_b95b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_b95b
result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_b95b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_b95b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_b95b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_b95b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_b95b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_b95b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_b95b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_b95b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_b95b
result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_b95b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_b95b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1243_c7_b95b
result_is_stack_read_MUX_uxn_opcodes_h_l1243_c7_b95b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1243_c7_b95b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1247_c11_c2d6
BIN_OP_EQ_uxn_opcodes_h_l1247_c11_c2d6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1247_c11_c2d6_left,
BIN_OP_EQ_uxn_opcodes_h_l1247_c11_c2d6_right,
BIN_OP_EQ_uxn_opcodes_h_l1247_c11_c2d6_return_output);

-- n8_MUX_uxn_opcodes_h_l1247_c7_7bff
n8_MUX_uxn_opcodes_h_l1247_c7_7bff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1247_c7_7bff_cond,
n8_MUX_uxn_opcodes_h_l1247_c7_7bff_iftrue,
n8_MUX_uxn_opcodes_h_l1247_c7_7bff_iffalse,
n8_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1247_c7_7bff
result_is_sp_shift_MUX_uxn_opcodes_h_l1247_c7_7bff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1247_c7_7bff_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1247_c7_7bff_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1247_c7_7bff_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1247_c7_7bff
result_stack_value_MUX_uxn_opcodes_h_l1247_c7_7bff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1247_c7_7bff_cond,
result_stack_value_MUX_uxn_opcodes_h_l1247_c7_7bff_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1247_c7_7bff_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1247_c7_7bff
result_is_stack_write_MUX_uxn_opcodes_h_l1247_c7_7bff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1247_c7_7bff_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1247_c7_7bff_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1247_c7_7bff_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1247_c7_7bff
result_sp_relative_shift_MUX_uxn_opcodes_h_l1247_c7_7bff : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1247_c7_7bff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1247_c7_7bff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1247_c7_7bff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1247_c7_7bff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1247_c7_7bff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1247_c7_7bff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1247_c7_7bff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1247_c7_7bff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1247_c7_7bff
result_is_opc_done_MUX_uxn_opcodes_h_l1247_c7_7bff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1247_c7_7bff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1247_c7_7bff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1247_c7_7bff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1247_c7_7bff
result_is_stack_read_MUX_uxn_opcodes_h_l1247_c7_7bff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1247_c7_7bff_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1247_c7_7bff_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1247_c7_7bff_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1250_c11_46cf
BIN_OP_EQ_uxn_opcodes_h_l1250_c11_46cf : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1250_c11_46cf_left,
BIN_OP_EQ_uxn_opcodes_h_l1250_c11_46cf_right,
BIN_OP_EQ_uxn_opcodes_h_l1250_c11_46cf_return_output);

-- n8_MUX_uxn_opcodes_h_l1250_c7_6b5b
n8_MUX_uxn_opcodes_h_l1250_c7_6b5b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1250_c7_6b5b_cond,
n8_MUX_uxn_opcodes_h_l1250_c7_6b5b_iftrue,
n8_MUX_uxn_opcodes_h_l1250_c7_6b5b_iffalse,
n8_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b
result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1250_c7_6b5b
result_stack_value_MUX_uxn_opcodes_h_l1250_c7_6b5b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1250_c7_6b5b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1250_c7_6b5b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1250_c7_6b5b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_6b5b
result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_6b5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_6b5b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_6b5b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_6b5b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_6b5b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_6b5b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_6b5b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_6b5b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_6b5b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_6b5b
result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_6b5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_6b5b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_6b5b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_6b5b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_6b5b
result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_6b5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_6b5b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_6b5b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_6b5b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1254_c32_c042
BIN_OP_AND_uxn_opcodes_h_l1254_c32_c042 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1254_c32_c042_left,
BIN_OP_AND_uxn_opcodes_h_l1254_c32_c042_right,
BIN_OP_AND_uxn_opcodes_h_l1254_c32_c042_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1254_c32_9111
BIN_OP_GT_uxn_opcodes_h_l1254_c32_9111 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1254_c32_9111_left,
BIN_OP_GT_uxn_opcodes_h_l1254_c32_9111_right,
BIN_OP_GT_uxn_opcodes_h_l1254_c32_9111_return_output);

-- MUX_uxn_opcodes_h_l1254_c32_879a
MUX_uxn_opcodes_h_l1254_c32_879a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1254_c32_879a_cond,
MUX_uxn_opcodes_h_l1254_c32_879a_iftrue,
MUX_uxn_opcodes_h_l1254_c32_879a_iffalse,
MUX_uxn_opcodes_h_l1254_c32_879a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1256_c11_cd40
BIN_OP_EQ_uxn_opcodes_h_l1256_c11_cd40 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1256_c11_cd40_left,
BIN_OP_EQ_uxn_opcodes_h_l1256_c11_cd40_right,
BIN_OP_EQ_uxn_opcodes_h_l1256_c11_cd40_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_d9d6
result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_d9d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_d9d6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_d9d6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_d9d6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_d9d6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1256_c7_d9d6
result_stack_value_MUX_uxn_opcodes_h_l1256_c7_d9d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1256_c7_d9d6_cond,
result_stack_value_MUX_uxn_opcodes_h_l1256_c7_d9d6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1256_c7_d9d6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1256_c7_d9d6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_d9d6
result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_d9d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_d9d6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_d9d6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_d9d6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_d9d6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_d9d6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_d9d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_d9d6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_d9d6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_d9d6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_d9d6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_d9d6
result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_d9d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_d9d6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_d9d6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_d9d6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_d9d6_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l1260_c24_2b48
BIN_OP_XOR_uxn_opcodes_h_l1260_c24_2b48 : entity work.BIN_OP_XOR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l1260_c24_2b48_left,
BIN_OP_XOR_uxn_opcodes_h_l1260_c24_2b48_right,
BIN_OP_XOR_uxn_opcodes_h_l1260_c24_2b48_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1262_c11_5759
BIN_OP_EQ_uxn_opcodes_h_l1262_c11_5759 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1262_c11_5759_left,
BIN_OP_EQ_uxn_opcodes_h_l1262_c11_5759_right,
BIN_OP_EQ_uxn_opcodes_h_l1262_c11_5759_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_26fa
result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_26fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_26fa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_26fa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_26fa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_26fa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_26fa
result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_26fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_26fa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_26fa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_26fa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_26fa_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1234_c6_e4b4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1234_c1_1317_return_output,
 t8_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output,
 n8_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1240_c11_6361_return_output,
 t8_MUX_uxn_opcodes_h_l1240_c7_2754_return_output,
 n8_MUX_uxn_opcodes_h_l1240_c7_2754_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1240_c7_2754_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1240_c7_2754_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_2754_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_2754_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_2754_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_2754_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1240_c7_2754_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1243_c11_99c8_return_output,
 t8_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output,
 n8_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1247_c11_c2d6_return_output,
 n8_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1250_c11_46cf_return_output,
 n8_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1254_c32_c042_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1254_c32_9111_return_output,
 MUX_uxn_opcodes_h_l1254_c32_879a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1256_c11_cd40_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_d9d6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1256_c7_d9d6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_d9d6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_d9d6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_d9d6_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l1260_c24_2b48_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1262_c11_5759_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_26fa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_26fa_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1234_c6_e4b4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1234_c6_e4b4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1234_c6_e4b4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1234_c1_1317_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1234_c1_1317_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1234_c1_1317_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1234_c1_1317_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1240_c7_2754_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1240_c7_2754_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1240_c7_2754_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1240_c7_2754_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_2754_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_2754_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1237_c3_203b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_2754_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_2754_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1240_c7_2754_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1235_c3_b582_uxn_opcodes_h_l1235_c3_b582_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1240_c11_6361_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1240_c11_6361_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1240_c11_6361_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1240_c7_2754_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1240_c7_2754_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1240_c7_2754_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1240_c7_2754_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_2754_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_2754_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1241_c3_0480 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_2754_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_2754_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1240_c7_2754_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1243_c11_99c8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1243_c11_99c8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1243_c11_99c8_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1243_c7_b95b_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1243_c7_b95b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1243_c7_b95b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1243_c7_b95b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_b95b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_b95b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1245_c3_ae54 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_b95b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_b95b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1243_c7_b95b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c11_c2d6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c11_c2d6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c11_c2d6_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1247_c7_7bff_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1247_c7_7bff_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1247_c7_7bff_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1247_c7_7bff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1247_c7_7bff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1247_c7_7bff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1247_c7_7bff_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1247_c7_7bff_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1247_c7_7bff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1247_c7_7bff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1247_c7_7bff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1247_c7_7bff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1247_c7_7bff_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1247_c7_7bff_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1247_c7_7bff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1247_c7_7bff_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1248_c3_0adb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1247_c7_7bff_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1247_c7_7bff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1247_c7_7bff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1247_c7_7bff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1247_c7_7bff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1247_c7_7bff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1247_c7_7bff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1247_c7_7bff_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1250_c11_46cf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1250_c11_46cf_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1250_c11_46cf_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1250_c7_6b5b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1250_c7_6b5b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1250_c7_6b5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_d9d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1250_c7_6b5b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1250_c7_6b5b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1256_c7_d9d6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1250_c7_6b5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_6b5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_6b5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_d9d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_6b5b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_6b5b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_6b5b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_d9d6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_6b5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_6b5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_6b5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_d9d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_6b5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_6b5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_6b5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_6b5b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1254_c32_879a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1254_c32_879a_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1254_c32_879a_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1254_c32_c042_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1254_c32_c042_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1254_c32_c042_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1254_c32_9111_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1254_c32_9111_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1254_c32_9111_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1254_c32_879a_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1256_c11_cd40_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1256_c11_cd40_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1256_c11_cd40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_d9d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_d9d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_d9d6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1256_c7_d9d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1256_c7_d9d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1256_c7_d9d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_d9d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_d9d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_26fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_d9d6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_d9d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1259_c3_1384 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_d9d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_d9d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_d9d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_d9d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_26fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_d9d6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1260_c24_2b48_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1260_c24_2b48_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1260_c24_2b48_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_5759_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_5759_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_5759_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_26fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_26fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_26fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_26fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_26fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_26fa_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1247_l1243_l1240_l1234_l1256_DUPLICATE_7be7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1250_l1247_l1243_l1240_l1234_l1256_DUPLICATE_8e84_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1250_l1247_l1243_l1240_l1234_l1262_DUPLICATE_73ca_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1250_l1247_l1243_l1240_l1234_DUPLICATE_7c12_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1250_l1247_l1243_l1240_l1262_l1256_DUPLICATE_7dc7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1247_l1240_l1250_l1243_DUPLICATE_d74b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1250_l1256_DUPLICATE_fb80_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1230_l1267_DUPLICATE_41a4_return_output : opcode_result_t;
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
     VAR_BIN_OP_AND_uxn_opcodes_h_l1254_c32_c042_right := to_unsigned(128, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1234_c1_1317_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1243_c11_99c8_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l1254_c32_879a_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1241_c3_0480 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1241_c3_0480;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_26fa_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1237_c3_203b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1237_c3_203b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1245_c3_ae54 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1245_c3_ae54;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_5759_right := to_unsigned(6, 3);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1254_c32_9111_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1259_c3_1384 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_d9d6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1259_c3_1384;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_d9d6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1234_c6_e4b4_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1256_c11_cd40_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1240_c11_6361_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1250_c11_46cf_right := to_unsigned(4, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_6b5b_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_d9d6_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_26fa_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c11_c2d6_right := to_unsigned(3, 2);
     VAR_MUX_uxn_opcodes_h_l1254_c32_879a_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1248_c3_0adb := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1247_c7_7bff_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1248_c3_0adb;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1234_c1_1317_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1254_c32_c042_left := VAR_ins;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1260_c24_2b48_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1247_c7_7bff_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1250_c7_6b5b_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1234_c6_e4b4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1240_c11_6361_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1243_c11_99c8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c11_c2d6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1250_c11_46cf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1256_c11_cd40_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_5759_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1250_c7_6b5b_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1260_c24_2b48_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1250_l1247_l1243_l1240_l1262_l1256_DUPLICATE_7dc7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1250_l1247_l1243_l1240_l1262_l1256_DUPLICATE_7dc7_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1234_c6_e4b4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1234_c6_e4b4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1234_c6_e4b4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1234_c6_e4b4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1234_c6_e4b4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1234_c6_e4b4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1234_c6_e4b4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1240_c11_6361] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1240_c11_6361_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1240_c11_6361_left;
     BIN_OP_EQ_uxn_opcodes_h_l1240_c11_6361_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1240_c11_6361_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1240_c11_6361_return_output := BIN_OP_EQ_uxn_opcodes_h_l1240_c11_6361_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1254_c32_c042] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1254_c32_c042_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1254_c32_c042_left;
     BIN_OP_AND_uxn_opcodes_h_l1254_c32_c042_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1254_c32_c042_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1254_c32_c042_return_output := BIN_OP_AND_uxn_opcodes_h_l1254_c32_c042_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1262_c11_5759] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1262_c11_5759_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_5759_left;
     BIN_OP_EQ_uxn_opcodes_h_l1262_c11_5759_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_5759_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_5759_return_output := BIN_OP_EQ_uxn_opcodes_h_l1262_c11_5759_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1250_l1247_l1243_l1240_l1234_l1262_DUPLICATE_73ca LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1250_l1247_l1243_l1240_l1234_l1262_DUPLICATE_73ca_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1256_c11_cd40] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1256_c11_cd40_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1256_c11_cd40_left;
     BIN_OP_EQ_uxn_opcodes_h_l1256_c11_cd40_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1256_c11_cd40_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1256_c11_cd40_return_output := BIN_OP_EQ_uxn_opcodes_h_l1256_c11_cd40_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1247_c11_c2d6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1247_c11_c2d6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c11_c2d6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1247_c11_c2d6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c11_c2d6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c11_c2d6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1247_c11_c2d6_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1250_l1247_l1243_l1240_l1234_DUPLICATE_7c12 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1250_l1247_l1243_l1240_l1234_DUPLICATE_7c12_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1243_c11_99c8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1243_c11_99c8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1243_c11_99c8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1243_c11_99c8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1243_c11_99c8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1243_c11_99c8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1243_c11_99c8_return_output;

     -- BIN_OP_XOR[uxn_opcodes_h_l1260_c24_2b48] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l1260_c24_2b48_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1260_c24_2b48_left;
     BIN_OP_XOR_uxn_opcodes_h_l1260_c24_2b48_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1260_c24_2b48_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1260_c24_2b48_return_output := BIN_OP_XOR_uxn_opcodes_h_l1260_c24_2b48_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1250_c11_46cf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1250_c11_46cf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1250_c11_46cf_left;
     BIN_OP_EQ_uxn_opcodes_h_l1250_c11_46cf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1250_c11_46cf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1250_c11_46cf_return_output := BIN_OP_EQ_uxn_opcodes_h_l1250_c11_46cf_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1247_l1243_l1240_l1234_l1256_DUPLICATE_7be7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1247_l1243_l1240_l1234_l1256_DUPLICATE_7be7_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1250_l1256_DUPLICATE_fb80 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1250_l1256_DUPLICATE_fb80_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1247_l1240_l1250_l1243_DUPLICATE_d74b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1247_l1240_l1250_l1243_DUPLICATE_d74b_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1250_l1247_l1243_l1240_l1234_l1256_DUPLICATE_8e84 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1250_l1247_l1243_l1240_l1234_l1256_DUPLICATE_8e84_return_output := result.stack_value;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1254_c32_9111_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1254_c32_c042_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1234_c1_1317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1234_c6_e4b4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1234_c6_e4b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1234_c6_e4b4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1234_c6_e4b4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1234_c6_e4b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1234_c6_e4b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1234_c6_e4b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1234_c6_e4b4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1234_c6_e4b4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1234_c6_e4b4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1240_c7_2754_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1240_c11_6361_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_2754_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1240_c11_6361_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1240_c7_2754_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1240_c11_6361_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1240_c7_2754_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1240_c11_6361_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_2754_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1240_c11_6361_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_2754_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1240_c11_6361_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_2754_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1240_c11_6361_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1240_c7_2754_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1240_c11_6361_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1240_c7_2754_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1240_c11_6361_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1243_c7_b95b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1243_c11_99c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_b95b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1243_c11_99c8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1243_c7_b95b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1243_c11_99c8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1243_c7_b95b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1243_c11_99c8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_b95b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1243_c11_99c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_b95b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1243_c11_99c8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_b95b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1243_c11_99c8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1243_c7_b95b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1243_c11_99c8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1243_c7_b95b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1243_c11_99c8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1247_c7_7bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c11_c2d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1247_c7_7bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c11_c2d6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1247_c7_7bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c11_c2d6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1247_c7_7bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c11_c2d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1247_c7_7bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c11_c2d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1247_c7_7bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c11_c2d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1247_c7_7bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c11_c2d6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1247_c7_7bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c11_c2d6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1250_c7_6b5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1250_c11_46cf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_6b5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1250_c11_46cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1250_c11_46cf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_6b5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1250_c11_46cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_6b5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1250_c11_46cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1250_c11_46cf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_6b5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1250_c11_46cf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1250_c7_6b5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1250_c11_46cf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_d9d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1256_c11_cd40_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_d9d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1256_c11_cd40_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_d9d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1256_c11_cd40_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_d9d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1256_c11_cd40_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1256_c7_d9d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1256_c11_cd40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_26fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_5759_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_26fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_5759_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1256_c7_d9d6_iftrue := VAR_BIN_OP_XOR_uxn_opcodes_h_l1260_c24_2b48_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1250_l1247_l1243_l1240_l1234_DUPLICATE_7c12_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1250_l1247_l1243_l1240_l1234_DUPLICATE_7c12_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1250_l1247_l1243_l1240_l1234_DUPLICATE_7c12_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1247_c7_7bff_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1250_l1247_l1243_l1240_l1234_DUPLICATE_7c12_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1250_l1247_l1243_l1240_l1234_DUPLICATE_7c12_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1250_l1247_l1243_l1240_l1262_l1256_DUPLICATE_7dc7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1250_l1247_l1243_l1240_l1262_l1256_DUPLICATE_7dc7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1247_c7_7bff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1250_l1247_l1243_l1240_l1262_l1256_DUPLICATE_7dc7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_6b5b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1250_l1247_l1243_l1240_l1262_l1256_DUPLICATE_7dc7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_d9d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1250_l1247_l1243_l1240_l1262_l1256_DUPLICATE_7dc7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_26fa_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1250_l1247_l1243_l1240_l1262_l1256_DUPLICATE_7dc7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1247_l1243_l1240_l1234_l1256_DUPLICATE_7be7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1247_l1243_l1240_l1234_l1256_DUPLICATE_7be7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1247_l1243_l1240_l1234_l1256_DUPLICATE_7be7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1247_c7_7bff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1247_l1243_l1240_l1234_l1256_DUPLICATE_7be7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_d9d6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1247_l1243_l1240_l1234_l1256_DUPLICATE_7be7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1247_l1240_l1250_l1243_DUPLICATE_d74b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1247_l1240_l1250_l1243_DUPLICATE_d74b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1247_c7_7bff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1247_l1240_l1250_l1243_DUPLICATE_d74b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_6b5b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1247_l1240_l1250_l1243_DUPLICATE_d74b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1250_l1247_l1243_l1240_l1234_l1262_DUPLICATE_73ca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1250_l1247_l1243_l1240_l1234_l1262_DUPLICATE_73ca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1250_l1247_l1243_l1240_l1234_l1262_DUPLICATE_73ca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1247_c7_7bff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1250_l1247_l1243_l1240_l1234_l1262_DUPLICATE_73ca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_6b5b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1250_l1247_l1243_l1240_l1234_l1262_DUPLICATE_73ca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_26fa_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1250_l1247_l1243_l1240_l1234_l1262_DUPLICATE_73ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_6b5b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1250_l1256_DUPLICATE_fb80_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_d9d6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1250_l1256_DUPLICATE_fb80_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1250_l1247_l1243_l1240_l1234_l1256_DUPLICATE_8e84_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1250_l1247_l1243_l1240_l1234_l1256_DUPLICATE_8e84_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1250_l1247_l1243_l1240_l1234_l1256_DUPLICATE_8e84_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1247_c7_7bff_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1250_l1247_l1243_l1240_l1234_l1256_DUPLICATE_8e84_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1250_c7_6b5b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1250_l1247_l1243_l1240_l1234_l1256_DUPLICATE_8e84_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1256_c7_d9d6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1250_l1247_l1243_l1240_l1234_l1256_DUPLICATE_8e84_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1256_c7_d9d6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_d9d6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_d9d6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_d9d6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_d9d6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_d9d6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_d9d6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_d9d6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_d9d6_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1250_c7_6b5b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_6b5b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_6b5b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_6b5b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_6b5b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_6b5b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_6b5b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output;

     -- n8_MUX[uxn_opcodes_h_l1250_c7_6b5b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1250_c7_6b5b_cond <= VAR_n8_MUX_uxn_opcodes_h_l1250_c7_6b5b_cond;
     n8_MUX_uxn_opcodes_h_l1250_c7_6b5b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1250_c7_6b5b_iftrue;
     n8_MUX_uxn_opcodes_h_l1250_c7_6b5b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1250_c7_6b5b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output := n8_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1254_c32_9111] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1254_c32_9111_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1254_c32_9111_left;
     BIN_OP_GT_uxn_opcodes_h_l1254_c32_9111_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1254_c32_9111_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1254_c32_9111_return_output := BIN_OP_GT_uxn_opcodes_h_l1254_c32_9111_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1256_c7_d9d6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1256_c7_d9d6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1256_c7_d9d6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1256_c7_d9d6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1256_c7_d9d6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1256_c7_d9d6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1256_c7_d9d6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1256_c7_d9d6_return_output := result_stack_value_MUX_uxn_opcodes_h_l1256_c7_d9d6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1262_c7_26fa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_26fa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_26fa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_26fa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_26fa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_26fa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_26fa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_26fa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_26fa_return_output;

     -- t8_MUX[uxn_opcodes_h_l1243_c7_b95b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1243_c7_b95b_cond <= VAR_t8_MUX_uxn_opcodes_h_l1243_c7_b95b_cond;
     t8_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue;
     t8_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output := t8_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1234_c1_1317] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1234_c1_1317_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1234_c1_1317_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1234_c1_1317_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1234_c1_1317_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1234_c1_1317_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1234_c1_1317_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1234_c1_1317_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1234_c1_1317_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1256_c7_d9d6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_d9d6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_d9d6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_d9d6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_d9d6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_d9d6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_d9d6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_d9d6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_d9d6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1262_c7_26fa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_26fa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_26fa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_26fa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_26fa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_26fa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_26fa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_26fa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_26fa_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1254_c32_879a_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1254_c32_9111_return_output;
     VAR_printf_uxn_opcodes_h_l1235_c3_b582_uxn_opcodes_h_l1235_c3_b582_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1234_c1_1317_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1247_c7_7bff_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_d9d6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_26fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_d9d6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1247_c7_7bff_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_d9d6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_26fa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_6b5b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_d9d6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1250_c7_6b5b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1256_c7_d9d6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1256_c7_d9d6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_d9d6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_d9d6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_d9d6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_d9d6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_d9d6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_d9d6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_d9d6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_d9d6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1256_c7_d9d6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_d9d6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_d9d6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_d9d6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_d9d6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_d9d6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_d9d6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_d9d6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_d9d6_return_output;

     -- MUX[uxn_opcodes_h_l1254_c32_879a] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1254_c32_879a_cond <= VAR_MUX_uxn_opcodes_h_l1254_c32_879a_cond;
     MUX_uxn_opcodes_h_l1254_c32_879a_iftrue <= VAR_MUX_uxn_opcodes_h_l1254_c32_879a_iftrue;
     MUX_uxn_opcodes_h_l1254_c32_879a_iffalse <= VAR_MUX_uxn_opcodes_h_l1254_c32_879a_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1254_c32_879a_return_output := MUX_uxn_opcodes_h_l1254_c32_879a_return_output;

     -- printf_uxn_opcodes_h_l1235_c3_b582[uxn_opcodes_h_l1235_c3_b582] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1235_c3_b582_uxn_opcodes_h_l1235_c3_b582_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1235_c3_b582_uxn_opcodes_h_l1235_c3_b582_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n8_MUX[uxn_opcodes_h_l1247_c7_7bff] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1247_c7_7bff_cond <= VAR_n8_MUX_uxn_opcodes_h_l1247_c7_7bff_cond;
     n8_MUX_uxn_opcodes_h_l1247_c7_7bff_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1247_c7_7bff_iftrue;
     n8_MUX_uxn_opcodes_h_l1247_c7_7bff_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1247_c7_7bff_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output := n8_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1247_c7_7bff] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1247_c7_7bff_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1247_c7_7bff_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1247_c7_7bff_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1247_c7_7bff_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1247_c7_7bff_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1247_c7_7bff_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output;

     -- t8_MUX[uxn_opcodes_h_l1240_c7_2754] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1240_c7_2754_cond <= VAR_t8_MUX_uxn_opcodes_h_l1240_c7_2754_cond;
     t8_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue;
     t8_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1240_c7_2754_return_output := t8_MUX_uxn_opcodes_h_l1240_c7_2754_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1250_c7_6b5b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_6b5b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_6b5b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_6b5b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_6b5b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_6b5b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_6b5b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1250_c7_6b5b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1250_c7_6b5b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1250_c7_6b5b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1250_c7_6b5b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1250_c7_6b5b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1250_c7_6b5b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1250_c7_6b5b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1250_c7_6b5b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b_iftrue := VAR_MUX_uxn_opcodes_h_l1254_c32_879a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_6b5b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_d9d6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1247_c7_7bff_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_6b5b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_d9d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1247_c7_7bff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1247_c7_7bff_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1240_c7_2754_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1250_c7_6b5b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_6b5b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_6b5b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_6b5b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_6b5b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_6b5b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_6b5b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1247_c7_7bff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1247_c7_7bff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1247_c7_7bff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1247_c7_7bff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1247_c7_7bff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1247_c7_7bff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1247_c7_7bff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1243_c7_b95b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1243_c7_b95b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1243_c7_b95b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1247_c7_7bff] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1247_c7_7bff_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1247_c7_7bff_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1247_c7_7bff_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1247_c7_7bff_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1247_c7_7bff_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1247_c7_7bff_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output := result_stack_value_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1250_c7_6b5b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output;

     -- t8_MUX[uxn_opcodes_h_l1234_c2_3ffa] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond <= VAR_t8_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond;
     t8_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue;
     t8_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output := t8_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output;

     -- n8_MUX[uxn_opcodes_h_l1243_c7_b95b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1243_c7_b95b_cond <= VAR_n8_MUX_uxn_opcodes_h_l1243_c7_b95b_cond;
     n8_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue;
     n8_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output := n8_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1247_c7_7bff] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1247_c7_7bff_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1247_c7_7bff_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1247_c7_7bff_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1247_c7_7bff_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1247_c7_7bff_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1247_c7_7bff_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1250_c7_6b5b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_6b5b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_6b5b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_6b5b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_6b5b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_6b5b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_6b5b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1247_c7_7bff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1247_c7_7bff_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1247_c7_7bff_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_6b5b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output;
     -- n8_MUX[uxn_opcodes_h_l1240_c7_2754] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1240_c7_2754_cond <= VAR_n8_MUX_uxn_opcodes_h_l1240_c7_2754_cond;
     n8_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue;
     n8_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1240_c7_2754_return_output := n8_MUX_uxn_opcodes_h_l1240_c7_2754_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1247_c7_7bff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1247_c7_7bff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1247_c7_7bff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1247_c7_7bff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1247_c7_7bff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1247_c7_7bff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1247_c7_7bff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1240_c7_2754] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1240_c7_2754_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1240_c7_2754_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1240_c7_2754_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1240_c7_2754_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1243_c7_b95b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1243_c7_b95b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1243_c7_b95b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1247_c7_7bff] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1247_c7_7bff_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1247_c7_7bff_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1247_c7_7bff_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1247_c7_7bff_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1247_c7_7bff_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1247_c7_7bff_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1247_c7_7bff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1247_c7_7bff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1247_c7_7bff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1247_c7_7bff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1247_c7_7bff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1247_c7_7bff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1247_c7_7bff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1243_c7_b95b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1243_c7_b95b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1243_c7_b95b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1243_c7_b95b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_b95b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_b95b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1240_c7_2754_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1240_c7_2754_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1247_c7_7bff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1243_c7_b95b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_b95b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_b95b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1234_c2_3ffa] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output;

     -- n8_MUX[uxn_opcodes_h_l1234_c2_3ffa] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond <= VAR_n8_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond;
     n8_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue;
     n8_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output := n8_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1240_c7_2754] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1240_c7_2754_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1240_c7_2754_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1240_c7_2754_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1240_c7_2754_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1240_c7_2754] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_2754_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_2754_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_2754_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_2754_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1240_c7_2754] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1240_c7_2754_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1240_c7_2754_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1240_c7_2754_return_output := result_stack_value_MUX_uxn_opcodes_h_l1240_c7_2754_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1243_c7_b95b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_b95b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_b95b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1243_c7_b95b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_b95b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_b95b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_b95b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_b95b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1240_c7_2754_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_b95b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_2754_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1240_c7_2754_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1234_c2_3ffa] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output := result_stack_value_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1234_c2_3ffa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1240_c7_2754] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_2754_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_2754_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_2754_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_2754_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1240_c7_2754] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_2754_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_2754_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_2754_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_2754_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1240_c7_2754] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_2754_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_2754_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_2754_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_2754_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_2754_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_2754_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1234_c2_3ffa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_2754_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_2754_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_2754_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1234_c2_3ffa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1234_c2_3ffa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1234_c2_3ffa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1230_l1267_DUPLICATE_41a4 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1230_l1267_DUPLICATE_41a4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_287e(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1234_c2_3ffa_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1230_l1267_DUPLICATE_41a4_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1230_l1267_DUPLICATE_41a4_return_output;
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
