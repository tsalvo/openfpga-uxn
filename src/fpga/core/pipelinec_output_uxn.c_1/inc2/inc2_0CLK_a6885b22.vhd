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
-- Submodules: 56
entity inc2_0CLK_a6885b22 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end inc2_0CLK_a6885b22;
architecture arch of inc2_0CLK_a6885b22 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1291_c6_4307]
signal BIN_OP_EQ_uxn_opcodes_h_l1291_c6_4307_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1291_c6_4307_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1291_c6_4307_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1291_c1_6efe]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_6efe_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_6efe_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_6efe_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_6efe_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1291_c2_3b19]
signal result_u8_value_MUX_uxn_opcodes_h_l1291_c2_3b19_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1291_c2_3b19_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1291_c2_3b19_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1291_c2_3b19]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_3b19_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_3b19_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_3b19_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1291_c2_3b19]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_3b19_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_3b19_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_3b19_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1291_c2_3b19]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_3b19_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_3b19_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_3b19_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1291_c2_3b19]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_3b19_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_3b19_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_3b19_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1291_c2_3b19]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_3b19_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_3b19_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_3b19_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1291_c2_3b19]
signal t16_MUX_uxn_opcodes_h_l1291_c2_3b19_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1291_c2_3b19_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1291_c2_3b19_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1291_c2_3b19]
signal tmp16_MUX_uxn_opcodes_h_l1291_c2_3b19_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1291_c2_3b19_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1291_c2_3b19_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1292_c3_e7bb[uxn_opcodes_h_l1292_c3_e7bb]
signal printf_uxn_opcodes_h_l1292_c3_e7bb_uxn_opcodes_h_l1292_c3_e7bb_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1296_c11_e0de]
signal BIN_OP_EQ_uxn_opcodes_h_l1296_c11_e0de_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1296_c11_e0de_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1296_c11_e0de_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1296_c7_df91]
signal result_u8_value_MUX_uxn_opcodes_h_l1296_c7_df91_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1296_c7_df91_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1296_c7_df91_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1296_c7_df91_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1296_c7_df91]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_df91_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_df91_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_df91_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_df91_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1296_c7_df91]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_df91_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_df91_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_df91_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_df91_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1296_c7_df91]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_df91_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_df91_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_df91_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_df91_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1296_c7_df91]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_df91_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_df91_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_df91_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_df91_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1296_c7_df91]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_df91_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_df91_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_df91_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_df91_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1296_c7_df91]
signal t16_MUX_uxn_opcodes_h_l1296_c7_df91_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1296_c7_df91_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1296_c7_df91_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1296_c7_df91_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1296_c7_df91]
signal tmp16_MUX_uxn_opcodes_h_l1296_c7_df91_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1296_c7_df91_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1296_c7_df91_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1296_c7_df91_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1299_c11_f8f8]
signal BIN_OP_EQ_uxn_opcodes_h_l1299_c11_f8f8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1299_c11_f8f8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1299_c11_f8f8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1299_c7_09b7]
signal result_u8_value_MUX_uxn_opcodes_h_l1299_c7_09b7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1299_c7_09b7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1299_c7_09b7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1299_c7_09b7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_09b7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_09b7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_09b7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1299_c7_09b7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_09b7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_09b7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_09b7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1299_c7_09b7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_09b7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_09b7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_09b7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1299_c7_09b7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_09b7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_09b7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_09b7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1299_c7_09b7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_09b7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_09b7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_09b7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1299_c7_09b7]
signal t16_MUX_uxn_opcodes_h_l1299_c7_09b7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1299_c7_09b7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1299_c7_09b7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1299_c7_09b7]
signal tmp16_MUX_uxn_opcodes_h_l1299_c7_09b7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1299_c7_09b7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1299_c7_09b7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1301_c3_1cb5]
signal CONST_SL_8_uxn_opcodes_h_l1301_c3_1cb5_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1301_c3_1cb5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1303_c11_0c3e]
signal BIN_OP_EQ_uxn_opcodes_h_l1303_c11_0c3e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1303_c11_0c3e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1303_c11_0c3e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1303_c7_2121]
signal result_u8_value_MUX_uxn_opcodes_h_l1303_c7_2121_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1303_c7_2121_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1303_c7_2121_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1303_c7_2121_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1303_c7_2121]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2121_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2121_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2121_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2121_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1303_c7_2121]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2121_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2121_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2121_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2121_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1303_c7_2121]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2121_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2121_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2121_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2121_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1303_c7_2121]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2121_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2121_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2121_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2121_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1303_c7_2121]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2121_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2121_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2121_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2121_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1303_c7_2121]
signal t16_MUX_uxn_opcodes_h_l1303_c7_2121_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1303_c7_2121_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1303_c7_2121_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1303_c7_2121_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1303_c7_2121]
signal tmp16_MUX_uxn_opcodes_h_l1303_c7_2121_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1303_c7_2121_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1303_c7_2121_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1303_c7_2121_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1304_c3_f654]
signal BIN_OP_OR_uxn_opcodes_h_l1304_c3_f654_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1304_c3_f654_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1304_c3_f654_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1305_c11_a07b]
signal BIN_OP_PLUS_uxn_opcodes_h_l1305_c11_a07b_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1305_c11_a07b_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1305_c11_a07b_return_output : unsigned(16 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1307_c30_cf7f]
signal sp_relative_shift_uxn_opcodes_h_l1307_c30_cf7f_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1307_c30_cf7f_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1307_c30_cf7f_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1307_c30_cf7f_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1312_c11_2fd3]
signal BIN_OP_EQ_uxn_opcodes_h_l1312_c11_2fd3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1312_c11_2fd3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1312_c11_2fd3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1312_c7_50c8]
signal result_u8_value_MUX_uxn_opcodes_h_l1312_c7_50c8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1312_c7_50c8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1312_c7_50c8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1312_c7_50c8_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1312_c7_50c8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_50c8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_50c8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_50c8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_50c8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1312_c7_50c8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_50c8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_50c8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_50c8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_50c8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1312_c7_50c8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_50c8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_50c8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_50c8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_50c8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1312_c7_50c8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_50c8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_50c8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_50c8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_50c8_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1315_c31_9c23]
signal CONST_SR_8_uxn_opcodes_h_l1315_c31_9c23_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1315_c31_9c23_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1317_c11_e522]
signal BIN_OP_EQ_uxn_opcodes_h_l1317_c11_e522_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1317_c11_e522_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1317_c11_e522_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1317_c7_8831]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_8831_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_8831_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_8831_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_8831_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1317_c7_8831]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_8831_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_8831_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_8831_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_8831_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1291_c6_4307
BIN_OP_EQ_uxn_opcodes_h_l1291_c6_4307 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1291_c6_4307_left,
BIN_OP_EQ_uxn_opcodes_h_l1291_c6_4307_right,
BIN_OP_EQ_uxn_opcodes_h_l1291_c6_4307_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_6efe
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_6efe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_6efe_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_6efe_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_6efe_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_6efe_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1291_c2_3b19
result_u8_value_MUX_uxn_opcodes_h_l1291_c2_3b19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1291_c2_3b19_cond,
result_u8_value_MUX_uxn_opcodes_h_l1291_c2_3b19_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1291_c2_3b19_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_3b19
result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_3b19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_3b19_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_3b19_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_3b19_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_3b19
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_3b19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_3b19_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_3b19_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_3b19_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_3b19
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_3b19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_3b19_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_3b19_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_3b19_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_3b19
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_3b19 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_3b19_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_3b19_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_3b19_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_3b19
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_3b19 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_3b19_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_3b19_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_3b19_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output);

-- t16_MUX_uxn_opcodes_h_l1291_c2_3b19
t16_MUX_uxn_opcodes_h_l1291_c2_3b19 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1291_c2_3b19_cond,
t16_MUX_uxn_opcodes_h_l1291_c2_3b19_iftrue,
t16_MUX_uxn_opcodes_h_l1291_c2_3b19_iffalse,
t16_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1291_c2_3b19
tmp16_MUX_uxn_opcodes_h_l1291_c2_3b19 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1291_c2_3b19_cond,
tmp16_MUX_uxn_opcodes_h_l1291_c2_3b19_iftrue,
tmp16_MUX_uxn_opcodes_h_l1291_c2_3b19_iffalse,
tmp16_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output);

-- printf_uxn_opcodes_h_l1292_c3_e7bb_uxn_opcodes_h_l1292_c3_e7bb
printf_uxn_opcodes_h_l1292_c3_e7bb_uxn_opcodes_h_l1292_c3_e7bb : entity work.printf_uxn_opcodes_h_l1292_c3_e7bb_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1292_c3_e7bb_uxn_opcodes_h_l1292_c3_e7bb_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1296_c11_e0de
BIN_OP_EQ_uxn_opcodes_h_l1296_c11_e0de : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1296_c11_e0de_left,
BIN_OP_EQ_uxn_opcodes_h_l1296_c11_e0de_right,
BIN_OP_EQ_uxn_opcodes_h_l1296_c11_e0de_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1296_c7_df91
result_u8_value_MUX_uxn_opcodes_h_l1296_c7_df91 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1296_c7_df91_cond,
result_u8_value_MUX_uxn_opcodes_h_l1296_c7_df91_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1296_c7_df91_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1296_c7_df91_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_df91
result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_df91 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_df91_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_df91_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_df91_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_df91_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_df91
result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_df91 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_df91_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_df91_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_df91_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_df91_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_df91
result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_df91 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_df91_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_df91_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_df91_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_df91_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_df91
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_df91 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_df91_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_df91_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_df91_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_df91_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_df91
result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_df91 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_df91_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_df91_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_df91_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_df91_return_output);

-- t16_MUX_uxn_opcodes_h_l1296_c7_df91
t16_MUX_uxn_opcodes_h_l1296_c7_df91 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1296_c7_df91_cond,
t16_MUX_uxn_opcodes_h_l1296_c7_df91_iftrue,
t16_MUX_uxn_opcodes_h_l1296_c7_df91_iffalse,
t16_MUX_uxn_opcodes_h_l1296_c7_df91_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1296_c7_df91
tmp16_MUX_uxn_opcodes_h_l1296_c7_df91 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1296_c7_df91_cond,
tmp16_MUX_uxn_opcodes_h_l1296_c7_df91_iftrue,
tmp16_MUX_uxn_opcodes_h_l1296_c7_df91_iffalse,
tmp16_MUX_uxn_opcodes_h_l1296_c7_df91_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1299_c11_f8f8
BIN_OP_EQ_uxn_opcodes_h_l1299_c11_f8f8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1299_c11_f8f8_left,
BIN_OP_EQ_uxn_opcodes_h_l1299_c11_f8f8_right,
BIN_OP_EQ_uxn_opcodes_h_l1299_c11_f8f8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1299_c7_09b7
result_u8_value_MUX_uxn_opcodes_h_l1299_c7_09b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1299_c7_09b7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1299_c7_09b7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1299_c7_09b7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_09b7
result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_09b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_09b7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_09b7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_09b7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_09b7
result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_09b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_09b7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_09b7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_09b7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_09b7
result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_09b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_09b7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_09b7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_09b7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_09b7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_09b7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_09b7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_09b7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_09b7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_09b7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_09b7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_09b7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_09b7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_09b7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output);

-- t16_MUX_uxn_opcodes_h_l1299_c7_09b7
t16_MUX_uxn_opcodes_h_l1299_c7_09b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1299_c7_09b7_cond,
t16_MUX_uxn_opcodes_h_l1299_c7_09b7_iftrue,
t16_MUX_uxn_opcodes_h_l1299_c7_09b7_iffalse,
t16_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1299_c7_09b7
tmp16_MUX_uxn_opcodes_h_l1299_c7_09b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1299_c7_09b7_cond,
tmp16_MUX_uxn_opcodes_h_l1299_c7_09b7_iftrue,
tmp16_MUX_uxn_opcodes_h_l1299_c7_09b7_iffalse,
tmp16_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1301_c3_1cb5
CONST_SL_8_uxn_opcodes_h_l1301_c3_1cb5 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1301_c3_1cb5_x,
CONST_SL_8_uxn_opcodes_h_l1301_c3_1cb5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1303_c11_0c3e
BIN_OP_EQ_uxn_opcodes_h_l1303_c11_0c3e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1303_c11_0c3e_left,
BIN_OP_EQ_uxn_opcodes_h_l1303_c11_0c3e_right,
BIN_OP_EQ_uxn_opcodes_h_l1303_c11_0c3e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1303_c7_2121
result_u8_value_MUX_uxn_opcodes_h_l1303_c7_2121 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1303_c7_2121_cond,
result_u8_value_MUX_uxn_opcodes_h_l1303_c7_2121_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1303_c7_2121_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1303_c7_2121_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2121
result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2121 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2121_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2121_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2121_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2121_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2121
result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2121 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2121_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2121_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2121_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2121_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2121
result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2121 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2121_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2121_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2121_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2121_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2121
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2121 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2121_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2121_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2121_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2121_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2121
result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2121 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2121_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2121_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2121_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2121_return_output);

-- t16_MUX_uxn_opcodes_h_l1303_c7_2121
t16_MUX_uxn_opcodes_h_l1303_c7_2121 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1303_c7_2121_cond,
t16_MUX_uxn_opcodes_h_l1303_c7_2121_iftrue,
t16_MUX_uxn_opcodes_h_l1303_c7_2121_iffalse,
t16_MUX_uxn_opcodes_h_l1303_c7_2121_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1303_c7_2121
tmp16_MUX_uxn_opcodes_h_l1303_c7_2121 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1303_c7_2121_cond,
tmp16_MUX_uxn_opcodes_h_l1303_c7_2121_iftrue,
tmp16_MUX_uxn_opcodes_h_l1303_c7_2121_iffalse,
tmp16_MUX_uxn_opcodes_h_l1303_c7_2121_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1304_c3_f654
BIN_OP_OR_uxn_opcodes_h_l1304_c3_f654 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1304_c3_f654_left,
BIN_OP_OR_uxn_opcodes_h_l1304_c3_f654_right,
BIN_OP_OR_uxn_opcodes_h_l1304_c3_f654_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1305_c11_a07b
BIN_OP_PLUS_uxn_opcodes_h_l1305_c11_a07b : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1305_c11_a07b_left,
BIN_OP_PLUS_uxn_opcodes_h_l1305_c11_a07b_right,
BIN_OP_PLUS_uxn_opcodes_h_l1305_c11_a07b_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1307_c30_cf7f
sp_relative_shift_uxn_opcodes_h_l1307_c30_cf7f : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1307_c30_cf7f_ins,
sp_relative_shift_uxn_opcodes_h_l1307_c30_cf7f_x,
sp_relative_shift_uxn_opcodes_h_l1307_c30_cf7f_y,
sp_relative_shift_uxn_opcodes_h_l1307_c30_cf7f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1312_c11_2fd3
BIN_OP_EQ_uxn_opcodes_h_l1312_c11_2fd3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1312_c11_2fd3_left,
BIN_OP_EQ_uxn_opcodes_h_l1312_c11_2fd3_right,
BIN_OP_EQ_uxn_opcodes_h_l1312_c11_2fd3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1312_c7_50c8
result_u8_value_MUX_uxn_opcodes_h_l1312_c7_50c8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1312_c7_50c8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1312_c7_50c8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1312_c7_50c8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1312_c7_50c8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_50c8
result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_50c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_50c8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_50c8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_50c8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_50c8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_50c8
result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_50c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_50c8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_50c8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_50c8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_50c8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_50c8
result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_50c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_50c8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_50c8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_50c8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_50c8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_50c8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_50c8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_50c8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_50c8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_50c8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_50c8_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1315_c31_9c23
CONST_SR_8_uxn_opcodes_h_l1315_c31_9c23 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1315_c31_9c23_x,
CONST_SR_8_uxn_opcodes_h_l1315_c31_9c23_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1317_c11_e522
BIN_OP_EQ_uxn_opcodes_h_l1317_c11_e522 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1317_c11_e522_left,
BIN_OP_EQ_uxn_opcodes_h_l1317_c11_e522_right,
BIN_OP_EQ_uxn_opcodes_h_l1317_c11_e522_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_8831
result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_8831 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_8831_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_8831_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_8831_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_8831_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_8831
result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_8831 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_8831_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_8831_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_8831_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_8831_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1291_c6_4307_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_6efe_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output,
 t16_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output,
 tmp16_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1296_c11_e0de_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1296_c7_df91_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_df91_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_df91_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_df91_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_df91_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_df91_return_output,
 t16_MUX_uxn_opcodes_h_l1296_c7_df91_return_output,
 tmp16_MUX_uxn_opcodes_h_l1296_c7_df91_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1299_c11_f8f8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output,
 t16_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output,
 tmp16_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output,
 CONST_SL_8_uxn_opcodes_h_l1301_c3_1cb5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1303_c11_0c3e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1303_c7_2121_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2121_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2121_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2121_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2121_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2121_return_output,
 t16_MUX_uxn_opcodes_h_l1303_c7_2121_return_output,
 tmp16_MUX_uxn_opcodes_h_l1303_c7_2121_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1304_c3_f654_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1305_c11_a07b_return_output,
 sp_relative_shift_uxn_opcodes_h_l1307_c30_cf7f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1312_c11_2fd3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1312_c7_50c8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_50c8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_50c8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_50c8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_50c8_return_output,
 CONST_SR_8_uxn_opcodes_h_l1315_c31_9c23_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1317_c11_e522_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_8831_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_8831_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c6_4307_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c6_4307_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c6_4307_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_6efe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_6efe_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_6efe_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_6efe_iffalse : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c2_3b19_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c2_3b19_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1296_c7_df91_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c2_3b19_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_3b19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_3b19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_df91_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_3b19_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_3b19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_3b19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_df91_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_3b19_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_3b19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_3b19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_df91_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_3b19_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_3b19_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1293_c3_515a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_3b19_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_df91_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_3b19_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_3b19_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_3b19_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_df91_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_3b19_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1291_c2_3b19_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1291_c2_3b19_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1296_c7_df91_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1291_c2_3b19_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1291_c2_3b19_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1291_c2_3b19_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1296_c7_df91_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1291_c2_3b19_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1292_c3_e7bb_uxn_opcodes_h_l1292_c3_e7bb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_e0de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_e0de_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_e0de_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1296_c7_df91_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1296_c7_df91_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1296_c7_df91_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_df91_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_df91_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_df91_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_df91_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_df91_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_df91_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_df91_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_df91_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_df91_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_df91_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1297_c3_a37a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_df91_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_df91_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_df91_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_df91_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_df91_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1296_c7_df91_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1296_c7_df91_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1296_c7_df91_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1296_c7_df91_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1296_c7_df91_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1296_c7_df91_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_f8f8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_f8f8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_f8f8_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_09b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_09b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_2121_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_09b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_09b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_09b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2121_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_09b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_09b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_09b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2121_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_09b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_09b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_09b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2121_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_09b7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_09b7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_09b7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2121_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_09b7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_09b7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_09b7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2121_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_09b7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1299_c7_09b7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1299_c7_09b7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1303_c7_2121_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1299_c7_09b7_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1299_c7_09b7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1299_c7_09b7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1303_c7_2121_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1299_c7_09b7_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1301_c3_1cb5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1301_c3_1cb5_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_0c3e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_0c3e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_0c3e_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_2121_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_2121_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1312_c7_50c8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_2121_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2121_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2121_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_50c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2121_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2121_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2121_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_50c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2121_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2121_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2121_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_50c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2121_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2121_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1309_c3_6398 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2121_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_50c8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2121_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2121_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2121_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2121_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1303_c7_2121_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1303_c7_2121_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1303_c7_2121_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1303_c7_2121_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l1305_c3_4e3e : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1303_c7_2121_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1303_c7_2121_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1304_c3_f654_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1304_c3_f654_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1304_c3_f654_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1305_c11_a07b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1305_c11_a07b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1305_c11_a07b_return_output : unsigned(16 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1307_c30_cf7f_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1307_c30_cf7f_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1307_c30_cf7f_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1307_c30_cf7f_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1310_c21_c2f5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c11_2fd3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c11_2fd3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c11_2fd3_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1312_c7_50c8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1312_c7_50c8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1312_c7_50c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_50c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_50c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_50c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_50c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_50c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_8831_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_50c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_50c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_50c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_8831_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_50c8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_50c8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1314_c3_e45e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_50c8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_50c8_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1315_c31_9c23_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1315_c31_9c23_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1315_c21_a814_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_e522_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_e522_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_e522_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_8831_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_8831_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_8831_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_8831_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_8831_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_8831_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1296_l1312_l1299_l1291_DUPLICATE_b8fc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1296_l1312_l1299_l1291_DUPLICATE_123a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1312_l1299_l1296_l1291_l1317_DUPLICATE_fed6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1296_l1299_l1291_l1303_DUPLICATE_3bd1_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1312_l1303_l1299_l1296_l1317_DUPLICATE_9350_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1304_l1300_DUPLICATE_43a6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1312_l1299_DUPLICATE_f1c0_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l1287_l1322_DUPLICATE_991f_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_f8f8_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1297_c3_a37a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_df91_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1297_c3_a37a;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_3b19_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1293_c3_515a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_3b19_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1293_c3_515a;
     VAR_sp_relative_shift_uxn_opcodes_h_l1307_c30_cf7f_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1309_c3_6398 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2121_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1309_c3_6398;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_8831_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_0c3e_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_e0de_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2121_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1314_c3_e45e := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_50c8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1314_c3_e45e;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_6efe_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_50c8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1305_c11_a07b_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c6_4307_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_e522_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_8831_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c11_2fd3_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2121_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1307_c30_cf7f_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_6efe_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1307_c30_cf7f_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c6_4307_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_e0de_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_f8f8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_0c3e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c11_2fd3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_e522_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1304_c3_f654_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1291_c2_3b19_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1296_c7_df91_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1303_c7_2121_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1315_c31_9c23_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1291_c2_3b19_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1296_c7_df91_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1299_c7_09b7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1303_c7_2121_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1291_c6_4307] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1291_c6_4307_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c6_4307_left;
     BIN_OP_EQ_uxn_opcodes_h_l1291_c6_4307_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c6_4307_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c6_4307_return_output := BIN_OP_EQ_uxn_opcodes_h_l1291_c6_4307_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1299_c11_f8f8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1299_c11_f8f8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_f8f8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1299_c11_f8f8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_f8f8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_f8f8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1299_c11_f8f8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1317_c11_e522] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1317_c11_e522_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_e522_left;
     BIN_OP_EQ_uxn_opcodes_h_l1317_c11_e522_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_e522_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_e522_return_output := BIN_OP_EQ_uxn_opcodes_h_l1317_c11_e522_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1304_l1300_DUPLICATE_43a6 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1304_l1300_DUPLICATE_43a6_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_SR_8[uxn_opcodes_h_l1315_c31_9c23] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1315_c31_9c23_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1315_c31_9c23_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1315_c31_9c23_return_output := CONST_SR_8_uxn_opcodes_h_l1315_c31_9c23_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1312_l1299_DUPLICATE_f1c0 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1312_l1299_DUPLICATE_f1c0_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1296_c11_e0de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1296_c11_e0de_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_e0de_left;
     BIN_OP_EQ_uxn_opcodes_h_l1296_c11_e0de_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_e0de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_e0de_return_output := BIN_OP_EQ_uxn_opcodes_h_l1296_c11_e0de_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1296_l1312_l1299_l1291_DUPLICATE_b8fc LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1296_l1312_l1299_l1291_DUPLICATE_b8fc_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1312_c11_2fd3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1312_c11_2fd3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c11_2fd3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1312_c11_2fd3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c11_2fd3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c11_2fd3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1312_c11_2fd3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1303_c11_0c3e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1303_c11_0c3e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_0c3e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1303_c11_0c3e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_0c3e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_0c3e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1303_c11_0c3e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1296_l1312_l1299_l1291_DUPLICATE_123a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1296_l1312_l1299_l1291_DUPLICATE_123a_return_output := result.is_sp_shift;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1296_l1299_l1291_l1303_DUPLICATE_3bd1 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1296_l1299_l1291_l1303_DUPLICATE_3bd1_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1312_l1303_l1299_l1296_l1317_DUPLICATE_9350 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1312_l1303_l1299_l1296_l1317_DUPLICATE_9350_return_output := result.is_opc_done;

     -- sp_relative_shift[uxn_opcodes_h_l1307_c30_cf7f] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1307_c30_cf7f_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1307_c30_cf7f_ins;
     sp_relative_shift_uxn_opcodes_h_l1307_c30_cf7f_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1307_c30_cf7f_x;
     sp_relative_shift_uxn_opcodes_h_l1307_c30_cf7f_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1307_c30_cf7f_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1307_c30_cf7f_return_output := sp_relative_shift_uxn_opcodes_h_l1307_c30_cf7f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1312_l1299_l1296_l1291_l1317_DUPLICATE_fed6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1312_l1299_l1296_l1291_l1317_DUPLICATE_fed6_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_6efe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c6_4307_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_3b19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c6_4307_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_3b19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c6_4307_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_3b19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c6_4307_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_3b19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c6_4307_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_3b19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c6_4307_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c2_3b19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c6_4307_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1291_c2_3b19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c6_4307_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1291_c2_3b19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c6_4307_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_df91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_e0de_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_df91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_e0de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_df91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_e0de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_df91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_e0de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_df91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_e0de_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1296_c7_df91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_e0de_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1296_c7_df91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_e0de_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1296_c7_df91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_e0de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_09b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_f8f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_09b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_f8f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_09b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_f8f8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_09b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_f8f8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_09b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_f8f8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_09b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_f8f8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1299_c7_09b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_f8f8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1299_c7_09b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_f8f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2121_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_0c3e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2121_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_0c3e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2121_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_0c3e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2121_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_0c3e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2121_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_0c3e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_2121_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_0c3e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1303_c7_2121_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_0c3e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1303_c7_2121_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_0c3e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_50c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c11_2fd3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_50c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c11_2fd3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_50c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c11_2fd3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_50c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c11_2fd3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1312_c7_50c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c11_2fd3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_8831_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_e522_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_8831_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_e522_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1304_c3_f654_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1304_l1300_DUPLICATE_43a6_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1301_c3_1cb5_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1304_l1300_DUPLICATE_43a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_3b19_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1296_l1299_l1291_l1303_DUPLICATE_3bd1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_df91_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1296_l1299_l1291_l1303_DUPLICATE_3bd1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_09b7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1296_l1299_l1291_l1303_DUPLICATE_3bd1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2121_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1296_l1299_l1291_l1303_DUPLICATE_3bd1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_df91_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1312_l1303_l1299_l1296_l1317_DUPLICATE_9350_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_09b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1312_l1303_l1299_l1296_l1317_DUPLICATE_9350_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2121_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1312_l1303_l1299_l1296_l1317_DUPLICATE_9350_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_50c8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1312_l1303_l1299_l1296_l1317_DUPLICATE_9350_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_8831_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1312_l1303_l1299_l1296_l1317_DUPLICATE_9350_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_3b19_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1296_l1312_l1299_l1291_DUPLICATE_123a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_df91_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1296_l1312_l1299_l1291_DUPLICATE_123a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_09b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1296_l1312_l1299_l1291_DUPLICATE_123a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_50c8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1296_l1312_l1299_l1291_DUPLICATE_123a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_3b19_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1312_l1299_l1296_l1291_l1317_DUPLICATE_fed6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_df91_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1312_l1299_l1296_l1291_l1317_DUPLICATE_fed6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_09b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1312_l1299_l1296_l1291_l1317_DUPLICATE_fed6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_50c8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1312_l1299_l1296_l1291_l1317_DUPLICATE_fed6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_8831_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1312_l1299_l1296_l1291_l1317_DUPLICATE_fed6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_09b7_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1312_l1299_DUPLICATE_f1c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_50c8_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1312_l1299_DUPLICATE_f1c0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c2_3b19_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1296_l1312_l1299_l1291_DUPLICATE_b8fc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1296_c7_df91_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1296_l1312_l1299_l1291_DUPLICATE_b8fc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_09b7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1296_l1312_l1299_l1291_DUPLICATE_b8fc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1312_c7_50c8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1296_l1312_l1299_l1291_DUPLICATE_b8fc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2121_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1307_c30_cf7f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1312_c7_50c8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_50c8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_50c8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_50c8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_50c8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_50c8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_50c8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_50c8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_50c8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1317_c7_8831] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_8831_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_8831_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_8831_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_8831_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_8831_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_8831_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_8831_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_8831_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1291_c1_6efe] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_6efe_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_6efe_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_6efe_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_6efe_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_6efe_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_6efe_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_6efe_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_6efe_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1303_c7_2121] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2121_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2121_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2121_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2121_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2121_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2121_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2121_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2121_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1301_c3_1cb5] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1301_c3_1cb5_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1301_c3_1cb5_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1301_c3_1cb5_return_output := CONST_SL_8_uxn_opcodes_h_l1301_c3_1cb5_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1304_c3_f654] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1304_c3_f654_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1304_c3_f654_left;
     BIN_OP_OR_uxn_opcodes_h_l1304_c3_f654_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1304_c3_f654_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1304_c3_f654_return_output := BIN_OP_OR_uxn_opcodes_h_l1304_c3_f654_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1317_c7_8831] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_8831_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_8831_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_8831_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_8831_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_8831_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_8831_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_8831_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_8831_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1312_c7_50c8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_50c8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_50c8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_50c8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_50c8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_50c8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_50c8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_50c8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_50c8_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1315_c21_a814] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1315_c21_a814_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1315_c31_9c23_return_output);

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1305_c11_a07b_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1304_c3_f654_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1303_c7_2121_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1304_c3_f654_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1312_c7_50c8_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1315_c21_a814_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1299_c7_09b7_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1301_c3_1cb5_return_output;
     VAR_printf_uxn_opcodes_h_l1292_c3_e7bb_uxn_opcodes_h_l1292_c3_e7bb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_6efe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_50c8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_8831_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2121_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_50c8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_50c8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_8831_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_09b7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2121_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2121_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_50c8_return_output;
     -- printf_uxn_opcodes_h_l1292_c3_e7bb[uxn_opcodes_h_l1292_c3_e7bb] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1292_c3_e7bb_uxn_opcodes_h_l1292_c3_e7bb_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1292_c3_e7bb_uxn_opcodes_h_l1292_c3_e7bb_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1303_c7_2121] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2121_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2121_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2121_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2121_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2121_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2121_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2121_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2121_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1312_c7_50c8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1312_c7_50c8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1312_c7_50c8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1312_c7_50c8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1312_c7_50c8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1312_c7_50c8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1312_c7_50c8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1312_c7_50c8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1312_c7_50c8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1299_c7_09b7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_09b7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_09b7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_09b7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_09b7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_09b7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_09b7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output;

     -- t16_MUX[uxn_opcodes_h_l1303_c7_2121] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1303_c7_2121_cond <= VAR_t16_MUX_uxn_opcodes_h_l1303_c7_2121_cond;
     t16_MUX_uxn_opcodes_h_l1303_c7_2121_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1303_c7_2121_iftrue;
     t16_MUX_uxn_opcodes_h_l1303_c7_2121_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1303_c7_2121_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1303_c7_2121_return_output := t16_MUX_uxn_opcodes_h_l1303_c7_2121_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1312_c7_50c8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_50c8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_50c8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_50c8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_50c8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_50c8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_50c8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_50c8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_50c8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1312_c7_50c8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_50c8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_50c8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_50c8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_50c8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_50c8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_50c8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_50c8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_50c8_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1305_c11_a07b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1305_c11_a07b_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1305_c11_a07b_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1305_c11_a07b_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1305_c11_a07b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1305_c11_a07b_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1305_c11_a07b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1303_c7_2121] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2121_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2121_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2121_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2121_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2121_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2121_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2121_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2121_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l1305_c3_4e3e := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1305_c11_a07b_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2121_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_50c8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_09b7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2121_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2121_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_50c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_df91_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_09b7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2121_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_2121_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1312_c7_50c8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1299_c7_09b7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1303_c7_2121_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1303_c7_2121_iftrue := VAR_tmp16_uxn_opcodes_h_l1305_c3_4e3e;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1296_c7_df91] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_df91_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_df91_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_df91_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_df91_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_df91_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_df91_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_df91_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_df91_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1303_c7_2121] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2121_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2121_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2121_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2121_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2121_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2121_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2121_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2121_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1303_c7_2121] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2121_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2121_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2121_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2121_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2121_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2121_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2121_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2121_return_output;

     -- t16_MUX[uxn_opcodes_h_l1299_c7_09b7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1299_c7_09b7_cond <= VAR_t16_MUX_uxn_opcodes_h_l1299_c7_09b7_cond;
     t16_MUX_uxn_opcodes_h_l1299_c7_09b7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1299_c7_09b7_iftrue;
     t16_MUX_uxn_opcodes_h_l1299_c7_09b7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1299_c7_09b7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output := t16_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1310_c21_c2f5] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1310_c21_c2f5_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l1305_c3_4e3e);

     -- tmp16_MUX[uxn_opcodes_h_l1303_c7_2121] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1303_c7_2121_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1303_c7_2121_cond;
     tmp16_MUX_uxn_opcodes_h_l1303_c7_2121_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1303_c7_2121_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1303_c7_2121_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1303_c7_2121_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1303_c7_2121_return_output := tmp16_MUX_uxn_opcodes_h_l1303_c7_2121_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1299_c7_09b7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_09b7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_09b7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_09b7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_09b7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_09b7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_09b7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1299_c7_09b7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_09b7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_09b7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_09b7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_09b7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_09b7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_09b7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_2121_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1310_c21_c2f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_09b7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2121_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_df91_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_09b7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2121_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_3b19_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_df91_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_df91_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1296_c7_df91_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1299_c7_09b7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1303_c7_2121_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1299_c7_09b7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_09b7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_09b7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_09b7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_09b7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_09b7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_09b7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1299_c7_09b7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_09b7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_09b7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_09b7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_09b7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_09b7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_09b7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1296_c7_df91] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_df91_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_df91_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_df91_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_df91_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_df91_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_df91_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_df91_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_df91_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1303_c7_2121] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1303_c7_2121_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_2121_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1303_c7_2121_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_2121_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1303_c7_2121_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_2121_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_2121_return_output := result_u8_value_MUX_uxn_opcodes_h_l1303_c7_2121_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1291_c2_3b19] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_3b19_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_3b19_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_3b19_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_3b19_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_3b19_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_3b19_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1296_c7_df91] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_df91_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_df91_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_df91_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_df91_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_df91_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_df91_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_df91_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_df91_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1299_c7_09b7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1299_c7_09b7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1299_c7_09b7_cond;
     tmp16_MUX_uxn_opcodes_h_l1299_c7_09b7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1299_c7_09b7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1299_c7_09b7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1299_c7_09b7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output := tmp16_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output;

     -- t16_MUX[uxn_opcodes_h_l1296_c7_df91] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1296_c7_df91_cond <= VAR_t16_MUX_uxn_opcodes_h_l1296_c7_df91_cond;
     t16_MUX_uxn_opcodes_h_l1296_c7_df91_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1296_c7_df91_iftrue;
     t16_MUX_uxn_opcodes_h_l1296_c7_df91_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1296_c7_df91_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1296_c7_df91_return_output := t16_MUX_uxn_opcodes_h_l1296_c7_df91_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_df91_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_3b19_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_df91_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_df91_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_3b19_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_df91_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_09b7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_2121_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1291_c2_3b19_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1296_c7_df91_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1296_c7_df91_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output;
     -- t16_MUX[uxn_opcodes_h_l1291_c2_3b19] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1291_c2_3b19_cond <= VAR_t16_MUX_uxn_opcodes_h_l1291_c2_3b19_cond;
     t16_MUX_uxn_opcodes_h_l1291_c2_3b19_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1291_c2_3b19_iftrue;
     t16_MUX_uxn_opcodes_h_l1291_c2_3b19_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1291_c2_3b19_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output := t16_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1296_c7_df91] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_df91_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_df91_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_df91_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_df91_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_df91_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_df91_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_df91_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_df91_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1296_c7_df91] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_df91_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_df91_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_df91_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_df91_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_df91_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_df91_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_df91_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_df91_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1299_c7_09b7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1299_c7_09b7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_09b7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1299_c7_09b7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_09b7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1299_c7_09b7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_09b7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1291_c2_3b19] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_3b19_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_3b19_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_3b19_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_3b19_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_3b19_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_3b19_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1296_c7_df91] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1296_c7_df91_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1296_c7_df91_cond;
     tmp16_MUX_uxn_opcodes_h_l1296_c7_df91_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1296_c7_df91_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1296_c7_df91_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1296_c7_df91_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1296_c7_df91_return_output := tmp16_MUX_uxn_opcodes_h_l1296_c7_df91_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1291_c2_3b19] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_3b19_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_3b19_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_3b19_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_3b19_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_3b19_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_3b19_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_3b19_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_df91_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_3b19_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_df91_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1296_c7_df91_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_09b7_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1291_c2_3b19_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1296_c7_df91_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1291_c2_3b19] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_3b19_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_3b19_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_3b19_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_3b19_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_3b19_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_3b19_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1291_c2_3b19] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1291_c2_3b19_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1291_c2_3b19_cond;
     tmp16_MUX_uxn_opcodes_h_l1291_c2_3b19_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1291_c2_3b19_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1291_c2_3b19_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1291_c2_3b19_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output := tmp16_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1291_c2_3b19] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_3b19_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_3b19_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_3b19_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_3b19_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_3b19_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_3b19_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1296_c7_df91] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1296_c7_df91_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1296_c7_df91_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1296_c7_df91_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1296_c7_df91_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1296_c7_df91_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1296_c7_df91_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1296_c7_df91_return_output := result_u8_value_MUX_uxn_opcodes_h_l1296_c7_df91_return_output;

     -- Submodule level 7
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c2_3b19_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1296_c7_df91_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1291_c2_3b19] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1291_c2_3b19_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c2_3b19_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1291_c2_3b19_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c2_3b19_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1291_c2_3b19_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c2_3b19_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output := result_u8_value_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l1287_l1322_DUPLICATE_991f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l1287_l1322_DUPLICATE_991f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_3b19_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l1287_l1322_DUPLICATE_991f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l1287_l1322_DUPLICATE_991f_return_output;
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
