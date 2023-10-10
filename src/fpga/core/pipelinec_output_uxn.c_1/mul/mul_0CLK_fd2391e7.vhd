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
entity mul_0CLK_fd2391e7 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end mul_0CLK_fd2391e7;
architecture arch of mul_0CLK_fd2391e7 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2223_c6_5a07]
signal BIN_OP_EQ_uxn_opcodes_h_l2223_c6_5a07_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2223_c6_5a07_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2223_c6_5a07_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2223_c1_f11a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2223_c1_f11a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2223_c1_f11a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2223_c1_f11a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2223_c1_f11a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2223_c2_cfe7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2223_c2_cfe7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2223_c2_cfe7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2223_c2_cfe7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2223_c2_cfe7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2223_c2_cfe7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2223_c2_cfe7]
signal result_stack_value_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2223_c2_cfe7]
signal t8_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2223_c2_cfe7]
signal n8_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l2224_c3_2743[uxn_opcodes_h_l2224_c3_2743]
signal printf_uxn_opcodes_h_l2224_c3_2743_uxn_opcodes_h_l2224_c3_2743_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2229_c11_c9d1]
signal BIN_OP_EQ_uxn_opcodes_h_l2229_c11_c9d1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2229_c11_c9d1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2229_c11_c9d1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2229_c7_e54a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_e54a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2229_c7_e54a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2229_c7_e54a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2229_c7_e54a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_e54a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2229_c7_e54a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_e54a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2229_c7_e54a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_e54a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2229_c7_e54a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_e54a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2229_c7_e54a]
signal result_stack_value_MUX_uxn_opcodes_h_l2229_c7_e54a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2229_c7_e54a]
signal t8_MUX_uxn_opcodes_h_l2229_c7_e54a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2229_c7_e54a]
signal n8_MUX_uxn_opcodes_h_l2229_c7_e54a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2232_c11_3275]
signal BIN_OP_EQ_uxn_opcodes_h_l2232_c11_3275_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2232_c11_3275_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2232_c11_3275_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2232_c7_6027]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_6027_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_6027_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2232_c7_6027]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2232_c7_6027_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2232_c7_6027_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2232_c7_6027]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_6027_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_6027_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2232_c7_6027]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_6027_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_6027_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2232_c7_6027]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_6027_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_6027_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2232_c7_6027]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_6027_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_6027_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2232_c7_6027]
signal result_stack_value_MUX_uxn_opcodes_h_l2232_c7_6027_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2232_c7_6027_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2232_c7_6027]
signal t8_MUX_uxn_opcodes_h_l2232_c7_6027_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2232_c7_6027_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2232_c7_6027]
signal n8_MUX_uxn_opcodes_h_l2232_c7_6027_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2232_c7_6027_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2236_c11_490d]
signal BIN_OP_EQ_uxn_opcodes_h_l2236_c11_490d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2236_c11_490d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2236_c11_490d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2236_c7_c5a2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2236_c7_c5a2]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2236_c7_c5a2_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2236_c7_c5a2_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2236_c7_c5a2_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2236_c7_c5a2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2236_c7_c5a2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_c5a2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_c5a2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_c5a2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2236_c7_c5a2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c7_c5a2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c7_c5a2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c7_c5a2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2236_c7_c5a2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_c5a2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_c5a2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_c5a2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2236_c7_c5a2]
signal result_stack_value_MUX_uxn_opcodes_h_l2236_c7_c5a2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2236_c7_c5a2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2236_c7_c5a2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2236_c7_c5a2]
signal n8_MUX_uxn_opcodes_h_l2236_c7_c5a2_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2236_c7_c5a2_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2236_c7_c5a2_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2239_c11_fa14]
signal BIN_OP_EQ_uxn_opcodes_h_l2239_c11_fa14_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2239_c11_fa14_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2239_c11_fa14_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2239_c7_de7b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_de7b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_de7b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_de7b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2239_c7_de7b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2239_c7_de7b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2239_c7_de7b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2239_c7_de7b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2239_c7_de7b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_de7b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_de7b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_de7b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2239_c7_de7b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_de7b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_de7b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_de7b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2239_c7_de7b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_de7b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_de7b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_de7b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2239_c7_de7b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_de7b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_de7b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_de7b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2239_c7_de7b]
signal result_stack_value_MUX_uxn_opcodes_h_l2239_c7_de7b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2239_c7_de7b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2239_c7_de7b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2239_c7_de7b]
signal n8_MUX_uxn_opcodes_h_l2239_c7_de7b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2239_c7_de7b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2239_c7_de7b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2243_c32_069a]
signal BIN_OP_AND_uxn_opcodes_h_l2243_c32_069a_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2243_c32_069a_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2243_c32_069a_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2243_c32_76f4]
signal BIN_OP_GT_uxn_opcodes_h_l2243_c32_76f4_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2243_c32_76f4_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2243_c32_76f4_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2243_c32_22f6]
signal MUX_uxn_opcodes_h_l2243_c32_22f6_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2243_c32_22f6_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2243_c32_22f6_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2243_c32_22f6_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2245_c11_22ba]
signal BIN_OP_EQ_uxn_opcodes_h_l2245_c11_22ba_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2245_c11_22ba_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2245_c11_22ba_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2245_c7_1fbd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_1fbd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_1fbd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_1fbd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_1fbd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2245_c7_1fbd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_1fbd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_1fbd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_1fbd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_1fbd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2245_c7_1fbd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_1fbd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_1fbd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_1fbd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_1fbd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2245_c7_1fbd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_1fbd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_1fbd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_1fbd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_1fbd_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2245_c7_1fbd]
signal result_stack_value_MUX_uxn_opcodes_h_l2245_c7_1fbd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2245_c7_1fbd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2245_c7_1fbd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2245_c7_1fbd_return_output : unsigned(7 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2249_c24_ad92]
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2249_c24_ad92_left : unsigned(7 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2249_c24_ad92_right : unsigned(7 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2249_c24_ad92_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2251_c11_38cb]
signal BIN_OP_EQ_uxn_opcodes_h_l2251_c11_38cb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2251_c11_38cb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2251_c11_38cb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2251_c7_57d7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_57d7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_57d7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_57d7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_57d7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2251_c7_57d7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_57d7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_57d7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_57d7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_57d7_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2223_c6_5a07
BIN_OP_EQ_uxn_opcodes_h_l2223_c6_5a07 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2223_c6_5a07_left,
BIN_OP_EQ_uxn_opcodes_h_l2223_c6_5a07_right,
BIN_OP_EQ_uxn_opcodes_h_l2223_c6_5a07_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2223_c1_f11a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2223_c1_f11a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2223_c1_f11a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2223_c1_f11a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2223_c1_f11a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2223_c1_f11a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7
result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2223_c2_cfe7
result_is_stack_read_MUX_uxn_opcodes_h_l2223_c2_cfe7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2223_c2_cfe7
result_is_stack_write_MUX_uxn_opcodes_h_l2223_c2_cfe7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c2_cfe7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c2_cfe7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2223_c2_cfe7
result_is_opc_done_MUX_uxn_opcodes_h_l2223_c2_cfe7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2223_c2_cfe7
result_stack_value_MUX_uxn_opcodes_h_l2223_c2_cfe7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond,
result_stack_value_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output);

-- t8_MUX_uxn_opcodes_h_l2223_c2_cfe7
t8_MUX_uxn_opcodes_h_l2223_c2_cfe7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond,
t8_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue,
t8_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse,
t8_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output);

-- n8_MUX_uxn_opcodes_h_l2223_c2_cfe7
n8_MUX_uxn_opcodes_h_l2223_c2_cfe7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond,
n8_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue,
n8_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse,
n8_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output);

-- printf_uxn_opcodes_h_l2224_c3_2743_uxn_opcodes_h_l2224_c3_2743
printf_uxn_opcodes_h_l2224_c3_2743_uxn_opcodes_h_l2224_c3_2743 : entity work.printf_uxn_opcodes_h_l2224_c3_2743_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2224_c3_2743_uxn_opcodes_h_l2224_c3_2743_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2229_c11_c9d1
BIN_OP_EQ_uxn_opcodes_h_l2229_c11_c9d1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2229_c11_c9d1_left,
BIN_OP_EQ_uxn_opcodes_h_l2229_c11_c9d1_right,
BIN_OP_EQ_uxn_opcodes_h_l2229_c11_c9d1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_e54a
result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_e54a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_e54a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2229_c7_e54a
result_is_stack_read_MUX_uxn_opcodes_h_l2229_c7_e54a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2229_c7_e54a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_e54a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_e54a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_e54a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_e54a
result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_e54a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_e54a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_e54a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_e54a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_e54a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_e54a
result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_e54a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_e54a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2229_c7_e54a
result_stack_value_MUX_uxn_opcodes_h_l2229_c7_e54a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2229_c7_e54a_cond,
result_stack_value_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output);

-- t8_MUX_uxn_opcodes_h_l2229_c7_e54a
t8_MUX_uxn_opcodes_h_l2229_c7_e54a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2229_c7_e54a_cond,
t8_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue,
t8_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse,
t8_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output);

-- n8_MUX_uxn_opcodes_h_l2229_c7_e54a
n8_MUX_uxn_opcodes_h_l2229_c7_e54a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2229_c7_e54a_cond,
n8_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue,
n8_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse,
n8_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2232_c11_3275
BIN_OP_EQ_uxn_opcodes_h_l2232_c11_3275 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2232_c11_3275_left,
BIN_OP_EQ_uxn_opcodes_h_l2232_c11_3275_right,
BIN_OP_EQ_uxn_opcodes_h_l2232_c11_3275_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_6027
result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_6027 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_6027_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_6027_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2232_c7_6027
result_is_stack_read_MUX_uxn_opcodes_h_l2232_c7_6027 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2232_c7_6027_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2232_c7_6027_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_6027
result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_6027 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_6027_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_6027_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_6027
result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_6027 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_6027_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_6027_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_6027
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_6027 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_6027_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_6027_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_6027
result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_6027 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_6027_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_6027_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2232_c7_6027
result_stack_value_MUX_uxn_opcodes_h_l2232_c7_6027 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2232_c7_6027_cond,
result_stack_value_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2232_c7_6027_return_output);

-- t8_MUX_uxn_opcodes_h_l2232_c7_6027
t8_MUX_uxn_opcodes_h_l2232_c7_6027 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2232_c7_6027_cond,
t8_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue,
t8_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse,
t8_MUX_uxn_opcodes_h_l2232_c7_6027_return_output);

-- n8_MUX_uxn_opcodes_h_l2232_c7_6027
n8_MUX_uxn_opcodes_h_l2232_c7_6027 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2232_c7_6027_cond,
n8_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue,
n8_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse,
n8_MUX_uxn_opcodes_h_l2232_c7_6027_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2236_c11_490d
BIN_OP_EQ_uxn_opcodes_h_l2236_c11_490d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2236_c11_490d_left,
BIN_OP_EQ_uxn_opcodes_h_l2236_c11_490d_right,
BIN_OP_EQ_uxn_opcodes_h_l2236_c11_490d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2
result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2236_c7_c5a2
result_is_stack_read_MUX_uxn_opcodes_h_l2236_c7_c5a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2236_c7_c5a2_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2236_c7_c5a2_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2236_c7_c5a2_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_c5a2
result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_c5a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_c5a2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_c5a2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_c5a2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c7_c5a2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c7_c5a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c7_c5a2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c7_c5a2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c7_c5a2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_c5a2
result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_c5a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_c5a2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_c5a2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_c5a2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2236_c7_c5a2
result_stack_value_MUX_uxn_opcodes_h_l2236_c7_c5a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2236_c7_c5a2_cond,
result_stack_value_MUX_uxn_opcodes_h_l2236_c7_c5a2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2236_c7_c5a2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output);

-- n8_MUX_uxn_opcodes_h_l2236_c7_c5a2
n8_MUX_uxn_opcodes_h_l2236_c7_c5a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2236_c7_c5a2_cond,
n8_MUX_uxn_opcodes_h_l2236_c7_c5a2_iftrue,
n8_MUX_uxn_opcodes_h_l2236_c7_c5a2_iffalse,
n8_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2239_c11_fa14
BIN_OP_EQ_uxn_opcodes_h_l2239_c11_fa14 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2239_c11_fa14_left,
BIN_OP_EQ_uxn_opcodes_h_l2239_c11_fa14_right,
BIN_OP_EQ_uxn_opcodes_h_l2239_c11_fa14_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_de7b
result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_de7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_de7b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_de7b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_de7b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2239_c7_de7b
result_is_stack_read_MUX_uxn_opcodes_h_l2239_c7_de7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2239_c7_de7b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2239_c7_de7b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2239_c7_de7b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_de7b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_de7b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_de7b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_de7b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_de7b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_de7b
result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_de7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_de7b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_de7b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_de7b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_de7b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_de7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_de7b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_de7b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_de7b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_de7b
result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_de7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_de7b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_de7b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_de7b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2239_c7_de7b
result_stack_value_MUX_uxn_opcodes_h_l2239_c7_de7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2239_c7_de7b_cond,
result_stack_value_MUX_uxn_opcodes_h_l2239_c7_de7b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2239_c7_de7b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output);

-- n8_MUX_uxn_opcodes_h_l2239_c7_de7b
n8_MUX_uxn_opcodes_h_l2239_c7_de7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2239_c7_de7b_cond,
n8_MUX_uxn_opcodes_h_l2239_c7_de7b_iftrue,
n8_MUX_uxn_opcodes_h_l2239_c7_de7b_iffalse,
n8_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2243_c32_069a
BIN_OP_AND_uxn_opcodes_h_l2243_c32_069a : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2243_c32_069a_left,
BIN_OP_AND_uxn_opcodes_h_l2243_c32_069a_right,
BIN_OP_AND_uxn_opcodes_h_l2243_c32_069a_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2243_c32_76f4
BIN_OP_GT_uxn_opcodes_h_l2243_c32_76f4 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2243_c32_76f4_left,
BIN_OP_GT_uxn_opcodes_h_l2243_c32_76f4_right,
BIN_OP_GT_uxn_opcodes_h_l2243_c32_76f4_return_output);

-- MUX_uxn_opcodes_h_l2243_c32_22f6
MUX_uxn_opcodes_h_l2243_c32_22f6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2243_c32_22f6_cond,
MUX_uxn_opcodes_h_l2243_c32_22f6_iftrue,
MUX_uxn_opcodes_h_l2243_c32_22f6_iffalse,
MUX_uxn_opcodes_h_l2243_c32_22f6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2245_c11_22ba
BIN_OP_EQ_uxn_opcodes_h_l2245_c11_22ba : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2245_c11_22ba_left,
BIN_OP_EQ_uxn_opcodes_h_l2245_c11_22ba_right,
BIN_OP_EQ_uxn_opcodes_h_l2245_c11_22ba_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_1fbd
result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_1fbd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_1fbd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_1fbd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_1fbd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_1fbd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_1fbd
result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_1fbd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_1fbd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_1fbd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_1fbd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_1fbd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_1fbd
result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_1fbd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_1fbd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_1fbd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_1fbd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_1fbd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_1fbd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_1fbd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_1fbd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_1fbd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_1fbd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_1fbd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2245_c7_1fbd
result_stack_value_MUX_uxn_opcodes_h_l2245_c7_1fbd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2245_c7_1fbd_cond,
result_stack_value_MUX_uxn_opcodes_h_l2245_c7_1fbd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2245_c7_1fbd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2245_c7_1fbd_return_output);

-- BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2249_c24_ad92
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2249_c24_ad92 : entity work.BIN_OP_INFERRED_MULT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2249_c24_ad92_left,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2249_c24_ad92_right,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2249_c24_ad92_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2251_c11_38cb
BIN_OP_EQ_uxn_opcodes_h_l2251_c11_38cb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2251_c11_38cb_left,
BIN_OP_EQ_uxn_opcodes_h_l2251_c11_38cb_right,
BIN_OP_EQ_uxn_opcodes_h_l2251_c11_38cb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_57d7
result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_57d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_57d7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_57d7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_57d7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_57d7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_57d7
result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_57d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_57d7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_57d7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_57d7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_57d7_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2223_c6_5a07_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2223_c1_f11a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output,
 t8_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output,
 n8_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2229_c11_c9d1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output,
 t8_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output,
 n8_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2232_c11_3275_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_6027_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2232_c7_6027_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_6027_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_6027_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_6027_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_6027_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2232_c7_6027_return_output,
 t8_MUX_uxn_opcodes_h_l2232_c7_6027_return_output,
 n8_MUX_uxn_opcodes_h_l2232_c7_6027_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2236_c11_490d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output,
 n8_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2239_c11_fa14_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output,
 n8_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2243_c32_069a_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2243_c32_76f4_return_output,
 MUX_uxn_opcodes_h_l2243_c32_22f6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2245_c11_22ba_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_1fbd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_1fbd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_1fbd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_1fbd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2245_c7_1fbd_return_output,
 BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2249_c24_ad92_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2251_c11_38cb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_57d7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_57d7_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c6_5a07_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c6_5a07_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c6_5a07_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2223_c1_f11a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2223_c1_f11a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2223_c1_f11a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2223_c1_f11a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2226_c3_2780 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2224_c3_2743_uxn_opcodes_h_l2224_c3_2743_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_c9d1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_c9d1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_c9d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_6027_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_e54a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2232_c7_6027_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2229_c7_e54a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_6027_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_e54a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_6027_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_e54a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2230_c3_caa4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_6027_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_e54a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_6027_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_e54a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2232_c7_6027_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2229_c7_e54a_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2232_c7_6027_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2229_c7_e54a_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2232_c7_6027_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2229_c7_e54a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2232_c11_3275_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2232_c11_3275_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2232_c11_3275_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_6027_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2232_c7_6027_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_6027_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_6027_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2234_c3_4024 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_6027_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_6027_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2232_c7_6027_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2232_c7_6027_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2232_c7_6027_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c11_490d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c11_490d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c11_490d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2236_c7_c5a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2236_c7_c5a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2236_c7_c5a2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_c5a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_c5a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_c5a2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c7_c5a2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2237_c3_137c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c7_c5a2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c7_c5a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_c5a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_c5a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_c5a2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2236_c7_c5a2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2236_c7_c5a2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2236_c7_c5a2_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2236_c7_c5a2_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2236_c7_c5a2_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2236_c7_c5a2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2239_c11_fa14_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2239_c11_fa14_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2239_c11_fa14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_de7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_de7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_1fbd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_de7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2239_c7_de7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2239_c7_de7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2239_c7_de7b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_de7b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_de7b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_de7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_de7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_de7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_1fbd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_de7b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_de7b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_de7b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_1fbd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_de7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_de7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_de7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_1fbd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_de7b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2239_c7_de7b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2239_c7_de7b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2245_c7_1fbd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2239_c7_de7b_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2239_c7_de7b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2239_c7_de7b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2239_c7_de7b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2243_c32_22f6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2243_c32_22f6_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2243_c32_22f6_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2243_c32_069a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2243_c32_069a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2243_c32_069a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2243_c32_76f4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2243_c32_76f4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2243_c32_76f4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2243_c32_22f6_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2245_c11_22ba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2245_c11_22ba_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2245_c11_22ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_1fbd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_1fbd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_1fbd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_1fbd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_1fbd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_57d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_1fbd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_1fbd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_1fbd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_57d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_1fbd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_1fbd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2248_c3_4ab7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_1fbd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_1fbd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2245_c7_1fbd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_uxn_opcodes_h_l2249_c3_164d : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2245_c7_1fbd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2245_c7_1fbd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2249_c24_ad92_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2249_c24_ad92_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2249_c24_ad92_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c11_38cb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c11_38cb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c11_38cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_57d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_57d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_57d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_57d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_57d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_57d7_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2229_l2223_l2245_l2236_l2232_DUPLICATE_27a1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2229_l2223_l2239_l2236_l2232_DUPLICATE_78c2_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2229_l2223_l2251_l2239_l2236_l2232_DUPLICATE_7cf9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2229_l2223_l2245_l2239_l2236_l2232_DUPLICATE_07f6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2236_l2229_l2239_l2232_DUPLICATE_3998_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2229_l2251_l2245_l2239_l2236_l2232_DUPLICATE_df68_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2239_l2245_DUPLICATE_ba21_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2256_l2219_DUPLICATE_877c_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c11_490d_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c11_38cb_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2232_c11_3275_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2234_c3_4024 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2234_c3_4024;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2230_c3_caa4 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2230_c3_caa4;
     VAR_MUX_uxn_opcodes_h_l2243_c32_22f6_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c6_5a07_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2245_c11_22ba_right := to_unsigned(5, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2223_c1_f11a_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2243_c32_76f4_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_c9d1_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_de7b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2239_c11_fa14_right := to_unsigned(4, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2239_c7_de7b_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_1fbd_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2237_c3_137c := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c7_c5a2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2237_c3_137c;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_1fbd_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2248_c3_4ab7 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_1fbd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2248_c3_4ab7;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2226_c3_2780 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2226_c3_2780;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_57d7_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2243_c32_22f6_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2243_c32_069a_right := to_unsigned(128, 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_57d7_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2223_c1_f11a_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2243_c32_069a_left := VAR_ins;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2249_c24_ad92_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2236_c7_c5a2_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2239_c7_de7b_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c6_5a07_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_c9d1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2232_c11_3275_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c11_490d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2239_c11_fa14_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2245_c11_22ba_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c11_38cb_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2239_c7_de7b_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2249_c24_ad92_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse := t8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2229_l2223_l2245_l2239_l2236_l2232_DUPLICATE_07f6 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2229_l2223_l2245_l2239_l2236_l2232_DUPLICATE_07f6_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2232_c11_3275] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2232_c11_3275_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2232_c11_3275_left;
     BIN_OP_EQ_uxn_opcodes_h_l2232_c11_3275_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2232_c11_3275_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2232_c11_3275_return_output := BIN_OP_EQ_uxn_opcodes_h_l2232_c11_3275_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2223_c6_5a07] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2223_c6_5a07_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c6_5a07_left;
     BIN_OP_EQ_uxn_opcodes_h_l2223_c6_5a07_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c6_5a07_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c6_5a07_return_output := BIN_OP_EQ_uxn_opcodes_h_l2223_c6_5a07_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2249_c24_ad92] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2249_c24_ad92_left <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2249_c24_ad92_left;
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2249_c24_ad92_right <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2249_c24_ad92_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2249_c24_ad92_return_output := BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2249_c24_ad92_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2229_l2223_l2239_l2236_l2232_DUPLICATE_78c2 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2229_l2223_l2239_l2236_l2232_DUPLICATE_78c2_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2229_c11_c9d1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2229_c11_c9d1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_c9d1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2229_c11_c9d1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_c9d1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_c9d1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2229_c11_c9d1_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2229_l2223_l2251_l2239_l2236_l2232_DUPLICATE_7cf9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2229_l2223_l2251_l2239_l2236_l2232_DUPLICATE_7cf9_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2229_l2251_l2245_l2239_l2236_l2232_DUPLICATE_df68 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2229_l2251_l2245_l2239_l2236_l2232_DUPLICATE_df68_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2251_c11_38cb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2251_c11_38cb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c11_38cb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2251_c11_38cb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c11_38cb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c11_38cb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2251_c11_38cb_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2236_l2229_l2239_l2232_DUPLICATE_3998 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2236_l2229_l2239_l2232_DUPLICATE_3998_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l2239_c11_fa14] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2239_c11_fa14_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2239_c11_fa14_left;
     BIN_OP_EQ_uxn_opcodes_h_l2239_c11_fa14_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2239_c11_fa14_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2239_c11_fa14_return_output := BIN_OP_EQ_uxn_opcodes_h_l2239_c11_fa14_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2243_c32_069a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2243_c32_069a_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2243_c32_069a_left;
     BIN_OP_AND_uxn_opcodes_h_l2243_c32_069a_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2243_c32_069a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2243_c32_069a_return_output := BIN_OP_AND_uxn_opcodes_h_l2243_c32_069a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2245_c11_22ba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2245_c11_22ba_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2245_c11_22ba_left;
     BIN_OP_EQ_uxn_opcodes_h_l2245_c11_22ba_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2245_c11_22ba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2245_c11_22ba_return_output := BIN_OP_EQ_uxn_opcodes_h_l2245_c11_22ba_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2229_l2223_l2245_l2236_l2232_DUPLICATE_27a1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2229_l2223_l2245_l2236_l2232_DUPLICATE_27a1_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2239_l2245_DUPLICATE_ba21 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2239_l2245_DUPLICATE_ba21_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2236_c11_490d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2236_c11_490d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c11_490d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2236_c11_490d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c11_490d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c11_490d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2236_c11_490d_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2243_c32_76f4_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2243_c32_069a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2223_c1_f11a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c6_5a07_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c6_5a07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c6_5a07_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c6_5a07_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c6_5a07_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c6_5a07_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c6_5a07_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c6_5a07_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c6_5a07_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c6_5a07_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2229_c7_e54a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_c9d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_e54a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_c9d1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_e54a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_c9d1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2229_c7_e54a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_c9d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_e54a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_c9d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_e54a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_c9d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_e54a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_c9d1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2229_c7_e54a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_c9d1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2229_c7_e54a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_c9d1_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2232_c7_6027_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2232_c11_3275_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_6027_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2232_c11_3275_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_6027_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2232_c11_3275_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2232_c7_6027_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2232_c11_3275_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_6027_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2232_c11_3275_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_6027_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2232_c11_3275_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_6027_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2232_c11_3275_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2232_c7_6027_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2232_c11_3275_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2232_c7_6027_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2232_c11_3275_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2236_c7_c5a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c11_490d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_c5a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c11_490d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c11_490d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2236_c7_c5a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c11_490d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_c5a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c11_490d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c11_490d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c7_c5a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c11_490d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2236_c7_c5a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c11_490d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2239_c7_de7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2239_c11_fa14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_de7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2239_c11_fa14_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_de7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2239_c11_fa14_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2239_c7_de7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2239_c11_fa14_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_de7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2239_c11_fa14_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_de7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2239_c11_fa14_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_de7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2239_c11_fa14_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2239_c7_de7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2239_c11_fa14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_1fbd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2245_c11_22ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_1fbd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2245_c11_22ba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_1fbd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2245_c11_22ba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_1fbd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2245_c11_22ba_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2245_c7_1fbd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2245_c11_22ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_57d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c11_38cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_57d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c11_38cb_return_output;
     VAR_result_stack_value_uxn_opcodes_h_l2249_c3_164d := resize(VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2249_c24_ad92_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2229_l2223_l2239_l2236_l2232_DUPLICATE_78c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2229_l2223_l2239_l2236_l2232_DUPLICATE_78c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2229_l2223_l2239_l2236_l2232_DUPLICATE_78c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2229_l2223_l2239_l2236_l2232_DUPLICATE_78c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_de7b_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2229_l2223_l2239_l2236_l2232_DUPLICATE_78c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2229_l2251_l2245_l2239_l2236_l2232_DUPLICATE_df68_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2229_l2251_l2245_l2239_l2236_l2232_DUPLICATE_df68_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_c5a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2229_l2251_l2245_l2239_l2236_l2232_DUPLICATE_df68_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_de7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2229_l2251_l2245_l2239_l2236_l2232_DUPLICATE_df68_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_1fbd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2229_l2251_l2245_l2239_l2236_l2232_DUPLICATE_df68_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_57d7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2229_l2251_l2245_l2239_l2236_l2232_DUPLICATE_df68_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2229_l2223_l2245_l2236_l2232_DUPLICATE_27a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2229_l2223_l2245_l2236_l2232_DUPLICATE_27a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2229_l2223_l2245_l2236_l2232_DUPLICATE_27a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2229_l2223_l2245_l2236_l2232_DUPLICATE_27a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_1fbd_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2229_l2223_l2245_l2236_l2232_DUPLICATE_27a1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2236_l2229_l2239_l2232_DUPLICATE_3998_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2236_l2229_l2239_l2232_DUPLICATE_3998_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2236_c7_c5a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2236_l2229_l2239_l2232_DUPLICATE_3998_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2239_c7_de7b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2236_l2229_l2239_l2232_DUPLICATE_3998_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2229_l2223_l2251_l2239_l2236_l2232_DUPLICATE_7cf9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2229_l2223_l2251_l2239_l2236_l2232_DUPLICATE_7cf9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2229_l2223_l2251_l2239_l2236_l2232_DUPLICATE_7cf9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_c5a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2229_l2223_l2251_l2239_l2236_l2232_DUPLICATE_7cf9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_de7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2229_l2223_l2251_l2239_l2236_l2232_DUPLICATE_7cf9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_57d7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2229_l2223_l2251_l2239_l2236_l2232_DUPLICATE_7cf9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_de7b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2239_l2245_DUPLICATE_ba21_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_1fbd_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2239_l2245_DUPLICATE_ba21_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2229_l2223_l2245_l2239_l2236_l2232_DUPLICATE_07f6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2229_l2223_l2245_l2239_l2236_l2232_DUPLICATE_07f6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2229_l2223_l2245_l2239_l2236_l2232_DUPLICATE_07f6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2236_c7_c5a2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2229_l2223_l2245_l2239_l2236_l2232_DUPLICATE_07f6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2239_c7_de7b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2229_l2223_l2245_l2239_l2236_l2232_DUPLICATE_07f6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2245_c7_1fbd_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2229_l2223_l2245_l2239_l2236_l2232_DUPLICATE_07f6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2245_c7_1fbd_iftrue := VAR_result_stack_value_uxn_opcodes_h_l2249_c3_164d;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2245_c7_1fbd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_1fbd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_1fbd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_1fbd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_1fbd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_1fbd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_1fbd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_1fbd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_1fbd_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2223_c1_f11a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2223_c1_f11a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2223_c1_f11a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2223_c1_f11a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2223_c1_f11a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2223_c1_f11a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2223_c1_f11a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2223_c1_f11a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2223_c1_f11a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2245_c7_1fbd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_1fbd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_1fbd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_1fbd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_1fbd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_1fbd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_1fbd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_1fbd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_1fbd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2251_c7_57d7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_57d7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_57d7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_57d7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_57d7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_57d7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_57d7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_57d7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_57d7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2245_c7_1fbd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2245_c7_1fbd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2245_c7_1fbd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2245_c7_1fbd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2245_c7_1fbd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2245_c7_1fbd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2245_c7_1fbd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2245_c7_1fbd_return_output := result_stack_value_MUX_uxn_opcodes_h_l2245_c7_1fbd_return_output;

     -- t8_MUX[uxn_opcodes_h_l2232_c7_6027] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2232_c7_6027_cond <= VAR_t8_MUX_uxn_opcodes_h_l2232_c7_6027_cond;
     t8_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue;
     t8_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2232_c7_6027_return_output := t8_MUX_uxn_opcodes_h_l2232_c7_6027_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2239_c7_de7b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2239_c7_de7b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2239_c7_de7b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2239_c7_de7b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2239_c7_de7b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2239_c7_de7b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2239_c7_de7b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2251_c7_57d7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_57d7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_57d7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_57d7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_57d7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_57d7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_57d7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_57d7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_57d7_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2243_c32_76f4] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2243_c32_76f4_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2243_c32_76f4_left;
     BIN_OP_GT_uxn_opcodes_h_l2243_c32_76f4_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2243_c32_76f4_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2243_c32_76f4_return_output := BIN_OP_GT_uxn_opcodes_h_l2243_c32_76f4_return_output;

     -- n8_MUX[uxn_opcodes_h_l2239_c7_de7b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2239_c7_de7b_cond <= VAR_n8_MUX_uxn_opcodes_h_l2239_c7_de7b_cond;
     n8_MUX_uxn_opcodes_h_l2239_c7_de7b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2239_c7_de7b_iftrue;
     n8_MUX_uxn_opcodes_h_l2239_c7_de7b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2239_c7_de7b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output := n8_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2243_c32_22f6_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2243_c32_76f4_return_output;
     VAR_printf_uxn_opcodes_h_l2224_c3_2743_uxn_opcodes_h_l2224_c3_2743_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2223_c1_f11a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2236_c7_c5a2_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_1fbd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_57d7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_de7b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_1fbd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2236_c7_c5a2_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_1fbd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_57d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_de7b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_1fbd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2239_c7_de7b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2245_c7_1fbd_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2232_c7_6027_return_output;
     -- n8_MUX[uxn_opcodes_h_l2236_c7_c5a2] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2236_c7_c5a2_cond <= VAR_n8_MUX_uxn_opcodes_h_l2236_c7_c5a2_cond;
     n8_MUX_uxn_opcodes_h_l2236_c7_c5a2_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2236_c7_c5a2_iftrue;
     n8_MUX_uxn_opcodes_h_l2236_c7_c5a2_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2236_c7_c5a2_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output := n8_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2239_c7_de7b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2239_c7_de7b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2239_c7_de7b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2239_c7_de7b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2239_c7_de7b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2239_c7_de7b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2239_c7_de7b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output := result_stack_value_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2245_c7_1fbd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_1fbd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_1fbd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_1fbd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_1fbd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_1fbd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_1fbd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_1fbd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_1fbd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2239_c7_de7b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_de7b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_de7b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_de7b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_de7b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_de7b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_de7b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2245_c7_1fbd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_1fbd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_1fbd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_1fbd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_1fbd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_1fbd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_1fbd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_1fbd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_1fbd_return_output;

     -- printf_uxn_opcodes_h_l2224_c3_2743[uxn_opcodes_h_l2224_c3_2743] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2224_c3_2743_uxn_opcodes_h_l2224_c3_2743_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2224_c3_2743_uxn_opcodes_h_l2224_c3_2743_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t8_MUX[uxn_opcodes_h_l2229_c7_e54a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2229_c7_e54a_cond <= VAR_t8_MUX_uxn_opcodes_h_l2229_c7_e54a_cond;
     t8_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue;
     t8_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output := t8_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2236_c7_c5a2] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2236_c7_c5a2_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2236_c7_c5a2_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2236_c7_c5a2_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2236_c7_c5a2_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2236_c7_c5a2_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2236_c7_c5a2_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output;

     -- MUX[uxn_opcodes_h_l2243_c32_22f6] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2243_c32_22f6_cond <= VAR_MUX_uxn_opcodes_h_l2243_c32_22f6_cond;
     MUX_uxn_opcodes_h_l2243_c32_22f6_iftrue <= VAR_MUX_uxn_opcodes_h_l2243_c32_22f6_iftrue;
     MUX_uxn_opcodes_h_l2243_c32_22f6_iffalse <= VAR_MUX_uxn_opcodes_h_l2243_c32_22f6_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2243_c32_22f6_return_output := MUX_uxn_opcodes_h_l2243_c32_22f6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2239_c7_de7b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_de7b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_de7b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_de7b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_de7b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_de7b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_de7b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_de7b_iftrue := VAR_MUX_uxn_opcodes_h_l2243_c32_22f6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_de7b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_1fbd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_de7b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_1fbd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c7_c5a2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2236_c7_c5a2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2239_c7_de7b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_de7b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_de7b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_de7b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_de7b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_de7b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_de7b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2239_c7_de7b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_de7b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_de7b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_de7b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_de7b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_de7b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_de7b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2232_c7_6027] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2232_c7_6027_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2232_c7_6027_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2232_c7_6027_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2232_c7_6027_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2239_c7_de7b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_de7b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_de7b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_de7b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_de7b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_de7b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_de7b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2236_c7_c5a2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c7_c5a2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c7_c5a2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c7_c5a2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c7_c5a2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c7_c5a2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c7_c5a2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2236_c7_c5a2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output;

     -- t8_MUX[uxn_opcodes_h_l2223_c2_cfe7] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond <= VAR_t8_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond;
     t8_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue;
     t8_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output := t8_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output;

     -- n8_MUX[uxn_opcodes_h_l2232_c7_6027] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2232_c7_6027_cond <= VAR_n8_MUX_uxn_opcodes_h_l2232_c7_6027_cond;
     n8_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue;
     n8_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2232_c7_6027_return_output := n8_MUX_uxn_opcodes_h_l2232_c7_6027_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2236_c7_c5a2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2236_c7_c5a2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2236_c7_c5a2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2236_c7_c5a2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2236_c7_c5a2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2236_c7_c5a2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2236_c7_c5a2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output := result_stack_value_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2232_c7_6027_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_c5a2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2232_c7_6027_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_c5a2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_de7b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2229_c7_e54a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2229_c7_e54a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2229_c7_e54a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2232_c7_6027] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_6027_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_6027_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_6027_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_6027_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2232_c7_6027] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_6027_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_6027_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_6027_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_6027_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2236_c7_c5a2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_c5a2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_c5a2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_c5a2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_c5a2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_c5a2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_c5a2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output;

     -- n8_MUX[uxn_opcodes_h_l2229_c7_e54a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2229_c7_e54a_cond <= VAR_n8_MUX_uxn_opcodes_h_l2229_c7_e54a_cond;
     n8_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue;
     n8_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output := n8_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2236_c7_c5a2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2236_c7_c5a2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_c5a2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_c5a2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_c5a2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_c5a2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_c5a2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_c5a2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2232_c7_6027] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2232_c7_6027_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2232_c7_6027_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2232_c7_6027_return_output := result_stack_value_MUX_uxn_opcodes_h_l2232_c7_6027_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_6027_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c7_c5a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_6027_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2232_c7_6027_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2223_c2_cfe7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output;

     -- n8_MUX[uxn_opcodes_h_l2223_c2_cfe7] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond <= VAR_n8_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond;
     n8_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue;
     n8_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output := n8_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2229_c7_e54a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2229_c7_e54a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2229_c7_e54a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output := result_stack_value_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2229_c7_e54a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_e54a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_e54a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2229_c7_e54a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_e54a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_e54a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2232_c7_6027] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_6027_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_6027_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_6027_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_6027_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2232_c7_6027] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_6027_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_6027_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_6027_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_6027_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2232_c7_6027] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_6027_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_6027_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_6027_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_6027_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_6027_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_6027_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_6027_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_6027_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_6027_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2229_c7_e54a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_e54a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_e54a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2229_c7_e54a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_e54a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_e54a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2223_c2_cfe7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2229_c7_e54a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_e54a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_e54a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_e54a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_e54a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2223_c2_cfe7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2223_c2_cfe7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output := result_stack_value_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_e54a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2223_c2_cfe7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2223_c2_cfe7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2223_c2_cfe7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2223_c2_cfe7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2223_c2_cfe7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2223_c2_cfe7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2256_l2219_DUPLICATE_877c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2256_l2219_DUPLICATE_877c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1ade(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2223_c2_cfe7_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2256_l2219_DUPLICATE_877c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2256_l2219_DUPLICATE_877c_return_output;
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
