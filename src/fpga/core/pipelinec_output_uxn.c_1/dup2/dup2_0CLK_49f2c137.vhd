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
-- BIN_OP_EQ[uxn_opcodes_h_l2649_c6_79a0]
signal BIN_OP_EQ_uxn_opcodes_h_l2649_c6_79a0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2649_c6_79a0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2649_c6_79a0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2649_c1_42b2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_42b2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_42b2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_42b2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_42b2_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2649_c2_0963]
signal t16_MUX_uxn_opcodes_h_l2649_c2_0963_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2649_c2_0963_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2649_c2_0963_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2649_c2_0963_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2649_c2_0963]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_0963_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_0963_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_0963_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_0963_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2649_c2_0963]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_0963_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_0963_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_0963_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_0963_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2649_c2_0963]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_0963_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_0963_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_0963_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_0963_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2649_c2_0963]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_0963_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_0963_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_0963_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_0963_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2649_c2_0963]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_0963_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_0963_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_0963_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_0963_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2649_c2_0963]
signal result_u8_value_MUX_uxn_opcodes_h_l2649_c2_0963_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2649_c2_0963_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2649_c2_0963_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2649_c2_0963_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l2650_c3_3d73[uxn_opcodes_h_l2650_c3_3d73]
signal printf_uxn_opcodes_h_l2650_c3_3d73_uxn_opcodes_h_l2650_c3_3d73_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2654_c11_09b2]
signal BIN_OP_EQ_uxn_opcodes_h_l2654_c11_09b2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2654_c11_09b2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2654_c11_09b2_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2654_c7_9a92]
signal t16_MUX_uxn_opcodes_h_l2654_c7_9a92_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2654_c7_9a92_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2654_c7_9a92_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2654_c7_9a92_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2654_c7_9a92]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_9a92_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_9a92_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_9a92_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_9a92_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2654_c7_9a92]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_9a92_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_9a92_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_9a92_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_9a92_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2654_c7_9a92]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_9a92_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_9a92_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_9a92_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_9a92_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2654_c7_9a92]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_9a92_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_9a92_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_9a92_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_9a92_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2654_c7_9a92]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_9a92_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_9a92_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_9a92_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_9a92_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2654_c7_9a92]
signal result_u8_value_MUX_uxn_opcodes_h_l2654_c7_9a92_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2654_c7_9a92_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2654_c7_9a92_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2654_c7_9a92_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2657_c11_870e]
signal BIN_OP_EQ_uxn_opcodes_h_l2657_c11_870e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2657_c11_870e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2657_c11_870e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2657_c7_c5be]
signal t16_MUX_uxn_opcodes_h_l2657_c7_c5be_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2657_c7_c5be_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2657_c7_c5be_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2657_c7_c5be_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2657_c7_c5be]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_c5be_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_c5be_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_c5be_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_c5be_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2657_c7_c5be]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_c5be_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_c5be_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_c5be_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_c5be_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2657_c7_c5be]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_c5be_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_c5be_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_c5be_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_c5be_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2657_c7_c5be]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_c5be_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_c5be_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_c5be_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_c5be_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2657_c7_c5be]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_c5be_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_c5be_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_c5be_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_c5be_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2657_c7_c5be]
signal result_u8_value_MUX_uxn_opcodes_h_l2657_c7_c5be_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2657_c7_c5be_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2657_c7_c5be_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2657_c7_c5be_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2659_c3_2046]
signal CONST_SL_8_uxn_opcodes_h_l2659_c3_2046_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2659_c3_2046_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2661_c11_e786]
signal BIN_OP_EQ_uxn_opcodes_h_l2661_c11_e786_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2661_c11_e786_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2661_c11_e786_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2661_c7_824a]
signal t16_MUX_uxn_opcodes_h_l2661_c7_824a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2661_c7_824a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2661_c7_824a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2661_c7_824a_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2661_c7_824a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_824a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_824a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_824a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_824a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2661_c7_824a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_824a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_824a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_824a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_824a_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2661_c7_824a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_824a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_824a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_824a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_824a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2661_c7_824a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_824a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_824a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_824a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_824a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2661_c7_824a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_824a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_824a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_824a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_824a_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2661_c7_824a]
signal result_u8_value_MUX_uxn_opcodes_h_l2661_c7_824a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2661_c7_824a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2661_c7_824a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2661_c7_824a_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2662_c3_d46a]
signal BIN_OP_OR_uxn_opcodes_h_l2662_c3_d46a_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2662_c3_d46a_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2662_c3_d46a_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2664_c30_06db]
signal sp_relative_shift_uxn_opcodes_h_l2664_c30_06db_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2664_c30_06db_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2664_c30_06db_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2664_c30_06db_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2669_c11_043c]
signal BIN_OP_EQ_uxn_opcodes_h_l2669_c11_043c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2669_c11_043c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2669_c11_043c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2669_c7_7afa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_7afa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_7afa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_7afa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_7afa_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2669_c7_7afa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_7afa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_7afa_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_7afa_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_7afa_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2669_c7_7afa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_7afa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_7afa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_7afa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_7afa_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2669_c7_7afa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_7afa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_7afa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_7afa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_7afa_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2669_c7_7afa]
signal result_u8_value_MUX_uxn_opcodes_h_l2669_c7_7afa_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2669_c7_7afa_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2669_c7_7afa_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2669_c7_7afa_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2674_c11_c035]
signal BIN_OP_EQ_uxn_opcodes_h_l2674_c11_c035_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2674_c11_c035_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2674_c11_c035_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2674_c7_1103]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1103_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1103_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1103_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1103_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2674_c7_1103]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1103_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1103_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1103_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1103_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2674_c7_1103]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1103_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1103_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1103_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1103_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2674_c7_1103]
signal result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1103_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1103_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1103_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1103_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2678_c11_0fb8]
signal BIN_OP_EQ_uxn_opcodes_h_l2678_c11_0fb8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2678_c11_0fb8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2678_c11_0fb8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2678_c7_620d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_620d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_620d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_620d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_620d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2678_c7_620d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_620d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_620d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_620d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_620d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2678_c7_620d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_620d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_620d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_620d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_620d_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2678_c7_620d]
signal result_u8_value_MUX_uxn_opcodes_h_l2678_c7_620d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2678_c7_620d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2678_c7_620d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2678_c7_620d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2682_c11_4112]
signal BIN_OP_EQ_uxn_opcodes_h_l2682_c11_4112_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2682_c11_4112_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2682_c11_4112_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2682_c7_91d5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_91d5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_91d5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_91d5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_91d5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2682_c7_91d5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_91d5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_91d5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_91d5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_91d5_return_output : unsigned(0 downto 0);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l2672_l2680_DUPLICATE_19ca
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l2672_l2680_DUPLICATE_19ca_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l2672_l2680_DUPLICATE_19ca_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_5b93( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2649_c6_79a0
BIN_OP_EQ_uxn_opcodes_h_l2649_c6_79a0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2649_c6_79a0_left,
BIN_OP_EQ_uxn_opcodes_h_l2649_c6_79a0_right,
BIN_OP_EQ_uxn_opcodes_h_l2649_c6_79a0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_42b2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_42b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_42b2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_42b2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_42b2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_42b2_return_output);

-- t16_MUX_uxn_opcodes_h_l2649_c2_0963
t16_MUX_uxn_opcodes_h_l2649_c2_0963 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2649_c2_0963_cond,
t16_MUX_uxn_opcodes_h_l2649_c2_0963_iftrue,
t16_MUX_uxn_opcodes_h_l2649_c2_0963_iffalse,
t16_MUX_uxn_opcodes_h_l2649_c2_0963_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_0963
result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_0963 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_0963_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_0963_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_0963_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_0963_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_0963
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_0963 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_0963_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_0963_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_0963_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_0963_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_0963
result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_0963 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_0963_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_0963_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_0963_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_0963_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_0963
result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_0963 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_0963_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_0963_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_0963_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_0963_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_0963
result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_0963 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_0963_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_0963_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_0963_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_0963_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2649_c2_0963
result_u8_value_MUX_uxn_opcodes_h_l2649_c2_0963 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2649_c2_0963_cond,
result_u8_value_MUX_uxn_opcodes_h_l2649_c2_0963_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2649_c2_0963_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2649_c2_0963_return_output);

-- printf_uxn_opcodes_h_l2650_c3_3d73_uxn_opcodes_h_l2650_c3_3d73
printf_uxn_opcodes_h_l2650_c3_3d73_uxn_opcodes_h_l2650_c3_3d73 : entity work.printf_uxn_opcodes_h_l2650_c3_3d73_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2650_c3_3d73_uxn_opcodes_h_l2650_c3_3d73_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2654_c11_09b2
BIN_OP_EQ_uxn_opcodes_h_l2654_c11_09b2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2654_c11_09b2_left,
BIN_OP_EQ_uxn_opcodes_h_l2654_c11_09b2_right,
BIN_OP_EQ_uxn_opcodes_h_l2654_c11_09b2_return_output);

-- t16_MUX_uxn_opcodes_h_l2654_c7_9a92
t16_MUX_uxn_opcodes_h_l2654_c7_9a92 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2654_c7_9a92_cond,
t16_MUX_uxn_opcodes_h_l2654_c7_9a92_iftrue,
t16_MUX_uxn_opcodes_h_l2654_c7_9a92_iffalse,
t16_MUX_uxn_opcodes_h_l2654_c7_9a92_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_9a92
result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_9a92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_9a92_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_9a92_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_9a92_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_9a92_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_9a92
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_9a92 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_9a92_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_9a92_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_9a92_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_9a92_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_9a92
result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_9a92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_9a92_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_9a92_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_9a92_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_9a92_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_9a92
result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_9a92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_9a92_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_9a92_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_9a92_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_9a92_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_9a92
result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_9a92 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_9a92_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_9a92_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_9a92_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_9a92_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2654_c7_9a92
result_u8_value_MUX_uxn_opcodes_h_l2654_c7_9a92 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2654_c7_9a92_cond,
result_u8_value_MUX_uxn_opcodes_h_l2654_c7_9a92_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2654_c7_9a92_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2654_c7_9a92_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2657_c11_870e
BIN_OP_EQ_uxn_opcodes_h_l2657_c11_870e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2657_c11_870e_left,
BIN_OP_EQ_uxn_opcodes_h_l2657_c11_870e_right,
BIN_OP_EQ_uxn_opcodes_h_l2657_c11_870e_return_output);

-- t16_MUX_uxn_opcodes_h_l2657_c7_c5be
t16_MUX_uxn_opcodes_h_l2657_c7_c5be : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2657_c7_c5be_cond,
t16_MUX_uxn_opcodes_h_l2657_c7_c5be_iftrue,
t16_MUX_uxn_opcodes_h_l2657_c7_c5be_iffalse,
t16_MUX_uxn_opcodes_h_l2657_c7_c5be_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_c5be
result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_c5be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_c5be_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_c5be_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_c5be_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_c5be_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_c5be
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_c5be : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_c5be_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_c5be_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_c5be_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_c5be_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_c5be
result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_c5be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_c5be_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_c5be_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_c5be_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_c5be_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_c5be
result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_c5be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_c5be_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_c5be_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_c5be_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_c5be_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_c5be
result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_c5be : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_c5be_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_c5be_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_c5be_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_c5be_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2657_c7_c5be
result_u8_value_MUX_uxn_opcodes_h_l2657_c7_c5be : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2657_c7_c5be_cond,
result_u8_value_MUX_uxn_opcodes_h_l2657_c7_c5be_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2657_c7_c5be_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2657_c7_c5be_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2659_c3_2046
CONST_SL_8_uxn_opcodes_h_l2659_c3_2046 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2659_c3_2046_x,
CONST_SL_8_uxn_opcodes_h_l2659_c3_2046_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2661_c11_e786
BIN_OP_EQ_uxn_opcodes_h_l2661_c11_e786 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2661_c11_e786_left,
BIN_OP_EQ_uxn_opcodes_h_l2661_c11_e786_right,
BIN_OP_EQ_uxn_opcodes_h_l2661_c11_e786_return_output);

-- t16_MUX_uxn_opcodes_h_l2661_c7_824a
t16_MUX_uxn_opcodes_h_l2661_c7_824a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2661_c7_824a_cond,
t16_MUX_uxn_opcodes_h_l2661_c7_824a_iftrue,
t16_MUX_uxn_opcodes_h_l2661_c7_824a_iffalse,
t16_MUX_uxn_opcodes_h_l2661_c7_824a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_824a
result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_824a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_824a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_824a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_824a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_824a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_824a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_824a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_824a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_824a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_824a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_824a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_824a
result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_824a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_824a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_824a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_824a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_824a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_824a
result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_824a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_824a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_824a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_824a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_824a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_824a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_824a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_824a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_824a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_824a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_824a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2661_c7_824a
result_u8_value_MUX_uxn_opcodes_h_l2661_c7_824a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2661_c7_824a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2661_c7_824a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2661_c7_824a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2661_c7_824a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2662_c3_d46a
BIN_OP_OR_uxn_opcodes_h_l2662_c3_d46a : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2662_c3_d46a_left,
BIN_OP_OR_uxn_opcodes_h_l2662_c3_d46a_right,
BIN_OP_OR_uxn_opcodes_h_l2662_c3_d46a_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2664_c30_06db
sp_relative_shift_uxn_opcodes_h_l2664_c30_06db : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2664_c30_06db_ins,
sp_relative_shift_uxn_opcodes_h_l2664_c30_06db_x,
sp_relative_shift_uxn_opcodes_h_l2664_c30_06db_y,
sp_relative_shift_uxn_opcodes_h_l2664_c30_06db_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2669_c11_043c
BIN_OP_EQ_uxn_opcodes_h_l2669_c11_043c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2669_c11_043c_left,
BIN_OP_EQ_uxn_opcodes_h_l2669_c11_043c_right,
BIN_OP_EQ_uxn_opcodes_h_l2669_c11_043c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_7afa
result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_7afa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_7afa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_7afa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_7afa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_7afa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_7afa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_7afa : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_7afa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_7afa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_7afa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_7afa_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_7afa
result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_7afa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_7afa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_7afa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_7afa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_7afa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_7afa
result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_7afa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_7afa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_7afa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_7afa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_7afa_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2669_c7_7afa
result_u8_value_MUX_uxn_opcodes_h_l2669_c7_7afa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2669_c7_7afa_cond,
result_u8_value_MUX_uxn_opcodes_h_l2669_c7_7afa_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2669_c7_7afa_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2669_c7_7afa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2674_c11_c035
BIN_OP_EQ_uxn_opcodes_h_l2674_c11_c035 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2674_c11_c035_left,
BIN_OP_EQ_uxn_opcodes_h_l2674_c11_c035_right,
BIN_OP_EQ_uxn_opcodes_h_l2674_c11_c035_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1103
result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1103 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1103_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1103_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1103_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1103_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1103
result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1103 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1103_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1103_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1103_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1103_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1103
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1103 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1103_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1103_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1103_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1103_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1103
result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1103 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1103_cond,
result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1103_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1103_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1103_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2678_c11_0fb8
BIN_OP_EQ_uxn_opcodes_h_l2678_c11_0fb8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2678_c11_0fb8_left,
BIN_OP_EQ_uxn_opcodes_h_l2678_c11_0fb8_right,
BIN_OP_EQ_uxn_opcodes_h_l2678_c11_0fb8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_620d
result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_620d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_620d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_620d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_620d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_620d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_620d
result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_620d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_620d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_620d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_620d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_620d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_620d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_620d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_620d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_620d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_620d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_620d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2678_c7_620d
result_u8_value_MUX_uxn_opcodes_h_l2678_c7_620d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2678_c7_620d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2678_c7_620d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2678_c7_620d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2678_c7_620d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2682_c11_4112
BIN_OP_EQ_uxn_opcodes_h_l2682_c11_4112 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2682_c11_4112_left,
BIN_OP_EQ_uxn_opcodes_h_l2682_c11_4112_right,
BIN_OP_EQ_uxn_opcodes_h_l2682_c11_4112_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_91d5
result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_91d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_91d5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_91d5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_91d5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_91d5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_91d5
result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_91d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_91d5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_91d5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_91d5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_91d5_return_output);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l2672_l2680_DUPLICATE_19ca
CONST_SR_8_uint16_t_uxn_opcodes_h_l2672_l2680_DUPLICATE_19ca : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_opcodes_h_l2672_l2680_DUPLICATE_19ca_x,
CONST_SR_8_uint16_t_uxn_opcodes_h_l2672_l2680_DUPLICATE_19ca_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2649_c6_79a0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_42b2_return_output,
 t16_MUX_uxn_opcodes_h_l2649_c2_0963_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_0963_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_0963_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_0963_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_0963_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_0963_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2649_c2_0963_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2654_c11_09b2_return_output,
 t16_MUX_uxn_opcodes_h_l2654_c7_9a92_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_9a92_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_9a92_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_9a92_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_9a92_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_9a92_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2654_c7_9a92_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2657_c11_870e_return_output,
 t16_MUX_uxn_opcodes_h_l2657_c7_c5be_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_c5be_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_c5be_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_c5be_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_c5be_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_c5be_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2657_c7_c5be_return_output,
 CONST_SL_8_uxn_opcodes_h_l2659_c3_2046_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2661_c11_e786_return_output,
 t16_MUX_uxn_opcodes_h_l2661_c7_824a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_824a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_824a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_824a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_824a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_824a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2661_c7_824a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2662_c3_d46a_return_output,
 sp_relative_shift_uxn_opcodes_h_l2664_c30_06db_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2669_c11_043c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_7afa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_7afa_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_7afa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_7afa_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2669_c7_7afa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2674_c11_c035_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1103_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1103_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1103_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1103_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2678_c11_0fb8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_620d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_620d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_620d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2678_c7_620d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2682_c11_4112_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_91d5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_91d5_return_output,
 CONST_SR_8_uint16_t_uxn_opcodes_h_l2672_l2680_DUPLICATE_19ca_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c6_79a0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c6_79a0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c6_79a0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_42b2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_42b2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_42b2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_42b2_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2649_c2_0963_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2649_c2_0963_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2654_c7_9a92_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2649_c2_0963_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2649_c2_0963_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_0963_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_0963_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_9a92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_0963_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_0963_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_0963_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2651_c3_22b7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_0963_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_9a92_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_0963_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_0963_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_0963_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_0963_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_9a92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_0963_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_0963_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_0963_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_0963_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_9a92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_0963_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_0963_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_0963_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_0963_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_9a92_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_0963_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_0963_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2649_c2_0963_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2649_c2_0963_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2654_c7_9a92_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2649_c2_0963_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2649_c2_0963_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2650_c3_3d73_uxn_opcodes_h_l2650_c3_3d73_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2654_c11_09b2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2654_c11_09b2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2654_c11_09b2_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2654_c7_9a92_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2654_c7_9a92_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2657_c7_c5be_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2654_c7_9a92_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_9a92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_9a92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_c5be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_9a92_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_9a92_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2655_c3_8cd0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_9a92_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_c5be_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_9a92_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_9a92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_9a92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_c5be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_9a92_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_9a92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_9a92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_c5be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_9a92_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_9a92_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_9a92_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_c5be_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_9a92_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2654_c7_9a92_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2654_c7_9a92_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2657_c7_c5be_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2654_c7_9a92_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2657_c11_870e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2657_c11_870e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2657_c11_870e_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2657_c7_c5be_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2657_c7_c5be_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2661_c7_824a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2657_c7_c5be_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_c5be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_c5be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_824a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_c5be_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_c5be_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_c5be_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_824a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_c5be_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_c5be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_c5be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_824a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_c5be_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_c5be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_c5be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_824a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_c5be_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_c5be_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_c5be_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_824a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_c5be_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2657_c7_c5be_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2657_c7_c5be_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_824a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2657_c7_c5be_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2659_c3_2046_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2659_c3_2046_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_e786_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_e786_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_e786_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2661_c7_824a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2661_c7_824a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2661_c7_824a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_824a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_824a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_7afa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_824a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_824a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2666_c3_eb28 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_824a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_7afa_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_824a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_824a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_824a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_7afa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_824a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_824a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_824a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_7afa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_824a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_824a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_824a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_824a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_824a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_824a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_7afa_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_824a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2662_c3_d46a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2662_c3_d46a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2662_c3_d46a_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2664_c30_06db_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2664_c30_06db_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2664_c30_06db_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2664_c30_06db_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2667_c21_f4b3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_043c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_043c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_043c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_7afa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_7afa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1103_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_7afa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_7afa_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2671_c3_d230 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_7afa_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1103_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_7afa_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_7afa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_7afa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_7afa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_7afa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_7afa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1103_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_7afa_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_7afa_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_7afa_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1103_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_7afa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_c035_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_c035_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_c035_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1103_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1103_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_620d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1103_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1103_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1103_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_620d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1103_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1103_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2675_c3_4390 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1103_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_620d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1103_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1103_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1103_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2678_c7_620d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1103_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2676_c21_f3d5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_0fb8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_0fb8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_0fb8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_620d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_620d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_91d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_620d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_620d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_620d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_91d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_620d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_620d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2679_c3_516d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_620d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_620d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2678_c7_620d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2678_c7_620d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2678_c7_620d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2682_c11_4112_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2682_c11_4112_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2682_c11_4112_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_91d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_91d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_91d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_91d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_91d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_91d5_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2657_l2654_l2682_l2649_l2678_l2674_l2669_DUPLICATE_6c7f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2657_l2649_l2654_l2669_DUPLICATE_45f0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2657_l2649_l2661_l2654_DUPLICATE_27a3_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2657_l2649_l2678_l2654_DUPLICATE_0635_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2661_l2657_l2654_l2682_l2678_l2674_l2669_DUPLICATE_fe15_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2662_l2658_DUPLICATE_b2fe_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2657_l2678_DUPLICATE_56e3_return_output : unsigned(3 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l2672_l2680_DUPLICATE_19ca_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l2672_l2680_DUPLICATE_19ca_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l2680_l2672_DUPLICATE_790f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l2687_l2645_DUPLICATE_c4d0_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_91d5_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_0963_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_42b2_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_7afa_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c6_79a0_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2664_c30_06db_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2657_c11_870e_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_824a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2675_c3_4390 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1103_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2675_c3_4390;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2679_c3_516d := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_620d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2679_c3_516d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2682_c11_4112_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_c035_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2654_c11_09b2_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2655_c3_8cd0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_9a92_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2655_c3_8cd0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_e786_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l2664_c30_06db_y := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_824a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2651_c3_22b7 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_0963_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2651_c3_22b7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_043c_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_0fb8_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2671_c3_d230 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_7afa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2671_c3_d230;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2666_c3_eb28 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_824a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2666_c3_eb28;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_91d5_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_42b2_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2664_c30_06db_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c6_79a0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2654_c11_09b2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2657_c11_870e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_e786_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_043c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_c035_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_0fb8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2682_c11_4112_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2662_c3_d46a_left := t16;
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l2672_l2680_DUPLICATE_19ca_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2649_c2_0963_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2654_c7_9a92_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2661_c7_824a_iffalse := t16;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l2676_c21_f3d5] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2676_c21_f3d5_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2657_l2649_l2654_l2669_DUPLICATE_45f0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2657_l2649_l2654_l2669_DUPLICATE_45f0_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2661_c11_e786] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2661_c11_e786_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_e786_left;
     BIN_OP_EQ_uxn_opcodes_h_l2661_c11_e786_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_e786_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_e786_return_output := BIN_OP_EQ_uxn_opcodes_h_l2661_c11_e786_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2657_l2678_DUPLICATE_56e3 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2657_l2678_DUPLICATE_56e3_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2657_l2649_l2661_l2654_DUPLICATE_27a3 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2657_l2649_l2661_l2654_DUPLICATE_27a3_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2682_c11_4112] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2682_c11_4112_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2682_c11_4112_left;
     BIN_OP_EQ_uxn_opcodes_h_l2682_c11_4112_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2682_c11_4112_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2682_c11_4112_return_output := BIN_OP_EQ_uxn_opcodes_h_l2682_c11_4112_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2649_c6_79a0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2649_c6_79a0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c6_79a0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2649_c6_79a0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c6_79a0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c6_79a0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2649_c6_79a0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2669_c11_043c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2669_c11_043c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_043c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2669_c11_043c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_043c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_043c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2669_c11_043c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2657_c11_870e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2657_c11_870e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2657_c11_870e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2657_c11_870e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2657_c11_870e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2657_c11_870e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2657_c11_870e_return_output;

     -- CONST_SR_8_uint16_t_uxn_opcodes_h_l2672_l2680_DUPLICATE_19ca LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_opcodes_h_l2672_l2680_DUPLICATE_19ca_x <= VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l2672_l2680_DUPLICATE_19ca_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l2672_l2680_DUPLICATE_19ca_return_output := CONST_SR_8_uint16_t_uxn_opcodes_h_l2672_l2680_DUPLICATE_19ca_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2657_l2649_l2678_l2654_DUPLICATE_0635 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2657_l2649_l2678_l2654_DUPLICATE_0635_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2654_c11_09b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2654_c11_09b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2654_c11_09b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2654_c11_09b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2654_c11_09b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2654_c11_09b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2654_c11_09b2_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2662_l2658_DUPLICATE_b2fe LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2662_l2658_DUPLICATE_b2fe_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2678_c11_0fb8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2678_c11_0fb8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_0fb8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2678_c11_0fb8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_0fb8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_0fb8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2678_c11_0fb8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2657_l2654_l2682_l2649_l2678_l2674_l2669_DUPLICATE_6c7f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2657_l2654_l2682_l2649_l2678_l2674_l2669_DUPLICATE_6c7f_return_output := result.is_stack_write;

     -- sp_relative_shift[uxn_opcodes_h_l2664_c30_06db] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2664_c30_06db_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2664_c30_06db_ins;
     sp_relative_shift_uxn_opcodes_h_l2664_c30_06db_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2664_c30_06db_x;
     sp_relative_shift_uxn_opcodes_h_l2664_c30_06db_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2664_c30_06db_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2664_c30_06db_return_output := sp_relative_shift_uxn_opcodes_h_l2664_c30_06db_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2661_l2657_l2654_l2682_l2678_l2674_l2669_DUPLICATE_fe15 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2661_l2657_l2654_l2682_l2678_l2674_l2669_DUPLICATE_fe15_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2674_c11_c035] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2674_c11_c035_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_c035_left;
     BIN_OP_EQ_uxn_opcodes_h_l2674_c11_c035_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_c035_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_c035_return_output := BIN_OP_EQ_uxn_opcodes_h_l2674_c11_c035_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_42b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c6_79a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_0963_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c6_79a0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_0963_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c6_79a0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_0963_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c6_79a0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_0963_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c6_79a0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_0963_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c6_79a0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2649_c2_0963_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c6_79a0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2649_c2_0963_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c6_79a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_9a92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2654_c11_09b2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_9a92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2654_c11_09b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_9a92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2654_c11_09b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_9a92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2654_c11_09b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_9a92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2654_c11_09b2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2654_c7_9a92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2654_c11_09b2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2654_c7_9a92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2654_c11_09b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_c5be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2657_c11_870e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_c5be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2657_c11_870e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_c5be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2657_c11_870e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_c5be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2657_c11_870e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_c5be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2657_c11_870e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2657_c7_c5be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2657_c11_870e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2657_c7_c5be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2657_c11_870e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_824a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_e786_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_824a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_e786_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_824a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_e786_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_824a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_e786_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_824a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_e786_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_824a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_e786_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2661_c7_824a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_e786_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_7afa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_043c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_7afa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_043c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_7afa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_043c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_7afa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_043c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_7afa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_043c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1103_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_c035_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1103_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_c035_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1103_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_c035_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1103_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_c035_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_620d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_0fb8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_620d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_0fb8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_620d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_0fb8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2678_c7_620d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_0fb8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_91d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2682_c11_4112_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_91d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2682_c11_4112_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2662_c3_d46a_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2662_l2658_DUPLICATE_b2fe_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2659_c3_2046_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2662_l2658_DUPLICATE_b2fe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1103_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2676_c21_f3d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_0963_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2657_l2649_l2661_l2654_DUPLICATE_27a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_9a92_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2657_l2649_l2661_l2654_DUPLICATE_27a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_c5be_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2657_l2649_l2661_l2654_DUPLICATE_27a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_824a_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2657_l2649_l2661_l2654_DUPLICATE_27a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_9a92_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2661_l2657_l2654_l2682_l2678_l2674_l2669_DUPLICATE_fe15_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_c5be_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2661_l2657_l2654_l2682_l2678_l2674_l2669_DUPLICATE_fe15_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_824a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2661_l2657_l2654_l2682_l2678_l2674_l2669_DUPLICATE_fe15_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_7afa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2661_l2657_l2654_l2682_l2678_l2674_l2669_DUPLICATE_fe15_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1103_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2661_l2657_l2654_l2682_l2678_l2674_l2669_DUPLICATE_fe15_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_620d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2661_l2657_l2654_l2682_l2678_l2674_l2669_DUPLICATE_fe15_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_91d5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2661_l2657_l2654_l2682_l2678_l2674_l2669_DUPLICATE_fe15_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_0963_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2657_l2649_l2654_l2669_DUPLICATE_45f0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_9a92_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2657_l2649_l2654_l2669_DUPLICATE_45f0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_c5be_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2657_l2649_l2654_l2669_DUPLICATE_45f0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_7afa_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2657_l2649_l2654_l2669_DUPLICATE_45f0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_0963_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2657_l2654_l2682_l2649_l2678_l2674_l2669_DUPLICATE_6c7f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_9a92_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2657_l2654_l2682_l2649_l2678_l2674_l2669_DUPLICATE_6c7f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_c5be_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2657_l2654_l2682_l2649_l2678_l2674_l2669_DUPLICATE_6c7f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_7afa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2657_l2654_l2682_l2649_l2678_l2674_l2669_DUPLICATE_6c7f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1103_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2657_l2654_l2682_l2649_l2678_l2674_l2669_DUPLICATE_6c7f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_620d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2657_l2654_l2682_l2649_l2678_l2674_l2669_DUPLICATE_6c7f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_91d5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2657_l2654_l2682_l2649_l2678_l2674_l2669_DUPLICATE_6c7f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_c5be_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2657_l2678_DUPLICATE_56e3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_620d_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2657_l2678_DUPLICATE_56e3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2649_c2_0963_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2657_l2649_l2678_l2654_DUPLICATE_0635_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2654_c7_9a92_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2657_l2649_l2678_l2654_DUPLICATE_0635_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2657_c7_c5be_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2657_l2649_l2678_l2654_DUPLICATE_0635_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2678_c7_620d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2657_l2649_l2678_l2654_DUPLICATE_0635_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_824a_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2664_c30_06db_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2649_c1_42b2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_42b2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_42b2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_42b2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_42b2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_42b2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_42b2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_42b2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_42b2_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2662_c3_d46a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2662_c3_d46a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2662_c3_d46a_left;
     BIN_OP_OR_uxn_opcodes_h_l2662_c3_d46a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2662_c3_d46a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2662_c3_d46a_return_output := BIN_OP_OR_uxn_opcodes_h_l2662_c3_d46a_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l2680_l2672_DUPLICATE_790f LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l2680_l2672_DUPLICATE_790f_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l2672_l2680_DUPLICATE_19ca_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2661_c7_824a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_824a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_824a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_824a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_824a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_824a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_824a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_824a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_824a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2682_c7_91d5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_91d5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_91d5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_91d5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_91d5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_91d5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_91d5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_91d5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_91d5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2682_c7_91d5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_91d5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_91d5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_91d5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_91d5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_91d5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_91d5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_91d5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_91d5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2678_c7_620d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_620d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_620d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_620d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_620d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_620d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_620d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_620d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_620d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2669_c7_7afa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_7afa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_7afa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_7afa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_7afa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_7afa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_7afa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_7afa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_7afa_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2659_c3_2046] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2659_c3_2046_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2659_c3_2046_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2659_c3_2046_return_output := CONST_SL_8_uxn_opcodes_h_l2659_c3_2046_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2661_c7_824a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2662_c3_d46a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_7afa_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l2680_l2672_DUPLICATE_790f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2678_c7_620d_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l2680_l2672_DUPLICATE_790f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2657_c7_c5be_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2659_c3_2046_return_output;
     VAR_printf_uxn_opcodes_h_l2650_c3_3d73_uxn_opcodes_h_l2650_c3_3d73_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_42b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_620d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_91d5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_824a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_7afa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_620d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_91d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_c5be_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_824a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1103_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_620d_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2661_c7_824a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_824a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_824a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_824a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_824a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_824a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_824a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_824a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_824a_return_output;

     -- t16_MUX[uxn_opcodes_h_l2661_c7_824a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2661_c7_824a_cond <= VAR_t16_MUX_uxn_opcodes_h_l2661_c7_824a_cond;
     t16_MUX_uxn_opcodes_h_l2661_c7_824a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2661_c7_824a_iftrue;
     t16_MUX_uxn_opcodes_h_l2661_c7_824a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2661_c7_824a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2661_c7_824a_return_output := t16_MUX_uxn_opcodes_h_l2661_c7_824a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2678_c7_620d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2678_c7_620d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2678_c7_620d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2678_c7_620d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2678_c7_620d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2678_c7_620d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2678_c7_620d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2678_c7_620d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2678_c7_620d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2657_c7_c5be] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_c5be_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_c5be_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_c5be_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_c5be_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_c5be_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_c5be_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_c5be_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_c5be_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2678_c7_620d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_620d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_620d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_620d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_620d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_620d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_620d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_620d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_620d_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2667_c21_f4b3] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2667_c21_f4b3_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l2662_c3_d46a_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2678_c7_620d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_620d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_620d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_620d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_620d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_620d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_620d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_620d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_620d_return_output;

     -- printf_uxn_opcodes_h_l2650_c3_3d73[uxn_opcodes_h_l2650_c3_3d73] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2650_c3_3d73_uxn_opcodes_h_l2650_c3_3d73_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2650_c3_3d73_uxn_opcodes_h_l2650_c3_3d73_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2674_c7_1103] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1103_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1103_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1103_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1103_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1103_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1103_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1103_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1103_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_824a_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2667_c21_f4b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1103_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_620d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_c5be_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_824a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1103_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_620d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_9a92_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_c5be_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_7afa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1103_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1103_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2678_c7_620d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2657_c7_c5be_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2661_c7_824a_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2669_c7_7afa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_7afa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_7afa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_7afa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_7afa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_7afa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_7afa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_7afa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_7afa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2674_c7_1103] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1103_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1103_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1103_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1103_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1103_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1103_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1103_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1103_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2657_c7_c5be] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_c5be_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_c5be_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_c5be_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_c5be_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_c5be_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_c5be_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_c5be_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_c5be_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2654_c7_9a92] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_9a92_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_9a92_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_9a92_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_9a92_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_9a92_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_9a92_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_9a92_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_9a92_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2674_c7_1103] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1103_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1103_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1103_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1103_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1103_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1103_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1103_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1103_return_output;

     -- t16_MUX[uxn_opcodes_h_l2657_c7_c5be] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2657_c7_c5be_cond <= VAR_t16_MUX_uxn_opcodes_h_l2657_c7_c5be_cond;
     t16_MUX_uxn_opcodes_h_l2657_c7_c5be_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2657_c7_c5be_iftrue;
     t16_MUX_uxn_opcodes_h_l2657_c7_c5be_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2657_c7_c5be_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2657_c7_c5be_return_output := t16_MUX_uxn_opcodes_h_l2657_c7_c5be_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2674_c7_1103] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1103_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1103_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1103_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1103_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1103_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1103_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1103_return_output := result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1103_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_7afa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1103_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_9a92_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_c5be_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_7afa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1103_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_0963_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_9a92_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_824a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_7afa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_7afa_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1103_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2654_c7_9a92_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2657_c7_c5be_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2669_c7_7afa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_7afa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_7afa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_7afa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_7afa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_7afa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_7afa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_7afa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_7afa_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2649_c2_0963] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_0963_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_0963_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_0963_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_0963_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_0963_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_0963_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_0963_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_0963_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2661_c7_824a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_824a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_824a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_824a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_824a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_824a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_824a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_824a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_824a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2669_c7_7afa] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2669_c7_7afa_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_7afa_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2669_c7_7afa_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_7afa_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2669_c7_7afa_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_7afa_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_7afa_return_output := result_u8_value_MUX_uxn_opcodes_h_l2669_c7_7afa_return_output;

     -- t16_MUX[uxn_opcodes_h_l2654_c7_9a92] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2654_c7_9a92_cond <= VAR_t16_MUX_uxn_opcodes_h_l2654_c7_9a92_cond;
     t16_MUX_uxn_opcodes_h_l2654_c7_9a92_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2654_c7_9a92_iftrue;
     t16_MUX_uxn_opcodes_h_l2654_c7_9a92_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2654_c7_9a92_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2654_c7_9a92_return_output := t16_MUX_uxn_opcodes_h_l2654_c7_9a92_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2654_c7_9a92] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_9a92_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_9a92_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_9a92_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_9a92_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_9a92_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_9a92_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_9a92_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_9a92_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2669_c7_7afa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_7afa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_7afa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_7afa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_7afa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_7afa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_7afa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_7afa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_7afa_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_824a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_7afa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_0963_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_9a92_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_824a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_7afa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_c5be_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_824a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_824a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_7afa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2649_c2_0963_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2654_c7_9a92_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2657_c7_c5be] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_c5be_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_c5be_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_c5be_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_c5be_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_c5be_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_c5be_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_c5be_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_c5be_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2649_c2_0963] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_0963_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_0963_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_0963_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_0963_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_0963_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_0963_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_0963_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_0963_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2661_c7_824a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2661_c7_824a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_824a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2661_c7_824a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_824a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2661_c7_824a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_824a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_824a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2661_c7_824a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2661_c7_824a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_824a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_824a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_824a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_824a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_824a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_824a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_824a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_824a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2661_c7_824a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_824a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_824a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_824a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_824a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_824a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_824a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_824a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_824a_return_output;

     -- t16_MUX[uxn_opcodes_h_l2649_c2_0963] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2649_c2_0963_cond <= VAR_t16_MUX_uxn_opcodes_h_l2649_c2_0963_cond;
     t16_MUX_uxn_opcodes_h_l2649_c2_0963_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2649_c2_0963_iftrue;
     t16_MUX_uxn_opcodes_h_l2649_c2_0963_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2649_c2_0963_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2649_c2_0963_return_output := t16_MUX_uxn_opcodes_h_l2649_c2_0963_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_c5be_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_824a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_c5be_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_824a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_9a92_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_c5be_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2657_c7_c5be_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_824a_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2649_c2_0963_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2654_c7_9a92] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_9a92_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_9a92_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_9a92_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_9a92_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_9a92_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_9a92_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_9a92_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_9a92_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2657_c7_c5be] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_c5be_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_c5be_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_c5be_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_c5be_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_c5be_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_c5be_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_c5be_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_c5be_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2657_c7_c5be] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2657_c7_c5be_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2657_c7_c5be_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2657_c7_c5be_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2657_c7_c5be_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2657_c7_c5be_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2657_c7_c5be_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2657_c7_c5be_return_output := result_u8_value_MUX_uxn_opcodes_h_l2657_c7_c5be_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2657_c7_c5be] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_c5be_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_c5be_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_c5be_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_c5be_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_c5be_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_c5be_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_c5be_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_c5be_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_9a92_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_c5be_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_9a92_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_c5be_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_0963_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_9a92_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2654_c7_9a92_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2657_c7_c5be_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2649_c2_0963] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_0963_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_0963_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_0963_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_0963_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_0963_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_0963_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_0963_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_0963_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2654_c7_9a92] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_9a92_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_9a92_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_9a92_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_9a92_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_9a92_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_9a92_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_9a92_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_9a92_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2654_c7_9a92] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_9a92_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_9a92_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_9a92_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_9a92_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_9a92_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_9a92_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_9a92_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_9a92_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2654_c7_9a92] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2654_c7_9a92_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2654_c7_9a92_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2654_c7_9a92_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2654_c7_9a92_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2654_c7_9a92_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2654_c7_9a92_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2654_c7_9a92_return_output := result_u8_value_MUX_uxn_opcodes_h_l2654_c7_9a92_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_0963_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_9a92_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_0963_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_9a92_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2649_c2_0963_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2654_c7_9a92_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2649_c2_0963] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_0963_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_0963_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_0963_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_0963_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_0963_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_0963_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_0963_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_0963_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2649_c2_0963] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_0963_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_0963_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_0963_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_0963_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_0963_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_0963_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_0963_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_0963_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2649_c2_0963] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2649_c2_0963_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2649_c2_0963_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2649_c2_0963_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2649_c2_0963_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2649_c2_0963_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2649_c2_0963_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2649_c2_0963_return_output := result_u8_value_MUX_uxn_opcodes_h_l2649_c2_0963_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l2687_l2645_DUPLICATE_c4d0 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l2687_l2645_DUPLICATE_c4d0_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5b93(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_0963_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_0963_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_0963_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_0963_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_0963_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2649_c2_0963_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l2687_l2645_DUPLICATE_c4d0_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l2687_l2645_DUPLICATE_c4d0_return_output;
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
