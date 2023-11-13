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
-- BIN_OP_EQ[uxn_opcodes_h_l2649_c6_5307]
signal BIN_OP_EQ_uxn_opcodes_h_l2649_c6_5307_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2649_c6_5307_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2649_c6_5307_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2649_c1_9a3f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_9a3f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_9a3f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_9a3f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_9a3f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2649_c2_93d3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_93d3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_93d3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_93d3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_93d3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2649_c2_93d3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_93d3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_93d3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_93d3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_93d3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2649_c2_93d3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_93d3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_93d3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_93d3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_93d3_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2649_c2_93d3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_93d3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_93d3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_93d3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_93d3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2649_c2_93d3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_93d3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_93d3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_93d3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_93d3_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2649_c2_93d3]
signal result_u8_value_MUX_uxn_opcodes_h_l2649_c2_93d3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2649_c2_93d3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2649_c2_93d3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2649_c2_93d3_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2649_c2_93d3]
signal t16_MUX_uxn_opcodes_h_l2649_c2_93d3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2649_c2_93d3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2649_c2_93d3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2649_c2_93d3_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2650_c3_fae5[uxn_opcodes_h_l2650_c3_fae5]
signal printf_uxn_opcodes_h_l2650_c3_fae5_uxn_opcodes_h_l2650_c3_fae5_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2654_c11_18c2]
signal BIN_OP_EQ_uxn_opcodes_h_l2654_c11_18c2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2654_c11_18c2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2654_c11_18c2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2654_c7_0af1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_0af1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_0af1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_0af1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_0af1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2654_c7_0af1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_0af1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_0af1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_0af1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_0af1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2654_c7_0af1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_0af1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_0af1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_0af1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_0af1_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2654_c7_0af1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_0af1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_0af1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_0af1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_0af1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2654_c7_0af1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_0af1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_0af1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_0af1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_0af1_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2654_c7_0af1]
signal result_u8_value_MUX_uxn_opcodes_h_l2654_c7_0af1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2654_c7_0af1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2654_c7_0af1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2654_c7_0af1_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2654_c7_0af1]
signal t16_MUX_uxn_opcodes_h_l2654_c7_0af1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2654_c7_0af1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2654_c7_0af1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2654_c7_0af1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2657_c11_7bad]
signal BIN_OP_EQ_uxn_opcodes_h_l2657_c11_7bad_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2657_c11_7bad_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2657_c11_7bad_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2657_c7_d6dd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_d6dd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_d6dd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_d6dd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_d6dd_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2657_c7_d6dd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2657_c7_d6dd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_d6dd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_d6dd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_d6dd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_d6dd_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2657_c7_d6dd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_d6dd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_d6dd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_d6dd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_d6dd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2657_c7_d6dd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2657_c7_d6dd]
signal result_u8_value_MUX_uxn_opcodes_h_l2657_c7_d6dd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2657_c7_d6dd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2657_c7_d6dd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2657_c7_d6dd_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2657_c7_d6dd]
signal t16_MUX_uxn_opcodes_h_l2657_c7_d6dd_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2657_c7_d6dd_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2657_c7_d6dd_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2657_c7_d6dd_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2659_c3_4303]
signal CONST_SL_8_uxn_opcodes_h_l2659_c3_4303_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2659_c3_4303_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2661_c11_0cb8]
signal BIN_OP_EQ_uxn_opcodes_h_l2661_c11_0cb8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2661_c11_0cb8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2661_c11_0cb8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2661_c7_d37b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_d37b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_d37b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_d37b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_d37b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2661_c7_d37b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_d37b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_d37b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_d37b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_d37b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2661_c7_d37b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_d37b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_d37b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_d37b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_d37b_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2661_c7_d37b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_d37b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_d37b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_d37b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_d37b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2661_c7_d37b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_d37b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_d37b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_d37b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_d37b_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2661_c7_d37b]
signal result_u8_value_MUX_uxn_opcodes_h_l2661_c7_d37b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2661_c7_d37b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2661_c7_d37b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2661_c7_d37b_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2661_c7_d37b]
signal t16_MUX_uxn_opcodes_h_l2661_c7_d37b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2661_c7_d37b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2661_c7_d37b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2661_c7_d37b_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2662_c3_0a39]
signal BIN_OP_OR_uxn_opcodes_h_l2662_c3_0a39_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2662_c3_0a39_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2662_c3_0a39_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2664_c30_3a5c]
signal sp_relative_shift_uxn_opcodes_h_l2664_c30_3a5c_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2664_c30_3a5c_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2664_c30_3a5c_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2664_c30_3a5c_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2669_c11_960a]
signal BIN_OP_EQ_uxn_opcodes_h_l2669_c11_960a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2669_c11_960a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2669_c11_960a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2669_c7_c480]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_c480_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_c480_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_c480_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_c480_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2669_c7_c480]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_c480_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_c480_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_c480_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_c480_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2669_c7_c480]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_c480_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_c480_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_c480_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_c480_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2669_c7_c480]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_c480_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_c480_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_c480_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_c480_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2669_c7_c480]
signal result_u8_value_MUX_uxn_opcodes_h_l2669_c7_c480_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2669_c7_c480_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2669_c7_c480_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2669_c7_c480_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2674_c11_4b52]
signal BIN_OP_EQ_uxn_opcodes_h_l2674_c11_4b52_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2674_c11_4b52_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2674_c11_4b52_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2674_c7_aba0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_aba0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_aba0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_aba0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_aba0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2674_c7_aba0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_aba0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_aba0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_aba0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_aba0_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2674_c7_aba0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_aba0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_aba0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_aba0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_aba0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2674_c7_aba0]
signal result_u8_value_MUX_uxn_opcodes_h_l2674_c7_aba0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2674_c7_aba0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2674_c7_aba0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2674_c7_aba0_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2678_c11_7908]
signal BIN_OP_EQ_uxn_opcodes_h_l2678_c11_7908_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2678_c11_7908_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2678_c11_7908_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2678_c7_7f87]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_7f87_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_7f87_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_7f87_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_7f87_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2678_c7_7f87]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_7f87_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_7f87_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_7f87_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_7f87_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2678_c7_7f87]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_7f87_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_7f87_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_7f87_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_7f87_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2678_c7_7f87]
signal result_u8_value_MUX_uxn_opcodes_h_l2678_c7_7f87_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2678_c7_7f87_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2678_c7_7f87_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2678_c7_7f87_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2682_c11_a67b]
signal BIN_OP_EQ_uxn_opcodes_h_l2682_c11_a67b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2682_c11_a67b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2682_c11_a67b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2682_c7_2f17]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_2f17_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_2f17_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_2f17_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_2f17_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2682_c7_2f17]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_2f17_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_2f17_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_2f17_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_2f17_return_output : unsigned(0 downto 0);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l2672_l2680_DUPLICATE_8afa
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l2672_l2680_DUPLICATE_8afa_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l2672_l2680_DUPLICATE_8afa_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_8c29( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2649_c6_5307
BIN_OP_EQ_uxn_opcodes_h_l2649_c6_5307 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2649_c6_5307_left,
BIN_OP_EQ_uxn_opcodes_h_l2649_c6_5307_right,
BIN_OP_EQ_uxn_opcodes_h_l2649_c6_5307_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_9a3f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_9a3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_9a3f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_9a3f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_9a3f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_9a3f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_93d3
result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_93d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_93d3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_93d3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_93d3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_93d3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_93d3
result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_93d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_93d3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_93d3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_93d3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_93d3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_93d3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_93d3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_93d3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_93d3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_93d3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_93d3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_93d3
result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_93d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_93d3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_93d3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_93d3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_93d3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_93d3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_93d3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_93d3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_93d3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_93d3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_93d3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2649_c2_93d3
result_u8_value_MUX_uxn_opcodes_h_l2649_c2_93d3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2649_c2_93d3_cond,
result_u8_value_MUX_uxn_opcodes_h_l2649_c2_93d3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2649_c2_93d3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2649_c2_93d3_return_output);

-- t16_MUX_uxn_opcodes_h_l2649_c2_93d3
t16_MUX_uxn_opcodes_h_l2649_c2_93d3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2649_c2_93d3_cond,
t16_MUX_uxn_opcodes_h_l2649_c2_93d3_iftrue,
t16_MUX_uxn_opcodes_h_l2649_c2_93d3_iffalse,
t16_MUX_uxn_opcodes_h_l2649_c2_93d3_return_output);

-- printf_uxn_opcodes_h_l2650_c3_fae5_uxn_opcodes_h_l2650_c3_fae5
printf_uxn_opcodes_h_l2650_c3_fae5_uxn_opcodes_h_l2650_c3_fae5 : entity work.printf_uxn_opcodes_h_l2650_c3_fae5_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2650_c3_fae5_uxn_opcodes_h_l2650_c3_fae5_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2654_c11_18c2
BIN_OP_EQ_uxn_opcodes_h_l2654_c11_18c2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2654_c11_18c2_left,
BIN_OP_EQ_uxn_opcodes_h_l2654_c11_18c2_right,
BIN_OP_EQ_uxn_opcodes_h_l2654_c11_18c2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_0af1
result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_0af1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_0af1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_0af1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_0af1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_0af1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_0af1
result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_0af1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_0af1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_0af1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_0af1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_0af1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_0af1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_0af1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_0af1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_0af1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_0af1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_0af1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_0af1
result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_0af1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_0af1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_0af1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_0af1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_0af1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_0af1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_0af1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_0af1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_0af1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_0af1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_0af1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2654_c7_0af1
result_u8_value_MUX_uxn_opcodes_h_l2654_c7_0af1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2654_c7_0af1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2654_c7_0af1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2654_c7_0af1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2654_c7_0af1_return_output);

-- t16_MUX_uxn_opcodes_h_l2654_c7_0af1
t16_MUX_uxn_opcodes_h_l2654_c7_0af1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2654_c7_0af1_cond,
t16_MUX_uxn_opcodes_h_l2654_c7_0af1_iftrue,
t16_MUX_uxn_opcodes_h_l2654_c7_0af1_iffalse,
t16_MUX_uxn_opcodes_h_l2654_c7_0af1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2657_c11_7bad
BIN_OP_EQ_uxn_opcodes_h_l2657_c11_7bad : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2657_c11_7bad_left,
BIN_OP_EQ_uxn_opcodes_h_l2657_c11_7bad_right,
BIN_OP_EQ_uxn_opcodes_h_l2657_c11_7bad_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_d6dd
result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_d6dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_d6dd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_d6dd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_d6dd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_d6dd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd
result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_d6dd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_d6dd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_d6dd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_d6dd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_d6dd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_d6dd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_d6dd
result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_d6dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_d6dd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_d6dd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_d6dd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_d6dd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd
result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2657_c7_d6dd
result_u8_value_MUX_uxn_opcodes_h_l2657_c7_d6dd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2657_c7_d6dd_cond,
result_u8_value_MUX_uxn_opcodes_h_l2657_c7_d6dd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2657_c7_d6dd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2657_c7_d6dd_return_output);

-- t16_MUX_uxn_opcodes_h_l2657_c7_d6dd
t16_MUX_uxn_opcodes_h_l2657_c7_d6dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2657_c7_d6dd_cond,
t16_MUX_uxn_opcodes_h_l2657_c7_d6dd_iftrue,
t16_MUX_uxn_opcodes_h_l2657_c7_d6dd_iffalse,
t16_MUX_uxn_opcodes_h_l2657_c7_d6dd_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2659_c3_4303
CONST_SL_8_uxn_opcodes_h_l2659_c3_4303 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2659_c3_4303_x,
CONST_SL_8_uxn_opcodes_h_l2659_c3_4303_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2661_c11_0cb8
BIN_OP_EQ_uxn_opcodes_h_l2661_c11_0cb8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2661_c11_0cb8_left,
BIN_OP_EQ_uxn_opcodes_h_l2661_c11_0cb8_right,
BIN_OP_EQ_uxn_opcodes_h_l2661_c11_0cb8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_d37b
result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_d37b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_d37b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_d37b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_d37b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_d37b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_d37b
result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_d37b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_d37b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_d37b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_d37b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_d37b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_d37b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_d37b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_d37b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_d37b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_d37b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_d37b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_d37b
result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_d37b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_d37b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_d37b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_d37b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_d37b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_d37b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_d37b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_d37b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_d37b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_d37b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_d37b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2661_c7_d37b
result_u8_value_MUX_uxn_opcodes_h_l2661_c7_d37b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2661_c7_d37b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2661_c7_d37b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2661_c7_d37b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2661_c7_d37b_return_output);

-- t16_MUX_uxn_opcodes_h_l2661_c7_d37b
t16_MUX_uxn_opcodes_h_l2661_c7_d37b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2661_c7_d37b_cond,
t16_MUX_uxn_opcodes_h_l2661_c7_d37b_iftrue,
t16_MUX_uxn_opcodes_h_l2661_c7_d37b_iffalse,
t16_MUX_uxn_opcodes_h_l2661_c7_d37b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2662_c3_0a39
BIN_OP_OR_uxn_opcodes_h_l2662_c3_0a39 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2662_c3_0a39_left,
BIN_OP_OR_uxn_opcodes_h_l2662_c3_0a39_right,
BIN_OP_OR_uxn_opcodes_h_l2662_c3_0a39_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2664_c30_3a5c
sp_relative_shift_uxn_opcodes_h_l2664_c30_3a5c : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2664_c30_3a5c_ins,
sp_relative_shift_uxn_opcodes_h_l2664_c30_3a5c_x,
sp_relative_shift_uxn_opcodes_h_l2664_c30_3a5c_y,
sp_relative_shift_uxn_opcodes_h_l2664_c30_3a5c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2669_c11_960a
BIN_OP_EQ_uxn_opcodes_h_l2669_c11_960a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2669_c11_960a_left,
BIN_OP_EQ_uxn_opcodes_h_l2669_c11_960a_right,
BIN_OP_EQ_uxn_opcodes_h_l2669_c11_960a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_c480
result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_c480 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_c480_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_c480_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_c480_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_c480_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_c480
result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_c480 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_c480_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_c480_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_c480_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_c480_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_c480
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_c480 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_c480_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_c480_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_c480_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_c480_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_c480
result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_c480 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_c480_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_c480_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_c480_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_c480_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2669_c7_c480
result_u8_value_MUX_uxn_opcodes_h_l2669_c7_c480 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2669_c7_c480_cond,
result_u8_value_MUX_uxn_opcodes_h_l2669_c7_c480_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2669_c7_c480_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2669_c7_c480_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2674_c11_4b52
BIN_OP_EQ_uxn_opcodes_h_l2674_c11_4b52 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2674_c11_4b52_left,
BIN_OP_EQ_uxn_opcodes_h_l2674_c11_4b52_right,
BIN_OP_EQ_uxn_opcodes_h_l2674_c11_4b52_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_aba0
result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_aba0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_aba0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_aba0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_aba0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_aba0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_aba0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_aba0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_aba0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_aba0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_aba0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_aba0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_aba0
result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_aba0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_aba0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_aba0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_aba0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_aba0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2674_c7_aba0
result_u8_value_MUX_uxn_opcodes_h_l2674_c7_aba0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2674_c7_aba0_cond,
result_u8_value_MUX_uxn_opcodes_h_l2674_c7_aba0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2674_c7_aba0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2674_c7_aba0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2678_c11_7908
BIN_OP_EQ_uxn_opcodes_h_l2678_c11_7908 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2678_c11_7908_left,
BIN_OP_EQ_uxn_opcodes_h_l2678_c11_7908_right,
BIN_OP_EQ_uxn_opcodes_h_l2678_c11_7908_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_7f87
result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_7f87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_7f87_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_7f87_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_7f87_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_7f87_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_7f87
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_7f87 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_7f87_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_7f87_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_7f87_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_7f87_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_7f87
result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_7f87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_7f87_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_7f87_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_7f87_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_7f87_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2678_c7_7f87
result_u8_value_MUX_uxn_opcodes_h_l2678_c7_7f87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2678_c7_7f87_cond,
result_u8_value_MUX_uxn_opcodes_h_l2678_c7_7f87_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2678_c7_7f87_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2678_c7_7f87_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2682_c11_a67b
BIN_OP_EQ_uxn_opcodes_h_l2682_c11_a67b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2682_c11_a67b_left,
BIN_OP_EQ_uxn_opcodes_h_l2682_c11_a67b_right,
BIN_OP_EQ_uxn_opcodes_h_l2682_c11_a67b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_2f17
result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_2f17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_2f17_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_2f17_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_2f17_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_2f17_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_2f17
result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_2f17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_2f17_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_2f17_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_2f17_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_2f17_return_output);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l2672_l2680_DUPLICATE_8afa
CONST_SR_8_uint16_t_uxn_opcodes_h_l2672_l2680_DUPLICATE_8afa : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_opcodes_h_l2672_l2680_DUPLICATE_8afa_x,
CONST_SR_8_uint16_t_uxn_opcodes_h_l2672_l2680_DUPLICATE_8afa_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2649_c6_5307_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_9a3f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_93d3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_93d3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_93d3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_93d3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_93d3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2649_c2_93d3_return_output,
 t16_MUX_uxn_opcodes_h_l2649_c2_93d3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2654_c11_18c2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_0af1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_0af1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_0af1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_0af1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_0af1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2654_c7_0af1_return_output,
 t16_MUX_uxn_opcodes_h_l2654_c7_0af1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2657_c11_7bad_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_d6dd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_d6dd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_d6dd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2657_c7_d6dd_return_output,
 t16_MUX_uxn_opcodes_h_l2657_c7_d6dd_return_output,
 CONST_SL_8_uxn_opcodes_h_l2659_c3_4303_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2661_c11_0cb8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_d37b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_d37b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_d37b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_d37b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_d37b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2661_c7_d37b_return_output,
 t16_MUX_uxn_opcodes_h_l2661_c7_d37b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2662_c3_0a39_return_output,
 sp_relative_shift_uxn_opcodes_h_l2664_c30_3a5c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2669_c11_960a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_c480_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_c480_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_c480_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_c480_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2669_c7_c480_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2674_c11_4b52_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_aba0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_aba0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_aba0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2674_c7_aba0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2678_c11_7908_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_7f87_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_7f87_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_7f87_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2678_c7_7f87_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2682_c11_a67b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_2f17_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_2f17_return_output,
 CONST_SR_8_uint16_t_uxn_opcodes_h_l2672_l2680_DUPLICATE_8afa_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c6_5307_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c6_5307_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c6_5307_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_9a3f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_9a3f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_9a3f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_9a3f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_93d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_93d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_0af1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_93d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_93d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_93d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_93d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_0af1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_93d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_93d3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_93d3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2651_c3_8631 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_93d3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_0af1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_93d3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_93d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_93d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_93d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_0af1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_93d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_93d3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_93d3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_93d3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_0af1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_93d3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_93d3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2649_c2_93d3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2649_c2_93d3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2654_c7_0af1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2649_c2_93d3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2649_c2_93d3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2649_c2_93d3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2649_c2_93d3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2654_c7_0af1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2649_c2_93d3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2649_c2_93d3_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2650_c3_fae5_uxn_opcodes_h_l2650_c3_fae5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2654_c11_18c2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2654_c11_18c2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2654_c11_18c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_0af1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_0af1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_d6dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_0af1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_0af1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_0af1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_0af1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_0af1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2655_c3_0dff : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_0af1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_d6dd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_0af1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_0af1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_0af1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_d6dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_0af1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_0af1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_0af1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_0af1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2654_c7_0af1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2654_c7_0af1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2657_c7_d6dd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2654_c7_0af1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2654_c7_0af1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2654_c7_0af1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2657_c7_d6dd_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2654_c7_0af1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2657_c11_7bad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2657_c11_7bad_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2657_c11_7bad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_d6dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_d6dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_d37b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_d6dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_d37b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_d6dd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_d6dd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_d37b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_d6dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_d6dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_d6dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_d37b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_d6dd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_d37b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2657_c7_d6dd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2657_c7_d6dd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_d37b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2657_c7_d6dd_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2657_c7_d6dd_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2657_c7_d6dd_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2661_c7_d37b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2657_c7_d6dd_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2659_c3_4303_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2659_c3_4303_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_0cb8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_0cb8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_0cb8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_d37b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_d37b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_c480_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_d37b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_d37b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_d37b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_c480_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_d37b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_d37b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2666_c3_cf8d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_d37b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_c480_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_d37b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_d37b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_d37b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_c480_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_d37b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_d37b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_d37b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_d37b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_d37b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_d37b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_c480_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_d37b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2661_c7_d37b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2661_c7_d37b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2661_c7_d37b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2662_c3_0a39_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2662_c3_0a39_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2662_c3_0a39_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2664_c30_3a5c_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2664_c30_3a5c_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2664_c30_3a5c_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2664_c30_3a5c_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2667_c21_ac45_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_960a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_960a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_960a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_c480_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_c480_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_aba0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_c480_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_c480_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_c480_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_c480_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_c480_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2671_c3_f97d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_c480_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_aba0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_c480_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_c480_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_c480_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_aba0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_c480_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_c480_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_c480_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2674_c7_aba0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_c480_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_4b52_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_4b52_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_4b52_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_aba0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_aba0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_7f87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_aba0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_aba0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2675_c3_c10c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_aba0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_7f87_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_aba0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_aba0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_aba0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_7f87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_aba0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2674_c7_aba0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2674_c7_aba0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2678_c7_7f87_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2674_c7_aba0_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2676_c21_ecf1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_7908_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_7908_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_7908_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_7f87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_7f87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_2f17_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_7f87_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_7f87_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2679_c3_031c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_7f87_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_7f87_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_7f87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_7f87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_2f17_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_7f87_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2678_c7_7f87_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2678_c7_7f87_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2678_c7_7f87_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2682_c11_a67b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2682_c11_a67b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2682_c11_a67b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_2f17_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_2f17_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_2f17_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_2f17_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_2f17_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_2f17_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2657_l2649_l2654_l2669_DUPLICATE_49cc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2657_l2654_l2682_l2649_l2678_l2674_l2669_DUPLICATE_4462_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2657_l2649_l2661_l2654_DUPLICATE_f24d_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2657_l2649_l2678_l2654_DUPLICATE_ea75_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2661_l2657_l2654_l2682_l2678_l2674_l2669_DUPLICATE_b88a_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2658_l2662_DUPLICATE_142b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2657_l2678_DUPLICATE_e5b1_return_output : unsigned(3 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l2672_l2680_DUPLICATE_8afa_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l2672_l2680_DUPLICATE_8afa_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l2672_l2680_DUPLICATE_b4e9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l2687_l2645_DUPLICATE_11e5_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_2f17_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_0cb8_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2675_c3_c10c := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_aba0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2675_c3_c10c;
     VAR_sp_relative_shift_uxn_opcodes_h_l2664_c30_3a5c_y := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_93d3_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2655_c3_0dff := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_0af1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2655_c3_0dff;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_960a_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_2f17_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_4b52_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2679_c3_031c := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_7f87_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2679_c3_031c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2666_c3_cf8d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_d37b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2666_c3_cf8d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2682_c11_a67b_right := to_unsigned(7, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_c480_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_d37b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2657_c11_7bad_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2654_c11_18c2_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_7908_right := to_unsigned(6, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2664_c30_3a5c_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2671_c3_f97d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_c480_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2671_c3_f97d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2651_c3_8631 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_93d3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2651_c3_8631;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_9a3f_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c6_5307_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_d37b_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_9a3f_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2664_c30_3a5c_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c6_5307_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2654_c11_18c2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2657_c11_7bad_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_0cb8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_960a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_4b52_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_7908_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2682_c11_a67b_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2662_c3_0a39_left := t16;
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l2672_l2680_DUPLICATE_8afa_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2649_c2_93d3_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2654_c7_0af1_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2661_c7_d37b_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2654_c11_18c2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2654_c11_18c2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2654_c11_18c2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2654_c11_18c2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2654_c11_18c2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2654_c11_18c2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2654_c11_18c2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2657_l2649_l2654_l2669_DUPLICATE_49cc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2657_l2649_l2654_l2669_DUPLICATE_49cc_return_output := result.is_sp_shift;

     -- CONST_SR_8_uint16_t_uxn_opcodes_h_l2672_l2680_DUPLICATE_8afa LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_opcodes_h_l2672_l2680_DUPLICATE_8afa_x <= VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l2672_l2680_DUPLICATE_8afa_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l2672_l2680_DUPLICATE_8afa_return_output := CONST_SR_8_uint16_t_uxn_opcodes_h_l2672_l2680_DUPLICATE_8afa_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2657_l2654_l2682_l2649_l2678_l2674_l2669_DUPLICATE_4462 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2657_l2654_l2682_l2649_l2678_l2674_l2669_DUPLICATE_4462_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2661_l2657_l2654_l2682_l2678_l2674_l2669_DUPLICATE_b88a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2661_l2657_l2654_l2682_l2678_l2674_l2669_DUPLICATE_b88a_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2682_c11_a67b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2682_c11_a67b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2682_c11_a67b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2682_c11_a67b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2682_c11_a67b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2682_c11_a67b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2682_c11_a67b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2676_c21_ecf1] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2676_c21_ecf1_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2657_l2649_l2678_l2654_DUPLICATE_ea75 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2657_l2649_l2678_l2654_DUPLICATE_ea75_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2661_c11_0cb8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2661_c11_0cb8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_0cb8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2661_c11_0cb8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_0cb8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_0cb8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2661_c11_0cb8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2669_c11_960a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2669_c11_960a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_960a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2669_c11_960a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_960a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_960a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2669_c11_960a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2657_c11_7bad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2657_c11_7bad_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2657_c11_7bad_left;
     BIN_OP_EQ_uxn_opcodes_h_l2657_c11_7bad_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2657_c11_7bad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2657_c11_7bad_return_output := BIN_OP_EQ_uxn_opcodes_h_l2657_c11_7bad_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2664_c30_3a5c] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2664_c30_3a5c_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2664_c30_3a5c_ins;
     sp_relative_shift_uxn_opcodes_h_l2664_c30_3a5c_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2664_c30_3a5c_x;
     sp_relative_shift_uxn_opcodes_h_l2664_c30_3a5c_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2664_c30_3a5c_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2664_c30_3a5c_return_output := sp_relative_shift_uxn_opcodes_h_l2664_c30_3a5c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2674_c11_4b52] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2674_c11_4b52_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_4b52_left;
     BIN_OP_EQ_uxn_opcodes_h_l2674_c11_4b52_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_4b52_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_4b52_return_output := BIN_OP_EQ_uxn_opcodes_h_l2674_c11_4b52_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2658_l2662_DUPLICATE_142b LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2658_l2662_DUPLICATE_142b_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2649_c6_5307] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2649_c6_5307_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c6_5307_left;
     BIN_OP_EQ_uxn_opcodes_h_l2649_c6_5307_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c6_5307_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c6_5307_return_output := BIN_OP_EQ_uxn_opcodes_h_l2649_c6_5307_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2657_l2649_l2661_l2654_DUPLICATE_f24d LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2657_l2649_l2661_l2654_DUPLICATE_f24d_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2678_c11_7908] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2678_c11_7908_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_7908_left;
     BIN_OP_EQ_uxn_opcodes_h_l2678_c11_7908_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_7908_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_7908_return_output := BIN_OP_EQ_uxn_opcodes_h_l2678_c11_7908_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2657_l2678_DUPLICATE_e5b1 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2657_l2678_DUPLICATE_e5b1_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_9a3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c6_5307_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_93d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c6_5307_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_93d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c6_5307_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_93d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c6_5307_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_93d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c6_5307_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_93d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c6_5307_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2649_c2_93d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c6_5307_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2649_c2_93d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c6_5307_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_0af1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2654_c11_18c2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_0af1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2654_c11_18c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_0af1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2654_c11_18c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_0af1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2654_c11_18c2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_0af1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2654_c11_18c2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2654_c7_0af1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2654_c11_18c2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2654_c7_0af1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2654_c11_18c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_d6dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2657_c11_7bad_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2657_c11_7bad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_d6dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2657_c11_7bad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2657_c11_7bad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_d6dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2657_c11_7bad_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2657_c7_d6dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2657_c11_7bad_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2657_c7_d6dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2657_c11_7bad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_d37b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_0cb8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_d37b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_0cb8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_d37b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_0cb8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_d37b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_0cb8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_d37b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_0cb8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_d37b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_0cb8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2661_c7_d37b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_0cb8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_c480_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_960a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_c480_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_960a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_c480_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_960a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_c480_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_960a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_c480_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_960a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_aba0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_4b52_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_aba0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_4b52_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_aba0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_4b52_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2674_c7_aba0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_4b52_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_7f87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_7908_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_7f87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_7908_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_7f87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_7908_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2678_c7_7f87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_7908_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_2f17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2682_c11_a67b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_2f17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2682_c11_a67b_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2662_c3_0a39_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2658_l2662_DUPLICATE_142b_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2659_c3_4303_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2658_l2662_DUPLICATE_142b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2674_c7_aba0_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2676_c21_ecf1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_93d3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2657_l2649_l2661_l2654_DUPLICATE_f24d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_0af1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2657_l2649_l2661_l2654_DUPLICATE_f24d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2657_l2649_l2661_l2654_DUPLICATE_f24d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_d37b_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2657_l2649_l2661_l2654_DUPLICATE_f24d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_0af1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2661_l2657_l2654_l2682_l2678_l2674_l2669_DUPLICATE_b88a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_d6dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2661_l2657_l2654_l2682_l2678_l2674_l2669_DUPLICATE_b88a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_d37b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2661_l2657_l2654_l2682_l2678_l2674_l2669_DUPLICATE_b88a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_c480_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2661_l2657_l2654_l2682_l2678_l2674_l2669_DUPLICATE_b88a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_aba0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2661_l2657_l2654_l2682_l2678_l2674_l2669_DUPLICATE_b88a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_7f87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2661_l2657_l2654_l2682_l2678_l2674_l2669_DUPLICATE_b88a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_2f17_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2661_l2657_l2654_l2682_l2678_l2674_l2669_DUPLICATE_b88a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_93d3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2657_l2649_l2654_l2669_DUPLICATE_49cc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_0af1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2657_l2649_l2654_l2669_DUPLICATE_49cc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2657_l2649_l2654_l2669_DUPLICATE_49cc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_c480_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2657_l2649_l2654_l2669_DUPLICATE_49cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_93d3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2657_l2654_l2682_l2649_l2678_l2674_l2669_DUPLICATE_4462_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_0af1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2657_l2654_l2682_l2649_l2678_l2674_l2669_DUPLICATE_4462_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_d6dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2657_l2654_l2682_l2649_l2678_l2674_l2669_DUPLICATE_4462_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_c480_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2657_l2654_l2682_l2649_l2678_l2674_l2669_DUPLICATE_4462_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_aba0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2657_l2654_l2682_l2649_l2678_l2674_l2669_DUPLICATE_4462_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_7f87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2657_l2654_l2682_l2649_l2678_l2674_l2669_DUPLICATE_4462_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_2f17_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2657_l2654_l2682_l2649_l2678_l2674_l2669_DUPLICATE_4462_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_d6dd_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2657_l2678_DUPLICATE_e5b1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_7f87_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2657_l2678_DUPLICATE_e5b1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2649_c2_93d3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2657_l2649_l2678_l2654_DUPLICATE_ea75_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2654_c7_0af1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2657_l2649_l2678_l2654_DUPLICATE_ea75_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2657_c7_d6dd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2657_l2649_l2678_l2654_DUPLICATE_ea75_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2678_c7_7f87_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2657_l2649_l2678_l2654_DUPLICATE_ea75_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_d37b_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2664_c30_3a5c_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2662_c3_0a39] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2662_c3_0a39_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2662_c3_0a39_left;
     BIN_OP_OR_uxn_opcodes_h_l2662_c3_0a39_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2662_c3_0a39_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2662_c3_0a39_return_output := BIN_OP_OR_uxn_opcodes_h_l2662_c3_0a39_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2649_c1_9a3f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_9a3f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_9a3f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_9a3f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_9a3f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_9a3f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_9a3f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_9a3f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_9a3f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2678_c7_7f87] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_7f87_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_7f87_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_7f87_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_7f87_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_7f87_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_7f87_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_7f87_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_7f87_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l2672_l2680_DUPLICATE_b4e9 LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l2672_l2680_DUPLICATE_b4e9_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l2672_l2680_DUPLICATE_8afa_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2669_c7_c480] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_c480_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_c480_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_c480_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_c480_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_c480_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_c480_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_c480_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_c480_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2682_c7_2f17] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_2f17_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_2f17_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_2f17_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_2f17_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_2f17_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_2f17_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_2f17_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_2f17_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2659_c3_4303] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2659_c3_4303_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2659_c3_4303_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2659_c3_4303_return_output := CONST_SL_8_uxn_opcodes_h_l2659_c3_4303_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2682_c7_2f17] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_2f17_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_2f17_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_2f17_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_2f17_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_2f17_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_2f17_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_2f17_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_2f17_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2661_c7_d37b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_d37b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_d37b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_d37b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_d37b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_d37b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_d37b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_d37b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_d37b_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2661_c7_d37b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2662_c3_0a39_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_c480_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l2672_l2680_DUPLICATE_b4e9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2678_c7_7f87_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l2672_l2680_DUPLICATE_b4e9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2657_c7_d6dd_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2659_c3_4303_return_output;
     VAR_printf_uxn_opcodes_h_l2650_c3_fae5_uxn_opcodes_h_l2650_c3_fae5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2649_c1_9a3f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_7f87_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_2f17_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_d37b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_c480_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_7f87_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_2f17_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_d37b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_aba0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_7f87_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2678_c7_7f87] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_7f87_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_7f87_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_7f87_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_7f87_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_7f87_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_7f87_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_7f87_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_7f87_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2674_c7_aba0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_aba0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_aba0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_aba0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_aba0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_aba0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_aba0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_aba0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_aba0_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2667_c21_ac45] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2667_c21_ac45_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l2662_c3_0a39_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2678_c7_7f87] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_7f87_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_7f87_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_7f87_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_7f87_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_7f87_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_7f87_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_7f87_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_7f87_return_output;

     -- t16_MUX[uxn_opcodes_h_l2661_c7_d37b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2661_c7_d37b_cond <= VAR_t16_MUX_uxn_opcodes_h_l2661_c7_d37b_cond;
     t16_MUX_uxn_opcodes_h_l2661_c7_d37b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2661_c7_d37b_iftrue;
     t16_MUX_uxn_opcodes_h_l2661_c7_d37b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2661_c7_d37b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2661_c7_d37b_return_output := t16_MUX_uxn_opcodes_h_l2661_c7_d37b_return_output;

     -- printf_uxn_opcodes_h_l2650_c3_fae5[uxn_opcodes_h_l2650_c3_fae5] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2650_c3_fae5_uxn_opcodes_h_l2650_c3_fae5_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2650_c3_fae5_uxn_opcodes_h_l2650_c3_fae5_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2657_c7_d6dd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2678_c7_7f87] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2678_c7_7f87_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2678_c7_7f87_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2678_c7_7f87_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2678_c7_7f87_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2678_c7_7f87_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2678_c7_7f87_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2678_c7_7f87_return_output := result_u8_value_MUX_uxn_opcodes_h_l2678_c7_7f87_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2661_c7_d37b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_d37b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_d37b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_d37b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_d37b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_d37b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_d37b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_d37b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_d37b_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_d37b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2667_c21_ac45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_aba0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_7f87_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_d37b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_aba0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_7f87_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_0af1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_c480_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_aba0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2674_c7_aba0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2678_c7_7f87_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2657_c7_d6dd_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2661_c7_d37b_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2674_c7_aba0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_aba0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_aba0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_aba0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_aba0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_aba0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_aba0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_aba0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_aba0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2674_c7_aba0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_aba0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_aba0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_aba0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_aba0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_aba0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_aba0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_aba0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_aba0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2674_c7_aba0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2674_c7_aba0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2674_c7_aba0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2674_c7_aba0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2674_c7_aba0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2674_c7_aba0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2674_c7_aba0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2674_c7_aba0_return_output := result_u8_value_MUX_uxn_opcodes_h_l2674_c7_aba0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2657_c7_d6dd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd_return_output;

     -- t16_MUX[uxn_opcodes_h_l2657_c7_d6dd] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2657_c7_d6dd_cond <= VAR_t16_MUX_uxn_opcodes_h_l2657_c7_d6dd_cond;
     t16_MUX_uxn_opcodes_h_l2657_c7_d6dd_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2657_c7_d6dd_iftrue;
     t16_MUX_uxn_opcodes_h_l2657_c7_d6dd_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2657_c7_d6dd_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2657_c7_d6dd_return_output := t16_MUX_uxn_opcodes_h_l2657_c7_d6dd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2654_c7_0af1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_0af1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_0af1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_0af1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_0af1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_0af1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_0af1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_0af1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_0af1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2669_c7_c480] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_c480_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_c480_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_c480_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_c480_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_c480_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_c480_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_c480_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_c480_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_c480_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_aba0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_0af1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_d6dd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_c480_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_aba0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_93d3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_0af1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_d37b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_c480_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_c480_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2674_c7_aba0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2654_c7_0af1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2657_c7_d6dd_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2661_c7_d37b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_d37b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_d37b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_d37b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_d37b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_d37b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_d37b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_d37b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_d37b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2669_c7_c480] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2669_c7_c480_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_c480_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2669_c7_c480_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_c480_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2669_c7_c480_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_c480_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_c480_return_output := result_u8_value_MUX_uxn_opcodes_h_l2669_c7_c480_return_output;

     -- t16_MUX[uxn_opcodes_h_l2654_c7_0af1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2654_c7_0af1_cond <= VAR_t16_MUX_uxn_opcodes_h_l2654_c7_0af1_cond;
     t16_MUX_uxn_opcodes_h_l2654_c7_0af1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2654_c7_0af1_iftrue;
     t16_MUX_uxn_opcodes_h_l2654_c7_0af1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2654_c7_0af1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2654_c7_0af1_return_output := t16_MUX_uxn_opcodes_h_l2654_c7_0af1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2654_c7_0af1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_0af1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_0af1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_0af1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_0af1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_0af1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_0af1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_0af1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_0af1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2669_c7_c480] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_c480_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_c480_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_c480_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_c480_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_c480_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_c480_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_c480_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_c480_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2649_c2_93d3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_93d3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_93d3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_93d3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_93d3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_93d3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_93d3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_93d3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_93d3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2669_c7_c480] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_c480_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_c480_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_c480_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_c480_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_c480_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_c480_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_c480_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_c480_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_d37b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_c480_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_93d3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_0af1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_d37b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_c480_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_d6dd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_d37b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_d37b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_c480_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2649_c2_93d3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2654_c7_0af1_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2661_c7_d37b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_d37b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_d37b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_d37b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_d37b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_d37b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_d37b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_d37b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_d37b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2649_c2_93d3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_93d3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_93d3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_93d3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_93d3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_93d3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_93d3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_93d3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_93d3_return_output;

     -- t16_MUX[uxn_opcodes_h_l2649_c2_93d3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2649_c2_93d3_cond <= VAR_t16_MUX_uxn_opcodes_h_l2649_c2_93d3_cond;
     t16_MUX_uxn_opcodes_h_l2649_c2_93d3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2649_c2_93d3_iftrue;
     t16_MUX_uxn_opcodes_h_l2649_c2_93d3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2649_c2_93d3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2649_c2_93d3_return_output := t16_MUX_uxn_opcodes_h_l2649_c2_93d3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2661_c7_d37b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_d37b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_d37b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_d37b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_d37b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_d37b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_d37b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_d37b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_d37b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2661_c7_d37b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2661_c7_d37b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_d37b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2661_c7_d37b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_d37b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2661_c7_d37b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_d37b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_d37b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2661_c7_d37b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2657_c7_d6dd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_d6dd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_d6dd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_d6dd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_d6dd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_d6dd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_d6dd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_d6dd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_d6dd_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_d6dd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_d37b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_d6dd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_d37b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_0af1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2657_c7_d6dd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2657_c7_d6dd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_d37b_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2649_c2_93d3_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2657_c7_d6dd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_d6dd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_d6dd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_d6dd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_d6dd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_d6dd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_d6dd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_d6dd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_d6dd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2654_c7_0af1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_0af1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_0af1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_0af1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_0af1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_0af1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_0af1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_0af1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_0af1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2657_c7_d6dd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_d6dd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_d6dd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_d6dd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_d6dd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_d6dd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_d6dd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_d6dd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_d6dd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2657_c7_d6dd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2657_c7_d6dd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2657_c7_d6dd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2657_c7_d6dd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2657_c7_d6dd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2657_c7_d6dd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2657_c7_d6dd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2657_c7_d6dd_return_output := result_u8_value_MUX_uxn_opcodes_h_l2657_c7_d6dd_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_0af1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_d6dd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_0af1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2657_c7_d6dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_93d3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_0af1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2654_c7_0af1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2657_c7_d6dd_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2654_c7_0af1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_0af1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_0af1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_0af1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_0af1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_0af1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_0af1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_0af1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_0af1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2654_c7_0af1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2654_c7_0af1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2654_c7_0af1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2654_c7_0af1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2654_c7_0af1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2654_c7_0af1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2654_c7_0af1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2654_c7_0af1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2654_c7_0af1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2649_c2_93d3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_93d3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_93d3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_93d3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_93d3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_93d3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_93d3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_93d3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_93d3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2654_c7_0af1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_0af1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_0af1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_0af1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_0af1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_0af1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_0af1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_0af1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_0af1_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_93d3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_0af1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_93d3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_0af1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2649_c2_93d3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2654_c7_0af1_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2649_c2_93d3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2649_c2_93d3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2649_c2_93d3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2649_c2_93d3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2649_c2_93d3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2649_c2_93d3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2649_c2_93d3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2649_c2_93d3_return_output := result_u8_value_MUX_uxn_opcodes_h_l2649_c2_93d3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2649_c2_93d3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_93d3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_93d3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_93d3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_93d3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_93d3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_93d3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_93d3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_93d3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2649_c2_93d3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_93d3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_93d3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_93d3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_93d3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_93d3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_93d3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_93d3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_93d3_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l2687_l2645_DUPLICATE_11e5 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l2687_l2645_DUPLICATE_11e5_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8c29(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c2_93d3_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c2_93d3_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c2_93d3_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c2_93d3_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c2_93d3_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2649_c2_93d3_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l2687_l2645_DUPLICATE_11e5_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l2687_l2645_DUPLICATE_11e5_return_output;
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
