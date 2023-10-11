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
-- Submodules: 127
entity ovr2_0CLK_9fd731de is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ovr2_0CLK_9fd731de;
architecture arch of ovr2_0CLK_9fd731de is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l346_c6_01d4]
signal BIN_OP_EQ_uxn_opcodes_h_l346_c6_01d4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l346_c6_01d4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l346_c6_01d4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l346_c1_5f8c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l346_c1_5f8c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l346_c1_5f8c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l346_c1_5f8c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l346_c1_5f8c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l346_c2_541f]
signal n16_MUX_uxn_opcodes_h_l346_c2_541f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l346_c2_541f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l346_c2_541f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l346_c2_541f_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l346_c2_541f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l346_c2_541f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l346_c2_541f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l346_c2_541f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l346_c2_541f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l346_c2_541f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c2_541f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c2_541f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c2_541f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c2_541f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l346_c2_541f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c2_541f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c2_541f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c2_541f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c2_541f_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l346_c2_541f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l346_c2_541f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l346_c2_541f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l346_c2_541f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l346_c2_541f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l346_c2_541f]
signal result_stack_value_MUX_uxn_opcodes_h_l346_c2_541f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l346_c2_541f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l346_c2_541f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l346_c2_541f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l346_c2_541f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l346_c2_541f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l346_c2_541f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l346_c2_541f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l346_c2_541f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l346_c2_541f]
signal t16_MUX_uxn_opcodes_h_l346_c2_541f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l346_c2_541f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l346_c2_541f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l346_c2_541f_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l347_c3_cea0[uxn_opcodes_h_l347_c3_cea0]
signal printf_uxn_opcodes_h_l347_c3_cea0_uxn_opcodes_h_l347_c3_cea0_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l351_c11_14c5]
signal BIN_OP_EQ_uxn_opcodes_h_l351_c11_14c5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l351_c11_14c5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l351_c11_14c5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l351_c7_93b9]
signal n16_MUX_uxn_opcodes_h_l351_c7_93b9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l351_c7_93b9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l351_c7_93b9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l351_c7_93b9_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l351_c7_93b9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_93b9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_93b9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_93b9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_93b9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l351_c7_93b9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_93b9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_93b9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_93b9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_93b9_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l351_c7_93b9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_93b9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_93b9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_93b9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_93b9_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l351_c7_93b9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_93b9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_93b9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_93b9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_93b9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l351_c7_93b9]
signal result_stack_value_MUX_uxn_opcodes_h_l351_c7_93b9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l351_c7_93b9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l351_c7_93b9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l351_c7_93b9_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l351_c7_93b9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_93b9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_93b9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_93b9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_93b9_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l351_c7_93b9]
signal t16_MUX_uxn_opcodes_h_l351_c7_93b9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l351_c7_93b9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l351_c7_93b9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l351_c7_93b9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l354_c11_e219]
signal BIN_OP_EQ_uxn_opcodes_h_l354_c11_e219_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l354_c11_e219_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l354_c11_e219_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l354_c7_1795]
signal n16_MUX_uxn_opcodes_h_l354_c7_1795_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l354_c7_1795_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l354_c7_1795_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l354_c7_1795_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l354_c7_1795]
signal result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_1795_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_1795_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_1795_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_1795_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l354_c7_1795]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_1795_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_1795_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_1795_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_1795_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l354_c7_1795]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_1795_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_1795_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_1795_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_1795_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l354_c7_1795]
signal result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_1795_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_1795_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_1795_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_1795_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l354_c7_1795]
signal result_stack_value_MUX_uxn_opcodes_h_l354_c7_1795_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l354_c7_1795_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l354_c7_1795_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l354_c7_1795_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l354_c7_1795]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_1795_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_1795_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_1795_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_1795_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l354_c7_1795]
signal t16_MUX_uxn_opcodes_h_l354_c7_1795_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l354_c7_1795_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l354_c7_1795_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l354_c7_1795_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l359_c11_7e44]
signal BIN_OP_EQ_uxn_opcodes_h_l359_c11_7e44_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l359_c11_7e44_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l359_c11_7e44_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l359_c7_1c7e]
signal n16_MUX_uxn_opcodes_h_l359_c7_1c7e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l359_c7_1c7e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l359_c7_1c7e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l359_c7_1c7e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_1c7e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_1c7e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_1c7e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l359_c7_1c7e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_1c7e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_1c7e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_1c7e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l359_c7_1c7e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_1c7e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_1c7e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_1c7e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l359_c7_1c7e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_1c7e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_1c7e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_1c7e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l359_c7_1c7e]
signal result_stack_value_MUX_uxn_opcodes_h_l359_c7_1c7e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l359_c7_1c7e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l359_c7_1c7e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l359_c7_1c7e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_1c7e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_1c7e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_1c7e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l359_c7_1c7e]
signal t16_MUX_uxn_opcodes_h_l359_c7_1c7e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l359_c7_1c7e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l359_c7_1c7e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l362_c11_e6df]
signal BIN_OP_EQ_uxn_opcodes_h_l362_c11_e6df_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l362_c11_e6df_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l362_c11_e6df_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l362_c7_4bf4]
signal n16_MUX_uxn_opcodes_h_l362_c7_4bf4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l362_c7_4bf4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l362_c7_4bf4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l362_c7_4bf4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_4bf4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_4bf4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_4bf4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l362_c7_4bf4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_4bf4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_4bf4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_4bf4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l362_c7_4bf4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_4bf4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_4bf4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_4bf4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l362_c7_4bf4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_4bf4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_4bf4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_4bf4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l362_c7_4bf4]
signal result_stack_value_MUX_uxn_opcodes_h_l362_c7_4bf4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l362_c7_4bf4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l362_c7_4bf4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l362_c7_4bf4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_4bf4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_4bf4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_4bf4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l362_c7_4bf4]
signal t16_MUX_uxn_opcodes_h_l362_c7_4bf4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l362_c7_4bf4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l362_c7_4bf4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l363_c3_0448]
signal BIN_OP_OR_uxn_opcodes_h_l363_c3_0448_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l363_c3_0448_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l363_c3_0448_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l366_c11_3f73]
signal BIN_OP_EQ_uxn_opcodes_h_l366_c11_3f73_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l366_c11_3f73_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l366_c11_3f73_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l366_c7_d2c7]
signal n16_MUX_uxn_opcodes_h_l366_c7_d2c7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l366_c7_d2c7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l366_c7_d2c7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l366_c7_d2c7_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l366_c7_d2c7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d2c7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d2c7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d2c7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d2c7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l366_c7_d2c7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d2c7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d2c7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d2c7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d2c7_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l366_c7_d2c7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_d2c7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_d2c7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_d2c7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_d2c7_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l366_c7_d2c7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d2c7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d2c7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d2c7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d2c7_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l366_c7_d2c7]
signal result_stack_value_MUX_uxn_opcodes_h_l366_c7_d2c7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l366_c7_d2c7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l366_c7_d2c7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l366_c7_d2c7_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l366_c7_d2c7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_d2c7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_d2c7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_d2c7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_d2c7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l369_c11_9fc2]
signal BIN_OP_EQ_uxn_opcodes_h_l369_c11_9fc2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l369_c11_9fc2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l369_c11_9fc2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l369_c7_b2ff]
signal n16_MUX_uxn_opcodes_h_l369_c7_b2ff_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l369_c7_b2ff_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l369_c7_b2ff_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l369_c7_b2ff_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l369_c7_b2ff]
signal result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_b2ff_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_b2ff_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_b2ff_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_b2ff_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l369_c7_b2ff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_b2ff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_b2ff_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_b2ff_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_b2ff_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l369_c7_b2ff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_b2ff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_b2ff_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_b2ff_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_b2ff_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l369_c7_b2ff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_b2ff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_b2ff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_b2ff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_b2ff_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l369_c7_b2ff]
signal result_stack_value_MUX_uxn_opcodes_h_l369_c7_b2ff_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l369_c7_b2ff_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l369_c7_b2ff_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l369_c7_b2ff_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l369_c7_b2ff]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_b2ff_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_b2ff_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_b2ff_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_b2ff_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l374_c11_86a6]
signal BIN_OP_EQ_uxn_opcodes_h_l374_c11_86a6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l374_c11_86a6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l374_c11_86a6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l374_c7_2b0a]
signal n16_MUX_uxn_opcodes_h_l374_c7_2b0a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l374_c7_2b0a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l374_c7_2b0a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l374_c7_2b0a_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l374_c7_2b0a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_2b0a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_2b0a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_2b0a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_2b0a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l374_c7_2b0a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_2b0a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_2b0a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_2b0a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_2b0a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l374_c7_2b0a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l374_c7_2b0a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l374_c7_2b0a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l374_c7_2b0a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l374_c7_2b0a_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l374_c7_2b0a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_2b0a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_2b0a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_2b0a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_2b0a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l374_c7_2b0a]
signal result_stack_value_MUX_uxn_opcodes_h_l374_c7_2b0a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l374_c7_2b0a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l374_c7_2b0a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l374_c7_2b0a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l374_c7_2b0a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l374_c7_2b0a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l374_c7_2b0a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l374_c7_2b0a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l374_c7_2b0a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l377_c11_d904]
signal BIN_OP_EQ_uxn_opcodes_h_l377_c11_d904_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l377_c11_d904_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l377_c11_d904_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l377_c7_d18d]
signal n16_MUX_uxn_opcodes_h_l377_c7_d18d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l377_c7_d18d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l377_c7_d18d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l377_c7_d18d_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l377_c7_d18d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l377_c7_d18d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l377_c7_d18d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l377_c7_d18d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l377_c7_d18d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l377_c7_d18d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l377_c7_d18d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l377_c7_d18d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l377_c7_d18d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l377_c7_d18d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l377_c7_d18d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l377_c7_d18d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l377_c7_d18d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l377_c7_d18d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l377_c7_d18d_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l377_c7_d18d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l377_c7_d18d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l377_c7_d18d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l377_c7_d18d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l377_c7_d18d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l377_c7_d18d]
signal result_stack_value_MUX_uxn_opcodes_h_l377_c7_d18d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l377_c7_d18d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l377_c7_d18d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l377_c7_d18d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l377_c7_d18d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l377_c7_d18d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l377_c7_d18d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l377_c7_d18d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l377_c7_d18d_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l378_c3_6e8e]
signal BIN_OP_OR_uxn_opcodes_h_l378_c3_6e8e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l378_c3_6e8e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l378_c3_6e8e_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l380_c32_8620]
signal BIN_OP_AND_uxn_opcodes_h_l380_c32_8620_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l380_c32_8620_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l380_c32_8620_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l380_c32_8c9d]
signal BIN_OP_GT_uxn_opcodes_h_l380_c32_8c9d_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l380_c32_8c9d_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l380_c32_8c9d_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l380_c32_2abb]
signal MUX_uxn_opcodes_h_l380_c32_2abb_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l380_c32_2abb_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l380_c32_2abb_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l380_c32_2abb_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l382_c11_7c4b]
signal BIN_OP_EQ_uxn_opcodes_h_l382_c11_7c4b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l382_c11_7c4b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l382_c11_7c4b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l382_c7_b705]
signal result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_b705_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_b705_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_b705_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_b705_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l382_c7_b705]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_b705_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_b705_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_b705_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_b705_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l382_c7_b705]
signal result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_b705_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_b705_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_b705_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_b705_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l382_c7_b705]
signal result_stack_value_MUX_uxn_opcodes_h_l382_c7_b705_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l382_c7_b705_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l382_c7_b705_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l382_c7_b705_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l382_c7_b705]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l382_c7_b705_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l382_c7_b705_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l382_c7_b705_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l382_c7_b705_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l388_c11_95b7]
signal BIN_OP_EQ_uxn_opcodes_h_l388_c11_95b7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l388_c11_95b7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l388_c11_95b7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l388_c7_69ee]
signal result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_69ee_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_69ee_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_69ee_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_69ee_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l388_c7_69ee]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_69ee_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_69ee_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_69ee_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_69ee_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l388_c7_69ee]
signal result_stack_value_MUX_uxn_opcodes_h_l388_c7_69ee_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l388_c7_69ee_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l388_c7_69ee_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l388_c7_69ee_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l388_c7_69ee]
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_69ee_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_69ee_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_69ee_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_69ee_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l392_c11_68a6]
signal BIN_OP_EQ_uxn_opcodes_h_l392_c11_68a6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l392_c11_68a6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l392_c11_68a6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l392_c7_9f73]
signal result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_9f73_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_9f73_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_9f73_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_9f73_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l392_c7_9f73]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_9f73_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_9f73_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_9f73_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_9f73_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l392_c7_9f73]
signal result_stack_value_MUX_uxn_opcodes_h_l392_c7_9f73_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l392_c7_9f73_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l392_c7_9f73_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l392_c7_9f73_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l392_c7_9f73]
signal result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_9f73_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_9f73_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_9f73_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_9f73_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l396_c11_3638]
signal BIN_OP_EQ_uxn_opcodes_h_l396_c11_3638_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l396_c11_3638_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l396_c11_3638_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l396_c7_9b57]
signal result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9b57_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9b57_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9b57_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9b57_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l396_c7_9b57]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9b57_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9b57_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9b57_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9b57_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l396_c7_9b57]
signal result_stack_value_MUX_uxn_opcodes_h_l396_c7_9b57_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l396_c7_9b57_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l396_c7_9b57_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l396_c7_9b57_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l396_c7_9b57]
signal result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9b57_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9b57_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9b57_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9b57_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l398_c34_1d62]
signal CONST_SR_8_uxn_opcodes_h_l398_c34_1d62_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l398_c34_1d62_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l400_c11_ef54]
signal BIN_OP_EQ_uxn_opcodes_h_l400_c11_ef54_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l400_c11_ef54_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l400_c11_ef54_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l400_c7_d71c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_d71c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_d71c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_d71c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_d71c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l400_c7_d71c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_d71c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_d71c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_d71c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_d71c_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l400_c7_d71c]
signal result_stack_value_MUX_uxn_opcodes_h_l400_c7_d71c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l400_c7_d71c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l400_c7_d71c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l400_c7_d71c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l400_c7_d71c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_d71c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_d71c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_d71c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_d71c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l404_c11_38dc]
signal BIN_OP_EQ_uxn_opcodes_h_l404_c11_38dc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l404_c11_38dc_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l404_c11_38dc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l404_c7_6a74]
signal result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_6a74_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_6a74_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_6a74_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_6a74_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l404_c7_6a74]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_6a74_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_6a74_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_6a74_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_6a74_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l404_c7_6a74]
signal result_stack_value_MUX_uxn_opcodes_h_l404_c7_6a74_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l404_c7_6a74_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l404_c7_6a74_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l404_c7_6a74_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l404_c7_6a74]
signal result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_6a74_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_6a74_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_6a74_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_6a74_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l408_c11_ec71]
signal BIN_OP_EQ_uxn_opcodes_h_l408_c11_ec71_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l408_c11_ec71_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l408_c11_ec71_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l408_c7_4789]
signal result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_4789_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_4789_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_4789_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_4789_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l408_c7_4789]
signal result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_4789_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_4789_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_4789_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_4789_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l371_l356_DUPLICATE_766f
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l371_l356_DUPLICATE_766f_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l371_l356_DUPLICATE_766f_return_output : unsigned(15 downto 0);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l390_l406_DUPLICATE_743e
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l390_l406_DUPLICATE_743e_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l390_l406_DUPLICATE_743e_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l346_c6_01d4
BIN_OP_EQ_uxn_opcodes_h_l346_c6_01d4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l346_c6_01d4_left,
BIN_OP_EQ_uxn_opcodes_h_l346_c6_01d4_right,
BIN_OP_EQ_uxn_opcodes_h_l346_c6_01d4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l346_c1_5f8c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l346_c1_5f8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l346_c1_5f8c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l346_c1_5f8c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l346_c1_5f8c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l346_c1_5f8c_return_output);

-- n16_MUX_uxn_opcodes_h_l346_c2_541f
n16_MUX_uxn_opcodes_h_l346_c2_541f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l346_c2_541f_cond,
n16_MUX_uxn_opcodes_h_l346_c2_541f_iftrue,
n16_MUX_uxn_opcodes_h_l346_c2_541f_iffalse,
n16_MUX_uxn_opcodes_h_l346_c2_541f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l346_c2_541f
result_is_stack_write_MUX_uxn_opcodes_h_l346_c2_541f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l346_c2_541f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l346_c2_541f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l346_c2_541f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l346_c2_541f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c2_541f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c2_541f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c2_541f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c2_541f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c2_541f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c2_541f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c2_541f
result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c2_541f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c2_541f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c2_541f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c2_541f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c2_541f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l346_c2_541f
result_is_opc_done_MUX_uxn_opcodes_h_l346_c2_541f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l346_c2_541f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l346_c2_541f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l346_c2_541f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l346_c2_541f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l346_c2_541f
result_stack_value_MUX_uxn_opcodes_h_l346_c2_541f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l346_c2_541f_cond,
result_stack_value_MUX_uxn_opcodes_h_l346_c2_541f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l346_c2_541f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l346_c2_541f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l346_c2_541f
result_is_sp_shift_MUX_uxn_opcodes_h_l346_c2_541f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l346_c2_541f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l346_c2_541f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l346_c2_541f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l346_c2_541f_return_output);

-- t16_MUX_uxn_opcodes_h_l346_c2_541f
t16_MUX_uxn_opcodes_h_l346_c2_541f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l346_c2_541f_cond,
t16_MUX_uxn_opcodes_h_l346_c2_541f_iftrue,
t16_MUX_uxn_opcodes_h_l346_c2_541f_iffalse,
t16_MUX_uxn_opcodes_h_l346_c2_541f_return_output);

-- printf_uxn_opcodes_h_l347_c3_cea0_uxn_opcodes_h_l347_c3_cea0
printf_uxn_opcodes_h_l347_c3_cea0_uxn_opcodes_h_l347_c3_cea0 : entity work.printf_uxn_opcodes_h_l347_c3_cea0_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l347_c3_cea0_uxn_opcodes_h_l347_c3_cea0_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l351_c11_14c5
BIN_OP_EQ_uxn_opcodes_h_l351_c11_14c5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l351_c11_14c5_left,
BIN_OP_EQ_uxn_opcodes_h_l351_c11_14c5_right,
BIN_OP_EQ_uxn_opcodes_h_l351_c11_14c5_return_output);

-- n16_MUX_uxn_opcodes_h_l351_c7_93b9
n16_MUX_uxn_opcodes_h_l351_c7_93b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l351_c7_93b9_cond,
n16_MUX_uxn_opcodes_h_l351_c7_93b9_iftrue,
n16_MUX_uxn_opcodes_h_l351_c7_93b9_iffalse,
n16_MUX_uxn_opcodes_h_l351_c7_93b9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_93b9
result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_93b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_93b9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_93b9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_93b9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_93b9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_93b9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_93b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_93b9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_93b9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_93b9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_93b9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_93b9
result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_93b9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_93b9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_93b9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_93b9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_93b9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_93b9
result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_93b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_93b9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_93b9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_93b9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_93b9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l351_c7_93b9
result_stack_value_MUX_uxn_opcodes_h_l351_c7_93b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l351_c7_93b9_cond,
result_stack_value_MUX_uxn_opcodes_h_l351_c7_93b9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l351_c7_93b9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l351_c7_93b9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_93b9
result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_93b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_93b9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_93b9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_93b9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_93b9_return_output);

-- t16_MUX_uxn_opcodes_h_l351_c7_93b9
t16_MUX_uxn_opcodes_h_l351_c7_93b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l351_c7_93b9_cond,
t16_MUX_uxn_opcodes_h_l351_c7_93b9_iftrue,
t16_MUX_uxn_opcodes_h_l351_c7_93b9_iffalse,
t16_MUX_uxn_opcodes_h_l351_c7_93b9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l354_c11_e219
BIN_OP_EQ_uxn_opcodes_h_l354_c11_e219 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l354_c11_e219_left,
BIN_OP_EQ_uxn_opcodes_h_l354_c11_e219_right,
BIN_OP_EQ_uxn_opcodes_h_l354_c11_e219_return_output);

-- n16_MUX_uxn_opcodes_h_l354_c7_1795
n16_MUX_uxn_opcodes_h_l354_c7_1795 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l354_c7_1795_cond,
n16_MUX_uxn_opcodes_h_l354_c7_1795_iftrue,
n16_MUX_uxn_opcodes_h_l354_c7_1795_iffalse,
n16_MUX_uxn_opcodes_h_l354_c7_1795_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_1795
result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_1795 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_1795_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_1795_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_1795_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_1795_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_1795
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_1795 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_1795_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_1795_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_1795_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_1795_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_1795
result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_1795 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_1795_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_1795_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_1795_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_1795_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_1795
result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_1795 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_1795_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_1795_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_1795_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_1795_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l354_c7_1795
result_stack_value_MUX_uxn_opcodes_h_l354_c7_1795 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l354_c7_1795_cond,
result_stack_value_MUX_uxn_opcodes_h_l354_c7_1795_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l354_c7_1795_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l354_c7_1795_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_1795
result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_1795 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_1795_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_1795_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_1795_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_1795_return_output);

-- t16_MUX_uxn_opcodes_h_l354_c7_1795
t16_MUX_uxn_opcodes_h_l354_c7_1795 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l354_c7_1795_cond,
t16_MUX_uxn_opcodes_h_l354_c7_1795_iftrue,
t16_MUX_uxn_opcodes_h_l354_c7_1795_iffalse,
t16_MUX_uxn_opcodes_h_l354_c7_1795_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l359_c11_7e44
BIN_OP_EQ_uxn_opcodes_h_l359_c11_7e44 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l359_c11_7e44_left,
BIN_OP_EQ_uxn_opcodes_h_l359_c11_7e44_right,
BIN_OP_EQ_uxn_opcodes_h_l359_c11_7e44_return_output);

-- n16_MUX_uxn_opcodes_h_l359_c7_1c7e
n16_MUX_uxn_opcodes_h_l359_c7_1c7e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l359_c7_1c7e_cond,
n16_MUX_uxn_opcodes_h_l359_c7_1c7e_iftrue,
n16_MUX_uxn_opcodes_h_l359_c7_1c7e_iffalse,
n16_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_1c7e
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_1c7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_1c7e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_1c7e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_1c7e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_1c7e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_1c7e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_1c7e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_1c7e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_1c7e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_1c7e
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_1c7e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_1c7e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_1c7e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_1c7e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_1c7e
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_1c7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_1c7e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_1c7e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_1c7e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l359_c7_1c7e
result_stack_value_MUX_uxn_opcodes_h_l359_c7_1c7e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l359_c7_1c7e_cond,
result_stack_value_MUX_uxn_opcodes_h_l359_c7_1c7e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l359_c7_1c7e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_1c7e
result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_1c7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_1c7e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_1c7e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_1c7e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output);

-- t16_MUX_uxn_opcodes_h_l359_c7_1c7e
t16_MUX_uxn_opcodes_h_l359_c7_1c7e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l359_c7_1c7e_cond,
t16_MUX_uxn_opcodes_h_l359_c7_1c7e_iftrue,
t16_MUX_uxn_opcodes_h_l359_c7_1c7e_iffalse,
t16_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l362_c11_e6df
BIN_OP_EQ_uxn_opcodes_h_l362_c11_e6df : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l362_c11_e6df_left,
BIN_OP_EQ_uxn_opcodes_h_l362_c11_e6df_right,
BIN_OP_EQ_uxn_opcodes_h_l362_c11_e6df_return_output);

-- n16_MUX_uxn_opcodes_h_l362_c7_4bf4
n16_MUX_uxn_opcodes_h_l362_c7_4bf4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l362_c7_4bf4_cond,
n16_MUX_uxn_opcodes_h_l362_c7_4bf4_iftrue,
n16_MUX_uxn_opcodes_h_l362_c7_4bf4_iffalse,
n16_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_4bf4
result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_4bf4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_4bf4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_4bf4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_4bf4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_4bf4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_4bf4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_4bf4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_4bf4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_4bf4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_4bf4
result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_4bf4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_4bf4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_4bf4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_4bf4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_4bf4
result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_4bf4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_4bf4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_4bf4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_4bf4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l362_c7_4bf4
result_stack_value_MUX_uxn_opcodes_h_l362_c7_4bf4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l362_c7_4bf4_cond,
result_stack_value_MUX_uxn_opcodes_h_l362_c7_4bf4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l362_c7_4bf4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_4bf4
result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_4bf4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_4bf4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_4bf4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_4bf4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output);

-- t16_MUX_uxn_opcodes_h_l362_c7_4bf4
t16_MUX_uxn_opcodes_h_l362_c7_4bf4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l362_c7_4bf4_cond,
t16_MUX_uxn_opcodes_h_l362_c7_4bf4_iftrue,
t16_MUX_uxn_opcodes_h_l362_c7_4bf4_iffalse,
t16_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l363_c3_0448
BIN_OP_OR_uxn_opcodes_h_l363_c3_0448 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l363_c3_0448_left,
BIN_OP_OR_uxn_opcodes_h_l363_c3_0448_right,
BIN_OP_OR_uxn_opcodes_h_l363_c3_0448_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l366_c11_3f73
BIN_OP_EQ_uxn_opcodes_h_l366_c11_3f73 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l366_c11_3f73_left,
BIN_OP_EQ_uxn_opcodes_h_l366_c11_3f73_right,
BIN_OP_EQ_uxn_opcodes_h_l366_c11_3f73_return_output);

-- n16_MUX_uxn_opcodes_h_l366_c7_d2c7
n16_MUX_uxn_opcodes_h_l366_c7_d2c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l366_c7_d2c7_cond,
n16_MUX_uxn_opcodes_h_l366_c7_d2c7_iftrue,
n16_MUX_uxn_opcodes_h_l366_c7_d2c7_iffalse,
n16_MUX_uxn_opcodes_h_l366_c7_d2c7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d2c7
result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d2c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d2c7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d2c7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d2c7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d2c7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d2c7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d2c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d2c7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d2c7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d2c7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d2c7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_d2c7
result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_d2c7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_d2c7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_d2c7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_d2c7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_d2c7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d2c7
result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d2c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d2c7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d2c7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d2c7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d2c7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l366_c7_d2c7
result_stack_value_MUX_uxn_opcodes_h_l366_c7_d2c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l366_c7_d2c7_cond,
result_stack_value_MUX_uxn_opcodes_h_l366_c7_d2c7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l366_c7_d2c7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l366_c7_d2c7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_d2c7
result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_d2c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_d2c7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_d2c7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_d2c7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_d2c7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l369_c11_9fc2
BIN_OP_EQ_uxn_opcodes_h_l369_c11_9fc2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l369_c11_9fc2_left,
BIN_OP_EQ_uxn_opcodes_h_l369_c11_9fc2_right,
BIN_OP_EQ_uxn_opcodes_h_l369_c11_9fc2_return_output);

-- n16_MUX_uxn_opcodes_h_l369_c7_b2ff
n16_MUX_uxn_opcodes_h_l369_c7_b2ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l369_c7_b2ff_cond,
n16_MUX_uxn_opcodes_h_l369_c7_b2ff_iftrue,
n16_MUX_uxn_opcodes_h_l369_c7_b2ff_iffalse,
n16_MUX_uxn_opcodes_h_l369_c7_b2ff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_b2ff
result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_b2ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_b2ff_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_b2ff_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_b2ff_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_b2ff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_b2ff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_b2ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_b2ff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_b2ff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_b2ff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_b2ff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_b2ff
result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_b2ff : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_b2ff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_b2ff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_b2ff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_b2ff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_b2ff
result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_b2ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_b2ff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_b2ff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_b2ff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_b2ff_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l369_c7_b2ff
result_stack_value_MUX_uxn_opcodes_h_l369_c7_b2ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l369_c7_b2ff_cond,
result_stack_value_MUX_uxn_opcodes_h_l369_c7_b2ff_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l369_c7_b2ff_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l369_c7_b2ff_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_b2ff
result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_b2ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_b2ff_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_b2ff_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_b2ff_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_b2ff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l374_c11_86a6
BIN_OP_EQ_uxn_opcodes_h_l374_c11_86a6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l374_c11_86a6_left,
BIN_OP_EQ_uxn_opcodes_h_l374_c11_86a6_right,
BIN_OP_EQ_uxn_opcodes_h_l374_c11_86a6_return_output);

-- n16_MUX_uxn_opcodes_h_l374_c7_2b0a
n16_MUX_uxn_opcodes_h_l374_c7_2b0a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l374_c7_2b0a_cond,
n16_MUX_uxn_opcodes_h_l374_c7_2b0a_iftrue,
n16_MUX_uxn_opcodes_h_l374_c7_2b0a_iffalse,
n16_MUX_uxn_opcodes_h_l374_c7_2b0a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_2b0a
result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_2b0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_2b0a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_2b0a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_2b0a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_2b0a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_2b0a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_2b0a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_2b0a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_2b0a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_2b0a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_2b0a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l374_c7_2b0a
result_sp_relative_shift_MUX_uxn_opcodes_h_l374_c7_2b0a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l374_c7_2b0a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l374_c7_2b0a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l374_c7_2b0a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l374_c7_2b0a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_2b0a
result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_2b0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_2b0a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_2b0a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_2b0a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_2b0a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l374_c7_2b0a
result_stack_value_MUX_uxn_opcodes_h_l374_c7_2b0a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l374_c7_2b0a_cond,
result_stack_value_MUX_uxn_opcodes_h_l374_c7_2b0a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l374_c7_2b0a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l374_c7_2b0a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l374_c7_2b0a
result_is_sp_shift_MUX_uxn_opcodes_h_l374_c7_2b0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l374_c7_2b0a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l374_c7_2b0a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l374_c7_2b0a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l374_c7_2b0a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l377_c11_d904
BIN_OP_EQ_uxn_opcodes_h_l377_c11_d904 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l377_c11_d904_left,
BIN_OP_EQ_uxn_opcodes_h_l377_c11_d904_right,
BIN_OP_EQ_uxn_opcodes_h_l377_c11_d904_return_output);

-- n16_MUX_uxn_opcodes_h_l377_c7_d18d
n16_MUX_uxn_opcodes_h_l377_c7_d18d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l377_c7_d18d_cond,
n16_MUX_uxn_opcodes_h_l377_c7_d18d_iftrue,
n16_MUX_uxn_opcodes_h_l377_c7_d18d_iffalse,
n16_MUX_uxn_opcodes_h_l377_c7_d18d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l377_c7_d18d
result_is_stack_write_MUX_uxn_opcodes_h_l377_c7_d18d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l377_c7_d18d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l377_c7_d18d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l377_c7_d18d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l377_c7_d18d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l377_c7_d18d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l377_c7_d18d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l377_c7_d18d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l377_c7_d18d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l377_c7_d18d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l377_c7_d18d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l377_c7_d18d
result_sp_relative_shift_MUX_uxn_opcodes_h_l377_c7_d18d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l377_c7_d18d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l377_c7_d18d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l377_c7_d18d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l377_c7_d18d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l377_c7_d18d
result_is_opc_done_MUX_uxn_opcodes_h_l377_c7_d18d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l377_c7_d18d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l377_c7_d18d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l377_c7_d18d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l377_c7_d18d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l377_c7_d18d
result_stack_value_MUX_uxn_opcodes_h_l377_c7_d18d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l377_c7_d18d_cond,
result_stack_value_MUX_uxn_opcodes_h_l377_c7_d18d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l377_c7_d18d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l377_c7_d18d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l377_c7_d18d
result_is_sp_shift_MUX_uxn_opcodes_h_l377_c7_d18d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l377_c7_d18d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l377_c7_d18d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l377_c7_d18d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l377_c7_d18d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l378_c3_6e8e
BIN_OP_OR_uxn_opcodes_h_l378_c3_6e8e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l378_c3_6e8e_left,
BIN_OP_OR_uxn_opcodes_h_l378_c3_6e8e_right,
BIN_OP_OR_uxn_opcodes_h_l378_c3_6e8e_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l380_c32_8620
BIN_OP_AND_uxn_opcodes_h_l380_c32_8620 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l380_c32_8620_left,
BIN_OP_AND_uxn_opcodes_h_l380_c32_8620_right,
BIN_OP_AND_uxn_opcodes_h_l380_c32_8620_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l380_c32_8c9d
BIN_OP_GT_uxn_opcodes_h_l380_c32_8c9d : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l380_c32_8c9d_left,
BIN_OP_GT_uxn_opcodes_h_l380_c32_8c9d_right,
BIN_OP_GT_uxn_opcodes_h_l380_c32_8c9d_return_output);

-- MUX_uxn_opcodes_h_l380_c32_2abb
MUX_uxn_opcodes_h_l380_c32_2abb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l380_c32_2abb_cond,
MUX_uxn_opcodes_h_l380_c32_2abb_iftrue,
MUX_uxn_opcodes_h_l380_c32_2abb_iffalse,
MUX_uxn_opcodes_h_l380_c32_2abb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l382_c11_7c4b
BIN_OP_EQ_uxn_opcodes_h_l382_c11_7c4b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l382_c11_7c4b_left,
BIN_OP_EQ_uxn_opcodes_h_l382_c11_7c4b_right,
BIN_OP_EQ_uxn_opcodes_h_l382_c11_7c4b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_b705
result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_b705 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_b705_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_b705_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_b705_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_b705_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_b705
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_b705 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_b705_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_b705_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_b705_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_b705_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_b705
result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_b705 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_b705_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_b705_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_b705_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_b705_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l382_c7_b705
result_stack_value_MUX_uxn_opcodes_h_l382_c7_b705 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l382_c7_b705_cond,
result_stack_value_MUX_uxn_opcodes_h_l382_c7_b705_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l382_c7_b705_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l382_c7_b705_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l382_c7_b705
result_is_sp_shift_MUX_uxn_opcodes_h_l382_c7_b705 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l382_c7_b705_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l382_c7_b705_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l382_c7_b705_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l382_c7_b705_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l388_c11_95b7
BIN_OP_EQ_uxn_opcodes_h_l388_c11_95b7 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l388_c11_95b7_left,
BIN_OP_EQ_uxn_opcodes_h_l388_c11_95b7_right,
BIN_OP_EQ_uxn_opcodes_h_l388_c11_95b7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_69ee
result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_69ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_69ee_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_69ee_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_69ee_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_69ee_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_69ee
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_69ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_69ee_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_69ee_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_69ee_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_69ee_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l388_c7_69ee
result_stack_value_MUX_uxn_opcodes_h_l388_c7_69ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l388_c7_69ee_cond,
result_stack_value_MUX_uxn_opcodes_h_l388_c7_69ee_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l388_c7_69ee_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l388_c7_69ee_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_69ee
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_69ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_69ee_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_69ee_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_69ee_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_69ee_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l392_c11_68a6
BIN_OP_EQ_uxn_opcodes_h_l392_c11_68a6 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l392_c11_68a6_left,
BIN_OP_EQ_uxn_opcodes_h_l392_c11_68a6_right,
BIN_OP_EQ_uxn_opcodes_h_l392_c11_68a6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_9f73
result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_9f73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_9f73_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_9f73_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_9f73_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_9f73_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_9f73
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_9f73 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_9f73_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_9f73_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_9f73_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_9f73_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l392_c7_9f73
result_stack_value_MUX_uxn_opcodes_h_l392_c7_9f73 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l392_c7_9f73_cond,
result_stack_value_MUX_uxn_opcodes_h_l392_c7_9f73_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l392_c7_9f73_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l392_c7_9f73_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_9f73
result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_9f73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_9f73_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_9f73_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_9f73_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_9f73_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l396_c11_3638
BIN_OP_EQ_uxn_opcodes_h_l396_c11_3638 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l396_c11_3638_left,
BIN_OP_EQ_uxn_opcodes_h_l396_c11_3638_right,
BIN_OP_EQ_uxn_opcodes_h_l396_c11_3638_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9b57
result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9b57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9b57_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9b57_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9b57_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9b57_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9b57
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9b57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9b57_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9b57_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9b57_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9b57_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l396_c7_9b57
result_stack_value_MUX_uxn_opcodes_h_l396_c7_9b57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l396_c7_9b57_cond,
result_stack_value_MUX_uxn_opcodes_h_l396_c7_9b57_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l396_c7_9b57_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l396_c7_9b57_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9b57
result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9b57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9b57_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9b57_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9b57_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9b57_return_output);

-- CONST_SR_8_uxn_opcodes_h_l398_c34_1d62
CONST_SR_8_uxn_opcodes_h_l398_c34_1d62 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l398_c34_1d62_x,
CONST_SR_8_uxn_opcodes_h_l398_c34_1d62_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l400_c11_ef54
BIN_OP_EQ_uxn_opcodes_h_l400_c11_ef54 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l400_c11_ef54_left,
BIN_OP_EQ_uxn_opcodes_h_l400_c11_ef54_right,
BIN_OP_EQ_uxn_opcodes_h_l400_c11_ef54_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_d71c
result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_d71c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_d71c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_d71c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_d71c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_d71c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_d71c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_d71c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_d71c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_d71c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_d71c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_d71c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l400_c7_d71c
result_stack_value_MUX_uxn_opcodes_h_l400_c7_d71c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l400_c7_d71c_cond,
result_stack_value_MUX_uxn_opcodes_h_l400_c7_d71c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l400_c7_d71c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l400_c7_d71c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_d71c
result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_d71c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_d71c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_d71c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_d71c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_d71c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l404_c11_38dc
BIN_OP_EQ_uxn_opcodes_h_l404_c11_38dc : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l404_c11_38dc_left,
BIN_OP_EQ_uxn_opcodes_h_l404_c11_38dc_right,
BIN_OP_EQ_uxn_opcodes_h_l404_c11_38dc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_6a74
result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_6a74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_6a74_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_6a74_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_6a74_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_6a74_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_6a74
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_6a74 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_6a74_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_6a74_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_6a74_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_6a74_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l404_c7_6a74
result_stack_value_MUX_uxn_opcodes_h_l404_c7_6a74 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l404_c7_6a74_cond,
result_stack_value_MUX_uxn_opcodes_h_l404_c7_6a74_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l404_c7_6a74_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l404_c7_6a74_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_6a74
result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_6a74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_6a74_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_6a74_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_6a74_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_6a74_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l408_c11_ec71
BIN_OP_EQ_uxn_opcodes_h_l408_c11_ec71 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l408_c11_ec71_left,
BIN_OP_EQ_uxn_opcodes_h_l408_c11_ec71_right,
BIN_OP_EQ_uxn_opcodes_h_l408_c11_ec71_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_4789
result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_4789 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_4789_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_4789_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_4789_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_4789_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_4789
result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_4789 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_4789_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_4789_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_4789_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_4789_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l371_l356_DUPLICATE_766f
CONST_SL_8_uint16_t_uxn_opcodes_h_l371_l356_DUPLICATE_766f : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l371_l356_DUPLICATE_766f_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l371_l356_DUPLICATE_766f_return_output);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l390_l406_DUPLICATE_743e
CONST_SR_8_uint16_t_uxn_opcodes_h_l390_l406_DUPLICATE_743e : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_opcodes_h_l390_l406_DUPLICATE_743e_x,
CONST_SR_8_uint16_t_uxn_opcodes_h_l390_l406_DUPLICATE_743e_return_output);



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
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l346_c6_01d4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l346_c1_5f8c_return_output,
 n16_MUX_uxn_opcodes_h_l346_c2_541f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l346_c2_541f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c2_541f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c2_541f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l346_c2_541f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l346_c2_541f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l346_c2_541f_return_output,
 t16_MUX_uxn_opcodes_h_l346_c2_541f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l351_c11_14c5_return_output,
 n16_MUX_uxn_opcodes_h_l351_c7_93b9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_93b9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_93b9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_93b9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_93b9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l351_c7_93b9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_93b9_return_output,
 t16_MUX_uxn_opcodes_h_l351_c7_93b9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l354_c11_e219_return_output,
 n16_MUX_uxn_opcodes_h_l354_c7_1795_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_1795_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_1795_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_1795_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_1795_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l354_c7_1795_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_1795_return_output,
 t16_MUX_uxn_opcodes_h_l354_c7_1795_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l359_c11_7e44_return_output,
 n16_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output,
 t16_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l362_c11_e6df_return_output,
 n16_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output,
 t16_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output,
 BIN_OP_OR_uxn_opcodes_h_l363_c3_0448_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l366_c11_3f73_return_output,
 n16_MUX_uxn_opcodes_h_l366_c7_d2c7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d2c7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d2c7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_d2c7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d2c7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l366_c7_d2c7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_d2c7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l369_c11_9fc2_return_output,
 n16_MUX_uxn_opcodes_h_l369_c7_b2ff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_b2ff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_b2ff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_b2ff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_b2ff_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l369_c7_b2ff_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_b2ff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l374_c11_86a6_return_output,
 n16_MUX_uxn_opcodes_h_l374_c7_2b0a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_2b0a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_2b0a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l374_c7_2b0a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_2b0a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l374_c7_2b0a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l374_c7_2b0a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l377_c11_d904_return_output,
 n16_MUX_uxn_opcodes_h_l377_c7_d18d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l377_c7_d18d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l377_c7_d18d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l377_c7_d18d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l377_c7_d18d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l377_c7_d18d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l377_c7_d18d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l378_c3_6e8e_return_output,
 BIN_OP_AND_uxn_opcodes_h_l380_c32_8620_return_output,
 BIN_OP_GT_uxn_opcodes_h_l380_c32_8c9d_return_output,
 MUX_uxn_opcodes_h_l380_c32_2abb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l382_c11_7c4b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_b705_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_b705_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_b705_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l382_c7_b705_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l382_c7_b705_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l388_c11_95b7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_69ee_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_69ee_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l388_c7_69ee_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_69ee_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l392_c11_68a6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_9f73_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_9f73_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l392_c7_9f73_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_9f73_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l396_c11_3638_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9b57_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9b57_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l396_c7_9b57_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9b57_return_output,
 CONST_SR_8_uxn_opcodes_h_l398_c34_1d62_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l400_c11_ef54_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_d71c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_d71c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l400_c7_d71c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_d71c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l404_c11_38dc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_6a74_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_6a74_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l404_c7_6a74_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_6a74_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l408_c11_ec71_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_4789_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_4789_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l371_l356_DUPLICATE_766f_return_output,
 CONST_SR_8_uint16_t_uxn_opcodes_h_l390_l406_DUPLICATE_743e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c6_01d4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c6_01d4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c6_01d4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l346_c1_5f8c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l346_c1_5f8c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l346_c1_5f8c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l346_c1_5f8c_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l346_c2_541f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l346_c2_541f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l351_c7_93b9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l346_c2_541f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l346_c2_541f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l346_c2_541f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l346_c2_541f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_93b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l346_c2_541f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l346_c2_541f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c2_541f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l348_c3_8f8b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c2_541f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_93b9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c2_541f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c2_541f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c2_541f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c2_541f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_93b9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c2_541f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c2_541f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l346_c2_541f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l346_c2_541f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_93b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l346_c2_541f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l346_c2_541f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l346_c2_541f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l346_c2_541f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l351_c7_93b9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l346_c2_541f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l346_c2_541f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l346_c2_541f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l346_c2_541f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_93b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l346_c2_541f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l346_c2_541f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l346_c2_541f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l346_c2_541f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l351_c7_93b9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l346_c2_541f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l346_c2_541f_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l347_c3_cea0_uxn_opcodes_h_l347_c3_cea0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l351_c11_14c5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l351_c11_14c5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l351_c11_14c5_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l351_c7_93b9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l351_c7_93b9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l354_c7_1795_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l351_c7_93b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_93b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_93b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_1795_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_93b9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_93b9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l352_c3_657e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_93b9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_1795_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_93b9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_93b9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_93b9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_1795_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_93b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_93b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_93b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_1795_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_93b9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l351_c7_93b9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l351_c7_93b9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l354_c7_1795_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l351_c7_93b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_93b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_93b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_1795_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_93b9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l351_c7_93b9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l351_c7_93b9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l354_c7_1795_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l351_c7_93b9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l354_c11_e219_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l354_c11_e219_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l354_c11_e219_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l354_c7_1795_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l354_c7_1795_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l354_c7_1795_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_1795_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_1795_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_1795_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_1795_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l357_c3_d1aa : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_1795_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_1795_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_1795_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_1795_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_1795_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_1795_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_1795_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_1795_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l354_c7_1795_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l354_c7_1795_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l354_c7_1795_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_1795_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_1795_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_1795_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l354_c7_1795_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l354_c7_1795_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l354_c7_1795_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_7e44_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_7e44_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_7e44_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l359_c7_1c7e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l359_c7_1c7e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l359_c7_1c7e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_1c7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_1c7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_1c7e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_1c7e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l360_c3_ee59 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_1c7e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_1c7e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_1c7e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_1c7e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_1c7e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_1c7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_1c7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_1c7e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l359_c7_1c7e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l359_c7_1c7e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l359_c7_1c7e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_1c7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_1c7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_1c7e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l359_c7_1c7e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l359_c7_1c7e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l359_c7_1c7e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_e6df_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_e6df_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_e6df_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l362_c7_4bf4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l362_c7_4bf4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l366_c7_d2c7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l362_c7_4bf4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_4bf4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_4bf4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d2c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_4bf4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_4bf4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l364_c3_df5d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_4bf4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d2c7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_4bf4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_4bf4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_4bf4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_d2c7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_4bf4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_4bf4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_4bf4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d2c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_4bf4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_4bf4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_4bf4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l366_c7_d2c7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_4bf4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_4bf4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_4bf4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_d2c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_4bf4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l362_c7_4bf4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l362_c7_4bf4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l362_c7_4bf4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l363_c3_0448_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l363_c3_0448_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l363_c3_0448_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_3f73_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_3f73_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_3f73_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l366_c7_d2c7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l366_c7_d2c7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l369_c7_b2ff_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l366_c7_d2c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d2c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d2c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_b2ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d2c7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d2c7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_5d75 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d2c7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_b2ff_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d2c7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_d2c7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_d2c7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_b2ff_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_d2c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d2c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d2c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_b2ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d2c7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l366_c7_d2c7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l366_c7_d2c7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l369_c7_b2ff_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l366_c7_d2c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_d2c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_d2c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_b2ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_d2c7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l369_c11_9fc2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l369_c11_9fc2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l369_c11_9fc2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l369_c7_b2ff_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l369_c7_b2ff_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l374_c7_2b0a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l369_c7_b2ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_b2ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_b2ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_2b0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_b2ff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_b2ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l372_c3_5e92 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_b2ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_2b0a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_b2ff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_b2ff_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_b2ff_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l374_c7_2b0a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_b2ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_b2ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_b2ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_2b0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_b2ff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l369_c7_b2ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l369_c7_b2ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l374_c7_2b0a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l369_c7_b2ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_b2ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_b2ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l374_c7_2b0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_b2ff_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_86a6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_86a6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_86a6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l374_c7_2b0a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l374_c7_2b0a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l377_c7_d18d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l374_c7_2b0a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_2b0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_2b0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l377_c7_d18d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_2b0a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_2b0a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l375_c3_ba2b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_2b0a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l377_c7_d18d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_2b0a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l374_c7_2b0a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l374_c7_2b0a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l377_c7_d18d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l374_c7_2b0a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_2b0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_2b0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l377_c7_d18d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_2b0a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l374_c7_2b0a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l374_c7_2b0a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l377_c7_d18d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l374_c7_2b0a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l374_c7_2b0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l374_c7_2b0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l377_c7_d18d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l374_c7_2b0a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l377_c11_d904_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l377_c11_d904_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l377_c11_d904_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l377_c7_d18d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l377_c7_d18d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l377_c7_d18d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l377_c7_d18d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l377_c7_d18d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_b705_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l377_c7_d18d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l377_c7_d18d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l377_c7_d18d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_b705_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l377_c7_d18d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l377_c7_d18d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l377_c7_d18d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l377_c7_d18d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l377_c7_d18d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l377_c7_d18d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_b705_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l377_c7_d18d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l377_c7_d18d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l377_c7_d18d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l382_c7_b705_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l377_c7_d18d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l377_c7_d18d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l377_c7_d18d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l382_c7_b705_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l377_c7_d18d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l378_c3_6e8e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l378_c3_6e8e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l378_c3_6e8e_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l380_c32_2abb_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l380_c32_2abb_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l380_c32_2abb_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l380_c32_8620_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l380_c32_8620_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l380_c32_8620_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l380_c32_8c9d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l380_c32_8c9d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l380_c32_8c9d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l380_c32_2abb_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l382_c11_7c4b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l382_c11_7c4b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l382_c11_7c4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_b705_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_b705_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_69ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_b705_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_b705_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_731d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_b705_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_69ee_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_b705_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_b705_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_b705_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_69ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_b705_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l382_c7_b705_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l382_c7_b705_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l388_c7_69ee_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l382_c7_b705_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l382_c7_b705_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l382_c7_b705_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l382_c7_b705_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_95b7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_95b7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_95b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_69ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_69ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_9f73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_69ee_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_69ee_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_28c7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_69ee_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_9f73_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_69ee_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l388_c7_69ee_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l388_c7_69ee_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l392_c7_9f73_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l388_c7_69ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_69ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_69ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_9f73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_69ee_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_68a6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_68a6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_68a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_9f73_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_9f73_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9b57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_9f73_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_9f73_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l393_c3_a9d0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_9f73_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9b57_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_9f73_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l392_c7_9f73_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l392_c7_9f73_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l396_c7_9b57_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l392_c7_9f73_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_9f73_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_9f73_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9b57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_9f73_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l394_c24_86c5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_3638_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_3638_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_3638_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9b57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9b57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_d71c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9b57_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9b57_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l397_c3_f9b8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9b57_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_d71c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9b57_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l396_c7_9b57_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l396_c7_9b57_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l400_c7_d71c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l396_c7_9b57_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9b57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9b57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_d71c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9b57_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l398_c34_1d62_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l398_c34_1d62_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l398_c24_3196_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_ef54_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_ef54_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_ef54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_d71c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_d71c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_6a74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_d71c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_d71c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l401_c3_e1cd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_d71c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_6a74_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_d71c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l400_c7_d71c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l400_c7_d71c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l404_c7_6a74_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l400_c7_d71c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_d71c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_d71c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_6a74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_d71c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l404_c11_38dc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l404_c11_38dc_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l404_c11_38dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_6a74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_6a74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_4789_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_6a74_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_6a74_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l405_c3_f8c3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_6a74_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_6a74_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l404_c7_6a74_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l404_c7_6a74_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l404_c7_6a74_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_6a74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_6a74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_4789_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_6a74_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_ec71_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_ec71_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_ec71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_4789_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_4789_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_4789_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_4789_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_4789_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_4789_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l374_l388_l362_l359_l396_l351_l366_l408_l392_l400_l346_l377_l354_l369_l404_DUPLICATE_ce30_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l374_l362_l359_l351_l366_l346_l377_l354_l369_DUPLICATE_f7ef_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l374_l362_l359_l351_l366_l346_l377_l354_l369_l404_DUPLICATE_90ca_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l374_l362_l359_l351_l366_l382_l346_l354_l369_DUPLICATE_2983_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l374_l388_l362_l359_l396_l351_l366_l408_l382_l392_l400_l377_l354_l369_l404_DUPLICATE_8c85_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l363_l355_l378_l370_DUPLICATE_5e6d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l371_l356_DUPLICATE_766f_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l371_l356_DUPLICATE_766f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l404_l377_DUPLICATE_c88b_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l386_l402_DUPLICATE_f80b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l390_l406_DUPLICATE_743e_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l390_l406_DUPLICATE_743e_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l406_l390_DUPLICATE_74ec_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l342_l413_DUPLICATE_c13f_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l393_c3_a9d0 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_9f73_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l393_c3_a9d0;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_731d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_b705_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_731d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l369_c11_9fc2_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l405_c3_f8c3 := resize(to_unsigned(6, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_6a74_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l405_c3_f8c3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l354_c11_e219_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_95b7_right := to_unsigned(10, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_4789_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l404_c11_38dc_right := to_unsigned(14, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l357_c3_d1aa := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_1795_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l357_c3_d1aa;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l372_c3_5e92 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_b2ff_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l372_c3_5e92;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l375_c3_ba2b := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_2b0a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l375_c3_ba2b;
     VAR_BIN_OP_AND_uxn_opcodes_h_l380_c32_8620_right := to_unsigned(128, 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_b705_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l377_c11_d904_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_e6df_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l348_c3_8f8b := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c2_541f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l348_c3_8f8b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l401_c3_e1cd := resize(to_unsigned(5, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_d71c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l401_c3_e1cd;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l377_c7_d18d_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_5d75 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d2c7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_5d75;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l364_c3_df5d := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_4bf4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l364_c3_df5d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_3f73_right := to_unsigned(5, 3);
     VAR_BIN_OP_GT_uxn_opcodes_h_l380_c32_8c9d_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_3638_right := to_unsigned(12, 4);
     VAR_MUX_uxn_opcodes_h_l380_c32_2abb_iffalse := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_ef54_right := to_unsigned(13, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c6_01d4_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l346_c2_541f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_28c7 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_69ee_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_28c7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_ec71_right := to_unsigned(15, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l397_c3_f9b8 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9b57_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l397_c3_f9b8;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_4789_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l382_c11_7c4b_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_86a6_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_68a6_right := to_unsigned(11, 4);
     VAR_MUX_uxn_opcodes_h_l380_c32_2abb_iftrue := signed(std_logic_vector(resize(to_unsigned(6, 3), 8)));
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l346_c1_5f8c_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l352_c3_657e := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_93b9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l352_c3_657e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_7e44_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l360_c3_ee59 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_1c7e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l360_c3_ee59;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l382_c7_b705_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l351_c11_14c5_right := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l346_c1_5f8c_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l380_c32_8620_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l378_c3_6e8e_left := n16;
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l390_l406_DUPLICATE_743e_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l346_c2_541f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l351_c7_93b9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l354_c7_1795_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l359_c7_1c7e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l362_c7_4bf4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l366_c7_d2c7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l374_c7_2b0a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l377_c7_d18d_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c6_01d4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l351_c11_14c5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l354_c11_e219_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_7e44_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_e6df_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_3f73_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l369_c11_9fc2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_86a6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l377_c11_d904_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l382_c11_7c4b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_95b7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_68a6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_3638_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_ef54_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l404_c11_38dc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_ec71_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l363_c3_0448_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l398_c34_1d62_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l346_c2_541f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l351_c7_93b9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l359_c7_1c7e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l362_c7_4bf4_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l392_c11_68a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l392_c11_68a6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_68a6_left;
     BIN_OP_EQ_uxn_opcodes_h_l392_c11_68a6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_68a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_68a6_return_output := BIN_OP_EQ_uxn_opcodes_h_l392_c11_68a6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l374_l362_l359_l351_l366_l382_l346_l354_l369_DUPLICATE_2983 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l374_l362_l359_l351_l366_l382_l346_l354_l369_DUPLICATE_2983_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l400_c11_ef54] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l400_c11_ef54_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_ef54_left;
     BIN_OP_EQ_uxn_opcodes_h_l400_c11_ef54_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_ef54_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_ef54_return_output := BIN_OP_EQ_uxn_opcodes_h_l400_c11_ef54_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l374_l388_l362_l359_l396_l351_l366_l408_l382_l392_l400_l377_l354_l369_l404_DUPLICATE_8c85 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l374_l388_l362_l359_l396_l351_l366_l408_l382_l392_l400_l377_l354_l369_l404_DUPLICATE_8c85_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l351_c11_14c5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l351_c11_14c5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l351_c11_14c5_left;
     BIN_OP_EQ_uxn_opcodes_h_l351_c11_14c5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l351_c11_14c5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l351_c11_14c5_return_output := BIN_OP_EQ_uxn_opcodes_h_l351_c11_14c5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l366_c11_3f73] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l366_c11_3f73_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_3f73_left;
     BIN_OP_EQ_uxn_opcodes_h_l366_c11_3f73_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_3f73_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_3f73_return_output := BIN_OP_EQ_uxn_opcodes_h_l366_c11_3f73_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l374_l362_l359_l351_l366_l346_l377_l354_l369_DUPLICATE_f7ef LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l374_l362_l359_l351_l366_l346_l377_l354_l369_DUPLICATE_f7ef_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l374_l362_l359_l351_l366_l346_l377_l354_l369_l404_DUPLICATE_90ca LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l374_l362_l359_l351_l366_l346_l377_l354_l369_l404_DUPLICATE_90ca_return_output := result.stack_value;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l386_l402_DUPLICATE_f80b LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l386_l402_DUPLICATE_f80b_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l369_c11_9fc2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l369_c11_9fc2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l369_c11_9fc2_left;
     BIN_OP_EQ_uxn_opcodes_h_l369_c11_9fc2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l369_c11_9fc2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l369_c11_9fc2_return_output := BIN_OP_EQ_uxn_opcodes_h_l369_c11_9fc2_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l404_l377_DUPLICATE_c88b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l404_l377_DUPLICATE_c88b_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l359_c11_7e44] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l359_c11_7e44_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_7e44_left;
     BIN_OP_EQ_uxn_opcodes_h_l359_c11_7e44_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_7e44_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_7e44_return_output := BIN_OP_EQ_uxn_opcodes_h_l359_c11_7e44_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l362_c11_e6df] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l362_c11_e6df_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_e6df_left;
     BIN_OP_EQ_uxn_opcodes_h_l362_c11_e6df_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_e6df_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_e6df_return_output := BIN_OP_EQ_uxn_opcodes_h_l362_c11_e6df_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l363_l355_l378_l370_DUPLICATE_5e6d LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l363_l355_l378_l370_DUPLICATE_5e6d_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l377_c11_d904] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l377_c11_d904_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l377_c11_d904_left;
     BIN_OP_EQ_uxn_opcodes_h_l377_c11_d904_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l377_c11_d904_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l377_c11_d904_return_output := BIN_OP_EQ_uxn_opcodes_h_l377_c11_d904_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l404_c11_38dc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l404_c11_38dc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l404_c11_38dc_left;
     BIN_OP_EQ_uxn_opcodes_h_l404_c11_38dc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l404_c11_38dc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l404_c11_38dc_return_output := BIN_OP_EQ_uxn_opcodes_h_l404_c11_38dc_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l374_l388_l362_l359_l396_l351_l366_l408_l392_l400_l346_l377_l354_l369_l404_DUPLICATE_ce30 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l374_l388_l362_l359_l396_l351_l366_l408_l392_l400_l346_l377_l354_l369_l404_DUPLICATE_ce30_return_output := result.is_stack_write;

     -- BIN_OP_AND[uxn_opcodes_h_l380_c32_8620] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l380_c32_8620_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l380_c32_8620_left;
     BIN_OP_AND_uxn_opcodes_h_l380_c32_8620_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l380_c32_8620_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l380_c32_8620_return_output := BIN_OP_AND_uxn_opcodes_h_l380_c32_8620_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l398_c34_1d62] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l398_c34_1d62_x <= VAR_CONST_SR_8_uxn_opcodes_h_l398_c34_1d62_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l398_c34_1d62_return_output := CONST_SR_8_uxn_opcodes_h_l398_c34_1d62_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l388_c11_95b7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l388_c11_95b7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_95b7_left;
     BIN_OP_EQ_uxn_opcodes_h_l388_c11_95b7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_95b7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_95b7_return_output := BIN_OP_EQ_uxn_opcodes_h_l388_c11_95b7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l382_c11_7c4b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l382_c11_7c4b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l382_c11_7c4b_left;
     BIN_OP_EQ_uxn_opcodes_h_l382_c11_7c4b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l382_c11_7c4b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l382_c11_7c4b_return_output := BIN_OP_EQ_uxn_opcodes_h_l382_c11_7c4b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l346_c6_01d4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l346_c6_01d4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c6_01d4_left;
     BIN_OP_EQ_uxn_opcodes_h_l346_c6_01d4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c6_01d4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c6_01d4_return_output := BIN_OP_EQ_uxn_opcodes_h_l346_c6_01d4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l374_c11_86a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l374_c11_86a6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_86a6_left;
     BIN_OP_EQ_uxn_opcodes_h_l374_c11_86a6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_86a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_86a6_return_output := BIN_OP_EQ_uxn_opcodes_h_l374_c11_86a6_return_output;

     -- CONST_SR_8_uint16_t_uxn_opcodes_h_l390_l406_DUPLICATE_743e LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_opcodes_h_l390_l406_DUPLICATE_743e_x <= VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l390_l406_DUPLICATE_743e_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l390_l406_DUPLICATE_743e_return_output := CONST_SR_8_uint16_t_uxn_opcodes_h_l390_l406_DUPLICATE_743e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l396_c11_3638] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l396_c11_3638_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_3638_left;
     BIN_OP_EQ_uxn_opcodes_h_l396_c11_3638_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_3638_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_3638_return_output := BIN_OP_EQ_uxn_opcodes_h_l396_c11_3638_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l408_c11_ec71] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l408_c11_ec71_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_ec71_left;
     BIN_OP_EQ_uxn_opcodes_h_l408_c11_ec71_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_ec71_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_ec71_return_output := BIN_OP_EQ_uxn_opcodes_h_l408_c11_ec71_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l354_c11_e219] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l354_c11_e219_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l354_c11_e219_left;
     BIN_OP_EQ_uxn_opcodes_h_l354_c11_e219_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l354_c11_e219_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l354_c11_e219_return_output := BIN_OP_EQ_uxn_opcodes_h_l354_c11_e219_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l394_c24_86c5] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l394_c24_86c5_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l380_c32_8c9d_left := VAR_BIN_OP_AND_uxn_opcodes_h_l380_c32_8620_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l346_c1_5f8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c6_01d4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l346_c2_541f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c6_01d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l346_c2_541f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c6_01d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l346_c2_541f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c6_01d4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l346_c2_541f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c6_01d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c2_541f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c6_01d4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c2_541f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c6_01d4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l346_c2_541f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c6_01d4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l346_c2_541f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c6_01d4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l351_c7_93b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l351_c11_14c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_93b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l351_c11_14c5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_93b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l351_c11_14c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_93b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l351_c11_14c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_93b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l351_c11_14c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_93b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l351_c11_14c5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l351_c7_93b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l351_c11_14c5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l351_c7_93b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l351_c11_14c5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l354_c7_1795_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l354_c11_e219_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_1795_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l354_c11_e219_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_1795_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l354_c11_e219_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_1795_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l354_c11_e219_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_1795_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l354_c11_e219_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_1795_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l354_c11_e219_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l354_c7_1795_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l354_c11_e219_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l354_c7_1795_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l354_c11_e219_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l359_c7_1c7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_7e44_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_1c7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_7e44_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_1c7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_7e44_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_1c7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_7e44_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_1c7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_7e44_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_1c7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_7e44_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l359_c7_1c7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_7e44_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l359_c7_1c7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_7e44_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l362_c7_4bf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_e6df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_4bf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_e6df_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_4bf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_e6df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_4bf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_e6df_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_4bf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_e6df_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_4bf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_e6df_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_4bf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_e6df_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l362_c7_4bf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_e6df_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l366_c7_d2c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_3f73_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d2c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_3f73_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_d2c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_3f73_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d2c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_3f73_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_d2c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_3f73_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d2c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_3f73_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l366_c7_d2c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_3f73_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l369_c7_b2ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l369_c11_9fc2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_b2ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l369_c11_9fc2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_b2ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l369_c11_9fc2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_b2ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l369_c11_9fc2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_b2ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l369_c11_9fc2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_b2ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l369_c11_9fc2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l369_c7_b2ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l369_c11_9fc2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l374_c7_2b0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_86a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_2b0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_86a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l374_c7_2b0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_86a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_2b0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_86a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l374_c7_2b0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_86a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_2b0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_86a6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l374_c7_2b0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_86a6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l377_c7_d18d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l377_c11_d904_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l377_c7_d18d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l377_c11_d904_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l377_c7_d18d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l377_c11_d904_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l377_c7_d18d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l377_c11_d904_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l377_c7_d18d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l377_c11_d904_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l377_c7_d18d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l377_c11_d904_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l377_c7_d18d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l377_c11_d904_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_b705_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l382_c11_7c4b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l382_c7_b705_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l382_c11_7c4b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_b705_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l382_c11_7c4b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_b705_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l382_c11_7c4b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l382_c7_b705_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l382_c11_7c4b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_69ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_95b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_69ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_95b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_69ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_95b7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l388_c7_69ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_95b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_9f73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_68a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_9f73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_68a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_9f73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_68a6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l392_c7_9f73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_68a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9b57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_3638_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9b57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_3638_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9b57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_3638_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l396_c7_9b57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_3638_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_d71c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_ef54_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_d71c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_ef54_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_d71c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_ef54_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l400_c7_d71c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_ef54_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_6a74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l404_c11_38dc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_6a74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l404_c11_38dc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_6a74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l404_c11_38dc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l404_c7_6a74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l404_c11_38dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_4789_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_ec71_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_4789_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_ec71_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l363_c3_0448_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l363_l355_l378_l370_DUPLICATE_5e6d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l378_c3_6e8e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l363_l355_l378_l370_DUPLICATE_5e6d_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l371_l356_DUPLICATE_766f_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l363_l355_l378_l370_DUPLICATE_5e6d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l392_c7_9f73_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l394_c24_86c5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l382_c7_b705_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l386_l402_DUPLICATE_f80b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l400_c7_d71c_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l386_l402_DUPLICATE_f80b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c2_541f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l374_l362_l359_l351_l366_l346_l377_l354_l369_DUPLICATE_f7ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_93b9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l374_l362_l359_l351_l366_l346_l377_l354_l369_DUPLICATE_f7ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_1795_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l374_l362_l359_l351_l366_l346_l377_l354_l369_DUPLICATE_f7ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_1c7e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l374_l362_l359_l351_l366_l346_l377_l354_l369_DUPLICATE_f7ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_4bf4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l374_l362_l359_l351_l366_l346_l377_l354_l369_DUPLICATE_f7ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_d2c7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l374_l362_l359_l351_l366_l346_l377_l354_l369_DUPLICATE_f7ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_b2ff_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l374_l362_l359_l351_l366_l346_l377_l354_l369_DUPLICATE_f7ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l374_c7_2b0a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l374_l362_l359_l351_l366_l346_l377_l354_l369_DUPLICATE_f7ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l377_c7_d18d_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l374_l362_l359_l351_l366_l346_l377_l354_l369_DUPLICATE_f7ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_93b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l374_l388_l362_l359_l396_l351_l366_l408_l382_l392_l400_l377_l354_l369_l404_DUPLICATE_8c85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_1795_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l374_l388_l362_l359_l396_l351_l366_l408_l382_l392_l400_l377_l354_l369_l404_DUPLICATE_8c85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_1c7e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l374_l388_l362_l359_l396_l351_l366_l408_l382_l392_l400_l377_l354_l369_l404_DUPLICATE_8c85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_4bf4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l374_l388_l362_l359_l396_l351_l366_l408_l382_l392_l400_l377_l354_l369_l404_DUPLICATE_8c85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d2c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l374_l388_l362_l359_l396_l351_l366_l408_l382_l392_l400_l377_l354_l369_l404_DUPLICATE_8c85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_b2ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l374_l388_l362_l359_l396_l351_l366_l408_l382_l392_l400_l377_l354_l369_l404_DUPLICATE_8c85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_2b0a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l374_l388_l362_l359_l396_l351_l366_l408_l382_l392_l400_l377_l354_l369_l404_DUPLICATE_8c85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l377_c7_d18d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l374_l388_l362_l359_l396_l351_l366_l408_l382_l392_l400_l377_l354_l369_l404_DUPLICATE_8c85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_b705_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l374_l388_l362_l359_l396_l351_l366_l408_l382_l392_l400_l377_l354_l369_l404_DUPLICATE_8c85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_69ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l374_l388_l362_l359_l396_l351_l366_l408_l382_l392_l400_l377_l354_l369_l404_DUPLICATE_8c85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_9f73_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l374_l388_l362_l359_l396_l351_l366_l408_l382_l392_l400_l377_l354_l369_l404_DUPLICATE_8c85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9b57_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l374_l388_l362_l359_l396_l351_l366_l408_l382_l392_l400_l377_l354_l369_l404_DUPLICATE_8c85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_d71c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l374_l388_l362_l359_l396_l351_l366_l408_l382_l392_l400_l377_l354_l369_l404_DUPLICATE_8c85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_6a74_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l374_l388_l362_l359_l396_l351_l366_l408_l382_l392_l400_l377_l354_l369_l404_DUPLICATE_8c85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_4789_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l374_l388_l362_l359_l396_l351_l366_l408_l382_l392_l400_l377_l354_l369_l404_DUPLICATE_8c85_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l346_c2_541f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l374_l362_l359_l351_l366_l382_l346_l354_l369_DUPLICATE_2983_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_93b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l374_l362_l359_l351_l366_l382_l346_l354_l369_DUPLICATE_2983_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_1795_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l374_l362_l359_l351_l366_l382_l346_l354_l369_DUPLICATE_2983_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_1c7e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l374_l362_l359_l351_l366_l382_l346_l354_l369_DUPLICATE_2983_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_4bf4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l374_l362_l359_l351_l366_l382_l346_l354_l369_DUPLICATE_2983_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_d2c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l374_l362_l359_l351_l366_l382_l346_l354_l369_DUPLICATE_2983_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_b2ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l374_l362_l359_l351_l366_l382_l346_l354_l369_DUPLICATE_2983_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l374_c7_2b0a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l374_l362_l359_l351_l366_l382_l346_l354_l369_DUPLICATE_2983_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l382_c7_b705_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l374_l362_l359_l351_l366_l382_l346_l354_l369_DUPLICATE_2983_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l346_c2_541f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l374_l388_l362_l359_l396_l351_l366_l408_l392_l400_l346_l377_l354_l369_l404_DUPLICATE_ce30_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_93b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l374_l388_l362_l359_l396_l351_l366_l408_l392_l400_l346_l377_l354_l369_l404_DUPLICATE_ce30_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_1795_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l374_l388_l362_l359_l396_l351_l366_l408_l392_l400_l346_l377_l354_l369_l404_DUPLICATE_ce30_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_1c7e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l374_l388_l362_l359_l396_l351_l366_l408_l392_l400_l346_l377_l354_l369_l404_DUPLICATE_ce30_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_4bf4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l374_l388_l362_l359_l396_l351_l366_l408_l392_l400_l346_l377_l354_l369_l404_DUPLICATE_ce30_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d2c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l374_l388_l362_l359_l396_l351_l366_l408_l392_l400_l346_l377_l354_l369_l404_DUPLICATE_ce30_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_b2ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l374_l388_l362_l359_l396_l351_l366_l408_l392_l400_l346_l377_l354_l369_l404_DUPLICATE_ce30_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_2b0a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l374_l388_l362_l359_l396_l351_l366_l408_l392_l400_l346_l377_l354_l369_l404_DUPLICATE_ce30_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l377_c7_d18d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l374_l388_l362_l359_l396_l351_l366_l408_l392_l400_l346_l377_l354_l369_l404_DUPLICATE_ce30_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_69ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l374_l388_l362_l359_l396_l351_l366_l408_l392_l400_l346_l377_l354_l369_l404_DUPLICATE_ce30_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_9f73_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l374_l388_l362_l359_l396_l351_l366_l408_l392_l400_l346_l377_l354_l369_l404_DUPLICATE_ce30_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9b57_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l374_l388_l362_l359_l396_l351_l366_l408_l392_l400_l346_l377_l354_l369_l404_DUPLICATE_ce30_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_d71c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l374_l388_l362_l359_l396_l351_l366_l408_l392_l400_l346_l377_l354_l369_l404_DUPLICATE_ce30_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_6a74_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l374_l388_l362_l359_l396_l351_l366_l408_l392_l400_l346_l377_l354_l369_l404_DUPLICATE_ce30_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_4789_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l374_l388_l362_l359_l396_l351_l366_l408_l392_l400_l346_l377_l354_l369_l404_DUPLICATE_ce30_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l377_c7_d18d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l404_l377_DUPLICATE_c88b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_6a74_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l404_l377_DUPLICATE_c88b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l346_c2_541f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l374_l362_l359_l351_l366_l346_l377_l354_l369_l404_DUPLICATE_90ca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l351_c7_93b9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l374_l362_l359_l351_l366_l346_l377_l354_l369_l404_DUPLICATE_90ca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l354_c7_1795_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l374_l362_l359_l351_l366_l346_l377_l354_l369_l404_DUPLICATE_90ca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l359_c7_1c7e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l374_l362_l359_l351_l366_l346_l377_l354_l369_l404_DUPLICATE_90ca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_4bf4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l374_l362_l359_l351_l366_l346_l377_l354_l369_l404_DUPLICATE_90ca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l366_c7_d2c7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l374_l362_l359_l351_l366_l346_l377_l354_l369_l404_DUPLICATE_90ca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l369_c7_b2ff_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l374_l362_l359_l351_l366_l346_l377_l354_l369_l404_DUPLICATE_90ca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l374_c7_2b0a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l374_l362_l359_l351_l366_l346_l377_l354_l369_l404_DUPLICATE_90ca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l377_c7_d18d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l374_l362_l359_l351_l366_l346_l377_l354_l369_l404_DUPLICATE_90ca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l404_c7_6a74_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l374_l362_l359_l351_l366_l346_l377_l354_l369_l404_DUPLICATE_90ca_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l398_c24_3196] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l398_c24_3196_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l398_c34_1d62_return_output);

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l406_l390_DUPLICATE_74ec LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l406_l390_DUPLICATE_74ec_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l390_l406_DUPLICATE_743e_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l408_c7_4789] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_4789_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_4789_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_4789_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_4789_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_4789_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_4789_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_4789_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_4789_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l371_l356_DUPLICATE_766f LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l371_l356_DUPLICATE_766f_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l371_l356_DUPLICATE_766f_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l371_l356_DUPLICATE_766f_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l371_l356_DUPLICATE_766f_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l378_c3_6e8e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l378_c3_6e8e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l378_c3_6e8e_left;
     BIN_OP_OR_uxn_opcodes_h_l378_c3_6e8e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l378_c3_6e8e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l378_c3_6e8e_return_output := BIN_OP_OR_uxn_opcodes_h_l378_c3_6e8e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l363_c3_0448] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l363_c3_0448_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l363_c3_0448_left;
     BIN_OP_OR_uxn_opcodes_h_l363_c3_0448_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l363_c3_0448_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l363_c3_0448_return_output := BIN_OP_OR_uxn_opcodes_h_l363_c3_0448_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l408_c7_4789] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_4789_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_4789_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_4789_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_4789_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_4789_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_4789_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_4789_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_4789_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l346_c1_5f8c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l346_c1_5f8c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l346_c1_5f8c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l346_c1_5f8c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l346_c1_5f8c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l346_c1_5f8c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l346_c1_5f8c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l346_c1_5f8c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l346_c1_5f8c_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l380_c32_8c9d] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l380_c32_8c9d_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l380_c32_8c9d_left;
     BIN_OP_GT_uxn_opcodes_h_l380_c32_8c9d_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l380_c32_8c9d_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l380_c32_8c9d_return_output := BIN_OP_GT_uxn_opcodes_h_l380_c32_8c9d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l404_c7_6a74] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_6a74_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_6a74_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_6a74_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_6a74_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_6a74_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_6a74_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_6a74_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_6a74_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l382_c7_b705] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l382_c7_b705_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l382_c7_b705_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l382_c7_b705_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l382_c7_b705_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l382_c7_b705_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l382_c7_b705_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l382_c7_b705_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l382_c7_b705_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l380_c32_2abb_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l380_c32_8c9d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l362_c7_4bf4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l363_c3_0448_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l377_c7_d18d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l378_c3_6e8e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l396_c7_9b57_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l398_c24_3196_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l388_c7_69ee_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l406_l390_DUPLICATE_74ec_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l404_c7_6a74_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l406_l390_DUPLICATE_74ec_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l369_c7_b2ff_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l371_l356_DUPLICATE_766f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l354_c7_1795_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l371_l356_DUPLICATE_766f_return_output;
     VAR_printf_uxn_opcodes_h_l347_c3_cea0_uxn_opcodes_h_l347_c3_cea0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l346_c1_5f8c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_6a74_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_4789_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l377_c7_d18d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l382_c7_b705_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_6a74_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_4789_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_d71c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_6a74_return_output;
     -- t16_MUX[uxn_opcodes_h_l362_c7_4bf4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l362_c7_4bf4_cond <= VAR_t16_MUX_uxn_opcodes_h_l362_c7_4bf4_cond;
     t16_MUX_uxn_opcodes_h_l362_c7_4bf4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l362_c7_4bf4_iftrue;
     t16_MUX_uxn_opcodes_h_l362_c7_4bf4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l362_c7_4bf4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output := t16_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l400_c7_d71c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_d71c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_d71c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_d71c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_d71c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_d71c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_d71c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_d71c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_d71c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l404_c7_6a74] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l404_c7_6a74_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l404_c7_6a74_cond;
     result_stack_value_MUX_uxn_opcodes_h_l404_c7_6a74_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l404_c7_6a74_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l404_c7_6a74_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l404_c7_6a74_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l404_c7_6a74_return_output := result_stack_value_MUX_uxn_opcodes_h_l404_c7_6a74_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l377_c7_d18d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l377_c7_d18d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l377_c7_d18d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l377_c7_d18d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l377_c7_d18d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l377_c7_d18d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l377_c7_d18d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l377_c7_d18d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l377_c7_d18d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l404_c7_6a74] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_6a74_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_6a74_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_6a74_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_6a74_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_6a74_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_6a74_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_6a74_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_6a74_return_output;

     -- n16_MUX[uxn_opcodes_h_l377_c7_d18d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l377_c7_d18d_cond <= VAR_n16_MUX_uxn_opcodes_h_l377_c7_d18d_cond;
     n16_MUX_uxn_opcodes_h_l377_c7_d18d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l377_c7_d18d_iftrue;
     n16_MUX_uxn_opcodes_h_l377_c7_d18d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l377_c7_d18d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l377_c7_d18d_return_output := n16_MUX_uxn_opcodes_h_l377_c7_d18d_return_output;

     -- printf_uxn_opcodes_h_l347_c3_cea0[uxn_opcodes_h_l347_c3_cea0] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l347_c3_cea0_uxn_opcodes_h_l347_c3_cea0_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l347_c3_cea0_uxn_opcodes_h_l347_c3_cea0_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- MUX[uxn_opcodes_h_l380_c32_2abb] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l380_c32_2abb_cond <= VAR_MUX_uxn_opcodes_h_l380_c32_2abb_cond;
     MUX_uxn_opcodes_h_l380_c32_2abb_iftrue <= VAR_MUX_uxn_opcodes_h_l380_c32_2abb_iftrue;
     MUX_uxn_opcodes_h_l380_c32_2abb_iffalse <= VAR_MUX_uxn_opcodes_h_l380_c32_2abb_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l380_c32_2abb_return_output := MUX_uxn_opcodes_h_l380_c32_2abb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l404_c7_6a74] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_6a74_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_6a74_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_6a74_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_6a74_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_6a74_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_6a74_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_6a74_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_6a74_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l377_c7_d18d_iftrue := VAR_MUX_uxn_opcodes_h_l380_c32_2abb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l374_c7_2b0a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l377_c7_d18d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_d71c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_6a74_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l374_c7_2b0a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l377_c7_d18d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_d71c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_6a74_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9b57_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_d71c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l400_c7_d71c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l404_c7_6a74_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l359_c7_1c7e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l374_c7_2b0a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l374_c7_2b0a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l374_c7_2b0a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l374_c7_2b0a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l374_c7_2b0a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l374_c7_2b0a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l374_c7_2b0a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l374_c7_2b0a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l374_c7_2b0a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l400_c7_d71c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l400_c7_d71c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l400_c7_d71c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l400_c7_d71c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l400_c7_d71c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l400_c7_d71c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l400_c7_d71c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l400_c7_d71c_return_output := result_stack_value_MUX_uxn_opcodes_h_l400_c7_d71c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l400_c7_d71c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_d71c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_d71c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_d71c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_d71c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_d71c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_d71c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_d71c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_d71c_return_output;

     -- t16_MUX[uxn_opcodes_h_l359_c7_1c7e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l359_c7_1c7e_cond <= VAR_t16_MUX_uxn_opcodes_h_l359_c7_1c7e_cond;
     t16_MUX_uxn_opcodes_h_l359_c7_1c7e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l359_c7_1c7e_iftrue;
     t16_MUX_uxn_opcodes_h_l359_c7_1c7e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l359_c7_1c7e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output := t16_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l396_c7_9b57] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9b57_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9b57_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9b57_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9b57_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9b57_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9b57_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9b57_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9b57_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l400_c7_d71c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_d71c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_d71c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_d71c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_d71c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_d71c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_d71c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_d71c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_d71c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l377_c7_d18d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l377_c7_d18d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l377_c7_d18d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l377_c7_d18d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l377_c7_d18d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l377_c7_d18d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l377_c7_d18d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l377_c7_d18d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l377_c7_d18d_return_output;

     -- n16_MUX[uxn_opcodes_h_l374_c7_2b0a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l374_c7_2b0a_cond <= VAR_n16_MUX_uxn_opcodes_h_l374_c7_2b0a_cond;
     n16_MUX_uxn_opcodes_h_l374_c7_2b0a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l374_c7_2b0a_iftrue;
     n16_MUX_uxn_opcodes_h_l374_c7_2b0a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l374_c7_2b0a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l374_c7_2b0a_return_output := n16_MUX_uxn_opcodes_h_l374_c7_2b0a_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l369_c7_b2ff_iffalse := VAR_n16_MUX_uxn_opcodes_h_l374_c7_2b0a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9b57_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_d71c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_b2ff_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l374_c7_2b0a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9b57_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_d71c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l374_c7_2b0a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l377_c7_d18d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_9f73_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9b57_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l396_c7_9b57_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l400_c7_d71c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l354_c7_1795_iffalse := VAR_t16_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l396_c7_9b57] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l396_c7_9b57_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l396_c7_9b57_cond;
     result_stack_value_MUX_uxn_opcodes_h_l396_c7_9b57_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l396_c7_9b57_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l396_c7_9b57_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l396_c7_9b57_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l396_c7_9b57_return_output := result_stack_value_MUX_uxn_opcodes_h_l396_c7_9b57_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l374_c7_2b0a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l374_c7_2b0a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l374_c7_2b0a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l374_c7_2b0a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l374_c7_2b0a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l374_c7_2b0a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l374_c7_2b0a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l374_c7_2b0a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l374_c7_2b0a_return_output;

     -- t16_MUX[uxn_opcodes_h_l354_c7_1795] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l354_c7_1795_cond <= VAR_t16_MUX_uxn_opcodes_h_l354_c7_1795_cond;
     t16_MUX_uxn_opcodes_h_l354_c7_1795_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l354_c7_1795_iftrue;
     t16_MUX_uxn_opcodes_h_l354_c7_1795_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l354_c7_1795_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l354_c7_1795_return_output := t16_MUX_uxn_opcodes_h_l354_c7_1795_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l369_c7_b2ff] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_b2ff_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_b2ff_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_b2ff_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_b2ff_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_b2ff_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_b2ff_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_b2ff_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_b2ff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l396_c7_9b57] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9b57_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9b57_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9b57_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9b57_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9b57_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9b57_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9b57_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9b57_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l392_c7_9f73] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_9f73_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_9f73_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_9f73_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_9f73_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_9f73_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_9f73_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_9f73_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_9f73_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l396_c7_9b57] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9b57_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9b57_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9b57_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9b57_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9b57_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9b57_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9b57_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9b57_return_output;

     -- n16_MUX[uxn_opcodes_h_l369_c7_b2ff] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l369_c7_b2ff_cond <= VAR_n16_MUX_uxn_opcodes_h_l369_c7_b2ff_cond;
     n16_MUX_uxn_opcodes_h_l369_c7_b2ff_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l369_c7_b2ff_iftrue;
     n16_MUX_uxn_opcodes_h_l369_c7_b2ff_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l369_c7_b2ff_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l369_c7_b2ff_return_output := n16_MUX_uxn_opcodes_h_l369_c7_b2ff_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l366_c7_d2c7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l369_c7_b2ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_9f73_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9b57_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_d2c7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_b2ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_9f73_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9b57_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_b2ff_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l374_c7_2b0a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_69ee_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_9f73_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l392_c7_9f73_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l396_c7_9b57_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l351_c7_93b9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l354_c7_1795_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l392_c7_9f73] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_9f73_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_9f73_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_9f73_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_9f73_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_9f73_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_9f73_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_9f73_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_9f73_return_output;

     -- n16_MUX[uxn_opcodes_h_l366_c7_d2c7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l366_c7_d2c7_cond <= VAR_n16_MUX_uxn_opcodes_h_l366_c7_d2c7_cond;
     n16_MUX_uxn_opcodes_h_l366_c7_d2c7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l366_c7_d2c7_iftrue;
     n16_MUX_uxn_opcodes_h_l366_c7_d2c7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l366_c7_d2c7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l366_c7_d2c7_return_output := n16_MUX_uxn_opcodes_h_l366_c7_d2c7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l388_c7_69ee] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_69ee_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_69ee_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_69ee_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_69ee_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_69ee_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_69ee_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_69ee_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_69ee_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l366_c7_d2c7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_d2c7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_d2c7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_d2c7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_d2c7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_d2c7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_d2c7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_d2c7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_d2c7_return_output;

     -- t16_MUX[uxn_opcodes_h_l351_c7_93b9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l351_c7_93b9_cond <= VAR_t16_MUX_uxn_opcodes_h_l351_c7_93b9_cond;
     t16_MUX_uxn_opcodes_h_l351_c7_93b9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l351_c7_93b9_iftrue;
     t16_MUX_uxn_opcodes_h_l351_c7_93b9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l351_c7_93b9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l351_c7_93b9_return_output := t16_MUX_uxn_opcodes_h_l351_c7_93b9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l369_c7_b2ff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_b2ff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_b2ff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_b2ff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_b2ff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_b2ff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_b2ff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_b2ff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_b2ff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l392_c7_9f73] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_9f73_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_9f73_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_9f73_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_9f73_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_9f73_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_9f73_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_9f73_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_9f73_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l392_c7_9f73] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l392_c7_9f73_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l392_c7_9f73_cond;
     result_stack_value_MUX_uxn_opcodes_h_l392_c7_9f73_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l392_c7_9f73_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l392_c7_9f73_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l392_c7_9f73_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l392_c7_9f73_return_output := result_stack_value_MUX_uxn_opcodes_h_l392_c7_9f73_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l362_c7_4bf4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l366_c7_d2c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_69ee_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_9f73_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_4bf4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_d2c7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_69ee_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_9f73_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_d2c7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_b2ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_b705_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_69ee_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l388_c7_69ee_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l392_c7_9f73_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l346_c2_541f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l351_c7_93b9_return_output;
     -- t16_MUX[uxn_opcodes_h_l346_c2_541f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l346_c2_541f_cond <= VAR_t16_MUX_uxn_opcodes_h_l346_c2_541f_cond;
     t16_MUX_uxn_opcodes_h_l346_c2_541f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l346_c2_541f_iftrue;
     t16_MUX_uxn_opcodes_h_l346_c2_541f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l346_c2_541f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l346_c2_541f_return_output := t16_MUX_uxn_opcodes_h_l346_c2_541f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l366_c7_d2c7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_d2c7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_d2c7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_d2c7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_d2c7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_d2c7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_d2c7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_d2c7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_d2c7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l388_c7_69ee] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l388_c7_69ee_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l388_c7_69ee_cond;
     result_stack_value_MUX_uxn_opcodes_h_l388_c7_69ee_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l388_c7_69ee_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l388_c7_69ee_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l388_c7_69ee_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l388_c7_69ee_return_output := result_stack_value_MUX_uxn_opcodes_h_l388_c7_69ee_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l388_c7_69ee] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_69ee_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_69ee_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_69ee_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_69ee_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_69ee_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_69ee_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_69ee_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_69ee_return_output;

     -- n16_MUX[uxn_opcodes_h_l362_c7_4bf4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l362_c7_4bf4_cond <= VAR_n16_MUX_uxn_opcodes_h_l362_c7_4bf4_cond;
     n16_MUX_uxn_opcodes_h_l362_c7_4bf4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l362_c7_4bf4_iftrue;
     n16_MUX_uxn_opcodes_h_l362_c7_4bf4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l362_c7_4bf4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output := n16_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l388_c7_69ee] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_69ee_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_69ee_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_69ee_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_69ee_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_69ee_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_69ee_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_69ee_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_69ee_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l382_c7_b705] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_b705_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_b705_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_b705_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_b705_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_b705_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_b705_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_b705_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_b705_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l362_c7_4bf4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_4bf4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_4bf4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_4bf4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_4bf4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_4bf4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_4bf4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l359_c7_1c7e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_b705_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_69ee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_1c7e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_b705_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_69ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_4bf4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_d2c7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l377_c7_d18d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_b705_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l382_c7_b705_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l388_c7_69ee_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l346_c2_541f_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l382_c7_b705] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l382_c7_b705_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l382_c7_b705_cond;
     result_stack_value_MUX_uxn_opcodes_h_l382_c7_b705_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l382_c7_b705_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l382_c7_b705_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l382_c7_b705_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l382_c7_b705_return_output := result_stack_value_MUX_uxn_opcodes_h_l382_c7_b705_return_output;

     -- n16_MUX[uxn_opcodes_h_l359_c7_1c7e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l359_c7_1c7e_cond <= VAR_n16_MUX_uxn_opcodes_h_l359_c7_1c7e_cond;
     n16_MUX_uxn_opcodes_h_l359_c7_1c7e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l359_c7_1c7e_iftrue;
     n16_MUX_uxn_opcodes_h_l359_c7_1c7e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l359_c7_1c7e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output := n16_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l382_c7_b705] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_b705_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_b705_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_b705_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_b705_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_b705_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_b705_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_b705_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_b705_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l359_c7_1c7e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_1c7e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_1c7e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_1c7e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_1c7e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_1c7e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_1c7e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l382_c7_b705] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_b705_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_b705_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_b705_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_b705_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_b705_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_b705_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_b705_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_b705_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l362_c7_4bf4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_4bf4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_4bf4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_4bf4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_4bf4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_4bf4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_4bf4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l377_c7_d18d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l377_c7_d18d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l377_c7_d18d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l377_c7_d18d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l377_c7_d18d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l377_c7_d18d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l377_c7_d18d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l377_c7_d18d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l377_c7_d18d_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l354_c7_1795_iffalse := VAR_n16_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l377_c7_d18d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_b705_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_1795_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l377_c7_d18d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_b705_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_1c7e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_2b0a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l377_c7_d18d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l377_c7_d18d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l382_c7_b705_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l374_c7_2b0a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_2b0a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_2b0a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_2b0a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_2b0a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_2b0a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_2b0a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_2b0a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_2b0a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l377_c7_d18d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l377_c7_d18d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l377_c7_d18d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l377_c7_d18d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l377_c7_d18d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l377_c7_d18d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l377_c7_d18d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l377_c7_d18d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l377_c7_d18d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l377_c7_d18d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l377_c7_d18d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l377_c7_d18d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l377_c7_d18d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l377_c7_d18d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l377_c7_d18d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l377_c7_d18d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l377_c7_d18d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l377_c7_d18d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l354_c7_1795] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_1795_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_1795_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_1795_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_1795_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_1795_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_1795_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_1795_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_1795_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l377_c7_d18d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l377_c7_d18d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l377_c7_d18d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l377_c7_d18d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l377_c7_d18d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l377_c7_d18d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l377_c7_d18d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l377_c7_d18d_return_output := result_stack_value_MUX_uxn_opcodes_h_l377_c7_d18d_return_output;

     -- n16_MUX[uxn_opcodes_h_l354_c7_1795] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l354_c7_1795_cond <= VAR_n16_MUX_uxn_opcodes_h_l354_c7_1795_cond;
     n16_MUX_uxn_opcodes_h_l354_c7_1795_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l354_c7_1795_iftrue;
     n16_MUX_uxn_opcodes_h_l354_c7_1795_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l354_c7_1795_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l354_c7_1795_return_output := n16_MUX_uxn_opcodes_h_l354_c7_1795_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l359_c7_1c7e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_1c7e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_1c7e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_1c7e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_1c7e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_1c7e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_1c7e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l351_c7_93b9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l354_c7_1795_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_2b0a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l377_c7_d18d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_93b9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_1795_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_2b0a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l377_c7_d18d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_1795_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_b2ff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_2b0a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l374_c7_2b0a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l377_c7_d18d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l369_c7_b2ff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_b2ff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_b2ff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_b2ff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_b2ff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_b2ff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_b2ff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_b2ff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_b2ff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l374_c7_2b0a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_2b0a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_2b0a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_2b0a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_2b0a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_2b0a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_2b0a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_2b0a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_2b0a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l351_c7_93b9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_93b9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_93b9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_93b9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_93b9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_93b9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_93b9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_93b9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_93b9_return_output;

     -- n16_MUX[uxn_opcodes_h_l351_c7_93b9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l351_c7_93b9_cond <= VAR_n16_MUX_uxn_opcodes_h_l351_c7_93b9_cond;
     n16_MUX_uxn_opcodes_h_l351_c7_93b9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l351_c7_93b9_iftrue;
     n16_MUX_uxn_opcodes_h_l351_c7_93b9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l351_c7_93b9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l351_c7_93b9_return_output := n16_MUX_uxn_opcodes_h_l351_c7_93b9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l374_c7_2b0a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_2b0a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_2b0a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_2b0a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_2b0a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_2b0a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_2b0a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_2b0a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_2b0a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l354_c7_1795] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_1795_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_1795_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_1795_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_1795_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_1795_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_1795_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_1795_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_1795_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l374_c7_2b0a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l374_c7_2b0a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l374_c7_2b0a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l374_c7_2b0a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l374_c7_2b0a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l374_c7_2b0a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l374_c7_2b0a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l374_c7_2b0a_return_output := result_stack_value_MUX_uxn_opcodes_h_l374_c7_2b0a_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l346_c2_541f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l351_c7_93b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_b2ff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_2b0a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l346_c2_541f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_93b9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_b2ff_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_2b0a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_93b9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_1795_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d2c7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_b2ff_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l369_c7_b2ff_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l374_c7_2b0a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l369_c7_b2ff] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_b2ff_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_b2ff_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_b2ff_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_b2ff_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_b2ff_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_b2ff_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_b2ff_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_b2ff_return_output;

     -- n16_MUX[uxn_opcodes_h_l346_c2_541f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l346_c2_541f_cond <= VAR_n16_MUX_uxn_opcodes_h_l346_c2_541f_cond;
     n16_MUX_uxn_opcodes_h_l346_c2_541f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l346_c2_541f_iftrue;
     n16_MUX_uxn_opcodes_h_l346_c2_541f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l346_c2_541f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l346_c2_541f_return_output := n16_MUX_uxn_opcodes_h_l346_c2_541f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l369_c7_b2ff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_b2ff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_b2ff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_b2ff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_b2ff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_b2ff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_b2ff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_b2ff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_b2ff_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l346_c2_541f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l346_c2_541f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l346_c2_541f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l346_c2_541f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l346_c2_541f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l346_c2_541f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l346_c2_541f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l346_c2_541f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l346_c2_541f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l351_c7_93b9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_93b9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_93b9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_93b9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_93b9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_93b9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_93b9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_93b9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_93b9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l369_c7_b2ff] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l369_c7_b2ff_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l369_c7_b2ff_cond;
     result_stack_value_MUX_uxn_opcodes_h_l369_c7_b2ff_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l369_c7_b2ff_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l369_c7_b2ff_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l369_c7_b2ff_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l369_c7_b2ff_return_output := result_stack_value_MUX_uxn_opcodes_h_l369_c7_b2ff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l366_c7_d2c7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d2c7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d2c7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d2c7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d2c7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d2c7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d2c7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d2c7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d2c7_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l346_c2_541f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d2c7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_b2ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d2c7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_b2ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c2_541f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_93b9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_4bf4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d2c7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l366_c7_d2c7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l369_c7_b2ff_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l346_c2_541f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c2_541f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c2_541f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c2_541f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c2_541f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c2_541f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c2_541f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c2_541f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c2_541f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l366_c7_d2c7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d2c7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d2c7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d2c7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d2c7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d2c7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d2c7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d2c7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d2c7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l366_c7_d2c7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l366_c7_d2c7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l366_c7_d2c7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l366_c7_d2c7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l366_c7_d2c7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l366_c7_d2c7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l366_c7_d2c7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l366_c7_d2c7_return_output := result_stack_value_MUX_uxn_opcodes_h_l366_c7_d2c7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l366_c7_d2c7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d2c7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d2c7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d2c7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d2c7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d2c7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d2c7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d2c7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d2c7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l362_c7_4bf4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_4bf4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_4bf4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_4bf4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_4bf4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_4bf4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_4bf4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_4bf4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d2c7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_4bf4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d2c7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_1c7e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_4bf4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l366_c7_d2c7_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l362_c7_4bf4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_4bf4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_4bf4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_4bf4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_4bf4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_4bf4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_4bf4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l362_c7_4bf4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l362_c7_4bf4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_4bf4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l362_c7_4bf4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_4bf4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l362_c7_4bf4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_4bf4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output := result_stack_value_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l362_c7_4bf4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_4bf4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_4bf4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_4bf4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_4bf4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_4bf4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_4bf4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l359_c7_1c7e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_1c7e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_1c7e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_1c7e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_1c7e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_1c7e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_1c7e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output;

     -- Submodule level 13
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_1c7e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_1c7e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_1795_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l359_c7_1c7e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_4bf4_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l359_c7_1c7e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l359_c7_1c7e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l359_c7_1c7e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l359_c7_1c7e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l359_c7_1c7e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l359_c7_1c7e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l359_c7_1c7e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output := result_stack_value_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l359_c7_1c7e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_1c7e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_1c7e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_1c7e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_1c7e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_1c7e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_1c7e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l359_c7_1c7e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_1c7e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_1c7e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_1c7e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_1c7e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_1c7e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_1c7e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l354_c7_1795] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_1795_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_1795_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_1795_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_1795_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_1795_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_1795_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_1795_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_1795_return_output;

     -- Submodule level 14
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_1795_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_1795_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_93b9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_1795_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l354_c7_1795_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l359_c7_1c7e_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l354_c7_1795] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_1795_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_1795_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_1795_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_1795_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_1795_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_1795_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_1795_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_1795_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l354_c7_1795] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_1795_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_1795_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_1795_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_1795_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_1795_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_1795_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_1795_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_1795_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l354_c7_1795] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l354_c7_1795_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l354_c7_1795_cond;
     result_stack_value_MUX_uxn_opcodes_h_l354_c7_1795_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l354_c7_1795_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l354_c7_1795_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l354_c7_1795_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l354_c7_1795_return_output := result_stack_value_MUX_uxn_opcodes_h_l354_c7_1795_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l351_c7_93b9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_93b9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_93b9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_93b9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_93b9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_93b9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_93b9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_93b9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_93b9_return_output;

     -- Submodule level 15
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_93b9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_1795_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_93b9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_1795_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c2_541f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_93b9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l351_c7_93b9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l354_c7_1795_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l351_c7_93b9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_93b9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_93b9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_93b9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_93b9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_93b9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_93b9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_93b9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_93b9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l351_c7_93b9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_93b9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_93b9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_93b9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_93b9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_93b9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_93b9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_93b9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_93b9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l346_c2_541f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c2_541f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c2_541f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c2_541f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c2_541f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c2_541f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c2_541f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c2_541f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c2_541f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l351_c7_93b9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l351_c7_93b9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l351_c7_93b9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l351_c7_93b9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l351_c7_93b9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l351_c7_93b9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l351_c7_93b9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l351_c7_93b9_return_output := result_stack_value_MUX_uxn_opcodes_h_l351_c7_93b9_return_output;

     -- Submodule level 16
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l346_c2_541f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_93b9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l346_c2_541f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_93b9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l346_c2_541f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l351_c7_93b9_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l346_c2_541f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l346_c2_541f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l346_c2_541f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l346_c2_541f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l346_c2_541f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l346_c2_541f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l346_c2_541f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l346_c2_541f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l346_c2_541f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l346_c2_541f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l346_c2_541f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l346_c2_541f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l346_c2_541f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l346_c2_541f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l346_c2_541f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l346_c2_541f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l346_c2_541f_return_output := result_stack_value_MUX_uxn_opcodes_h_l346_c2_541f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l346_c2_541f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l346_c2_541f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l346_c2_541f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l346_c2_541f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l346_c2_541f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l346_c2_541f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l346_c2_541f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l346_c2_541f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l346_c2_541f_return_output;

     -- Submodule level 17
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l342_l413_DUPLICATE_c13f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l342_l413_DUPLICATE_c13f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_53ff(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l346_c2_541f_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c2_541f_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c2_541f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l346_c2_541f_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l346_c2_541f_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l346_c2_541f_return_output);

     -- Submodule level 18
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l342_l413_DUPLICATE_c13f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l342_l413_DUPLICATE_c13f_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
