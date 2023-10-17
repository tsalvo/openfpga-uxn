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
-- Submodules: 65
entity inc2_0CLK_861257cf is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end inc2_0CLK_861257cf;
architecture arch of inc2_0CLK_861257cf is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1431_c6_ddcb]
signal BIN_OP_EQ_uxn_opcodes_h_l1431_c6_ddcb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1431_c6_ddcb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1431_c6_ddcb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1431_c1_4c81]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_4c81_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_4c81_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_4c81_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_4c81_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1431_c2_542f]
signal tmp16_MUX_uxn_opcodes_h_l1431_c2_542f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1431_c2_542f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1431_c2_542f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1431_c2_542f_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1431_c2_542f]
signal result_u8_value_MUX_uxn_opcodes_h_l1431_c2_542f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1431_c2_542f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1431_c2_542f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1431_c2_542f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1431_c2_542f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_542f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_542f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_542f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_542f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1431_c2_542f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_542f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_542f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_542f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_542f_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1431_c2_542f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_542f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_542f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_542f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_542f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1431_c2_542f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_542f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_542f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_542f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_542f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1431_c2_542f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_542f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_542f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_542f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_542f_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1431_c2_542f]
signal t16_MUX_uxn_opcodes_h_l1431_c2_542f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1431_c2_542f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1431_c2_542f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1431_c2_542f_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1432_c3_e0a3[uxn_opcodes_h_l1432_c3_e0a3]
signal printf_uxn_opcodes_h_l1432_c3_e0a3_uxn_opcodes_h_l1432_c3_e0a3_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1436_c11_3841]
signal BIN_OP_EQ_uxn_opcodes_h_l1436_c11_3841_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1436_c11_3841_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1436_c11_3841_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1436_c7_3b75]
signal tmp16_MUX_uxn_opcodes_h_l1436_c7_3b75_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1436_c7_3b75_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1436_c7_3b75_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1436_c7_3b75]
signal result_u8_value_MUX_uxn_opcodes_h_l1436_c7_3b75_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1436_c7_3b75_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1436_c7_3b75_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1436_c7_3b75]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_3b75_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_3b75_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_3b75_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1436_c7_3b75]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_3b75_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_3b75_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_3b75_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1436_c7_3b75]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_3b75_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_3b75_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_3b75_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1436_c7_3b75]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_3b75_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_3b75_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_3b75_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1436_c7_3b75]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_3b75_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_3b75_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_3b75_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1436_c7_3b75]
signal t16_MUX_uxn_opcodes_h_l1436_c7_3b75_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1436_c7_3b75_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1436_c7_3b75_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1439_c11_309d]
signal BIN_OP_EQ_uxn_opcodes_h_l1439_c11_309d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1439_c11_309d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1439_c11_309d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1439_c7_450b]
signal tmp16_MUX_uxn_opcodes_h_l1439_c7_450b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1439_c7_450b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1439_c7_450b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1439_c7_450b_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1439_c7_450b]
signal result_u8_value_MUX_uxn_opcodes_h_l1439_c7_450b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1439_c7_450b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1439_c7_450b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1439_c7_450b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1439_c7_450b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_450b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_450b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_450b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_450b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1439_c7_450b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_450b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_450b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_450b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_450b_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1439_c7_450b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_450b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_450b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_450b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_450b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1439_c7_450b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_450b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_450b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_450b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_450b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1439_c7_450b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_450b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_450b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_450b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_450b_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1439_c7_450b]
signal t16_MUX_uxn_opcodes_h_l1439_c7_450b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1439_c7_450b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1439_c7_450b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1439_c7_450b_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1441_c3_c39a]
signal CONST_SL_8_uxn_opcodes_h_l1441_c3_c39a_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1441_c3_c39a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1444_c11_cd82]
signal BIN_OP_EQ_uxn_opcodes_h_l1444_c11_cd82_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1444_c11_cd82_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1444_c11_cd82_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1444_c7_e627]
signal tmp16_MUX_uxn_opcodes_h_l1444_c7_e627_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1444_c7_e627_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1444_c7_e627_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1444_c7_e627_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1444_c7_e627]
signal result_u8_value_MUX_uxn_opcodes_h_l1444_c7_e627_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1444_c7_e627_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1444_c7_e627_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1444_c7_e627_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1444_c7_e627]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_e627_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_e627_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_e627_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_e627_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1444_c7_e627]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_e627_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_e627_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_e627_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_e627_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1444_c7_e627]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_e627_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_e627_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_e627_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_e627_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1444_c7_e627]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_e627_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_e627_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_e627_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_e627_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1444_c7_e627]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_e627_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_e627_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_e627_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_e627_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1444_c7_e627]
signal t16_MUX_uxn_opcodes_h_l1444_c7_e627_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1444_c7_e627_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1444_c7_e627_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1444_c7_e627_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1447_c11_a1d6]
signal BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a1d6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a1d6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a1d6_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1447_c7_6343]
signal tmp16_MUX_uxn_opcodes_h_l1447_c7_6343_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1447_c7_6343_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1447_c7_6343_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1447_c7_6343_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1447_c7_6343]
signal result_u8_value_MUX_uxn_opcodes_h_l1447_c7_6343_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1447_c7_6343_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1447_c7_6343_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1447_c7_6343_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1447_c7_6343]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_6343_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_6343_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_6343_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_6343_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1447_c7_6343]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_6343_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_6343_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_6343_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_6343_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1447_c7_6343]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_6343_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_6343_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_6343_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_6343_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1447_c7_6343]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_6343_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_6343_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_6343_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_6343_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1447_c7_6343]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_6343_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_6343_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_6343_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_6343_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1447_c7_6343]
signal t16_MUX_uxn_opcodes_h_l1447_c7_6343_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1447_c7_6343_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1447_c7_6343_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1447_c7_6343_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1448_c3_920c]
signal BIN_OP_OR_uxn_opcodes_h_l1448_c3_920c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1448_c3_920c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1448_c3_920c_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1449_c11_6e00]
signal BIN_OP_PLUS_uxn_opcodes_h_l1449_c11_6e00_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1449_c11_6e00_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1449_c11_6e00_return_output : unsigned(16 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1451_c30_5496]
signal sp_relative_shift_uxn_opcodes_h_l1451_c30_5496_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1451_c30_5496_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1451_c30_5496_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1451_c30_5496_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1456_c11_0142]
signal BIN_OP_EQ_uxn_opcodes_h_l1456_c11_0142_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1456_c11_0142_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1456_c11_0142_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1456_c7_fbe3]
signal result_u8_value_MUX_uxn_opcodes_h_l1456_c7_fbe3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1456_c7_fbe3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1456_c7_fbe3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1456_c7_fbe3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1456_c7_fbe3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_fbe3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_fbe3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_fbe3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_fbe3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1456_c7_fbe3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_fbe3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_fbe3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_fbe3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_fbe3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1456_c7_fbe3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_fbe3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_fbe3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_fbe3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_fbe3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1456_c7_fbe3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_fbe3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_fbe3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_fbe3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_fbe3_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1459_c31_720d]
signal CONST_SR_8_uxn_opcodes_h_l1459_c31_720d_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1459_c31_720d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1461_c11_0da7]
signal BIN_OP_EQ_uxn_opcodes_h_l1461_c11_0da7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1461_c11_0da7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1461_c11_0da7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1461_c7_6509]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6509_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6509_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6509_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6509_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1461_c7_6509]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6509_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6509_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6509_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6509_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_25e8( ref_toks_0 : opcode_result_t;
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
      base.u8_value := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1431_c6_ddcb
BIN_OP_EQ_uxn_opcodes_h_l1431_c6_ddcb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1431_c6_ddcb_left,
BIN_OP_EQ_uxn_opcodes_h_l1431_c6_ddcb_right,
BIN_OP_EQ_uxn_opcodes_h_l1431_c6_ddcb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_4c81
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_4c81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_4c81_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_4c81_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_4c81_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_4c81_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1431_c2_542f
tmp16_MUX_uxn_opcodes_h_l1431_c2_542f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1431_c2_542f_cond,
tmp16_MUX_uxn_opcodes_h_l1431_c2_542f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1431_c2_542f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1431_c2_542f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1431_c2_542f
result_u8_value_MUX_uxn_opcodes_h_l1431_c2_542f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1431_c2_542f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1431_c2_542f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1431_c2_542f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1431_c2_542f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_542f
result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_542f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_542f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_542f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_542f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_542f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_542f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_542f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_542f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_542f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_542f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_542f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_542f
result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_542f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_542f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_542f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_542f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_542f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_542f
result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_542f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_542f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_542f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_542f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_542f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_542f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_542f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_542f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_542f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_542f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_542f_return_output);

-- t16_MUX_uxn_opcodes_h_l1431_c2_542f
t16_MUX_uxn_opcodes_h_l1431_c2_542f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1431_c2_542f_cond,
t16_MUX_uxn_opcodes_h_l1431_c2_542f_iftrue,
t16_MUX_uxn_opcodes_h_l1431_c2_542f_iffalse,
t16_MUX_uxn_opcodes_h_l1431_c2_542f_return_output);

-- printf_uxn_opcodes_h_l1432_c3_e0a3_uxn_opcodes_h_l1432_c3_e0a3
printf_uxn_opcodes_h_l1432_c3_e0a3_uxn_opcodes_h_l1432_c3_e0a3 : entity work.printf_uxn_opcodes_h_l1432_c3_e0a3_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1432_c3_e0a3_uxn_opcodes_h_l1432_c3_e0a3_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1436_c11_3841
BIN_OP_EQ_uxn_opcodes_h_l1436_c11_3841 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1436_c11_3841_left,
BIN_OP_EQ_uxn_opcodes_h_l1436_c11_3841_right,
BIN_OP_EQ_uxn_opcodes_h_l1436_c11_3841_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1436_c7_3b75
tmp16_MUX_uxn_opcodes_h_l1436_c7_3b75 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1436_c7_3b75_cond,
tmp16_MUX_uxn_opcodes_h_l1436_c7_3b75_iftrue,
tmp16_MUX_uxn_opcodes_h_l1436_c7_3b75_iffalse,
tmp16_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1436_c7_3b75
result_u8_value_MUX_uxn_opcodes_h_l1436_c7_3b75 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1436_c7_3b75_cond,
result_u8_value_MUX_uxn_opcodes_h_l1436_c7_3b75_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1436_c7_3b75_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_3b75
result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_3b75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_3b75_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_3b75_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_3b75_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_3b75
result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_3b75 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_3b75_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_3b75_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_3b75_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_3b75
result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_3b75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_3b75_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_3b75_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_3b75_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_3b75
result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_3b75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_3b75_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_3b75_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_3b75_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_3b75
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_3b75 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_3b75_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_3b75_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_3b75_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output);

-- t16_MUX_uxn_opcodes_h_l1436_c7_3b75
t16_MUX_uxn_opcodes_h_l1436_c7_3b75 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1436_c7_3b75_cond,
t16_MUX_uxn_opcodes_h_l1436_c7_3b75_iftrue,
t16_MUX_uxn_opcodes_h_l1436_c7_3b75_iffalse,
t16_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1439_c11_309d
BIN_OP_EQ_uxn_opcodes_h_l1439_c11_309d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1439_c11_309d_left,
BIN_OP_EQ_uxn_opcodes_h_l1439_c11_309d_right,
BIN_OP_EQ_uxn_opcodes_h_l1439_c11_309d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1439_c7_450b
tmp16_MUX_uxn_opcodes_h_l1439_c7_450b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1439_c7_450b_cond,
tmp16_MUX_uxn_opcodes_h_l1439_c7_450b_iftrue,
tmp16_MUX_uxn_opcodes_h_l1439_c7_450b_iffalse,
tmp16_MUX_uxn_opcodes_h_l1439_c7_450b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1439_c7_450b
result_u8_value_MUX_uxn_opcodes_h_l1439_c7_450b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1439_c7_450b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1439_c7_450b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1439_c7_450b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1439_c7_450b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_450b
result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_450b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_450b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_450b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_450b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_450b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_450b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_450b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_450b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_450b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_450b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_450b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_450b
result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_450b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_450b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_450b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_450b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_450b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_450b
result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_450b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_450b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_450b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_450b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_450b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_450b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_450b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_450b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_450b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_450b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_450b_return_output);

-- t16_MUX_uxn_opcodes_h_l1439_c7_450b
t16_MUX_uxn_opcodes_h_l1439_c7_450b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1439_c7_450b_cond,
t16_MUX_uxn_opcodes_h_l1439_c7_450b_iftrue,
t16_MUX_uxn_opcodes_h_l1439_c7_450b_iffalse,
t16_MUX_uxn_opcodes_h_l1439_c7_450b_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1441_c3_c39a
CONST_SL_8_uxn_opcodes_h_l1441_c3_c39a : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1441_c3_c39a_x,
CONST_SL_8_uxn_opcodes_h_l1441_c3_c39a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1444_c11_cd82
BIN_OP_EQ_uxn_opcodes_h_l1444_c11_cd82 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1444_c11_cd82_left,
BIN_OP_EQ_uxn_opcodes_h_l1444_c11_cd82_right,
BIN_OP_EQ_uxn_opcodes_h_l1444_c11_cd82_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1444_c7_e627
tmp16_MUX_uxn_opcodes_h_l1444_c7_e627 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1444_c7_e627_cond,
tmp16_MUX_uxn_opcodes_h_l1444_c7_e627_iftrue,
tmp16_MUX_uxn_opcodes_h_l1444_c7_e627_iffalse,
tmp16_MUX_uxn_opcodes_h_l1444_c7_e627_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1444_c7_e627
result_u8_value_MUX_uxn_opcodes_h_l1444_c7_e627 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1444_c7_e627_cond,
result_u8_value_MUX_uxn_opcodes_h_l1444_c7_e627_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1444_c7_e627_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1444_c7_e627_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_e627
result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_e627 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_e627_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_e627_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_e627_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_e627_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_e627
result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_e627 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_e627_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_e627_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_e627_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_e627_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_e627
result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_e627 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_e627_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_e627_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_e627_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_e627_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_e627
result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_e627 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_e627_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_e627_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_e627_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_e627_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_e627
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_e627 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_e627_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_e627_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_e627_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_e627_return_output);

-- t16_MUX_uxn_opcodes_h_l1444_c7_e627
t16_MUX_uxn_opcodes_h_l1444_c7_e627 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1444_c7_e627_cond,
t16_MUX_uxn_opcodes_h_l1444_c7_e627_iftrue,
t16_MUX_uxn_opcodes_h_l1444_c7_e627_iffalse,
t16_MUX_uxn_opcodes_h_l1444_c7_e627_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a1d6
BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a1d6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a1d6_left,
BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a1d6_right,
BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a1d6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1447_c7_6343
tmp16_MUX_uxn_opcodes_h_l1447_c7_6343 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1447_c7_6343_cond,
tmp16_MUX_uxn_opcodes_h_l1447_c7_6343_iftrue,
tmp16_MUX_uxn_opcodes_h_l1447_c7_6343_iffalse,
tmp16_MUX_uxn_opcodes_h_l1447_c7_6343_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1447_c7_6343
result_u8_value_MUX_uxn_opcodes_h_l1447_c7_6343 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1447_c7_6343_cond,
result_u8_value_MUX_uxn_opcodes_h_l1447_c7_6343_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1447_c7_6343_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1447_c7_6343_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_6343
result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_6343 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_6343_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_6343_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_6343_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_6343_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_6343
result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_6343 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_6343_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_6343_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_6343_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_6343_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_6343
result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_6343 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_6343_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_6343_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_6343_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_6343_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_6343
result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_6343 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_6343_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_6343_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_6343_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_6343_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_6343
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_6343 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_6343_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_6343_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_6343_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_6343_return_output);

-- t16_MUX_uxn_opcodes_h_l1447_c7_6343
t16_MUX_uxn_opcodes_h_l1447_c7_6343 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1447_c7_6343_cond,
t16_MUX_uxn_opcodes_h_l1447_c7_6343_iftrue,
t16_MUX_uxn_opcodes_h_l1447_c7_6343_iffalse,
t16_MUX_uxn_opcodes_h_l1447_c7_6343_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1448_c3_920c
BIN_OP_OR_uxn_opcodes_h_l1448_c3_920c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1448_c3_920c_left,
BIN_OP_OR_uxn_opcodes_h_l1448_c3_920c_right,
BIN_OP_OR_uxn_opcodes_h_l1448_c3_920c_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1449_c11_6e00
BIN_OP_PLUS_uxn_opcodes_h_l1449_c11_6e00 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1449_c11_6e00_left,
BIN_OP_PLUS_uxn_opcodes_h_l1449_c11_6e00_right,
BIN_OP_PLUS_uxn_opcodes_h_l1449_c11_6e00_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1451_c30_5496
sp_relative_shift_uxn_opcodes_h_l1451_c30_5496 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1451_c30_5496_ins,
sp_relative_shift_uxn_opcodes_h_l1451_c30_5496_x,
sp_relative_shift_uxn_opcodes_h_l1451_c30_5496_y,
sp_relative_shift_uxn_opcodes_h_l1451_c30_5496_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1456_c11_0142
BIN_OP_EQ_uxn_opcodes_h_l1456_c11_0142 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1456_c11_0142_left,
BIN_OP_EQ_uxn_opcodes_h_l1456_c11_0142_right,
BIN_OP_EQ_uxn_opcodes_h_l1456_c11_0142_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1456_c7_fbe3
result_u8_value_MUX_uxn_opcodes_h_l1456_c7_fbe3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1456_c7_fbe3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1456_c7_fbe3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1456_c7_fbe3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1456_c7_fbe3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_fbe3
result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_fbe3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_fbe3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_fbe3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_fbe3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_fbe3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_fbe3
result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_fbe3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_fbe3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_fbe3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_fbe3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_fbe3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_fbe3
result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_fbe3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_fbe3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_fbe3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_fbe3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_fbe3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_fbe3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_fbe3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_fbe3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_fbe3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_fbe3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_fbe3_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1459_c31_720d
CONST_SR_8_uxn_opcodes_h_l1459_c31_720d : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1459_c31_720d_x,
CONST_SR_8_uxn_opcodes_h_l1459_c31_720d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1461_c11_0da7
BIN_OP_EQ_uxn_opcodes_h_l1461_c11_0da7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1461_c11_0da7_left,
BIN_OP_EQ_uxn_opcodes_h_l1461_c11_0da7_right,
BIN_OP_EQ_uxn_opcodes_h_l1461_c11_0da7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6509
result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6509 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6509_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6509_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6509_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6509_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6509
result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6509 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6509_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6509_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6509_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6509_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1431_c6_ddcb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_4c81_return_output,
 tmp16_MUX_uxn_opcodes_h_l1431_c2_542f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1431_c2_542f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_542f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_542f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_542f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_542f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_542f_return_output,
 t16_MUX_uxn_opcodes_h_l1431_c2_542f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1436_c11_3841_return_output,
 tmp16_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output,
 t16_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1439_c11_309d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1439_c7_450b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1439_c7_450b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_450b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_450b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_450b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_450b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_450b_return_output,
 t16_MUX_uxn_opcodes_h_l1439_c7_450b_return_output,
 CONST_SL_8_uxn_opcodes_h_l1441_c3_c39a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1444_c11_cd82_return_output,
 tmp16_MUX_uxn_opcodes_h_l1444_c7_e627_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1444_c7_e627_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_e627_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_e627_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_e627_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_e627_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_e627_return_output,
 t16_MUX_uxn_opcodes_h_l1444_c7_e627_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a1d6_return_output,
 tmp16_MUX_uxn_opcodes_h_l1447_c7_6343_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1447_c7_6343_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_6343_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_6343_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_6343_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_6343_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_6343_return_output,
 t16_MUX_uxn_opcodes_h_l1447_c7_6343_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1448_c3_920c_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1449_c11_6e00_return_output,
 sp_relative_shift_uxn_opcodes_h_l1451_c30_5496_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1456_c11_0142_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1456_c7_fbe3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_fbe3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_fbe3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_fbe3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_fbe3_return_output,
 CONST_SR_8_uxn_opcodes_h_l1459_c31_720d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1461_c11_0da7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6509_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6509_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_ddcb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_ddcb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_ddcb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_4c81_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_4c81_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_4c81_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_4c81_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1431_c2_542f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1431_c2_542f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1431_c2_542f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1431_c2_542f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1431_c2_542f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1431_c2_542f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1431_c2_542f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1431_c2_542f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_542f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_542f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_542f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_542f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_542f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_542f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_542f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_542f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_542f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_542f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_542f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_542f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_542f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_542f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_542f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_542f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_542f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1433_c3_0438 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_542f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_542f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_542f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1431_c2_542f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1431_c2_542f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1431_c2_542f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1431_c2_542f_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1432_c3_e0a3_uxn_opcodes_h_l1432_c3_e0a3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_3841_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_3841_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_3841_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1436_c7_3b75_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1436_c7_3b75_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1439_c7_450b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1436_c7_3b75_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c7_3b75_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c7_3b75_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_450b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c7_3b75_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_3b75_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_3b75_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_450b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_3b75_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_3b75_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_3b75_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_450b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_3b75_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_3b75_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_3b75_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_450b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_3b75_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_3b75_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_3b75_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_450b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_3b75_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_3b75_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1437_c3_da15 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_3b75_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_450b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_3b75_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1436_c7_3b75_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1436_c7_3b75_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1439_c7_450b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1436_c7_3b75_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_309d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_309d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_309d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1439_c7_450b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1439_c7_450b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_e627_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1439_c7_450b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_450b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_450b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1444_c7_e627_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_450b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_450b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_450b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_e627_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_450b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_450b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_450b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_e627_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_450b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_450b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_450b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_e627_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_450b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_450b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_450b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_e627_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_450b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_450b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1442_c3_d744 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_450b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_e627_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_450b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1439_c7_450b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1439_c7_450b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1444_c7_e627_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1439_c7_450b_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1441_c3_c39a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1441_c3_c39a_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_cd82_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_cd82_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_cd82_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_e627_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_e627_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1447_c7_6343_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_e627_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1444_c7_e627_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1444_c7_e627_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1447_c7_6343_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1444_c7_e627_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_e627_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_e627_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_6343_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_e627_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_e627_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_e627_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_6343_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_e627_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_e627_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_e627_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_6343_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_e627_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_e627_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_e627_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_6343_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_e627_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_e627_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1445_c3_018b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_e627_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_6343_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_e627_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1444_c7_e627_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1444_c7_e627_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1447_c7_6343_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1444_c7_e627_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a1d6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a1d6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a1d6_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1447_c7_6343_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l1449_c3_0e3e : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1447_c7_6343_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1447_c7_6343_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1447_c7_6343_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1447_c7_6343_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1456_c7_fbe3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1447_c7_6343_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_6343_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_6343_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_fbe3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_6343_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_6343_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_6343_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_6343_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_6343_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_6343_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_fbe3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_6343_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_6343_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_6343_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_fbe3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_6343_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_6343_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1453_c3_370b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_6343_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_fbe3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_6343_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1447_c7_6343_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1447_c7_6343_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1447_c7_6343_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1448_c3_920c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1448_c3_920c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1448_c3_920c_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1449_c11_6e00_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1449_c11_6e00_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1449_c11_6e00_return_output : unsigned(16 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1451_c30_5496_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1451_c30_5496_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1451_c30_5496_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1451_c30_5496_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1454_c21_3f33_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1456_c11_0142_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1456_c11_0142_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1456_c11_0142_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1456_c7_fbe3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1456_c7_fbe3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1456_c7_fbe3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_fbe3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_fbe3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6509_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_fbe3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_fbe3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_fbe3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6509_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_fbe3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_fbe3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_fbe3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_fbe3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_fbe3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1458_c3_5583 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_fbe3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1456_c7_fbe3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_fbe3_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1459_c31_720d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1459_c31_720d_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1459_c21_0b5d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_0da7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_0da7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_0da7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6509_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6509_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6509_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6509_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6509_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6509_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1431_l1456_l1444_l1439_l1436_DUPLICATE_a330_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1431_l1447_l1444_l1439_l1436_DUPLICATE_1218_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1431_l1461_l1456_l1444_l1439_l1436_DUPLICATE_3adb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1431_l1456_l1444_l1439_l1436_DUPLICATE_1fa8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1461_l1456_l1447_l1444_l1439_l1436_DUPLICATE_9bca_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1440_l1448_DUPLICATE_d6c7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l1466_l1427_DUPLICATE_1b7e_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1442_c3_d744 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_450b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1442_c3_d744;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1445_c3_018b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_e627_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1445_c3_018b;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_fbe3_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1433_c3_0438 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_542f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1433_c3_0438;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_542f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_cd82_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_6343_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1458_c3_5583 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_fbe3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1458_c3_5583;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_309d_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6509_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1451_c30_5496_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_ddcb_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1456_c11_0142_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1453_c3_370b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_6343_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1453_c3_370b;
     VAR_sp_relative_shift_uxn_opcodes_h_l1451_c30_5496_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_3841_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a1d6_right := to_unsigned(4, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_4c81_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_6343_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6509_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1437_c3_da15 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_3b75_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1437_c3_da15;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1449_c11_6e00_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_0da7_right := to_unsigned(6, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_4c81_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1451_c30_5496_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_ddcb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_3841_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_309d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_cd82_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a1d6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1456_c11_0142_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_0da7_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1448_c3_920c_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1431_c2_542f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1436_c7_3b75_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1444_c7_e627_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1447_c7_6343_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1459_c31_720d_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1431_c2_542f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1436_c7_3b75_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1439_c7_450b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_e627_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1447_c7_6343_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1431_l1456_l1444_l1439_l1436_DUPLICATE_1fa8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1431_l1456_l1444_l1439_l1436_DUPLICATE_1fa8_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1436_c11_3841] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1436_c11_3841_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_3841_left;
     BIN_OP_EQ_uxn_opcodes_h_l1436_c11_3841_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_3841_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_3841_return_output := BIN_OP_EQ_uxn_opcodes_h_l1436_c11_3841_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1431_l1456_l1444_l1439_l1436_DUPLICATE_a330 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1431_l1456_l1444_l1439_l1436_DUPLICATE_a330_return_output := result.u8_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1431_l1447_l1444_l1439_l1436_DUPLICATE_1218 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1431_l1447_l1444_l1439_l1436_DUPLICATE_1218_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1431_l1461_l1456_l1444_l1439_l1436_DUPLICATE_3adb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1431_l1461_l1456_l1444_l1439_l1436_DUPLICATE_3adb_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1461_c11_0da7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1461_c11_0da7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_0da7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1461_c11_0da7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_0da7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_0da7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1461_c11_0da7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1461_l1456_l1447_l1444_l1439_l1436_DUPLICATE_9bca LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1461_l1456_l1447_l1444_l1439_l1436_DUPLICATE_9bca_return_output := result.is_opc_done;

     -- CONST_SR_8[uxn_opcodes_h_l1459_c31_720d] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1459_c31_720d_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1459_c31_720d_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1459_c31_720d_return_output := CONST_SR_8_uxn_opcodes_h_l1459_c31_720d_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1451_c30_5496] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1451_c30_5496_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1451_c30_5496_ins;
     sp_relative_shift_uxn_opcodes_h_l1451_c30_5496_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1451_c30_5496_x;
     sp_relative_shift_uxn_opcodes_h_l1451_c30_5496_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1451_c30_5496_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1451_c30_5496_return_output := sp_relative_shift_uxn_opcodes_h_l1451_c30_5496_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1456_c11_0142] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1456_c11_0142_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1456_c11_0142_left;
     BIN_OP_EQ_uxn_opcodes_h_l1456_c11_0142_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1456_c11_0142_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1456_c11_0142_return_output := BIN_OP_EQ_uxn_opcodes_h_l1456_c11_0142_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1447_c11_a1d6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a1d6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a1d6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a1d6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a1d6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a1d6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a1d6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1444_c11_cd82] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1444_c11_cd82_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_cd82_left;
     BIN_OP_EQ_uxn_opcodes_h_l1444_c11_cd82_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_cd82_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_cd82_return_output := BIN_OP_EQ_uxn_opcodes_h_l1444_c11_cd82_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1439_c11_309d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1439_c11_309d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_309d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1439_c11_309d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_309d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_309d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1439_c11_309d_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1456_c7_fbe3] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1456_c7_fbe3_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1440_l1448_DUPLICATE_d6c7 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1440_l1448_DUPLICATE_d6c7_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1431_c6_ddcb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1431_c6_ddcb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_ddcb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1431_c6_ddcb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_ddcb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_ddcb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1431_c6_ddcb_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_4c81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_ddcb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_542f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_ddcb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_542f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_ddcb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_542f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_ddcb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_542f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_ddcb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_542f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_ddcb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1431_c2_542f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_ddcb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1431_c2_542f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_ddcb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1431_c2_542f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_ddcb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_3b75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_3841_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_3b75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_3841_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_3b75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_3841_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_3b75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_3841_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_3b75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_3841_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c7_3b75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_3841_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1436_c7_3b75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_3841_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1436_c7_3b75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_3841_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_450b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_309d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_450b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_309d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_450b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_309d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_450b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_309d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_450b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_309d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_450b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_309d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1439_c7_450b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_309d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1439_c7_450b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_309d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_e627_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_cd82_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_e627_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_cd82_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_e627_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_cd82_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_e627_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_cd82_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_e627_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_cd82_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1444_c7_e627_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_cd82_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1444_c7_e627_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_cd82_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_e627_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_cd82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_6343_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a1d6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_6343_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a1d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_6343_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a1d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_6343_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a1d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_6343_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a1d6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1447_c7_6343_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a1d6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1447_c7_6343_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a1d6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1447_c7_6343_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a1d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_fbe3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1456_c11_0142_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_fbe3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1456_c11_0142_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_fbe3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1456_c11_0142_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_fbe3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1456_c11_0142_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1456_c7_fbe3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1456_c11_0142_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6509_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_0da7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6509_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_0da7_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1448_c3_920c_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1440_l1448_DUPLICATE_d6c7_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1441_c3_c39a_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1440_l1448_DUPLICATE_d6c7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_542f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1431_l1447_l1444_l1439_l1436_DUPLICATE_1218_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_3b75_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1431_l1447_l1444_l1439_l1436_DUPLICATE_1218_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_450b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1431_l1447_l1444_l1439_l1436_DUPLICATE_1218_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_e627_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1431_l1447_l1444_l1439_l1436_DUPLICATE_1218_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_6343_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1431_l1447_l1444_l1439_l1436_DUPLICATE_1218_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_3b75_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1461_l1456_l1447_l1444_l1439_l1436_DUPLICATE_9bca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_450b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1461_l1456_l1447_l1444_l1439_l1436_DUPLICATE_9bca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_e627_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1461_l1456_l1447_l1444_l1439_l1436_DUPLICATE_9bca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_6343_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1461_l1456_l1447_l1444_l1439_l1436_DUPLICATE_9bca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_fbe3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1461_l1456_l1447_l1444_l1439_l1436_DUPLICATE_9bca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6509_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1461_l1456_l1447_l1444_l1439_l1436_DUPLICATE_9bca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_542f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1431_l1456_l1444_l1439_l1436_DUPLICATE_1fa8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_3b75_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1431_l1456_l1444_l1439_l1436_DUPLICATE_1fa8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_450b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1431_l1456_l1444_l1439_l1436_DUPLICATE_1fa8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_e627_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1431_l1456_l1444_l1439_l1436_DUPLICATE_1fa8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_fbe3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1431_l1456_l1444_l1439_l1436_DUPLICATE_1fa8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_542f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1431_l1461_l1456_l1444_l1439_l1436_DUPLICATE_3adb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_3b75_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1431_l1461_l1456_l1444_l1439_l1436_DUPLICATE_3adb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_450b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1431_l1461_l1456_l1444_l1439_l1436_DUPLICATE_3adb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_e627_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1431_l1461_l1456_l1444_l1439_l1436_DUPLICATE_3adb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_fbe3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1431_l1461_l1456_l1444_l1439_l1436_DUPLICATE_3adb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6509_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1431_l1461_l1456_l1444_l1439_l1436_DUPLICATE_3adb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1431_c2_542f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1431_l1456_l1444_l1439_l1436_DUPLICATE_a330_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c7_3b75_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1431_l1456_l1444_l1439_l1436_DUPLICATE_a330_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_450b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1431_l1456_l1444_l1439_l1436_DUPLICATE_a330_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1444_c7_e627_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1431_l1456_l1444_l1439_l1436_DUPLICATE_a330_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1456_c7_fbe3_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1431_l1456_l1444_l1439_l1436_DUPLICATE_a330_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_fbe3_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1456_c7_fbe3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_6343_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1451_c30_5496_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1448_c3_920c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1448_c3_920c_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1448_c3_920c_left;
     BIN_OP_OR_uxn_opcodes_h_l1448_c3_920c_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1448_c3_920c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1448_c3_920c_return_output := BIN_OP_OR_uxn_opcodes_h_l1448_c3_920c_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1459_c21_0b5d] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1459_c21_0b5d_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1459_c31_720d_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1461_c7_6509] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6509_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6509_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6509_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6509_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6509_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6509_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6509_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6509_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1456_c7_fbe3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_fbe3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_fbe3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_fbe3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_fbe3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_fbe3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_fbe3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_fbe3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_fbe3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1447_c7_6343] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_6343_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_6343_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_6343_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_6343_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_6343_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_6343_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_6343_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_6343_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1441_c3_c39a] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1441_c3_c39a_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1441_c3_c39a_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1441_c3_c39a_return_output := CONST_SL_8_uxn_opcodes_h_l1441_c3_c39a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1461_c7_6509] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6509_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6509_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6509_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6509_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6509_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6509_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6509_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6509_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1456_c7_fbe3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_fbe3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_fbe3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_fbe3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_fbe3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_fbe3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_fbe3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_fbe3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_fbe3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1431_c1_4c81] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_4c81_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_4c81_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_4c81_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_4c81_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_4c81_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_4c81_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_4c81_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_4c81_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1449_c11_6e00_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1448_c3_920c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1447_c7_6343_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1448_c3_920c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1456_c7_fbe3_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1459_c21_0b5d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1439_c7_450b_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1441_c3_c39a_return_output;
     VAR_printf_uxn_opcodes_h_l1432_c3_e0a3_uxn_opcodes_h_l1432_c3_e0a3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_4c81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_fbe3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6509_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_6343_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_fbe3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_fbe3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6509_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_e627_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_6343_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_6343_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_fbe3_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1447_c7_6343] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_6343_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_6343_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_6343_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_6343_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_6343_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_6343_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_6343_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_6343_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1449_c11_6e00] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1449_c11_6e00_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1449_c11_6e00_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1449_c11_6e00_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1449_c11_6e00_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1449_c11_6e00_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1449_c11_6e00_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1447_c7_6343] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_6343_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_6343_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_6343_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_6343_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_6343_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_6343_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_6343_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_6343_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1444_c7_e627] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_e627_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_e627_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_e627_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_e627_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_e627_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_e627_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_e627_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_e627_return_output;

     -- printf_uxn_opcodes_h_l1432_c3_e0a3[uxn_opcodes_h_l1432_c3_e0a3] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1432_c3_e0a3_uxn_opcodes_h_l1432_c3_e0a3_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1432_c3_e0a3_uxn_opcodes_h_l1432_c3_e0a3_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1456_c7_fbe3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_fbe3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_fbe3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_fbe3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_fbe3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_fbe3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_fbe3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_fbe3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_fbe3_return_output;

     -- t16_MUX[uxn_opcodes_h_l1447_c7_6343] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1447_c7_6343_cond <= VAR_t16_MUX_uxn_opcodes_h_l1447_c7_6343_cond;
     t16_MUX_uxn_opcodes_h_l1447_c7_6343_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1447_c7_6343_iftrue;
     t16_MUX_uxn_opcodes_h_l1447_c7_6343_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1447_c7_6343_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1447_c7_6343_return_output := t16_MUX_uxn_opcodes_h_l1447_c7_6343_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1456_c7_fbe3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1456_c7_fbe3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1456_c7_fbe3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1456_c7_fbe3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1456_c7_fbe3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1456_c7_fbe3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1456_c7_fbe3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1456_c7_fbe3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1456_c7_fbe3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1456_c7_fbe3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_fbe3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_fbe3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_fbe3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_fbe3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_fbe3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_fbe3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_fbe3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_fbe3_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l1449_c3_0e3e := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1449_c11_6e00_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_6343_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_fbe3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_e627_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_6343_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_6343_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_fbe3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_450b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_e627_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_e627_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_6343_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1447_c7_6343_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1456_c7_fbe3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1444_c7_e627_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1447_c7_6343_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1447_c7_6343_iftrue := VAR_tmp16_uxn_opcodes_h_l1449_c3_0e3e;
     -- t16_MUX[uxn_opcodes_h_l1444_c7_e627] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1444_c7_e627_cond <= VAR_t16_MUX_uxn_opcodes_h_l1444_c7_e627_cond;
     t16_MUX_uxn_opcodes_h_l1444_c7_e627_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1444_c7_e627_iftrue;
     t16_MUX_uxn_opcodes_h_l1444_c7_e627_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1444_c7_e627_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1444_c7_e627_return_output := t16_MUX_uxn_opcodes_h_l1444_c7_e627_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1454_c21_3f33] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1454_c21_3f33_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l1449_c3_0e3e);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1447_c7_6343] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_6343_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_6343_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_6343_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_6343_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_6343_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_6343_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_6343_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_6343_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1444_c7_e627] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_e627_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_e627_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_e627_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_e627_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_e627_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_e627_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_e627_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_e627_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1444_c7_e627] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_e627_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_e627_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_e627_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_e627_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_e627_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_e627_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_e627_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_e627_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1447_c7_6343] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_6343_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_6343_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_6343_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_6343_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_6343_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_6343_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_6343_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_6343_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1439_c7_450b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_450b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_450b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_450b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_450b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_450b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_450b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_450b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_450b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1447_c7_6343] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1447_c7_6343_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1447_c7_6343_cond;
     tmp16_MUX_uxn_opcodes_h_l1447_c7_6343_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1447_c7_6343_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1447_c7_6343_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1447_c7_6343_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1447_c7_6343_return_output := tmp16_MUX_uxn_opcodes_h_l1447_c7_6343_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1447_c7_6343_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1454_c21_3f33_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_e627_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_6343_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_450b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_e627_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_e627_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_6343_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_3b75_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_450b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_450b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_e627_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1439_c7_450b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1444_c7_e627_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_e627_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1447_c7_6343_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1444_c7_e627] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_e627_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_e627_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_e627_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_e627_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_e627_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_e627_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_e627_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_e627_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1436_c7_3b75] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_3b75_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_3b75_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_3b75_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_3b75_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_3b75_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_3b75_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1444_c7_e627] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_e627_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_e627_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_e627_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_e627_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_e627_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_e627_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_e627_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_e627_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1444_c7_e627] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1444_c7_e627_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_e627_cond;
     tmp16_MUX_uxn_opcodes_h_l1444_c7_e627_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_e627_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1444_c7_e627_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_e627_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_e627_return_output := tmp16_MUX_uxn_opcodes_h_l1444_c7_e627_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1439_c7_450b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_450b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_450b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_450b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_450b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_450b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_450b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_450b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_450b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1447_c7_6343] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1447_c7_6343_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1447_c7_6343_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1447_c7_6343_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1447_c7_6343_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1447_c7_6343_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1447_c7_6343_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1447_c7_6343_return_output := result_u8_value_MUX_uxn_opcodes_h_l1447_c7_6343_return_output;

     -- t16_MUX[uxn_opcodes_h_l1439_c7_450b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1439_c7_450b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1439_c7_450b_cond;
     t16_MUX_uxn_opcodes_h_l1439_c7_450b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1439_c7_450b_iftrue;
     t16_MUX_uxn_opcodes_h_l1439_c7_450b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1439_c7_450b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1439_c7_450b_return_output := t16_MUX_uxn_opcodes_h_l1439_c7_450b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1439_c7_450b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_450b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_450b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_450b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_450b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_450b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_450b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_450b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_450b_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_450b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_e627_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_3b75_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_450b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_450b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_e627_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_542f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_3b75_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_450b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1444_c7_e627_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1447_c7_6343_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1436_c7_3b75_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1439_c7_450b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1439_c7_450b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_e627_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1436_c7_3b75] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_3b75_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_3b75_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_3b75_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_3b75_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_3b75_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_3b75_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1444_c7_e627] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1444_c7_e627_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1444_c7_e627_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1444_c7_e627_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1444_c7_e627_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1444_c7_e627_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1444_c7_e627_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1444_c7_e627_return_output := result_u8_value_MUX_uxn_opcodes_h_l1444_c7_e627_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1436_c7_3b75] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_3b75_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_3b75_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_3b75_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_3b75_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_3b75_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_3b75_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1439_c7_450b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1439_c7_450b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1439_c7_450b_cond;
     tmp16_MUX_uxn_opcodes_h_l1439_c7_450b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1439_c7_450b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1439_c7_450b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1439_c7_450b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1439_c7_450b_return_output := tmp16_MUX_uxn_opcodes_h_l1439_c7_450b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1431_c2_542f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_542f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_542f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_542f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_542f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_542f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_542f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_542f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_542f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1439_c7_450b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_450b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_450b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_450b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_450b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_450b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_450b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_450b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_450b_return_output;

     -- t16_MUX[uxn_opcodes_h_l1436_c7_3b75] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1436_c7_3b75_cond <= VAR_t16_MUX_uxn_opcodes_h_l1436_c7_3b75_cond;
     t16_MUX_uxn_opcodes_h_l1436_c7_3b75_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1436_c7_3b75_iftrue;
     t16_MUX_uxn_opcodes_h_l1436_c7_3b75_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1436_c7_3b75_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output := t16_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1439_c7_450b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_450b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_450b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_450b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_450b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_450b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_450b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_450b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_450b_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_3b75_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_450b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_542f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_3b75_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_450b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_542f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_450b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1444_c7_e627_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1431_c2_542f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1436_c7_3b75_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1439_c7_450b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1436_c7_3b75] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_3b75_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_3b75_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_3b75_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_3b75_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_3b75_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_3b75_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1431_c2_542f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_542f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_542f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_542f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_542f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_542f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_542f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_542f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_542f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1436_c7_3b75] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_3b75_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_3b75_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_3b75_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_3b75_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_3b75_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_3b75_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output;

     -- t16_MUX[uxn_opcodes_h_l1431_c2_542f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1431_c2_542f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1431_c2_542f_cond;
     t16_MUX_uxn_opcodes_h_l1431_c2_542f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1431_c2_542f_iftrue;
     t16_MUX_uxn_opcodes_h_l1431_c2_542f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1431_c2_542f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1431_c2_542f_return_output := t16_MUX_uxn_opcodes_h_l1431_c2_542f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1439_c7_450b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1439_c7_450b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_450b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1439_c7_450b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_450b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1439_c7_450b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_450b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_450b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1439_c7_450b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1436_c7_3b75] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1436_c7_3b75_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1436_c7_3b75_cond;
     tmp16_MUX_uxn_opcodes_h_l1436_c7_3b75_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1436_c7_3b75_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1436_c7_3b75_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1436_c7_3b75_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output := tmp16_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1431_c2_542f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_542f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_542f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_542f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_542f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_542f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_542f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_542f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_542f_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_542f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_542f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c7_3b75_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_450b_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1431_c2_542f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1431_c2_542f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1436_c7_3b75] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1436_c7_3b75_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c7_3b75_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1436_c7_3b75_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c7_3b75_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1436_c7_3b75_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c7_3b75_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output := result_u8_value_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1431_c2_542f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1431_c2_542f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1431_c2_542f_cond;
     tmp16_MUX_uxn_opcodes_h_l1431_c2_542f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1431_c2_542f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1431_c2_542f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1431_c2_542f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1431_c2_542f_return_output := tmp16_MUX_uxn_opcodes_h_l1431_c2_542f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1431_c2_542f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_542f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_542f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_542f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_542f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_542f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_542f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_542f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_542f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1431_c2_542f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_542f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_542f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_542f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_542f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_542f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_542f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_542f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_542f_return_output;

     -- Submodule level 8
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1431_c2_542f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c7_3b75_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1431_c2_542f_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1431_c2_542f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1431_c2_542f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1431_c2_542f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1431_c2_542f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1431_c2_542f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1431_c2_542f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1431_c2_542f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1431_c2_542f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1431_c2_542f_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l1466_l1427_DUPLICATE_1b7e LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l1466_l1427_DUPLICATE_1b7e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_25e8(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1431_c2_542f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_542f_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_542f_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_542f_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_542f_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_542f_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l1466_l1427_DUPLICATE_1b7e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l1466_l1427_DUPLICATE_1b7e_return_output;
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
