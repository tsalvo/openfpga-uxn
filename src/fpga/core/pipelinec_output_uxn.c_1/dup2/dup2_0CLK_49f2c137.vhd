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
-- Submodules: 62
entity dup2_0CLK_49f2c137 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end dup2_0CLK_49f2c137;
architecture arch of dup2_0CLK_49f2c137 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2641_c6_283d]
signal BIN_OP_EQ_uxn_opcodes_h_l2641_c6_283d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2641_c6_283d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2641_c6_283d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2641_c1_267c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2641_c1_267c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2641_c1_267c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2641_c1_267c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2641_c1_267c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2641_c2_4311]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2641_c2_4311_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2641_c2_4311_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2641_c2_4311_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2641_c2_4311_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2641_c2_4311]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c2_4311_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c2_4311_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c2_4311_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c2_4311_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2641_c2_4311]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c2_4311_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c2_4311_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c2_4311_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c2_4311_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2641_c2_4311]
signal result_u8_value_MUX_uxn_opcodes_h_l2641_c2_4311_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2641_c2_4311_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2641_c2_4311_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2641_c2_4311_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2641_c2_4311]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2641_c2_4311_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2641_c2_4311_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2641_c2_4311_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2641_c2_4311_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2641_c2_4311]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c2_4311_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c2_4311_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c2_4311_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c2_4311_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2641_c2_4311]
signal t16_MUX_uxn_opcodes_h_l2641_c2_4311_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2641_c2_4311_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2641_c2_4311_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2641_c2_4311_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2642_c3_c7ac[uxn_opcodes_h_l2642_c3_c7ac]
signal printf_uxn_opcodes_h_l2642_c3_c7ac_uxn_opcodes_h_l2642_c3_c7ac_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2646_c11_1277]
signal BIN_OP_EQ_uxn_opcodes_h_l2646_c11_1277_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2646_c11_1277_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2646_c11_1277_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2646_c7_a934]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_a934_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_a934_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_a934_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_a934_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2646_c7_a934]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_a934_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_a934_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_a934_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_a934_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2646_c7_a934]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_a934_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_a934_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_a934_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_a934_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2646_c7_a934]
signal result_u8_value_MUX_uxn_opcodes_h_l2646_c7_a934_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2646_c7_a934_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2646_c7_a934_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2646_c7_a934_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2646_c7_a934]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_a934_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_a934_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_a934_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_a934_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2646_c7_a934]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_a934_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_a934_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_a934_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_a934_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2646_c7_a934]
signal t16_MUX_uxn_opcodes_h_l2646_c7_a934_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2646_c7_a934_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2646_c7_a934_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2646_c7_a934_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2649_c11_c7fb]
signal BIN_OP_EQ_uxn_opcodes_h_l2649_c11_c7fb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2649_c11_c7fb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2649_c11_c7fb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2649_c7_b2b2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_b2b2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_b2b2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_b2b2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_b2b2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2649_c7_b2b2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_b2b2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_b2b2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_b2b2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_b2b2_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2649_c7_b2b2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2649_c7_b2b2]
signal result_u8_value_MUX_uxn_opcodes_h_l2649_c7_b2b2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2649_c7_b2b2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2649_c7_b2b2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2649_c7_b2b2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2649_c7_b2b2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_b2b2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_b2b2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_b2b2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_b2b2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2649_c7_b2b2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2649_c7_b2b2]
signal t16_MUX_uxn_opcodes_h_l2649_c7_b2b2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2649_c7_b2b2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2649_c7_b2b2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2649_c7_b2b2_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2651_c3_6654]
signal CONST_SL_8_uxn_opcodes_h_l2651_c3_6654_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2651_c3_6654_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2653_c11_5193]
signal BIN_OP_EQ_uxn_opcodes_h_l2653_c11_5193_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2653_c11_5193_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2653_c11_5193_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2653_c7_dec0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_dec0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_dec0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_dec0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_dec0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2653_c7_dec0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_dec0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_dec0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_dec0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_dec0_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2653_c7_dec0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_dec0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_dec0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_dec0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_dec0_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2653_c7_dec0]
signal result_u8_value_MUX_uxn_opcodes_h_l2653_c7_dec0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2653_c7_dec0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2653_c7_dec0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2653_c7_dec0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2653_c7_dec0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_dec0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_dec0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_dec0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_dec0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2653_c7_dec0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_dec0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_dec0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_dec0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_dec0_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2653_c7_dec0]
signal t16_MUX_uxn_opcodes_h_l2653_c7_dec0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2653_c7_dec0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2653_c7_dec0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2653_c7_dec0_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2654_c3_dbcd]
signal BIN_OP_OR_uxn_opcodes_h_l2654_c3_dbcd_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2654_c3_dbcd_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2654_c3_dbcd_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2656_c30_32e6]
signal sp_relative_shift_uxn_opcodes_h_l2656_c30_32e6_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2656_c30_32e6_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2656_c30_32e6_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2656_c30_32e6_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2661_c11_32e9]
signal BIN_OP_EQ_uxn_opcodes_h_l2661_c11_32e9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2661_c11_32e9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2661_c11_32e9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2661_c7_c287]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_c287_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_c287_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_c287_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_c287_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2661_c7_c287]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_c287_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_c287_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_c287_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_c287_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2661_c7_c287]
signal result_u8_value_MUX_uxn_opcodes_h_l2661_c7_c287_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2661_c7_c287_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2661_c7_c287_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2661_c7_c287_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2661_c7_c287]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_c287_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_c287_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_c287_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_c287_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2661_c7_c287]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_c287_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_c287_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_c287_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_c287_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2666_c11_c333]
signal BIN_OP_EQ_uxn_opcodes_h_l2666_c11_c333_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2666_c11_c333_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2666_c11_c333_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2666_c7_e49c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_e49c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_e49c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_e49c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_e49c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2666_c7_e49c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_e49c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_e49c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_e49c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_e49c_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2666_c7_e49c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_e49c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_e49c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_e49c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_e49c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2666_c7_e49c]
signal result_u8_value_MUX_uxn_opcodes_h_l2666_c7_e49c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2666_c7_e49c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2666_c7_e49c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2666_c7_e49c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2670_c11_4798]
signal BIN_OP_EQ_uxn_opcodes_h_l2670_c11_4798_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2670_c11_4798_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2670_c11_4798_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2670_c7_77de]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_77de_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_77de_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_77de_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_77de_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2670_c7_77de]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_77de_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_77de_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_77de_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_77de_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2670_c7_77de]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_77de_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_77de_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_77de_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_77de_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2670_c7_77de]
signal result_u8_value_MUX_uxn_opcodes_h_l2670_c7_77de_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2670_c7_77de_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2670_c7_77de_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2670_c7_77de_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2674_c11_7b4b]
signal BIN_OP_EQ_uxn_opcodes_h_l2674_c11_7b4b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2674_c11_7b4b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2674_c11_7b4b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2674_c7_22cd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_22cd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_22cd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_22cd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_22cd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2674_c7_22cd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_22cd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_22cd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_22cd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_22cd_return_output : unsigned(0 downto 0);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l2672_l2664_DUPLICATE_3db6
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l2672_l2664_DUPLICATE_3db6_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l2672_l2664_DUPLICATE_3db6_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_c551( ref_toks_0 : opcode_result_t;
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
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_sp_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2641_c6_283d
BIN_OP_EQ_uxn_opcodes_h_l2641_c6_283d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2641_c6_283d_left,
BIN_OP_EQ_uxn_opcodes_h_l2641_c6_283d_right,
BIN_OP_EQ_uxn_opcodes_h_l2641_c6_283d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2641_c1_267c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2641_c1_267c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2641_c1_267c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2641_c1_267c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2641_c1_267c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2641_c1_267c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2641_c2_4311
result_is_stack_write_MUX_uxn_opcodes_h_l2641_c2_4311 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2641_c2_4311_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2641_c2_4311_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2641_c2_4311_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2641_c2_4311_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c2_4311
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c2_4311 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c2_4311_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c2_4311_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c2_4311_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c2_4311_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c2_4311
result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c2_4311 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c2_4311_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c2_4311_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c2_4311_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c2_4311_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2641_c2_4311
result_u8_value_MUX_uxn_opcodes_h_l2641_c2_4311 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2641_c2_4311_cond,
result_u8_value_MUX_uxn_opcodes_h_l2641_c2_4311_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2641_c2_4311_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2641_c2_4311_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2641_c2_4311
result_is_opc_done_MUX_uxn_opcodes_h_l2641_c2_4311 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2641_c2_4311_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2641_c2_4311_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2641_c2_4311_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2641_c2_4311_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c2_4311
result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c2_4311 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c2_4311_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c2_4311_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c2_4311_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c2_4311_return_output);

-- t16_MUX_uxn_opcodes_h_l2641_c2_4311
t16_MUX_uxn_opcodes_h_l2641_c2_4311 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2641_c2_4311_cond,
t16_MUX_uxn_opcodes_h_l2641_c2_4311_iftrue,
t16_MUX_uxn_opcodes_h_l2641_c2_4311_iffalse,
t16_MUX_uxn_opcodes_h_l2641_c2_4311_return_output);

-- printf_uxn_opcodes_h_l2642_c3_c7ac_uxn_opcodes_h_l2642_c3_c7ac
printf_uxn_opcodes_h_l2642_c3_c7ac_uxn_opcodes_h_l2642_c3_c7ac : entity work.printf_uxn_opcodes_h_l2642_c3_c7ac_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2642_c3_c7ac_uxn_opcodes_h_l2642_c3_c7ac_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2646_c11_1277
BIN_OP_EQ_uxn_opcodes_h_l2646_c11_1277 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2646_c11_1277_left,
BIN_OP_EQ_uxn_opcodes_h_l2646_c11_1277_right,
BIN_OP_EQ_uxn_opcodes_h_l2646_c11_1277_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_a934
result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_a934 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_a934_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_a934_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_a934_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_a934_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_a934
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_a934 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_a934_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_a934_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_a934_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_a934_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_a934
result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_a934 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_a934_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_a934_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_a934_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_a934_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2646_c7_a934
result_u8_value_MUX_uxn_opcodes_h_l2646_c7_a934 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2646_c7_a934_cond,
result_u8_value_MUX_uxn_opcodes_h_l2646_c7_a934_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2646_c7_a934_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2646_c7_a934_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_a934
result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_a934 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_a934_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_a934_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_a934_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_a934_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_a934
result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_a934 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_a934_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_a934_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_a934_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_a934_return_output);

-- t16_MUX_uxn_opcodes_h_l2646_c7_a934
t16_MUX_uxn_opcodes_h_l2646_c7_a934 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2646_c7_a934_cond,
t16_MUX_uxn_opcodes_h_l2646_c7_a934_iftrue,
t16_MUX_uxn_opcodes_h_l2646_c7_a934_iffalse,
t16_MUX_uxn_opcodes_h_l2646_c7_a934_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2649_c11_c7fb
BIN_OP_EQ_uxn_opcodes_h_l2649_c11_c7fb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2649_c11_c7fb_left,
BIN_OP_EQ_uxn_opcodes_h_l2649_c11_c7fb_right,
BIN_OP_EQ_uxn_opcodes_h_l2649_c11_c7fb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_b2b2
result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_b2b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_b2b2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_b2b2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_b2b2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_b2b2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_b2b2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_b2b2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_b2b2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_b2b2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_b2b2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_b2b2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2649_c7_b2b2
result_u8_value_MUX_uxn_opcodes_h_l2649_c7_b2b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2649_c7_b2b2_cond,
result_u8_value_MUX_uxn_opcodes_h_l2649_c7_b2b2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2649_c7_b2b2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2649_c7_b2b2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_b2b2
result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_b2b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_b2b2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_b2b2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_b2b2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_b2b2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2
result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2_return_output);

-- t16_MUX_uxn_opcodes_h_l2649_c7_b2b2
t16_MUX_uxn_opcodes_h_l2649_c7_b2b2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2649_c7_b2b2_cond,
t16_MUX_uxn_opcodes_h_l2649_c7_b2b2_iftrue,
t16_MUX_uxn_opcodes_h_l2649_c7_b2b2_iffalse,
t16_MUX_uxn_opcodes_h_l2649_c7_b2b2_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2651_c3_6654
CONST_SL_8_uxn_opcodes_h_l2651_c3_6654 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2651_c3_6654_x,
CONST_SL_8_uxn_opcodes_h_l2651_c3_6654_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2653_c11_5193
BIN_OP_EQ_uxn_opcodes_h_l2653_c11_5193 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2653_c11_5193_left,
BIN_OP_EQ_uxn_opcodes_h_l2653_c11_5193_right,
BIN_OP_EQ_uxn_opcodes_h_l2653_c11_5193_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_dec0
result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_dec0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_dec0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_dec0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_dec0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_dec0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_dec0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_dec0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_dec0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_dec0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_dec0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_dec0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_dec0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_dec0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_dec0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_dec0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_dec0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_dec0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2653_c7_dec0
result_u8_value_MUX_uxn_opcodes_h_l2653_c7_dec0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2653_c7_dec0_cond,
result_u8_value_MUX_uxn_opcodes_h_l2653_c7_dec0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2653_c7_dec0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2653_c7_dec0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_dec0
result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_dec0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_dec0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_dec0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_dec0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_dec0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_dec0
result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_dec0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_dec0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_dec0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_dec0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_dec0_return_output);

-- t16_MUX_uxn_opcodes_h_l2653_c7_dec0
t16_MUX_uxn_opcodes_h_l2653_c7_dec0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2653_c7_dec0_cond,
t16_MUX_uxn_opcodes_h_l2653_c7_dec0_iftrue,
t16_MUX_uxn_opcodes_h_l2653_c7_dec0_iffalse,
t16_MUX_uxn_opcodes_h_l2653_c7_dec0_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2654_c3_dbcd
BIN_OP_OR_uxn_opcodes_h_l2654_c3_dbcd : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2654_c3_dbcd_left,
BIN_OP_OR_uxn_opcodes_h_l2654_c3_dbcd_right,
BIN_OP_OR_uxn_opcodes_h_l2654_c3_dbcd_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2656_c30_32e6
sp_relative_shift_uxn_opcodes_h_l2656_c30_32e6 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2656_c30_32e6_ins,
sp_relative_shift_uxn_opcodes_h_l2656_c30_32e6_x,
sp_relative_shift_uxn_opcodes_h_l2656_c30_32e6_y,
sp_relative_shift_uxn_opcodes_h_l2656_c30_32e6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2661_c11_32e9
BIN_OP_EQ_uxn_opcodes_h_l2661_c11_32e9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2661_c11_32e9_left,
BIN_OP_EQ_uxn_opcodes_h_l2661_c11_32e9_right,
BIN_OP_EQ_uxn_opcodes_h_l2661_c11_32e9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_c287
result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_c287 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_c287_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_c287_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_c287_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_c287_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_c287
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_c287 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_c287_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_c287_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_c287_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_c287_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2661_c7_c287
result_u8_value_MUX_uxn_opcodes_h_l2661_c7_c287 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2661_c7_c287_cond,
result_u8_value_MUX_uxn_opcodes_h_l2661_c7_c287_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2661_c7_c287_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2661_c7_c287_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_c287
result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_c287 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_c287_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_c287_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_c287_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_c287_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_c287
result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_c287 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_c287_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_c287_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_c287_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_c287_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2666_c11_c333
BIN_OP_EQ_uxn_opcodes_h_l2666_c11_c333 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2666_c11_c333_left,
BIN_OP_EQ_uxn_opcodes_h_l2666_c11_c333_right,
BIN_OP_EQ_uxn_opcodes_h_l2666_c11_c333_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_e49c
result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_e49c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_e49c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_e49c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_e49c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_e49c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_e49c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_e49c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_e49c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_e49c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_e49c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_e49c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_e49c
result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_e49c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_e49c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_e49c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_e49c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_e49c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2666_c7_e49c
result_u8_value_MUX_uxn_opcodes_h_l2666_c7_e49c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2666_c7_e49c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2666_c7_e49c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2666_c7_e49c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2666_c7_e49c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2670_c11_4798
BIN_OP_EQ_uxn_opcodes_h_l2670_c11_4798 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2670_c11_4798_left,
BIN_OP_EQ_uxn_opcodes_h_l2670_c11_4798_right,
BIN_OP_EQ_uxn_opcodes_h_l2670_c11_4798_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_77de
result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_77de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_77de_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_77de_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_77de_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_77de_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_77de
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_77de : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_77de_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_77de_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_77de_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_77de_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_77de
result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_77de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_77de_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_77de_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_77de_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_77de_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2670_c7_77de
result_u8_value_MUX_uxn_opcodes_h_l2670_c7_77de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2670_c7_77de_cond,
result_u8_value_MUX_uxn_opcodes_h_l2670_c7_77de_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2670_c7_77de_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2670_c7_77de_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2674_c11_7b4b
BIN_OP_EQ_uxn_opcodes_h_l2674_c11_7b4b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2674_c11_7b4b_left,
BIN_OP_EQ_uxn_opcodes_h_l2674_c11_7b4b_right,
BIN_OP_EQ_uxn_opcodes_h_l2674_c11_7b4b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_22cd
result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_22cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_22cd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_22cd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_22cd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_22cd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_22cd
result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_22cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_22cd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_22cd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_22cd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_22cd_return_output);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l2672_l2664_DUPLICATE_3db6
CONST_SR_8_uint16_t_uxn_opcodes_h_l2672_l2664_DUPLICATE_3db6 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_opcodes_h_l2672_l2664_DUPLICATE_3db6_x,
CONST_SR_8_uint16_t_uxn_opcodes_h_l2672_l2664_DUPLICATE_3db6_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2641_c6_283d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2641_c1_267c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2641_c2_4311_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c2_4311_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c2_4311_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2641_c2_4311_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2641_c2_4311_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c2_4311_return_output,
 t16_MUX_uxn_opcodes_h_l2641_c2_4311_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2646_c11_1277_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_a934_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_a934_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_a934_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2646_c7_a934_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_a934_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_a934_return_output,
 t16_MUX_uxn_opcodes_h_l2646_c7_a934_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2649_c11_c7fb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_b2b2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_b2b2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2649_c7_b2b2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_b2b2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2_return_output,
 t16_MUX_uxn_opcodes_h_l2649_c7_b2b2_return_output,
 CONST_SL_8_uxn_opcodes_h_l2651_c3_6654_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2653_c11_5193_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_dec0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_dec0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_dec0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2653_c7_dec0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_dec0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_dec0_return_output,
 t16_MUX_uxn_opcodes_h_l2653_c7_dec0_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2654_c3_dbcd_return_output,
 sp_relative_shift_uxn_opcodes_h_l2656_c30_32e6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2661_c11_32e9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_c287_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_c287_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2661_c7_c287_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_c287_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_c287_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2666_c11_c333_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_e49c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_e49c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_e49c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2666_c7_e49c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2670_c11_4798_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_77de_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_77de_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_77de_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2670_c7_77de_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2674_c11_7b4b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_22cd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_22cd_return_output,
 CONST_SR_8_uint16_t_uxn_opcodes_h_l2672_l2664_DUPLICATE_3db6_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c6_283d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c6_283d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c6_283d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2641_c1_267c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2641_c1_267c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2641_c1_267c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2641_c1_267c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2641_c2_4311_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2641_c2_4311_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_a934_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2641_c2_4311_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2641_c2_4311_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c2_4311_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2643_c3_59e5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c2_4311_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_a934_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c2_4311_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c2_4311_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c2_4311_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c2_4311_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_a934_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c2_4311_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c2_4311_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2641_c2_4311_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2641_c2_4311_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2646_c7_a934_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2641_c2_4311_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2641_c2_4311_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c2_4311_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c2_4311_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_a934_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c2_4311_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c2_4311_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c2_4311_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c2_4311_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_a934_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c2_4311_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c2_4311_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2641_c2_4311_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2641_c2_4311_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2646_c7_a934_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2641_c2_4311_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2641_c2_4311_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2642_c3_c7ac_uxn_opcodes_h_l2642_c3_c7ac_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2646_c11_1277_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2646_c11_1277_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2646_c11_1277_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_a934_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_a934_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_b2b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_a934_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_a934_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2647_c3_fcf7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_a934_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_b2b2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_a934_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_a934_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_a934_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_a934_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2646_c7_a934_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2646_c7_a934_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2649_c7_b2b2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2646_c7_a934_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_a934_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_a934_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_b2b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_a934_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_a934_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_a934_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_a934_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2646_c7_a934_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2646_c7_a934_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2649_c7_b2b2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2646_c7_a934_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_c7fb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_c7fb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_c7fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_b2b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_b2b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_dec0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_b2b2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_b2b2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_b2b2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_dec0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_b2b2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_dec0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2649_c7_b2b2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2649_c7_b2b2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c7_dec0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2649_c7_b2b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_b2b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_b2b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_dec0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_b2b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_dec0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2649_c7_b2b2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2649_c7_b2b2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2653_c7_dec0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2649_c7_b2b2_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2651_c3_6654_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2651_c3_6654_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_5193_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_5193_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_5193_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_dec0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_dec0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_c287_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_dec0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_dec0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2658_c3_a95e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_dec0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_c287_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_dec0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_dec0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_dec0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_dec0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c7_dec0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c7_dec0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_c287_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c7_dec0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_dec0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_dec0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_c287_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_dec0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_dec0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_dec0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_c287_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_dec0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2653_c7_dec0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2653_c7_dec0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2653_c7_dec0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2654_c3_dbcd_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2654_c3_dbcd_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2654_c3_dbcd_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2656_c30_32e6_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2656_c30_32e6_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2656_c30_32e6_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2656_c30_32e6_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2659_c21_1711_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_32e9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_32e9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_32e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_c287_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_c287_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_e49c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_c287_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_c287_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2663_c3_920c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_c287_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_e49c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_c287_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_c287_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_c287_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2666_c7_e49c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_c287_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_c287_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_c287_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_e49c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_c287_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_c287_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_c287_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_c287_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_c333_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_c333_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_c333_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_e49c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_e49c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_77de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_e49c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_e49c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2667_c3_bd4f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_e49c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_77de_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_e49c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_e49c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_e49c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_77de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_e49c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2666_c7_e49c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2666_c7_e49c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2670_c7_77de_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2666_c7_e49c_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2668_c21_3ccd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2670_c11_4798_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2670_c11_4798_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2670_c11_4798_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_77de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_77de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_22cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_77de_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_77de_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2671_c3_57a1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_77de_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_77de_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_77de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_77de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_22cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_77de_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2670_c7_77de_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2670_c7_77de_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2670_c7_77de_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_7b4b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_7b4b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_7b4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_22cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_22cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_22cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_22cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_22cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_22cd_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2641_l2670_l2666_l2661_l2649_l2646_l2674_DUPLICATE_2296_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2641_l2653_l2646_l2649_DUPLICATE_3231_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2641_l2670_l2646_l2649_DUPLICATE_6b2e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2641_l2646_l2661_l2649_DUPLICATE_1261_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2670_l2666_l2661_l2653_l2649_l2646_l2674_DUPLICATE_ce2c_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2650_l2654_DUPLICATE_0148_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2670_l2649_DUPLICATE_7f2d_return_output : unsigned(3 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l2672_l2664_DUPLICATE_3db6_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l2672_l2664_DUPLICATE_3db6_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l2664_l2672_DUPLICATE_4356_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l2679_l2637_DUPLICATE_f2dd_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_22cd_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2671_c3_57a1 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_77de_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2671_c3_57a1;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c2_4311_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c6_283d_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2658_c3_a95e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_dec0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2658_c3_a95e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2667_c3_bd4f := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_e49c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2667_c3_bd4f;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_dec0_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2663_c3_920c := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_c287_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2663_c3_920c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2646_c11_1277_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_32e9_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2647_c3_fcf7 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_a934_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2647_c3_fcf7;
     VAR_sp_relative_shift_uxn_opcodes_h_l2656_c30_32e6_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2643_c3_59e5 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c2_4311_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2643_c3_59e5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_c333_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2670_c11_4798_right := to_unsigned(6, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2656_c30_32e6_y := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_dec0_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2641_c1_267c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_5193_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_22cd_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_c287_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_c7fb_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_7b4b_right := to_unsigned(7, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2641_c1_267c_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2656_c30_32e6_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c6_283d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2646_c11_1277_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_c7fb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_5193_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_32e9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_c333_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2670_c11_4798_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_7b4b_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2654_c3_dbcd_left := t16;
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l2672_l2664_DUPLICATE_3db6_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2641_c2_4311_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2646_c7_a934_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2653_c7_dec0_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2670_c11_4798] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2670_c11_4798_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2670_c11_4798_left;
     BIN_OP_EQ_uxn_opcodes_h_l2670_c11_4798_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2670_c11_4798_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2670_c11_4798_return_output := BIN_OP_EQ_uxn_opcodes_h_l2670_c11_4798_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2670_l2666_l2661_l2653_l2649_l2646_l2674_DUPLICATE_ce2c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2670_l2666_l2661_l2653_l2649_l2646_l2674_DUPLICATE_ce2c_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2649_c11_c7fb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2649_c11_c7fb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_c7fb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2649_c11_c7fb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_c7fb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_c7fb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2649_c11_c7fb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2674_c11_7b4b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2674_c11_7b4b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_7b4b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2674_c11_7b4b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_7b4b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_7b4b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2674_c11_7b4b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2653_c11_5193] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2653_c11_5193_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_5193_left;
     BIN_OP_EQ_uxn_opcodes_h_l2653_c11_5193_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_5193_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_5193_return_output := BIN_OP_EQ_uxn_opcodes_h_l2653_c11_5193_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2641_c6_283d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2641_c6_283d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c6_283d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2641_c6_283d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c6_283d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c6_283d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2641_c6_283d_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2641_l2653_l2646_l2649_DUPLICATE_3231 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2641_l2653_l2646_l2649_DUPLICATE_3231_return_output := result.sp_relative_shift;

     -- CONST_SR_8_uint16_t_uxn_opcodes_h_l2672_l2664_DUPLICATE_3db6 LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_opcodes_h_l2672_l2664_DUPLICATE_3db6_x <= VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l2672_l2664_DUPLICATE_3db6_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l2672_l2664_DUPLICATE_3db6_return_output := CONST_SR_8_uint16_t_uxn_opcodes_h_l2672_l2664_DUPLICATE_3db6_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2670_l2649_DUPLICATE_7f2d LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2670_l2649_DUPLICATE_7f2d_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2641_l2646_l2661_l2649_DUPLICATE_1261 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2641_l2646_l2661_l2649_DUPLICATE_1261_return_output := result.is_sp_shift;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2668_c21_3ccd] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2668_c21_3ccd_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2641_l2670_l2646_l2649_DUPLICATE_6b2e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2641_l2670_l2646_l2649_DUPLICATE_6b2e_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2666_c11_c333] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2666_c11_c333_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_c333_left;
     BIN_OP_EQ_uxn_opcodes_h_l2666_c11_c333_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_c333_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_c333_return_output := BIN_OP_EQ_uxn_opcodes_h_l2666_c11_c333_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2656_c30_32e6] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2656_c30_32e6_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2656_c30_32e6_ins;
     sp_relative_shift_uxn_opcodes_h_l2656_c30_32e6_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2656_c30_32e6_x;
     sp_relative_shift_uxn_opcodes_h_l2656_c30_32e6_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2656_c30_32e6_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2656_c30_32e6_return_output := sp_relative_shift_uxn_opcodes_h_l2656_c30_32e6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2661_c11_32e9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2661_c11_32e9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_32e9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2661_c11_32e9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_32e9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_32e9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2661_c11_32e9_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2650_l2654_DUPLICATE_0148 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2650_l2654_DUPLICATE_0148_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2641_l2670_l2666_l2661_l2649_l2646_l2674_DUPLICATE_2296 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2641_l2670_l2666_l2661_l2649_l2646_l2674_DUPLICATE_2296_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2646_c11_1277] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2646_c11_1277_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2646_c11_1277_left;
     BIN_OP_EQ_uxn_opcodes_h_l2646_c11_1277_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2646_c11_1277_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2646_c11_1277_return_output := BIN_OP_EQ_uxn_opcodes_h_l2646_c11_1277_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2641_c1_267c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c6_283d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c2_4311_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c6_283d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c2_4311_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c6_283d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2641_c2_4311_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c6_283d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c2_4311_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c6_283d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c2_4311_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c6_283d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2641_c2_4311_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c6_283d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2641_c2_4311_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c6_283d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_a934_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2646_c11_1277_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_a934_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2646_c11_1277_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_a934_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2646_c11_1277_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_a934_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2646_c11_1277_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_a934_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2646_c11_1277_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2646_c7_a934_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2646_c11_1277_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2646_c7_a934_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2646_c11_1277_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_b2b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_c7fb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_c7fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_b2b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_c7fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_c7fb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_b2b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_c7fb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2649_c7_b2b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_c7fb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2649_c7_b2b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_c7fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_dec0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_5193_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_dec0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_5193_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_dec0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_5193_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_dec0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_5193_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_dec0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_5193_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c7_dec0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_5193_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2653_c7_dec0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_5193_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_c287_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_32e9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_c287_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_32e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_c287_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_32e9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_c287_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_32e9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_c287_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_32e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_e49c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_c333_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_e49c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_c333_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_e49c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_c333_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2666_c7_e49c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_c333_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_77de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2670_c11_4798_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_77de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2670_c11_4798_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_77de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2670_c11_4798_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2670_c7_77de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2670_c11_4798_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_22cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_7b4b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_22cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_7b4b_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2654_c3_dbcd_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2650_l2654_DUPLICATE_0148_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2651_c3_6654_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2650_l2654_DUPLICATE_0148_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2666_c7_e49c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2668_c21_3ccd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c2_4311_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2641_l2653_l2646_l2649_DUPLICATE_3231_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_a934_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2641_l2653_l2646_l2649_DUPLICATE_3231_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2641_l2653_l2646_l2649_DUPLICATE_3231_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_dec0_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2641_l2653_l2646_l2649_DUPLICATE_3231_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_a934_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2670_l2666_l2661_l2653_l2649_l2646_l2674_DUPLICATE_ce2c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_b2b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2670_l2666_l2661_l2653_l2649_l2646_l2674_DUPLICATE_ce2c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_dec0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2670_l2666_l2661_l2653_l2649_l2646_l2674_DUPLICATE_ce2c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_c287_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2670_l2666_l2661_l2653_l2649_l2646_l2674_DUPLICATE_ce2c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_e49c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2670_l2666_l2661_l2653_l2649_l2646_l2674_DUPLICATE_ce2c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_77de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2670_l2666_l2661_l2653_l2649_l2646_l2674_DUPLICATE_ce2c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_22cd_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2670_l2666_l2661_l2653_l2649_l2646_l2674_DUPLICATE_ce2c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c2_4311_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2641_l2646_l2661_l2649_DUPLICATE_1261_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_a934_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2641_l2646_l2661_l2649_DUPLICATE_1261_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2641_l2646_l2661_l2649_DUPLICATE_1261_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_c287_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2641_l2646_l2661_l2649_DUPLICATE_1261_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2641_c2_4311_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2641_l2670_l2666_l2661_l2649_l2646_l2674_DUPLICATE_2296_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_a934_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2641_l2670_l2666_l2661_l2649_l2646_l2674_DUPLICATE_2296_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_b2b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2641_l2670_l2666_l2661_l2649_l2646_l2674_DUPLICATE_2296_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_c287_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2641_l2670_l2666_l2661_l2649_l2646_l2674_DUPLICATE_2296_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_e49c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2641_l2670_l2666_l2661_l2649_l2646_l2674_DUPLICATE_2296_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_77de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2641_l2670_l2666_l2661_l2649_l2646_l2674_DUPLICATE_2296_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_22cd_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2641_l2670_l2666_l2661_l2649_l2646_l2674_DUPLICATE_2296_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_b2b2_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2670_l2649_DUPLICATE_7f2d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_77de_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2670_l2649_DUPLICATE_7f2d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2641_c2_4311_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2641_l2670_l2646_l2649_DUPLICATE_6b2e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2646_c7_a934_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2641_l2670_l2646_l2649_DUPLICATE_6b2e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2649_c7_b2b2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2641_l2670_l2646_l2649_DUPLICATE_6b2e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2670_c7_77de_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2641_l2670_l2646_l2649_DUPLICATE_6b2e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_dec0_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2656_c30_32e6_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2661_c7_c287] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_c287_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_c287_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_c287_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_c287_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_c287_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_c287_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_c287_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_c287_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2641_c1_267c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2641_c1_267c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2641_c1_267c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2641_c1_267c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2641_c1_267c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2641_c1_267c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2641_c1_267c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2641_c1_267c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2641_c1_267c_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2651_c3_6654] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2651_c3_6654_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2651_c3_6654_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2651_c3_6654_return_output := CONST_SL_8_uxn_opcodes_h_l2651_c3_6654_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2654_c3_dbcd] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2654_c3_dbcd_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2654_c3_dbcd_left;
     BIN_OP_OR_uxn_opcodes_h_l2654_c3_dbcd_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2654_c3_dbcd_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2654_c3_dbcd_return_output := BIN_OP_OR_uxn_opcodes_h_l2654_c3_dbcd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2674_c7_22cd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_22cd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_22cd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_22cd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_22cd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_22cd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_22cd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_22cd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_22cd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2670_c7_77de] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_77de_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_77de_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_77de_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_77de_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_77de_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_77de_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_77de_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_77de_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l2664_l2672_DUPLICATE_4356 LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l2664_l2672_DUPLICATE_4356_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l2672_l2664_DUPLICATE_3db6_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2653_c7_dec0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_dec0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_dec0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_dec0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_dec0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_dec0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_dec0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_dec0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_dec0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2674_c7_22cd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_22cd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_22cd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_22cd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_22cd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_22cd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_22cd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_22cd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_22cd_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2653_c7_dec0_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2654_c3_dbcd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_c287_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l2664_l2672_DUPLICATE_4356_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2670_c7_77de_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l2664_l2672_DUPLICATE_4356_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2649_c7_b2b2_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2651_c3_6654_return_output;
     VAR_printf_uxn_opcodes_h_l2642_c3_c7ac_uxn_opcodes_h_l2642_c3_c7ac_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2641_c1_267c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_77de_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_22cd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_dec0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_c287_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_77de_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_22cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_dec0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_e49c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_77de_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2666_c7_e49c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_e49c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_e49c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_e49c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_e49c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_e49c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_e49c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_e49c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_e49c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2670_c7_77de] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_77de_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_77de_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_77de_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_77de_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_77de_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_77de_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_77de_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_77de_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2670_c7_77de] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2670_c7_77de_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2670_c7_77de_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2670_c7_77de_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2670_c7_77de_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2670_c7_77de_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2670_c7_77de_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2670_c7_77de_return_output := result_u8_value_MUX_uxn_opcodes_h_l2670_c7_77de_return_output;

     -- t16_MUX[uxn_opcodes_h_l2653_c7_dec0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2653_c7_dec0_cond <= VAR_t16_MUX_uxn_opcodes_h_l2653_c7_dec0_cond;
     t16_MUX_uxn_opcodes_h_l2653_c7_dec0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2653_c7_dec0_iftrue;
     t16_MUX_uxn_opcodes_h_l2653_c7_dec0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2653_c7_dec0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2653_c7_dec0_return_output := t16_MUX_uxn_opcodes_h_l2653_c7_dec0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2670_c7_77de] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_77de_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_77de_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_77de_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_77de_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_77de_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_77de_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_77de_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_77de_return_output;

     -- printf_uxn_opcodes_h_l2642_c3_c7ac[uxn_opcodes_h_l2642_c3_c7ac] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2642_c3_c7ac_uxn_opcodes_h_l2642_c3_c7ac_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2642_c3_c7ac_uxn_opcodes_h_l2642_c3_c7ac_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2649_c7_b2b2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2659_c21_1711] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2659_c21_1711_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l2654_c3_dbcd_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2653_c7_dec0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_dec0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_dec0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_dec0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_dec0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_dec0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_dec0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_dec0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_dec0_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c7_dec0_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2659_c21_1711_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_e49c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_77de_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_dec0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_e49c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_77de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_a934_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_c287_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_e49c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2666_c7_e49c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2670_c7_77de_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2649_c7_b2b2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2653_c7_dec0_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2649_c7_b2b2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2666_c7_e49c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_e49c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_e49c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_e49c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_e49c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_e49c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_e49c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_e49c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_e49c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2646_c7_a934] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_a934_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_a934_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_a934_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_a934_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_a934_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_a934_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_a934_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_a934_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2666_c7_e49c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_e49c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_e49c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_e49c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_e49c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_e49c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_e49c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_e49c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_e49c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2661_c7_c287] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_c287_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_c287_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_c287_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_c287_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_c287_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_c287_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_c287_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_c287_return_output;

     -- t16_MUX[uxn_opcodes_h_l2649_c7_b2b2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2649_c7_b2b2_cond <= VAR_t16_MUX_uxn_opcodes_h_l2649_c7_b2b2_cond;
     t16_MUX_uxn_opcodes_h_l2649_c7_b2b2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2649_c7_b2b2_iftrue;
     t16_MUX_uxn_opcodes_h_l2649_c7_b2b2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2649_c7_b2b2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2649_c7_b2b2_return_output := t16_MUX_uxn_opcodes_h_l2649_c7_b2b2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2666_c7_e49c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2666_c7_e49c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2666_c7_e49c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2666_c7_e49c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2666_c7_e49c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2666_c7_e49c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2666_c7_e49c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2666_c7_e49c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2666_c7_e49c_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_c287_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_e49c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_a934_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_b2b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_c287_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_e49c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c2_4311_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_a934_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_dec0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_c287_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_c287_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2666_c7_e49c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2646_c7_a934_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2649_c7_b2b2_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2661_c7_c287] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_c287_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_c287_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_c287_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_c287_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_c287_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_c287_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_c287_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_c287_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2641_c2_4311] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c2_4311_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c2_4311_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c2_4311_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c2_4311_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c2_4311_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c2_4311_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c2_4311_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c2_4311_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2661_c7_c287] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_c287_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_c287_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_c287_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_c287_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_c287_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_c287_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_c287_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_c287_return_output;

     -- t16_MUX[uxn_opcodes_h_l2646_c7_a934] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2646_c7_a934_cond <= VAR_t16_MUX_uxn_opcodes_h_l2646_c7_a934_cond;
     t16_MUX_uxn_opcodes_h_l2646_c7_a934_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2646_c7_a934_iftrue;
     t16_MUX_uxn_opcodes_h_l2646_c7_a934_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2646_c7_a934_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2646_c7_a934_return_output := t16_MUX_uxn_opcodes_h_l2646_c7_a934_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2661_c7_c287] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2661_c7_c287_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_c287_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2661_c7_c287_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_c287_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2661_c7_c287_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_c287_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_c287_return_output := result_u8_value_MUX_uxn_opcodes_h_l2661_c7_c287_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2646_c7_a934] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_a934_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_a934_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_a934_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_a934_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_a934_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_a934_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_a934_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_a934_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2653_c7_dec0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_dec0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_dec0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_dec0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_dec0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_dec0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_dec0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_dec0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_dec0_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_dec0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_c287_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c2_4311_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_a934_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_dec0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_c287_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_b2b2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_dec0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c7_dec0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_c287_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2641_c2_4311_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2646_c7_a934_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2649_c7_b2b2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_b2b2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_b2b2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_b2b2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_b2b2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_b2b2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_b2b2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_b2b2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_b2b2_return_output;

     -- t16_MUX[uxn_opcodes_h_l2641_c2_4311] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2641_c2_4311_cond <= VAR_t16_MUX_uxn_opcodes_h_l2641_c2_4311_cond;
     t16_MUX_uxn_opcodes_h_l2641_c2_4311_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2641_c2_4311_iftrue;
     t16_MUX_uxn_opcodes_h_l2641_c2_4311_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2641_c2_4311_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2641_c2_4311_return_output := t16_MUX_uxn_opcodes_h_l2641_c2_4311_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2653_c7_dec0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_dec0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_dec0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_dec0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_dec0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_dec0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_dec0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_dec0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_dec0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2653_c7_dec0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_dec0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_dec0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_dec0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_dec0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_dec0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_dec0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_dec0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_dec0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2653_c7_dec0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2653_c7_dec0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c7_dec0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2653_c7_dec0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c7_dec0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2653_c7_dec0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c7_dec0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c7_dec0_return_output := result_u8_value_MUX_uxn_opcodes_h_l2653_c7_dec0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2641_c2_4311] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c2_4311_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c2_4311_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c2_4311_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c2_4311_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c2_4311_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c2_4311_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c2_4311_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c2_4311_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_b2b2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_dec0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_b2b2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_dec0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_a934_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_b2b2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2649_c7_b2b2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c7_dec0_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2641_c2_4311_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2649_c7_b2b2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_b2b2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_b2b2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_b2b2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_b2b2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_b2b2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_b2b2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_b2b2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_b2b2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2646_c7_a934] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_a934_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_a934_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_a934_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_a934_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_a934_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_a934_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_a934_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_a934_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2649_c7_b2b2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2649_c7_b2b2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2649_c7_b2b2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2649_c7_b2b2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2649_c7_b2b2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2649_c7_b2b2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2649_c7_b2b2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2649_c7_b2b2_return_output := result_u8_value_MUX_uxn_opcodes_h_l2649_c7_b2b2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2649_c7_b2b2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_b2b2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_b2b2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_b2b2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_b2b2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_b2b2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_b2b2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_b2b2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_b2b2_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_a934_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_b2b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_a934_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_b2b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c2_4311_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_a934_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2646_c7_a934_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2649_c7_b2b2_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2646_c7_a934] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_a934_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_a934_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_a934_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_a934_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_a934_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_a934_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_a934_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_a934_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2646_c7_a934] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2646_c7_a934_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2646_c7_a934_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2646_c7_a934_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2646_c7_a934_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2646_c7_a934_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2646_c7_a934_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2646_c7_a934_return_output := result_u8_value_MUX_uxn_opcodes_h_l2646_c7_a934_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2641_c2_4311] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c2_4311_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c2_4311_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c2_4311_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c2_4311_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c2_4311_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c2_4311_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c2_4311_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c2_4311_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2646_c7_a934] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_a934_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_a934_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_a934_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_a934_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_a934_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_a934_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_a934_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_a934_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c2_4311_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_a934_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2641_c2_4311_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_a934_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2641_c2_4311_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2646_c7_a934_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2641_c2_4311] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2641_c2_4311_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2641_c2_4311_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2641_c2_4311_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2641_c2_4311_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2641_c2_4311_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2641_c2_4311_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2641_c2_4311_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2641_c2_4311_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2641_c2_4311] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2641_c2_4311_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c2_4311_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2641_c2_4311_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c2_4311_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2641_c2_4311_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c2_4311_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c2_4311_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2641_c2_4311_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2641_c2_4311] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2641_c2_4311_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2641_c2_4311_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2641_c2_4311_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2641_c2_4311_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2641_c2_4311_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2641_c2_4311_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2641_c2_4311_return_output := result_u8_value_MUX_uxn_opcodes_h_l2641_c2_4311_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l2679_l2637_DUPLICATE_f2dd LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l2679_l2637_DUPLICATE_f2dd_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c551(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2641_c2_4311_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c2_4311_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c2_4311_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2641_c2_4311_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c2_4311_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c2_4311_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l2679_l2637_DUPLICATE_f2dd_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l2679_l2637_DUPLICATE_f2dd_return_output;
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
