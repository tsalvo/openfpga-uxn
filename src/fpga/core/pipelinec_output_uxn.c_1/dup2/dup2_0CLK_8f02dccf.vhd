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
-- Submodules: 81
entity dup2_0CLK_8f02dccf is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end dup2_0CLK_8f02dccf;
architecture arch of dup2_0CLK_8f02dccf is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l3190_c6_f3b4]
signal BIN_OP_EQ_uxn_opcodes_h_l3190_c6_f3b4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3190_c6_f3b4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3190_c6_f3b4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3190_c1_2ccc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2ccc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2ccc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2ccc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2ccc_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3190_c2_5b5f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3190_c2_5b5f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3190_c2_5b5f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3190_c2_5b5f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3190_c2_5b5f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3190_c2_5b5f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3190_c2_5b5f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3190_c2_5b5f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3190_c2_5b5f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3190_c2_5b5f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3190_c2_5b5f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3190_c2_5b5f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3190_c2_5b5f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3190_c2_5b5f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3190_c2_5b5f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3190_c2_5b5f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3190_c2_5b5f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3190_c2_5b5f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3190_c2_5b5f]
signal result_stack_value_MUX_uxn_opcodes_h_l3190_c2_5b5f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3190_c2_5b5f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3190_c2_5b5f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l3190_c2_5b5f]
signal t16_MUX_uxn_opcodes_h_l3190_c2_5b5f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3190_c2_5b5f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3190_c2_5b5f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l3191_c3_b0b1[uxn_opcodes_h_l3191_c3_b0b1]
signal printf_uxn_opcodes_h_l3191_c3_b0b1_uxn_opcodes_h_l3191_c3_b0b1_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3196_c11_7f7a]
signal BIN_OP_EQ_uxn_opcodes_h_l3196_c11_7f7a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3196_c11_7f7a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3196_c11_7f7a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3196_c7_c624]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3196_c7_c624_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3196_c7_c624_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3196_c7_c624_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3196_c7_c624_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3196_c7_c624]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3196_c7_c624_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3196_c7_c624_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3196_c7_c624_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3196_c7_c624_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3196_c7_c624]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3196_c7_c624_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3196_c7_c624_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3196_c7_c624_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3196_c7_c624_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3196_c7_c624]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3196_c7_c624_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3196_c7_c624_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3196_c7_c624_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3196_c7_c624_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3196_c7_c624]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3196_c7_c624_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3196_c7_c624_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3196_c7_c624_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3196_c7_c624_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3196_c7_c624]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3196_c7_c624_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3196_c7_c624_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3196_c7_c624_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3196_c7_c624_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3196_c7_c624]
signal result_stack_value_MUX_uxn_opcodes_h_l3196_c7_c624_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3196_c7_c624_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3196_c7_c624_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3196_c7_c624_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l3196_c7_c624]
signal t16_MUX_uxn_opcodes_h_l3196_c7_c624_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3196_c7_c624_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3196_c7_c624_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3196_c7_c624_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3199_c11_59c1]
signal BIN_OP_EQ_uxn_opcodes_h_l3199_c11_59c1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3199_c11_59c1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3199_c11_59c1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3199_c7_8551]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3199_c7_8551_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3199_c7_8551_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3199_c7_8551_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3199_c7_8551_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3199_c7_8551]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3199_c7_8551_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3199_c7_8551_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3199_c7_8551_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3199_c7_8551_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3199_c7_8551]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3199_c7_8551_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3199_c7_8551_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3199_c7_8551_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3199_c7_8551_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3199_c7_8551]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3199_c7_8551_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3199_c7_8551_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3199_c7_8551_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3199_c7_8551_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3199_c7_8551]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3199_c7_8551_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3199_c7_8551_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3199_c7_8551_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3199_c7_8551_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3199_c7_8551]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3199_c7_8551_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3199_c7_8551_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3199_c7_8551_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3199_c7_8551_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3199_c7_8551]
signal result_stack_value_MUX_uxn_opcodes_h_l3199_c7_8551_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3199_c7_8551_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3199_c7_8551_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3199_c7_8551_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l3199_c7_8551]
signal t16_MUX_uxn_opcodes_h_l3199_c7_8551_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3199_c7_8551_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3199_c7_8551_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3199_c7_8551_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l3201_c3_70a7]
signal CONST_SL_8_uxn_opcodes_h_l3201_c3_70a7_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l3201_c3_70a7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3204_c11_79bf]
signal BIN_OP_EQ_uxn_opcodes_h_l3204_c11_79bf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3204_c11_79bf_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3204_c11_79bf_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3204_c7_3c92]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3204_c7_3c92_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3204_c7_3c92_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3204_c7_3c92_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3204_c7_3c92]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3204_c7_3c92_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3204_c7_3c92_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3204_c7_3c92_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3204_c7_3c92]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3204_c7_3c92_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3204_c7_3c92_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3204_c7_3c92_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3204_c7_3c92]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3204_c7_3c92_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3204_c7_3c92_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3204_c7_3c92_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3204_c7_3c92]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3204_c7_3c92_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3204_c7_3c92_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3204_c7_3c92_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3204_c7_3c92]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3204_c7_3c92_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3204_c7_3c92_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3204_c7_3c92_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3204_c7_3c92]
signal result_stack_value_MUX_uxn_opcodes_h_l3204_c7_3c92_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3204_c7_3c92_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3204_c7_3c92_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l3204_c7_3c92]
signal t16_MUX_uxn_opcodes_h_l3204_c7_3c92_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3204_c7_3c92_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3204_c7_3c92_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3207_c11_ff01]
signal BIN_OP_EQ_uxn_opcodes_h_l3207_c11_ff01_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3207_c11_ff01_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3207_c11_ff01_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3207_c7_3679]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3207_c7_3679_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3207_c7_3679_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3207_c7_3679_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3207_c7_3679_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3207_c7_3679]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3207_c7_3679_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3207_c7_3679_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3207_c7_3679_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3207_c7_3679_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3207_c7_3679]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3207_c7_3679_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3207_c7_3679_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3207_c7_3679_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3207_c7_3679_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3207_c7_3679]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3207_c7_3679_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3207_c7_3679_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3207_c7_3679_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3207_c7_3679_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3207_c7_3679]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3207_c7_3679_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3207_c7_3679_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3207_c7_3679_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3207_c7_3679_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3207_c7_3679]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3207_c7_3679_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3207_c7_3679_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3207_c7_3679_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3207_c7_3679_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3207_c7_3679]
signal result_stack_value_MUX_uxn_opcodes_h_l3207_c7_3679_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3207_c7_3679_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3207_c7_3679_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3207_c7_3679_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l3207_c7_3679]
signal t16_MUX_uxn_opcodes_h_l3207_c7_3679_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3207_c7_3679_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3207_c7_3679_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3207_c7_3679_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l3208_c3_0ca7]
signal BIN_OP_OR_uxn_opcodes_h_l3208_c3_0ca7_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l3208_c3_0ca7_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l3208_c3_0ca7_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l3211_c32_f5d8]
signal BIN_OP_AND_uxn_opcodes_h_l3211_c32_f5d8_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3211_c32_f5d8_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3211_c32_f5d8_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l3211_c32_d927]
signal BIN_OP_GT_uxn_opcodes_h_l3211_c32_d927_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3211_c32_d927_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3211_c32_d927_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l3211_c32_46c6]
signal MUX_uxn_opcodes_h_l3211_c32_46c6_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3211_c32_46c6_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l3211_c32_46c6_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l3211_c32_46c6_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3213_c11_ea62]
signal BIN_OP_EQ_uxn_opcodes_h_l3213_c11_ea62_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3213_c11_ea62_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3213_c11_ea62_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3213_c7_4dfb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3213_c7_4dfb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3213_c7_4dfb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3213_c7_4dfb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3213_c7_4dfb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3213_c7_4dfb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_4dfb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_4dfb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_4dfb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_4dfb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3213_c7_4dfb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_4dfb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_4dfb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_4dfb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_4dfb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3213_c7_4dfb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3213_c7_4dfb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3213_c7_4dfb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3213_c7_4dfb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3213_c7_4dfb_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3213_c7_4dfb]
signal result_stack_value_MUX_uxn_opcodes_h_l3213_c7_4dfb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3213_c7_4dfb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3213_c7_4dfb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3213_c7_4dfb_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3219_c11_c597]
signal BIN_OP_EQ_uxn_opcodes_h_l3219_c11_c597_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3219_c11_c597_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3219_c11_c597_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3219_c7_784b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3219_c7_784b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3219_c7_784b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3219_c7_784b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3219_c7_784b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3219_c7_784b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3219_c7_784b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3219_c7_784b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3219_c7_784b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3219_c7_784b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3219_c7_784b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3219_c7_784b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3219_c7_784b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3219_c7_784b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3219_c7_784b_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3219_c7_784b]
signal result_stack_value_MUX_uxn_opcodes_h_l3219_c7_784b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3219_c7_784b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3219_c7_784b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3219_c7_784b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3223_c11_ae70]
signal BIN_OP_EQ_uxn_opcodes_h_l3223_c11_ae70_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3223_c11_ae70_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3223_c11_ae70_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3223_c7_2ff7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_2ff7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_2ff7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_2ff7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_2ff7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3223_c7_2ff7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_2ff7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_2ff7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_2ff7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_2ff7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3223_c7_2ff7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_2ff7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_2ff7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_2ff7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_2ff7_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3223_c7_2ff7]
signal result_stack_value_MUX_uxn_opcodes_h_l3223_c7_2ff7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3223_c7_2ff7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3223_c7_2ff7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3223_c7_2ff7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3227_c11_5791]
signal BIN_OP_EQ_uxn_opcodes_h_l3227_c11_5791_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3227_c11_5791_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3227_c11_5791_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3227_c7_6a96]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3227_c7_6a96_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3227_c7_6a96_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3227_c7_6a96_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3227_c7_6a96_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3227_c7_6a96]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3227_c7_6a96_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3227_c7_6a96_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3227_c7_6a96_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3227_c7_6a96_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3227_c7_6a96]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3227_c7_6a96_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3227_c7_6a96_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3227_c7_6a96_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3227_c7_6a96_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3227_c7_6a96]
signal result_stack_value_MUX_uxn_opcodes_h_l3227_c7_6a96_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3227_c7_6a96_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3227_c7_6a96_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3227_c7_6a96_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3231_c11_a1b2]
signal BIN_OP_EQ_uxn_opcodes_h_l3231_c11_a1b2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3231_c11_a1b2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3231_c11_a1b2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3231_c7_83cb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_83cb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_83cb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_83cb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_83cb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3231_c7_83cb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_83cb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_83cb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_83cb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_83cb_return_output : unsigned(0 downto 0);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l3229_l3221_DUPLICATE_36ef
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l3229_l3221_DUPLICATE_36ef_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l3229_l3221_DUPLICATE_36ef_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
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
-- BIN_OP_EQ_uxn_opcodes_h_l3190_c6_f3b4
BIN_OP_EQ_uxn_opcodes_h_l3190_c6_f3b4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3190_c6_f3b4_left,
BIN_OP_EQ_uxn_opcodes_h_l3190_c6_f3b4_right,
BIN_OP_EQ_uxn_opcodes_h_l3190_c6_f3b4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2ccc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2ccc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2ccc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2ccc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2ccc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2ccc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f
result_is_sp_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3190_c2_5b5f
result_is_stack_read_MUX_uxn_opcodes_h_l3190_c2_5b5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3190_c2_5b5f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3190_c2_5b5f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3190_c2_5b5f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f
result_sp_relative_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3190_c2_5b5f
result_is_stack_write_MUX_uxn_opcodes_h_l3190_c2_5b5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3190_c2_5b5f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3190_c2_5b5f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3190_c2_5b5f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3190_c2_5b5f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3190_c2_5b5f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3190_c2_5b5f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3190_c2_5b5f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3190_c2_5b5f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3190_c2_5b5f
result_is_opc_done_MUX_uxn_opcodes_h_l3190_c2_5b5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3190_c2_5b5f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3190_c2_5b5f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3190_c2_5b5f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3190_c2_5b5f
result_stack_value_MUX_uxn_opcodes_h_l3190_c2_5b5f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3190_c2_5b5f_cond,
result_stack_value_MUX_uxn_opcodes_h_l3190_c2_5b5f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3190_c2_5b5f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output);

-- t16_MUX_uxn_opcodes_h_l3190_c2_5b5f
t16_MUX_uxn_opcodes_h_l3190_c2_5b5f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3190_c2_5b5f_cond,
t16_MUX_uxn_opcodes_h_l3190_c2_5b5f_iftrue,
t16_MUX_uxn_opcodes_h_l3190_c2_5b5f_iffalse,
t16_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output);

-- printf_uxn_opcodes_h_l3191_c3_b0b1_uxn_opcodes_h_l3191_c3_b0b1
printf_uxn_opcodes_h_l3191_c3_b0b1_uxn_opcodes_h_l3191_c3_b0b1 : entity work.printf_uxn_opcodes_h_l3191_c3_b0b1_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l3191_c3_b0b1_uxn_opcodes_h_l3191_c3_b0b1_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l3196_c11_7f7a
BIN_OP_EQ_uxn_opcodes_h_l3196_c11_7f7a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3196_c11_7f7a_left,
BIN_OP_EQ_uxn_opcodes_h_l3196_c11_7f7a_right,
BIN_OP_EQ_uxn_opcodes_h_l3196_c11_7f7a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3196_c7_c624
result_is_sp_shift_MUX_uxn_opcodes_h_l3196_c7_c624 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3196_c7_c624_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3196_c7_c624_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3196_c7_c624_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3196_c7_c624_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3196_c7_c624
result_is_stack_read_MUX_uxn_opcodes_h_l3196_c7_c624 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3196_c7_c624_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3196_c7_c624_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3196_c7_c624_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3196_c7_c624_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3196_c7_c624
result_sp_relative_shift_MUX_uxn_opcodes_h_l3196_c7_c624 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3196_c7_c624_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3196_c7_c624_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3196_c7_c624_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3196_c7_c624_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3196_c7_c624
result_is_stack_write_MUX_uxn_opcodes_h_l3196_c7_c624 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3196_c7_c624_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3196_c7_c624_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3196_c7_c624_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3196_c7_c624_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3196_c7_c624
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3196_c7_c624 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3196_c7_c624_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3196_c7_c624_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3196_c7_c624_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3196_c7_c624_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3196_c7_c624
result_is_opc_done_MUX_uxn_opcodes_h_l3196_c7_c624 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3196_c7_c624_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3196_c7_c624_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3196_c7_c624_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3196_c7_c624_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3196_c7_c624
result_stack_value_MUX_uxn_opcodes_h_l3196_c7_c624 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3196_c7_c624_cond,
result_stack_value_MUX_uxn_opcodes_h_l3196_c7_c624_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3196_c7_c624_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3196_c7_c624_return_output);

-- t16_MUX_uxn_opcodes_h_l3196_c7_c624
t16_MUX_uxn_opcodes_h_l3196_c7_c624 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3196_c7_c624_cond,
t16_MUX_uxn_opcodes_h_l3196_c7_c624_iftrue,
t16_MUX_uxn_opcodes_h_l3196_c7_c624_iffalse,
t16_MUX_uxn_opcodes_h_l3196_c7_c624_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3199_c11_59c1
BIN_OP_EQ_uxn_opcodes_h_l3199_c11_59c1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3199_c11_59c1_left,
BIN_OP_EQ_uxn_opcodes_h_l3199_c11_59c1_right,
BIN_OP_EQ_uxn_opcodes_h_l3199_c11_59c1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3199_c7_8551
result_is_sp_shift_MUX_uxn_opcodes_h_l3199_c7_8551 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3199_c7_8551_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3199_c7_8551_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3199_c7_8551_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3199_c7_8551_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3199_c7_8551
result_is_stack_read_MUX_uxn_opcodes_h_l3199_c7_8551 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3199_c7_8551_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3199_c7_8551_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3199_c7_8551_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3199_c7_8551_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3199_c7_8551
result_sp_relative_shift_MUX_uxn_opcodes_h_l3199_c7_8551 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3199_c7_8551_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3199_c7_8551_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3199_c7_8551_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3199_c7_8551_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3199_c7_8551
result_is_stack_write_MUX_uxn_opcodes_h_l3199_c7_8551 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3199_c7_8551_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3199_c7_8551_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3199_c7_8551_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3199_c7_8551_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3199_c7_8551
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3199_c7_8551 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3199_c7_8551_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3199_c7_8551_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3199_c7_8551_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3199_c7_8551_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3199_c7_8551
result_is_opc_done_MUX_uxn_opcodes_h_l3199_c7_8551 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3199_c7_8551_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3199_c7_8551_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3199_c7_8551_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3199_c7_8551_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3199_c7_8551
result_stack_value_MUX_uxn_opcodes_h_l3199_c7_8551 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3199_c7_8551_cond,
result_stack_value_MUX_uxn_opcodes_h_l3199_c7_8551_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3199_c7_8551_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3199_c7_8551_return_output);

-- t16_MUX_uxn_opcodes_h_l3199_c7_8551
t16_MUX_uxn_opcodes_h_l3199_c7_8551 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3199_c7_8551_cond,
t16_MUX_uxn_opcodes_h_l3199_c7_8551_iftrue,
t16_MUX_uxn_opcodes_h_l3199_c7_8551_iffalse,
t16_MUX_uxn_opcodes_h_l3199_c7_8551_return_output);

-- CONST_SL_8_uxn_opcodes_h_l3201_c3_70a7
CONST_SL_8_uxn_opcodes_h_l3201_c3_70a7 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l3201_c3_70a7_x,
CONST_SL_8_uxn_opcodes_h_l3201_c3_70a7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3204_c11_79bf
BIN_OP_EQ_uxn_opcodes_h_l3204_c11_79bf : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3204_c11_79bf_left,
BIN_OP_EQ_uxn_opcodes_h_l3204_c11_79bf_right,
BIN_OP_EQ_uxn_opcodes_h_l3204_c11_79bf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3204_c7_3c92
result_is_sp_shift_MUX_uxn_opcodes_h_l3204_c7_3c92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3204_c7_3c92_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3204_c7_3c92_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3204_c7_3c92_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3204_c7_3c92
result_is_stack_read_MUX_uxn_opcodes_h_l3204_c7_3c92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3204_c7_3c92_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3204_c7_3c92_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3204_c7_3c92_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3204_c7_3c92
result_sp_relative_shift_MUX_uxn_opcodes_h_l3204_c7_3c92 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3204_c7_3c92_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3204_c7_3c92_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3204_c7_3c92_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3204_c7_3c92
result_is_stack_write_MUX_uxn_opcodes_h_l3204_c7_3c92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3204_c7_3c92_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3204_c7_3c92_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3204_c7_3c92_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3204_c7_3c92
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3204_c7_3c92 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3204_c7_3c92_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3204_c7_3c92_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3204_c7_3c92_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3204_c7_3c92
result_is_opc_done_MUX_uxn_opcodes_h_l3204_c7_3c92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3204_c7_3c92_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3204_c7_3c92_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3204_c7_3c92_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3204_c7_3c92
result_stack_value_MUX_uxn_opcodes_h_l3204_c7_3c92 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3204_c7_3c92_cond,
result_stack_value_MUX_uxn_opcodes_h_l3204_c7_3c92_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3204_c7_3c92_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output);

-- t16_MUX_uxn_opcodes_h_l3204_c7_3c92
t16_MUX_uxn_opcodes_h_l3204_c7_3c92 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3204_c7_3c92_cond,
t16_MUX_uxn_opcodes_h_l3204_c7_3c92_iftrue,
t16_MUX_uxn_opcodes_h_l3204_c7_3c92_iffalse,
t16_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3207_c11_ff01
BIN_OP_EQ_uxn_opcodes_h_l3207_c11_ff01 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3207_c11_ff01_left,
BIN_OP_EQ_uxn_opcodes_h_l3207_c11_ff01_right,
BIN_OP_EQ_uxn_opcodes_h_l3207_c11_ff01_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3207_c7_3679
result_is_sp_shift_MUX_uxn_opcodes_h_l3207_c7_3679 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3207_c7_3679_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3207_c7_3679_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3207_c7_3679_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3207_c7_3679_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3207_c7_3679
result_is_stack_read_MUX_uxn_opcodes_h_l3207_c7_3679 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3207_c7_3679_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3207_c7_3679_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3207_c7_3679_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3207_c7_3679_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3207_c7_3679
result_sp_relative_shift_MUX_uxn_opcodes_h_l3207_c7_3679 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3207_c7_3679_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3207_c7_3679_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3207_c7_3679_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3207_c7_3679_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3207_c7_3679
result_is_stack_write_MUX_uxn_opcodes_h_l3207_c7_3679 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3207_c7_3679_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3207_c7_3679_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3207_c7_3679_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3207_c7_3679_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3207_c7_3679
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3207_c7_3679 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3207_c7_3679_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3207_c7_3679_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3207_c7_3679_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3207_c7_3679_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3207_c7_3679
result_is_opc_done_MUX_uxn_opcodes_h_l3207_c7_3679 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3207_c7_3679_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3207_c7_3679_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3207_c7_3679_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3207_c7_3679_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3207_c7_3679
result_stack_value_MUX_uxn_opcodes_h_l3207_c7_3679 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3207_c7_3679_cond,
result_stack_value_MUX_uxn_opcodes_h_l3207_c7_3679_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3207_c7_3679_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3207_c7_3679_return_output);

-- t16_MUX_uxn_opcodes_h_l3207_c7_3679
t16_MUX_uxn_opcodes_h_l3207_c7_3679 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3207_c7_3679_cond,
t16_MUX_uxn_opcodes_h_l3207_c7_3679_iftrue,
t16_MUX_uxn_opcodes_h_l3207_c7_3679_iffalse,
t16_MUX_uxn_opcodes_h_l3207_c7_3679_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l3208_c3_0ca7
BIN_OP_OR_uxn_opcodes_h_l3208_c3_0ca7 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l3208_c3_0ca7_left,
BIN_OP_OR_uxn_opcodes_h_l3208_c3_0ca7_right,
BIN_OP_OR_uxn_opcodes_h_l3208_c3_0ca7_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l3211_c32_f5d8
BIN_OP_AND_uxn_opcodes_h_l3211_c32_f5d8 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l3211_c32_f5d8_left,
BIN_OP_AND_uxn_opcodes_h_l3211_c32_f5d8_right,
BIN_OP_AND_uxn_opcodes_h_l3211_c32_f5d8_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l3211_c32_d927
BIN_OP_GT_uxn_opcodes_h_l3211_c32_d927 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l3211_c32_d927_left,
BIN_OP_GT_uxn_opcodes_h_l3211_c32_d927_right,
BIN_OP_GT_uxn_opcodes_h_l3211_c32_d927_return_output);

-- MUX_uxn_opcodes_h_l3211_c32_46c6
MUX_uxn_opcodes_h_l3211_c32_46c6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l3211_c32_46c6_cond,
MUX_uxn_opcodes_h_l3211_c32_46c6_iftrue,
MUX_uxn_opcodes_h_l3211_c32_46c6_iffalse,
MUX_uxn_opcodes_h_l3211_c32_46c6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3213_c11_ea62
BIN_OP_EQ_uxn_opcodes_h_l3213_c11_ea62 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3213_c11_ea62_left,
BIN_OP_EQ_uxn_opcodes_h_l3213_c11_ea62_right,
BIN_OP_EQ_uxn_opcodes_h_l3213_c11_ea62_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3213_c7_4dfb
result_is_sp_shift_MUX_uxn_opcodes_h_l3213_c7_4dfb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3213_c7_4dfb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3213_c7_4dfb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3213_c7_4dfb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3213_c7_4dfb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_4dfb
result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_4dfb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_4dfb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_4dfb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_4dfb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_4dfb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_4dfb
result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_4dfb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_4dfb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_4dfb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_4dfb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_4dfb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3213_c7_4dfb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3213_c7_4dfb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3213_c7_4dfb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3213_c7_4dfb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3213_c7_4dfb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3213_c7_4dfb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3213_c7_4dfb
result_stack_value_MUX_uxn_opcodes_h_l3213_c7_4dfb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3213_c7_4dfb_cond,
result_stack_value_MUX_uxn_opcodes_h_l3213_c7_4dfb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3213_c7_4dfb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3213_c7_4dfb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3219_c11_c597
BIN_OP_EQ_uxn_opcodes_h_l3219_c11_c597 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3219_c11_c597_left,
BIN_OP_EQ_uxn_opcodes_h_l3219_c11_c597_right,
BIN_OP_EQ_uxn_opcodes_h_l3219_c11_c597_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3219_c7_784b
result_is_stack_write_MUX_uxn_opcodes_h_l3219_c7_784b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3219_c7_784b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3219_c7_784b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3219_c7_784b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3219_c7_784b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3219_c7_784b
result_is_opc_done_MUX_uxn_opcodes_h_l3219_c7_784b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3219_c7_784b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3219_c7_784b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3219_c7_784b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3219_c7_784b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3219_c7_784b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3219_c7_784b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3219_c7_784b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3219_c7_784b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3219_c7_784b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3219_c7_784b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3219_c7_784b
result_stack_value_MUX_uxn_opcodes_h_l3219_c7_784b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3219_c7_784b_cond,
result_stack_value_MUX_uxn_opcodes_h_l3219_c7_784b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3219_c7_784b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3219_c7_784b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3223_c11_ae70
BIN_OP_EQ_uxn_opcodes_h_l3223_c11_ae70 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3223_c11_ae70_left,
BIN_OP_EQ_uxn_opcodes_h_l3223_c11_ae70_right,
BIN_OP_EQ_uxn_opcodes_h_l3223_c11_ae70_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_2ff7
result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_2ff7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_2ff7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_2ff7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_2ff7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_2ff7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_2ff7
result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_2ff7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_2ff7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_2ff7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_2ff7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_2ff7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_2ff7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_2ff7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_2ff7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_2ff7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_2ff7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_2ff7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3223_c7_2ff7
result_stack_value_MUX_uxn_opcodes_h_l3223_c7_2ff7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3223_c7_2ff7_cond,
result_stack_value_MUX_uxn_opcodes_h_l3223_c7_2ff7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3223_c7_2ff7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3223_c7_2ff7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3227_c11_5791
BIN_OP_EQ_uxn_opcodes_h_l3227_c11_5791 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3227_c11_5791_left,
BIN_OP_EQ_uxn_opcodes_h_l3227_c11_5791_right,
BIN_OP_EQ_uxn_opcodes_h_l3227_c11_5791_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3227_c7_6a96
result_is_stack_write_MUX_uxn_opcodes_h_l3227_c7_6a96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3227_c7_6a96_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3227_c7_6a96_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3227_c7_6a96_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3227_c7_6a96_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3227_c7_6a96
result_is_opc_done_MUX_uxn_opcodes_h_l3227_c7_6a96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3227_c7_6a96_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3227_c7_6a96_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3227_c7_6a96_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3227_c7_6a96_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3227_c7_6a96
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3227_c7_6a96 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3227_c7_6a96_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3227_c7_6a96_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3227_c7_6a96_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3227_c7_6a96_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3227_c7_6a96
result_stack_value_MUX_uxn_opcodes_h_l3227_c7_6a96 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3227_c7_6a96_cond,
result_stack_value_MUX_uxn_opcodes_h_l3227_c7_6a96_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3227_c7_6a96_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3227_c7_6a96_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3231_c11_a1b2
BIN_OP_EQ_uxn_opcodes_h_l3231_c11_a1b2 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3231_c11_a1b2_left,
BIN_OP_EQ_uxn_opcodes_h_l3231_c11_a1b2_right,
BIN_OP_EQ_uxn_opcodes_h_l3231_c11_a1b2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_83cb
result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_83cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_83cb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_83cb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_83cb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_83cb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_83cb
result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_83cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_83cb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_83cb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_83cb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_83cb_return_output);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l3229_l3221_DUPLICATE_36ef
CONST_SR_8_uint16_t_uxn_opcodes_h_l3229_l3221_DUPLICATE_36ef : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_opcodes_h_l3229_l3221_DUPLICATE_36ef_x,
CONST_SR_8_uint16_t_uxn_opcodes_h_l3229_l3221_DUPLICATE_36ef_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l3190_c6_f3b4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2ccc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output,
 t16_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3196_c11_7f7a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3196_c7_c624_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3196_c7_c624_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3196_c7_c624_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3196_c7_c624_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3196_c7_c624_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3196_c7_c624_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3196_c7_c624_return_output,
 t16_MUX_uxn_opcodes_h_l3196_c7_c624_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3199_c11_59c1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3199_c7_8551_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3199_c7_8551_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3199_c7_8551_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3199_c7_8551_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3199_c7_8551_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3199_c7_8551_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3199_c7_8551_return_output,
 t16_MUX_uxn_opcodes_h_l3199_c7_8551_return_output,
 CONST_SL_8_uxn_opcodes_h_l3201_c3_70a7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3204_c11_79bf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output,
 t16_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3207_c11_ff01_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3207_c7_3679_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3207_c7_3679_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3207_c7_3679_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3207_c7_3679_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3207_c7_3679_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3207_c7_3679_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3207_c7_3679_return_output,
 t16_MUX_uxn_opcodes_h_l3207_c7_3679_return_output,
 BIN_OP_OR_uxn_opcodes_h_l3208_c3_0ca7_return_output,
 BIN_OP_AND_uxn_opcodes_h_l3211_c32_f5d8_return_output,
 BIN_OP_GT_uxn_opcodes_h_l3211_c32_d927_return_output,
 MUX_uxn_opcodes_h_l3211_c32_46c6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3213_c11_ea62_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3213_c7_4dfb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_4dfb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_4dfb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3213_c7_4dfb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3213_c7_4dfb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3219_c11_c597_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3219_c7_784b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3219_c7_784b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3219_c7_784b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3219_c7_784b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3223_c11_ae70_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_2ff7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_2ff7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_2ff7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3223_c7_2ff7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3227_c11_5791_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3227_c7_6a96_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3227_c7_6a96_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3227_c7_6a96_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3227_c7_6a96_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3231_c11_a1b2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_83cb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_83cb_return_output,
 CONST_SR_8_uint16_t_uxn_opcodes_h_l3229_l3221_DUPLICATE_36ef_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3190_c6_f3b4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3190_c6_f3b4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3190_c6_f3b4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2ccc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2ccc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2ccc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2ccc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3196_c7_c624_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3190_c2_5b5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3190_c2_5b5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3196_c7_c624_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3190_c2_5b5f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3196_c7_c624_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3190_c2_5b5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3190_c2_5b5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3196_c7_c624_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3190_c2_5b5f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3190_c2_5b5f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3193_c3_d31a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3190_c2_5b5f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3196_c7_c624_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3190_c2_5b5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3190_c2_5b5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3190_c2_5b5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3196_c7_c624_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3190_c2_5b5f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3190_c2_5b5f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3190_c2_5b5f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3196_c7_c624_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3190_c2_5b5f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3190_c2_5b5f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3190_c2_5b5f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3196_c7_c624_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3190_c2_5b5f_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3191_c3_b0b1_uxn_opcodes_h_l3191_c3_b0b1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3196_c11_7f7a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3196_c11_7f7a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3196_c11_7f7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3196_c7_c624_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3196_c7_c624_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3199_c7_8551_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3196_c7_c624_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3196_c7_c624_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3196_c7_c624_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3199_c7_8551_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3196_c7_c624_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3196_c7_c624_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3196_c7_c624_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3199_c7_8551_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3196_c7_c624_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3196_c7_c624_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3196_c7_c624_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3199_c7_8551_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3196_c7_c624_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3196_c7_c624_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3197_c3_883d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3196_c7_c624_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3199_c7_8551_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3196_c7_c624_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3196_c7_c624_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3196_c7_c624_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3199_c7_8551_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3196_c7_c624_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3196_c7_c624_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3196_c7_c624_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3199_c7_8551_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3196_c7_c624_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3196_c7_c624_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3196_c7_c624_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3199_c7_8551_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3196_c7_c624_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3199_c11_59c1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3199_c11_59c1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3199_c11_59c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3199_c7_8551_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3199_c7_8551_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3199_c7_8551_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3199_c7_8551_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3199_c7_8551_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3199_c7_8551_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3199_c7_8551_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3199_c7_8551_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3199_c7_8551_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3199_c7_8551_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3199_c7_8551_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3199_c7_8551_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3199_c7_8551_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3202_c3_5f85 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3199_c7_8551_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3199_c7_8551_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3199_c7_8551_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3199_c7_8551_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3199_c7_8551_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3199_c7_8551_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3199_c7_8551_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3199_c7_8551_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3199_c7_8551_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3199_c7_8551_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3199_c7_8551_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l3201_c3_70a7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l3201_c3_70a7_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3204_c11_79bf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3204_c11_79bf_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3204_c11_79bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3204_c7_3c92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3204_c7_3c92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3207_c7_3679_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3204_c7_3c92_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3204_c7_3c92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3204_c7_3c92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3207_c7_3679_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3204_c7_3c92_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3204_c7_3c92_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3204_c7_3c92_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3207_c7_3679_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3204_c7_3c92_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3204_c7_3c92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3204_c7_3c92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3207_c7_3679_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3204_c7_3c92_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3204_c7_3c92_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3205_c3_89f2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3204_c7_3c92_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3207_c7_3679_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3204_c7_3c92_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3204_c7_3c92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3204_c7_3c92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3207_c7_3679_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3204_c7_3c92_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3204_c7_3c92_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3204_c7_3c92_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3207_c7_3679_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3204_c7_3c92_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3204_c7_3c92_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3204_c7_3c92_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3207_c7_3679_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3204_c7_3c92_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3207_c11_ff01_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3207_c11_ff01_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3207_c11_ff01_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3207_c7_3679_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3207_c7_3679_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3213_c7_4dfb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3207_c7_3679_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3207_c7_3679_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3207_c7_3679_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3207_c7_3679_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3207_c7_3679_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3207_c7_3679_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3207_c7_3679_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3207_c7_3679_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3207_c7_3679_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_4dfb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3207_c7_3679_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3207_c7_3679_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3207_c7_3679_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3213_c7_4dfb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3207_c7_3679_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3207_c7_3679_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3207_c7_3679_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_4dfb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3207_c7_3679_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3207_c7_3679_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3207_c7_3679_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3213_c7_4dfb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3207_c7_3679_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3207_c7_3679_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3207_c7_3679_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3207_c7_3679_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3208_c3_0ca7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3208_c3_0ca7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3208_c3_0ca7_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3211_c32_46c6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3211_c32_46c6_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3211_c32_46c6_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3211_c32_f5d8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3211_c32_f5d8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3211_c32_f5d8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3211_c32_d927_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3211_c32_d927_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3211_c32_d927_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3211_c32_46c6_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3213_c11_ea62_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3213_c11_ea62_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3213_c11_ea62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3213_c7_4dfb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3213_c7_4dfb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3213_c7_4dfb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_4dfb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_4dfb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3219_c7_784b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_4dfb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_4dfb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_4dfb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3219_c7_784b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_4dfb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3213_c7_4dfb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3216_c3_1684 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3213_c7_4dfb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3219_c7_784b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3213_c7_4dfb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3213_c7_4dfb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3213_c7_4dfb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3219_c7_784b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3213_c7_4dfb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3219_c11_c597_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3219_c11_c597_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3219_c11_c597_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3219_c7_784b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3219_c7_784b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_2ff7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3219_c7_784b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3219_c7_784b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3219_c7_784b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_2ff7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3219_c7_784b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3219_c7_784b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3220_c3_0aa7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3219_c7_784b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_2ff7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3219_c7_784b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3219_c7_784b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3219_c7_784b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3223_c7_2ff7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3219_c7_784b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3223_c11_ae70_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3223_c11_ae70_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3223_c11_ae70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_2ff7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_2ff7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3227_c7_6a96_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_2ff7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_2ff7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_2ff7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3227_c7_6a96_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_2ff7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_2ff7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3224_c3_67b4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_2ff7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3227_c7_6a96_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_2ff7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3223_c7_2ff7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3223_c7_2ff7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3227_c7_6a96_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3223_c7_2ff7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3227_c11_5791_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3227_c11_5791_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3227_c11_5791_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3227_c7_6a96_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3227_c7_6a96_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_83cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3227_c7_6a96_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3227_c7_6a96_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3227_c7_6a96_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_83cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3227_c7_6a96_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3227_c7_6a96_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3228_c3_578f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3227_c7_6a96_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3227_c7_6a96_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3227_c7_6a96_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3227_c7_6a96_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3227_c7_6a96_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3231_c11_a1b2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3231_c11_a1b2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3231_c11_a1b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_83cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_83cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_83cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_83cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_83cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_83cb_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3190_l3213_l3204_l3199_l3196_DUPLICATE_02a8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3190_l3207_l3204_l3199_l3196_DUPLICATE_f4b7_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3190_l3219_l3207_l3204_l3231_l3199_l3227_l3196_l3223_DUPLICATE_8035_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3190_l3207_l3204_l3199_l3227_l3196_DUPLICATE_7b8e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3204_l3196_l3207_l3199_DUPLICATE_104a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3219_l3213_l3207_l3204_l3231_l3199_l3227_l3196_l3223_DUPLICATE_6164_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3208_l3200_DUPLICATE_7b7d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3227_l3207_DUPLICATE_546d_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3217_l3225_DUPLICATE_0fae_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3229_l3221_DUPLICATE_36ef_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3229_l3221_DUPLICATE_36ef_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3221_l3229_DUPLICATE_4319_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l3186_l3236_DUPLICATE_4449_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_83cb_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3190_c2_5b5f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3204_c11_79bf_right := to_unsigned(3, 2);
     VAR_BIN_OP_GT_uxn_opcodes_h_l3211_c32_d927_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3190_c6_f3b4_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3193_c3_d31a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3190_c2_5b5f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3193_c3_d31a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3227_c11_5791_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3205_c3_89f2 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3204_c7_3c92_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3205_c3_89f2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3213_c11_ea62_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3223_c11_ae70_right := to_unsigned(7, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l3211_c32_f5d8_right := to_unsigned(128, 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_4dfb_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3216_c3_1684 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3213_c7_4dfb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3216_c3_1684;
     VAR_MUX_uxn_opcodes_h_l3211_c32_46c6_iftrue := signed(std_logic_vector(resize(to_unsigned(4, 3), 8)));
     VAR_MUX_uxn_opcodes_h_l3211_c32_46c6_iffalse := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3199_c11_59c1_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3207_c7_3679_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3190_c2_5b5f_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2ccc_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3202_c3_5f85 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3199_c7_8551_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3202_c3_5f85;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3228_c3_578f := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3227_c7_6a96_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3228_c3_578f;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3207_c7_3679_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3231_c11_a1b2_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3224_c3_67b4 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_2ff7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3224_c3_67b4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3219_c11_c597_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3220_c3_0aa7 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3219_c7_784b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3220_c3_0aa7;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3213_c7_4dfb_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_83cb_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3197_c3_883d := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3196_c7_c624_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3197_c3_883d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3207_c11_ff01_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3196_c11_7f7a_right := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2ccc_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l3211_c32_f5d8_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3190_c6_f3b4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3196_c11_7f7a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3199_c11_59c1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3204_c11_79bf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3207_c11_ff01_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3213_c11_ea62_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3219_c11_c597_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3223_c11_ae70_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3227_c11_5791_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3231_c11_a1b2_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l3208_c3_0ca7_left := t16;
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3229_l3221_DUPLICATE_36ef_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l3190_c2_5b5f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l3196_c7_c624_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l3204_c7_3c92_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l3207_c7_3679_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3219_l3213_l3207_l3204_l3231_l3199_l3227_l3196_l3223_DUPLICATE_6164 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3219_l3213_l3207_l3204_l3231_l3199_l3227_l3196_l3223_DUPLICATE_6164_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l3199_c11_59c1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3199_c11_59c1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3199_c11_59c1_left;
     BIN_OP_EQ_uxn_opcodes_h_l3199_c11_59c1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3199_c11_59c1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3199_c11_59c1_return_output := BIN_OP_EQ_uxn_opcodes_h_l3199_c11_59c1_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3208_l3200_DUPLICATE_7b7d LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3208_l3200_DUPLICATE_7b7d_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l3207_c11_ff01] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3207_c11_ff01_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3207_c11_ff01_left;
     BIN_OP_EQ_uxn_opcodes_h_l3207_c11_ff01_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3207_c11_ff01_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3207_c11_ff01_return_output := BIN_OP_EQ_uxn_opcodes_h_l3207_c11_ff01_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3204_c11_79bf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3204_c11_79bf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3204_c11_79bf_left;
     BIN_OP_EQ_uxn_opcodes_h_l3204_c11_79bf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3204_c11_79bf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3204_c11_79bf_return_output := BIN_OP_EQ_uxn_opcodes_h_l3204_c11_79bf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3196_c11_7f7a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3196_c11_7f7a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3196_c11_7f7a_left;
     BIN_OP_EQ_uxn_opcodes_h_l3196_c11_7f7a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3196_c11_7f7a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3196_c11_7f7a_return_output := BIN_OP_EQ_uxn_opcodes_h_l3196_c11_7f7a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3219_c11_c597] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3219_c11_c597_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3219_c11_c597_left;
     BIN_OP_EQ_uxn_opcodes_h_l3219_c11_c597_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3219_c11_c597_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3219_c11_c597_return_output := BIN_OP_EQ_uxn_opcodes_h_l3219_c11_c597_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3190_c6_f3b4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3190_c6_f3b4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3190_c6_f3b4_left;
     BIN_OP_EQ_uxn_opcodes_h_l3190_c6_f3b4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3190_c6_f3b4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3190_c6_f3b4_return_output := BIN_OP_EQ_uxn_opcodes_h_l3190_c6_f3b4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3227_c11_5791] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3227_c11_5791_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3227_c11_5791_left;
     BIN_OP_EQ_uxn_opcodes_h_l3227_c11_5791_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3227_c11_5791_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3227_c11_5791_return_output := BIN_OP_EQ_uxn_opcodes_h_l3227_c11_5791_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3213_c11_ea62] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3213_c11_ea62_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3213_c11_ea62_left;
     BIN_OP_EQ_uxn_opcodes_h_l3213_c11_ea62_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3213_c11_ea62_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3213_c11_ea62_return_output := BIN_OP_EQ_uxn_opcodes_h_l3213_c11_ea62_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3204_l3196_l3207_l3199_DUPLICATE_104a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3204_l3196_l3207_l3199_DUPLICATE_104a_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3190_l3213_l3204_l3199_l3196_DUPLICATE_02a8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3190_l3213_l3204_l3199_l3196_DUPLICATE_02a8_return_output := result.is_sp_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l3211_c32_f5d8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l3211_c32_f5d8_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l3211_c32_f5d8_left;
     BIN_OP_AND_uxn_opcodes_h_l3211_c32_f5d8_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l3211_c32_f5d8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l3211_c32_f5d8_return_output := BIN_OP_AND_uxn_opcodes_h_l3211_c32_f5d8_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3190_l3207_l3204_l3199_l3196_DUPLICATE_f4b7 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3190_l3207_l3204_l3199_l3196_DUPLICATE_f4b7_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3190_l3207_l3204_l3199_l3227_l3196_DUPLICATE_7b8e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3190_l3207_l3204_l3199_l3227_l3196_DUPLICATE_7b8e_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l3231_c11_a1b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3231_c11_a1b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3231_c11_a1b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l3231_c11_a1b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3231_c11_a1b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3231_c11_a1b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l3231_c11_a1b2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3223_c11_ae70] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3223_c11_ae70_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3223_c11_ae70_left;
     BIN_OP_EQ_uxn_opcodes_h_l3223_c11_ae70_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3223_c11_ae70_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3223_c11_ae70_return_output := BIN_OP_EQ_uxn_opcodes_h_l3223_c11_ae70_return_output;

     -- CONST_SR_8_uint16_t_uxn_opcodes_h_l3229_l3221_DUPLICATE_36ef LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_opcodes_h_l3229_l3221_DUPLICATE_36ef_x <= VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3229_l3221_DUPLICATE_36ef_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3229_l3221_DUPLICATE_36ef_return_output := CONST_SR_8_uint16_t_uxn_opcodes_h_l3229_l3221_DUPLICATE_36ef_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3217_l3225_DUPLICATE_0fae LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3217_l3225_DUPLICATE_0fae_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3227_l3207_DUPLICATE_546d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3227_l3207_DUPLICATE_546d_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3190_l3219_l3207_l3204_l3231_l3199_l3227_l3196_l3223_DUPLICATE_8035 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3190_l3219_l3207_l3204_l3231_l3199_l3227_l3196_l3223_DUPLICATE_8035_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l3211_c32_d927_left := VAR_BIN_OP_AND_uxn_opcodes_h_l3211_c32_f5d8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2ccc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3190_c6_f3b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3190_c2_5b5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3190_c6_f3b4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3190_c6_f3b4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3190_c2_5b5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3190_c6_f3b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3190_c2_5b5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3190_c6_f3b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3190_c6_f3b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3190_c2_5b5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3190_c6_f3b4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3190_c2_5b5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3190_c6_f3b4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3190_c2_5b5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3190_c6_f3b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3196_c7_c624_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3196_c11_7f7a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3196_c7_c624_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3196_c11_7f7a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3196_c7_c624_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3196_c11_7f7a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3196_c7_c624_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3196_c11_7f7a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3196_c7_c624_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3196_c11_7f7a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3196_c7_c624_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3196_c11_7f7a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3196_c7_c624_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3196_c11_7f7a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3196_c7_c624_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3196_c11_7f7a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3199_c7_8551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3199_c11_59c1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3199_c7_8551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3199_c11_59c1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3199_c7_8551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3199_c11_59c1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3199_c7_8551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3199_c11_59c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3199_c7_8551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3199_c11_59c1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3199_c7_8551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3199_c11_59c1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3199_c7_8551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3199_c11_59c1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3199_c7_8551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3199_c11_59c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3204_c7_3c92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3204_c11_79bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3204_c7_3c92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3204_c11_79bf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3204_c7_3c92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3204_c11_79bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3204_c7_3c92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3204_c11_79bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3204_c7_3c92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3204_c11_79bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3204_c7_3c92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3204_c11_79bf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3204_c7_3c92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3204_c11_79bf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3204_c7_3c92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3204_c11_79bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3207_c7_3679_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3207_c11_ff01_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3207_c7_3679_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3207_c11_ff01_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3207_c7_3679_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3207_c11_ff01_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3207_c7_3679_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3207_c11_ff01_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3207_c7_3679_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3207_c11_ff01_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3207_c7_3679_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3207_c11_ff01_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3207_c7_3679_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3207_c11_ff01_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3207_c7_3679_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3207_c11_ff01_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_4dfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3213_c11_ea62_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3213_c7_4dfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3213_c11_ea62_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_4dfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3213_c11_ea62_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3213_c7_4dfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3213_c11_ea62_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3213_c7_4dfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3213_c11_ea62_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3219_c7_784b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3219_c11_c597_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3219_c7_784b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3219_c11_c597_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3219_c7_784b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3219_c11_c597_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3219_c7_784b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3219_c11_c597_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_2ff7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3223_c11_ae70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_2ff7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3223_c11_ae70_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_2ff7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3223_c11_ae70_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3223_c7_2ff7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3223_c11_ae70_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3227_c7_6a96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3227_c11_5791_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3227_c7_6a96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3227_c11_5791_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3227_c7_6a96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3227_c11_5791_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3227_c7_6a96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3227_c11_5791_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_83cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3231_c11_a1b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_83cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3231_c11_a1b2_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l3208_c3_0ca7_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3208_l3200_DUPLICATE_7b7d_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l3201_c3_70a7_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3208_l3200_DUPLICATE_7b7d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3213_c7_4dfb_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3217_l3225_DUPLICATE_0fae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3223_c7_2ff7_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3217_l3225_DUPLICATE_0fae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3190_l3207_l3204_l3199_l3196_DUPLICATE_f4b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3196_c7_c624_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3190_l3207_l3204_l3199_l3196_DUPLICATE_f4b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3199_c7_8551_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3190_l3207_l3204_l3199_l3196_DUPLICATE_f4b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3204_c7_3c92_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3190_l3207_l3204_l3199_l3196_DUPLICATE_f4b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3207_c7_3679_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3190_l3207_l3204_l3199_l3196_DUPLICATE_f4b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3196_c7_c624_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3219_l3213_l3207_l3204_l3231_l3199_l3227_l3196_l3223_DUPLICATE_6164_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3199_c7_8551_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3219_l3213_l3207_l3204_l3231_l3199_l3227_l3196_l3223_DUPLICATE_6164_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3204_c7_3c92_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3219_l3213_l3207_l3204_l3231_l3199_l3227_l3196_l3223_DUPLICATE_6164_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3207_c7_3679_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3219_l3213_l3207_l3204_l3231_l3199_l3227_l3196_l3223_DUPLICATE_6164_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_4dfb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3219_l3213_l3207_l3204_l3231_l3199_l3227_l3196_l3223_DUPLICATE_6164_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3219_c7_784b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3219_l3213_l3207_l3204_l3231_l3199_l3227_l3196_l3223_DUPLICATE_6164_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_2ff7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3219_l3213_l3207_l3204_l3231_l3199_l3227_l3196_l3223_DUPLICATE_6164_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3227_c7_6a96_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3219_l3213_l3207_l3204_l3231_l3199_l3227_l3196_l3223_DUPLICATE_6164_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_83cb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3219_l3213_l3207_l3204_l3231_l3199_l3227_l3196_l3223_DUPLICATE_6164_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3190_l3213_l3204_l3199_l3196_DUPLICATE_02a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3196_c7_c624_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3190_l3213_l3204_l3199_l3196_DUPLICATE_02a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3199_c7_8551_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3190_l3213_l3204_l3199_l3196_DUPLICATE_02a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3204_c7_3c92_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3190_l3213_l3204_l3199_l3196_DUPLICATE_02a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3213_c7_4dfb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3190_l3213_l3204_l3199_l3196_DUPLICATE_02a8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3196_c7_c624_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3204_l3196_l3207_l3199_DUPLICATE_104a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3199_c7_8551_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3204_l3196_l3207_l3199_DUPLICATE_104a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3204_c7_3c92_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3204_l3196_l3207_l3199_DUPLICATE_104a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3207_c7_3679_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3204_l3196_l3207_l3199_DUPLICATE_104a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3190_c2_5b5f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3190_l3219_l3207_l3204_l3231_l3199_l3227_l3196_l3223_DUPLICATE_8035_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3196_c7_c624_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3190_l3219_l3207_l3204_l3231_l3199_l3227_l3196_l3223_DUPLICATE_8035_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3199_c7_8551_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3190_l3219_l3207_l3204_l3231_l3199_l3227_l3196_l3223_DUPLICATE_8035_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3204_c7_3c92_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3190_l3219_l3207_l3204_l3231_l3199_l3227_l3196_l3223_DUPLICATE_8035_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3207_c7_3679_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3190_l3219_l3207_l3204_l3231_l3199_l3227_l3196_l3223_DUPLICATE_8035_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3219_c7_784b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3190_l3219_l3207_l3204_l3231_l3199_l3227_l3196_l3223_DUPLICATE_8035_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_2ff7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3190_l3219_l3207_l3204_l3231_l3199_l3227_l3196_l3223_DUPLICATE_8035_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3227_c7_6a96_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3190_l3219_l3207_l3204_l3231_l3199_l3227_l3196_l3223_DUPLICATE_8035_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_83cb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3190_l3219_l3207_l3204_l3231_l3199_l3227_l3196_l3223_DUPLICATE_8035_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3207_c7_3679_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3227_l3207_DUPLICATE_546d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3227_c7_6a96_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3227_l3207_DUPLICATE_546d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3190_c2_5b5f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3190_l3207_l3204_l3199_l3227_l3196_DUPLICATE_7b8e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3196_c7_c624_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3190_l3207_l3204_l3199_l3227_l3196_DUPLICATE_7b8e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3199_c7_8551_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3190_l3207_l3204_l3199_l3227_l3196_DUPLICATE_7b8e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3204_c7_3c92_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3190_l3207_l3204_l3199_l3227_l3196_DUPLICATE_7b8e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3207_c7_3679_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3190_l3207_l3204_l3199_l3227_l3196_DUPLICATE_7b8e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3227_c7_6a96_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3190_l3207_l3204_l3199_l3227_l3196_DUPLICATE_7b8e_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3190_c1_2ccc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2ccc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2ccc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2ccc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2ccc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2ccc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2ccc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2ccc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2ccc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3231_c7_83cb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_83cb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_83cb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_83cb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_83cb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_83cb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_83cb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_83cb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_83cb_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3207_c7_3679] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3207_c7_3679_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3207_c7_3679_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3207_c7_3679_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3207_c7_3679_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3207_c7_3679_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3207_c7_3679_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3207_c7_3679_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3207_c7_3679_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l3211_c32_d927] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l3211_c32_d927_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l3211_c32_d927_left;
     BIN_OP_GT_uxn_opcodes_h_l3211_c32_d927_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l3211_c32_d927_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l3211_c32_d927_return_output := BIN_OP_GT_uxn_opcodes_h_l3211_c32_d927_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l3201_c3_70a7] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l3201_c3_70a7_x <= VAR_CONST_SL_8_uxn_opcodes_h_l3201_c3_70a7_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l3201_c3_70a7_return_output := CONST_SL_8_uxn_opcodes_h_l3201_c3_70a7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3227_c7_6a96] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3227_c7_6a96_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3227_c7_6a96_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3227_c7_6a96_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3227_c7_6a96_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3227_c7_6a96_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3227_c7_6a96_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3227_c7_6a96_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3227_c7_6a96_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3221_l3229_DUPLICATE_4319 LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3221_l3229_DUPLICATE_4319_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3229_l3221_DUPLICATE_36ef_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3213_c7_4dfb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3213_c7_4dfb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3213_c7_4dfb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3213_c7_4dfb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3213_c7_4dfb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3213_c7_4dfb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3213_c7_4dfb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3213_c7_4dfb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3213_c7_4dfb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3231_c7_83cb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_83cb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_83cb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_83cb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_83cb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_83cb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_83cb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_83cb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_83cb_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l3208_c3_0ca7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l3208_c3_0ca7_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l3208_c3_0ca7_left;
     BIN_OP_OR_uxn_opcodes_h_l3208_c3_0ca7_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l3208_c3_0ca7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l3208_c3_0ca7_return_output := BIN_OP_OR_uxn_opcodes_h_l3208_c3_0ca7_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l3211_c32_46c6_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l3211_c32_d927_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3207_c7_3679_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l3208_c3_0ca7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3219_c7_784b_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3221_l3229_DUPLICATE_4319_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3227_c7_6a96_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3221_l3229_DUPLICATE_4319_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3199_c7_8551_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l3201_c3_70a7_return_output;
     VAR_printf_uxn_opcodes_h_l3191_c3_b0b1_uxn_opcodes_h_l3191_c3_b0b1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2ccc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3227_c7_6a96_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_83cb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3207_c7_3679_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3213_c7_4dfb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3204_c7_3c92_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3207_c7_3679_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3227_c7_6a96_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_83cb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_2ff7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3227_c7_6a96_return_output;
     -- MUX[uxn_opcodes_h_l3211_c32_46c6] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l3211_c32_46c6_cond <= VAR_MUX_uxn_opcodes_h_l3211_c32_46c6_cond;
     MUX_uxn_opcodes_h_l3211_c32_46c6_iftrue <= VAR_MUX_uxn_opcodes_h_l3211_c32_46c6_iftrue;
     MUX_uxn_opcodes_h_l3211_c32_46c6_iffalse <= VAR_MUX_uxn_opcodes_h_l3211_c32_46c6_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l3211_c32_46c6_return_output := MUX_uxn_opcodes_h_l3211_c32_46c6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3227_c7_6a96] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3227_c7_6a96_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3227_c7_6a96_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3227_c7_6a96_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3227_c7_6a96_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3227_c7_6a96_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3227_c7_6a96_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3227_c7_6a96_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3227_c7_6a96_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3207_c7_3679] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3207_c7_3679_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3207_c7_3679_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3207_c7_3679_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3207_c7_3679_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3207_c7_3679_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3207_c7_3679_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3207_c7_3679_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3207_c7_3679_return_output;

     -- t16_MUX[uxn_opcodes_h_l3207_c7_3679] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3207_c7_3679_cond <= VAR_t16_MUX_uxn_opcodes_h_l3207_c7_3679_cond;
     t16_MUX_uxn_opcodes_h_l3207_c7_3679_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3207_c7_3679_iftrue;
     t16_MUX_uxn_opcodes_h_l3207_c7_3679_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3207_c7_3679_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3207_c7_3679_return_output := t16_MUX_uxn_opcodes_h_l3207_c7_3679_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3227_c7_6a96] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3227_c7_6a96_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3227_c7_6a96_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3227_c7_6a96_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3227_c7_6a96_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3227_c7_6a96_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3227_c7_6a96_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3227_c7_6a96_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3227_c7_6a96_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3227_c7_6a96] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3227_c7_6a96_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3227_c7_6a96_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3227_c7_6a96_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3227_c7_6a96_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3227_c7_6a96_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3227_c7_6a96_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3227_c7_6a96_return_output := result_stack_value_MUX_uxn_opcodes_h_l3227_c7_6a96_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3223_c7_2ff7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_2ff7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_2ff7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_2ff7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_2ff7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_2ff7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_2ff7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_2ff7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_2ff7_return_output;

     -- printf_uxn_opcodes_h_l3191_c3_b0b1[uxn_opcodes_h_l3191_c3_b0b1] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l3191_c3_b0b1_uxn_opcodes_h_l3191_c3_b0b1_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l3191_c3_b0b1_uxn_opcodes_h_l3191_c3_b0b1_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3204_c7_3c92] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3204_c7_3c92_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3204_c7_3c92_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3204_c7_3c92_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3204_c7_3c92_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3204_c7_3c92_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3204_c7_3c92_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3207_c7_3679_iftrue := VAR_MUX_uxn_opcodes_h_l3211_c32_46c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_2ff7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3227_c7_6a96_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3204_c7_3c92_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3207_c7_3679_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3199_c7_8551_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_2ff7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3227_c7_6a96_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3219_c7_784b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_2ff7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3223_c7_2ff7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3227_c7_6a96_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3204_c7_3c92_iffalse := VAR_t16_MUX_uxn_opcodes_h_l3207_c7_3679_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l3223_c7_2ff7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_2ff7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_2ff7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_2ff7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_2ff7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_2ff7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_2ff7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_2ff7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_2ff7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3223_c7_2ff7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3223_c7_2ff7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3223_c7_2ff7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3223_c7_2ff7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3223_c7_2ff7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3223_c7_2ff7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3223_c7_2ff7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3223_c7_2ff7_return_output := result_stack_value_MUX_uxn_opcodes_h_l3223_c7_2ff7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3207_c7_3679] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3207_c7_3679_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3207_c7_3679_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3207_c7_3679_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3207_c7_3679_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3207_c7_3679_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3207_c7_3679_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3207_c7_3679_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3207_c7_3679_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3199_c7_8551] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3199_c7_8551_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3199_c7_8551_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3199_c7_8551_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3199_c7_8551_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3199_c7_8551_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3199_c7_8551_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3199_c7_8551_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3199_c7_8551_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3223_c7_2ff7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_2ff7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_2ff7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_2ff7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_2ff7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_2ff7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_2ff7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_2ff7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_2ff7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3219_c7_784b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3219_c7_784b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3219_c7_784b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3219_c7_784b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3219_c7_784b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3219_c7_784b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3219_c7_784b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3219_c7_784b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3219_c7_784b_return_output;

     -- t16_MUX[uxn_opcodes_h_l3204_c7_3c92] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3204_c7_3c92_cond <= VAR_t16_MUX_uxn_opcodes_h_l3204_c7_3c92_cond;
     t16_MUX_uxn_opcodes_h_l3204_c7_3c92_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3204_c7_3c92_iftrue;
     t16_MUX_uxn_opcodes_h_l3204_c7_3c92_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3204_c7_3c92_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output := t16_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3204_c7_3c92] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3204_c7_3c92_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3204_c7_3c92_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3204_c7_3c92_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3204_c7_3c92_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3204_c7_3c92_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3204_c7_3c92_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3219_c7_784b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_2ff7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3199_c7_8551_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3196_c7_c624_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3199_c7_8551_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3219_c7_784b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_2ff7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3204_c7_3c92_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3207_c7_3679_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3213_c7_4dfb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3219_c7_784b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3219_c7_784b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3223_c7_2ff7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3199_c7_8551_iffalse := VAR_t16_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output;
     -- t16_MUX[uxn_opcodes_h_l3199_c7_8551] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3199_c7_8551_cond <= VAR_t16_MUX_uxn_opcodes_h_l3199_c7_8551_cond;
     t16_MUX_uxn_opcodes_h_l3199_c7_8551_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3199_c7_8551_iftrue;
     t16_MUX_uxn_opcodes_h_l3199_c7_8551_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3199_c7_8551_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3199_c7_8551_return_output := t16_MUX_uxn_opcodes_h_l3199_c7_8551_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3213_c7_4dfb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3213_c7_4dfb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3213_c7_4dfb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3213_c7_4dfb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3213_c7_4dfb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3213_c7_4dfb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3213_c7_4dfb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3213_c7_4dfb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3213_c7_4dfb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3219_c7_784b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3219_c7_784b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3219_c7_784b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3219_c7_784b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3219_c7_784b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3219_c7_784b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3219_c7_784b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3219_c7_784b_return_output := result_stack_value_MUX_uxn_opcodes_h_l3219_c7_784b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3204_c7_3c92] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3204_c7_3c92_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3204_c7_3c92_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3204_c7_3c92_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3204_c7_3c92_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3204_c7_3c92_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3204_c7_3c92_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3219_c7_784b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3219_c7_784b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3219_c7_784b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3219_c7_784b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3219_c7_784b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3219_c7_784b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3219_c7_784b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3219_c7_784b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3219_c7_784b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3196_c7_c624] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3196_c7_c624_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3196_c7_c624_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3196_c7_c624_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3196_c7_c624_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3196_c7_c624_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3196_c7_c624_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3196_c7_c624_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3196_c7_c624_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3199_c7_8551] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3199_c7_8551_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3199_c7_8551_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3199_c7_8551_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3199_c7_8551_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3199_c7_8551_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3199_c7_8551_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3199_c7_8551_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3199_c7_8551_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3219_c7_784b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3219_c7_784b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3219_c7_784b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3219_c7_784b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3219_c7_784b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3219_c7_784b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3219_c7_784b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3219_c7_784b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3219_c7_784b_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_4dfb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3219_c7_784b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3196_c7_c624_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3199_c7_8551_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3190_c2_5b5f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3196_c7_c624_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_4dfb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3219_c7_784b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3199_c7_8551_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3207_c7_3679_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3213_c7_4dfb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3213_c7_4dfb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3219_c7_784b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3196_c7_c624_iffalse := VAR_t16_MUX_uxn_opcodes_h_l3199_c7_8551_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l3213_c7_4dfb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_4dfb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_4dfb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_4dfb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_4dfb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_4dfb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_4dfb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_4dfb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_4dfb_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3190_c2_5b5f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3190_c2_5b5f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3190_c2_5b5f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3190_c2_5b5f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3190_c2_5b5f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3190_c2_5b5f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3190_c2_5b5f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3196_c7_c624] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3196_c7_c624_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3196_c7_c624_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3196_c7_c624_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3196_c7_c624_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3196_c7_c624_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3196_c7_c624_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3196_c7_c624_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3196_c7_c624_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3213_c7_4dfb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3213_c7_4dfb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3213_c7_4dfb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3213_c7_4dfb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3213_c7_4dfb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3213_c7_4dfb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3213_c7_4dfb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3213_c7_4dfb_return_output := result_stack_value_MUX_uxn_opcodes_h_l3213_c7_4dfb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3207_c7_3679] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3207_c7_3679_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3207_c7_3679_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3207_c7_3679_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3207_c7_3679_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3207_c7_3679_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3207_c7_3679_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3207_c7_3679_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3207_c7_3679_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3213_c7_4dfb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_4dfb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_4dfb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_4dfb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_4dfb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_4dfb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_4dfb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_4dfb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_4dfb_return_output;

     -- t16_MUX[uxn_opcodes_h_l3196_c7_c624] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3196_c7_c624_cond <= VAR_t16_MUX_uxn_opcodes_h_l3196_c7_c624_cond;
     t16_MUX_uxn_opcodes_h_l3196_c7_c624_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3196_c7_c624_iftrue;
     t16_MUX_uxn_opcodes_h_l3196_c7_c624_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3196_c7_c624_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3196_c7_c624_return_output := t16_MUX_uxn_opcodes_h_l3196_c7_c624_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3199_c7_8551] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3199_c7_8551_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3199_c7_8551_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3199_c7_8551_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3199_c7_8551_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3199_c7_8551_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3199_c7_8551_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3199_c7_8551_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3199_c7_8551_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3207_c7_3679_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_4dfb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3196_c7_c624_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3207_c7_3679_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_4dfb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3196_c7_c624_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3199_c7_8551_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3204_c7_3c92_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3207_c7_3679_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3207_c7_3679_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3213_c7_4dfb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3190_c2_5b5f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l3196_c7_c624_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l3207_c7_3679] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3207_c7_3679_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3207_c7_3679_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3207_c7_3679_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3207_c7_3679_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3207_c7_3679_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3207_c7_3679_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3207_c7_3679_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3207_c7_3679_return_output;

     -- t16_MUX[uxn_opcodes_h_l3190_c2_5b5f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3190_c2_5b5f_cond <= VAR_t16_MUX_uxn_opcodes_h_l3190_c2_5b5f_cond;
     t16_MUX_uxn_opcodes_h_l3190_c2_5b5f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3190_c2_5b5f_iftrue;
     t16_MUX_uxn_opcodes_h_l3190_c2_5b5f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3190_c2_5b5f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output := t16_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3190_c2_5b5f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3196_c7_c624] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3196_c7_c624_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3196_c7_c624_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3196_c7_c624_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3196_c7_c624_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3196_c7_c624_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3196_c7_c624_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3196_c7_c624_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3196_c7_c624_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3207_c7_3679] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3207_c7_3679_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3207_c7_3679_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3207_c7_3679_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3207_c7_3679_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3207_c7_3679_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3207_c7_3679_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3207_c7_3679_return_output := result_stack_value_MUX_uxn_opcodes_h_l3207_c7_3679_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3207_c7_3679] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3207_c7_3679_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3207_c7_3679_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3207_c7_3679_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3207_c7_3679_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3207_c7_3679_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3207_c7_3679_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3207_c7_3679_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3207_c7_3679_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3204_c7_3c92] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3204_c7_3c92_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3204_c7_3c92_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3204_c7_3c92_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3204_c7_3c92_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3204_c7_3c92_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3204_c7_3c92_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3204_c7_3c92_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3207_c7_3679_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3204_c7_3c92_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3207_c7_3679_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3196_c7_c624_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3199_c7_8551_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3204_c7_3c92_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3207_c7_3679_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3199_c7_8551] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3199_c7_8551_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3199_c7_8551_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3199_c7_8551_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3199_c7_8551_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3199_c7_8551_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3199_c7_8551_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3199_c7_8551_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3199_c7_8551_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3204_c7_3c92] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3204_c7_3c92_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3204_c7_3c92_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3204_c7_3c92_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3204_c7_3c92_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3204_c7_3c92_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3204_c7_3c92_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3204_c7_3c92] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3204_c7_3c92_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3204_c7_3c92_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3204_c7_3c92_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3204_c7_3c92_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3204_c7_3c92_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3204_c7_3c92_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output := result_stack_value_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3204_c7_3c92] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3204_c7_3c92_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3204_c7_3c92_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3204_c7_3c92_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3204_c7_3c92_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3204_c7_3c92_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3204_c7_3c92_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3190_c2_5b5f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3199_c7_8551_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3199_c7_8551_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3196_c7_c624_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3199_c7_8551_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3199_c7_8551_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3204_c7_3c92_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l3199_c7_8551] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3199_c7_8551_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3199_c7_8551_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3199_c7_8551_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3199_c7_8551_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3199_c7_8551_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3199_c7_8551_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3199_c7_8551_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3199_c7_8551_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3199_c7_8551] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3199_c7_8551_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3199_c7_8551_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3199_c7_8551_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3199_c7_8551_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3199_c7_8551_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3199_c7_8551_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3199_c7_8551_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3199_c7_8551_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3199_c7_8551] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3199_c7_8551_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3199_c7_8551_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3199_c7_8551_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3199_c7_8551_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3199_c7_8551_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3199_c7_8551_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3199_c7_8551_return_output := result_stack_value_MUX_uxn_opcodes_h_l3199_c7_8551_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3196_c7_c624] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3196_c7_c624_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3196_c7_c624_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3196_c7_c624_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3196_c7_c624_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3196_c7_c624_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3196_c7_c624_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3196_c7_c624_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3196_c7_c624_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3196_c7_c624_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3199_c7_8551_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3196_c7_c624_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3199_c7_8551_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3190_c2_5b5f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3196_c7_c624_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3196_c7_c624_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3199_c7_8551_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3190_c2_5b5f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3190_c2_5b5f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3190_c2_5b5f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3190_c2_5b5f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3190_c2_5b5f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3190_c2_5b5f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3190_c2_5b5f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3196_c7_c624] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3196_c7_c624_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3196_c7_c624_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3196_c7_c624_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3196_c7_c624_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3196_c7_c624_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3196_c7_c624_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3196_c7_c624_return_output := result_stack_value_MUX_uxn_opcodes_h_l3196_c7_c624_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3196_c7_c624] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3196_c7_c624_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3196_c7_c624_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3196_c7_c624_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3196_c7_c624_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3196_c7_c624_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3196_c7_c624_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3196_c7_c624_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3196_c7_c624_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3196_c7_c624] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3196_c7_c624_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3196_c7_c624_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3196_c7_c624_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3196_c7_c624_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3196_c7_c624_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3196_c7_c624_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3196_c7_c624_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3196_c7_c624_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3190_c2_5b5f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3196_c7_c624_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3190_c2_5b5f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3196_c7_c624_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3190_c2_5b5f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3196_c7_c624_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l3190_c2_5b5f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3190_c2_5b5f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3190_c2_5b5f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3190_c2_5b5f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3190_c2_5b5f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3190_c2_5b5f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3190_c2_5b5f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output := result_stack_value_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3190_c2_5b5f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3190_c2_5b5f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3190_c2_5b5f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3190_c2_5b5f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3190_c2_5b5f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3190_c2_5b5f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3190_c2_5b5f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3190_c2_5b5f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3190_c2_5b5f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3190_c2_5b5f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3190_c2_5b5f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3190_c2_5b5f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3190_c2_5b5f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3190_c2_5b5f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l3186_l3236_DUPLICATE_4449 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l3186_l3236_DUPLICATE_4449_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1ade(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3190_c2_5b5f_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l3186_l3236_DUPLICATE_4449_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l3186_l3236_DUPLICATE_4449_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
