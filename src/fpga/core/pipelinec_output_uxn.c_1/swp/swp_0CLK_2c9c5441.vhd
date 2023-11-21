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
-- Submodules: 45
entity swp_0CLK_2c9c5441 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(15 downto 0);
 return_output : out opcode_result_t);
end swp_0CLK_2c9c5441;
architecture arch of swp_0CLK_2c9c5441 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2286_c6_e787]
signal BIN_OP_EQ_uxn_opcodes_h_l2286_c6_e787_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2286_c6_e787_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2286_c6_e787_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2286_c2_a82f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c2_a82f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2286_c2_a82f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c2_a82f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2286_c2_a82f]
signal result_u16_value_MUX_uxn_opcodes_h_l2286_c2_a82f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output : unsigned(15 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l2286_c2_a82f]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2286_c2_a82f_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2286_c2_a82f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2286_c2_a82f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2286_c2_a82f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c2_a82f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2286_c2_a82f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2286_c2_a82f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2286_c2_a82f]
signal t8_MUX_uxn_opcodes_h_l2286_c2_a82f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2286_c2_a82f]
signal n8_MUX_uxn_opcodes_h_l2286_c2_a82f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2286_c2_a82f]
signal tmp16_MUX_uxn_opcodes_h_l2286_c2_a82f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2294_c11_4e5b]
signal BIN_OP_EQ_uxn_opcodes_h_l2294_c11_4e5b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2294_c11_4e5b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2294_c11_4e5b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2294_c7_0551]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_0551_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_0551_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2294_c7_0551]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_0551_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_0551_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2294_c7_0551]
signal result_u16_value_MUX_uxn_opcodes_h_l2294_c7_0551_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2294_c7_0551_return_output : unsigned(15 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l2294_c7_0551]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2294_c7_0551_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2294_c7_0551_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2294_c7_0551]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_0551_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_0551_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2294_c7_0551]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_0551_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_0551_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2294_c7_0551]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_0551_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_0551_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2294_c7_0551]
signal t8_MUX_uxn_opcodes_h_l2294_c7_0551_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2294_c7_0551_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2294_c7_0551]
signal n8_MUX_uxn_opcodes_h_l2294_c7_0551_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2294_c7_0551_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2294_c7_0551]
signal tmp16_MUX_uxn_opcodes_h_l2294_c7_0551_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2294_c7_0551_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2296_c30_4431]
signal sp_relative_shift_uxn_opcodes_h_l2296_c30_4431_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2296_c30_4431_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2296_c30_4431_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2296_c30_4431_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2298_c11_7f7b]
signal BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7f7b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7f7b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7f7b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2298_c7_00c4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_00c4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2298_c7_00c4]
signal result_u16_value_MUX_uxn_opcodes_h_l2298_c7_00c4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output : unsigned(15 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l2298_c7_00c4]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2298_c7_00c4_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2298_c7_00c4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_00c4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2298_c7_00c4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_00c4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2298_c7_00c4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_00c4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l2298_c7_00c4]
signal t8_MUX_uxn_opcodes_h_l2298_c7_00c4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2298_c7_00c4]
signal n8_MUX_uxn_opcodes_h_l2298_c7_00c4_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2298_c7_00c4]
signal tmp16_MUX_uxn_opcodes_h_l2298_c7_00c4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output : unsigned(15 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2300_c18_2987]
signal CONST_SR_8_uxn_opcodes_h_l2300_c18_2987_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2300_c18_2987_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2302_c3_08b7]
signal CONST_SL_8_uxn_opcodes_h_l2302_c3_08b7_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2302_c3_08b7_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2303_c3_9f1f]
signal BIN_OP_OR_uxn_opcodes_h_l2303_c3_9f1f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2303_c3_9f1f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2303_c3_9f1f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2309_c11_6a21]
signal BIN_OP_EQ_uxn_opcodes_h_l2309_c11_6a21_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2309_c11_6a21_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2309_c11_6a21_return_output : unsigned(0 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l2309_c7_065b]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2309_c7_065b_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2309_c7_065b_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2309_c7_065b_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2309_c7_065b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2309_c7_065b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_065b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_065b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_065b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_065b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2309_c7_065b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_065b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_065b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_065b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_065b_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_8152( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_stack_operation_16bit := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_stack_write := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2286_c6_e787
BIN_OP_EQ_uxn_opcodes_h_l2286_c6_e787 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2286_c6_e787_left,
BIN_OP_EQ_uxn_opcodes_h_l2286_c6_e787_right,
BIN_OP_EQ_uxn_opcodes_h_l2286_c6_e787_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c2_a82f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c2_a82f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c2_a82f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c2_a82f
result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c2_a82f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c2_a82f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2286_c2_a82f
result_u16_value_MUX_uxn_opcodes_h_l2286_c2_a82f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2286_c2_a82f_cond,
result_u16_value_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2286_c2_a82f
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2286_c2_a82f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2286_c2_a82f_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2286_c2_a82f
result_is_opc_done_MUX_uxn_opcodes_h_l2286_c2_a82f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2286_c2_a82f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c2_a82f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c2_a82f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c2_a82f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2286_c2_a82f
result_is_stack_write_MUX_uxn_opcodes_h_l2286_c2_a82f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2286_c2_a82f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output);

-- t8_MUX_uxn_opcodes_h_l2286_c2_a82f
t8_MUX_uxn_opcodes_h_l2286_c2_a82f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2286_c2_a82f_cond,
t8_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue,
t8_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse,
t8_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output);

-- n8_MUX_uxn_opcodes_h_l2286_c2_a82f
n8_MUX_uxn_opcodes_h_l2286_c2_a82f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2286_c2_a82f_cond,
n8_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue,
n8_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse,
n8_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2286_c2_a82f
tmp16_MUX_uxn_opcodes_h_l2286_c2_a82f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2286_c2_a82f_cond,
tmp16_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue,
tmp16_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse,
tmp16_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2294_c11_4e5b
BIN_OP_EQ_uxn_opcodes_h_l2294_c11_4e5b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2294_c11_4e5b_left,
BIN_OP_EQ_uxn_opcodes_h_l2294_c11_4e5b_right,
BIN_OP_EQ_uxn_opcodes_h_l2294_c11_4e5b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_0551
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_0551 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_0551_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_0551_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_0551
result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_0551 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_0551_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_0551_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2294_c7_0551
result_u16_value_MUX_uxn_opcodes_h_l2294_c7_0551 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2294_c7_0551_cond,
result_u16_value_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2294_c7_0551_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2294_c7_0551
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2294_c7_0551 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2294_c7_0551_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2294_c7_0551_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_0551
result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_0551 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_0551_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_0551_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_0551
result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_0551 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_0551_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_0551_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_0551
result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_0551 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_0551_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_0551_return_output);

-- t8_MUX_uxn_opcodes_h_l2294_c7_0551
t8_MUX_uxn_opcodes_h_l2294_c7_0551 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2294_c7_0551_cond,
t8_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue,
t8_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse,
t8_MUX_uxn_opcodes_h_l2294_c7_0551_return_output);

-- n8_MUX_uxn_opcodes_h_l2294_c7_0551
n8_MUX_uxn_opcodes_h_l2294_c7_0551 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2294_c7_0551_cond,
n8_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue,
n8_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse,
n8_MUX_uxn_opcodes_h_l2294_c7_0551_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2294_c7_0551
tmp16_MUX_uxn_opcodes_h_l2294_c7_0551 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2294_c7_0551_cond,
tmp16_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue,
tmp16_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse,
tmp16_MUX_uxn_opcodes_h_l2294_c7_0551_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2296_c30_4431
sp_relative_shift_uxn_opcodes_h_l2296_c30_4431 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2296_c30_4431_ins,
sp_relative_shift_uxn_opcodes_h_l2296_c30_4431_x,
sp_relative_shift_uxn_opcodes_h_l2296_c30_4431_y,
sp_relative_shift_uxn_opcodes_h_l2296_c30_4431_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7f7b
BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7f7b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7f7b_left,
BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7f7b_right,
BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7f7b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_00c4
result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_00c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_00c4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2298_c7_00c4
result_u16_value_MUX_uxn_opcodes_h_l2298_c7_00c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2298_c7_00c4_cond,
result_u16_value_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2298_c7_00c4
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2298_c7_00c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2298_c7_00c4_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_00c4
result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_00c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_00c4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_00c4
result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_00c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_00c4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_00c4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_00c4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_00c4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output);

-- t8_MUX_uxn_opcodes_h_l2298_c7_00c4
t8_MUX_uxn_opcodes_h_l2298_c7_00c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2298_c7_00c4_cond,
t8_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue,
t8_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse,
t8_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output);

-- n8_MUX_uxn_opcodes_h_l2298_c7_00c4
n8_MUX_uxn_opcodes_h_l2298_c7_00c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2298_c7_00c4_cond,
n8_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue,
n8_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse,
n8_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2298_c7_00c4
tmp16_MUX_uxn_opcodes_h_l2298_c7_00c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2298_c7_00c4_cond,
tmp16_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue,
tmp16_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse,
tmp16_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2300_c18_2987
CONST_SR_8_uxn_opcodes_h_l2300_c18_2987 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2300_c18_2987_x,
CONST_SR_8_uxn_opcodes_h_l2300_c18_2987_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2302_c3_08b7
CONST_SL_8_uxn_opcodes_h_l2302_c3_08b7 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2302_c3_08b7_x,
CONST_SL_8_uxn_opcodes_h_l2302_c3_08b7_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2303_c3_9f1f
BIN_OP_OR_uxn_opcodes_h_l2303_c3_9f1f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2303_c3_9f1f_left,
BIN_OP_OR_uxn_opcodes_h_l2303_c3_9f1f_right,
BIN_OP_OR_uxn_opcodes_h_l2303_c3_9f1f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2309_c11_6a21
BIN_OP_EQ_uxn_opcodes_h_l2309_c11_6a21 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2309_c11_6a21_left,
BIN_OP_EQ_uxn_opcodes_h_l2309_c11_6a21_right,
BIN_OP_EQ_uxn_opcodes_h_l2309_c11_6a21_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2309_c7_065b
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2309_c7_065b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2309_c7_065b_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2309_c7_065b_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2309_c7_065b_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2309_c7_065b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_065b
result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_065b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_065b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_065b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_065b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_065b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_065b
result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_065b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_065b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_065b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_065b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_065b_return_output);



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
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2286_c6_e787_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output,
 t8_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output,
 n8_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output,
 tmp16_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2294_c11_4e5b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_0551_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_0551_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2294_c7_0551_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2294_c7_0551_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_0551_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_0551_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_0551_return_output,
 t8_MUX_uxn_opcodes_h_l2294_c7_0551_return_output,
 n8_MUX_uxn_opcodes_h_l2294_c7_0551_return_output,
 tmp16_MUX_uxn_opcodes_h_l2294_c7_0551_return_output,
 sp_relative_shift_uxn_opcodes_h_l2296_c30_4431_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7f7b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output,
 t8_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output,
 n8_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output,
 tmp16_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output,
 CONST_SR_8_uxn_opcodes_h_l2300_c18_2987_return_output,
 CONST_SL_8_uxn_opcodes_h_l2302_c3_08b7_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2303_c3_9f1f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2309_c11_6a21_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2309_c7_065b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_065b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_065b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c6_e787_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c6_e787_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c6_e787_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2291_c3_cfde : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_0551_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c2_a82f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_0551_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c2_a82f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2294_c7_0551_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2286_c2_a82f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2294_c7_0551_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2286_c2_a82f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_0551_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2286_c2_a82f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_0551_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c2_a82f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_0551_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2286_c2_a82f_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2294_c7_0551_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2286_c2_a82f_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2294_c7_0551_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2286_c2_a82f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_0551_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2286_c2_a82f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_4e5b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_4e5b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_4e5b_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_0551_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_0551_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2294_c7_0551_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2294_c7_0551_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_0551_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_0551_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_0551_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2294_c7_0551_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2294_c7_0551_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_0551_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2296_c30_4431_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2296_c30_4431_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2296_c30_4431_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2296_c30_4431_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7f7b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7f7b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7f7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_00c4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2298_c7_00c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2309_c7_065b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2298_c7_00c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_065b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_00c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_065b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_00c4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2306_c3_49af : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_00c4_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2298_c7_00c4_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2298_c7_00c4_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2298_c7_00c4_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2299_c8_93dd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2300_c18_2987_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2300_c18_2987_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2300_c8_bc73_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l2301_c11_b78a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2302_c3_08b7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2302_c3_08b7_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2303_c3_9f1f_left : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l2303_c12_4649_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2303_c3_9f1f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2303_c3_9f1f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2309_c11_6a21_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2309_c11_6a21_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2309_c11_6a21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2309_c7_065b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2309_c7_065b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2309_c7_065b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_065b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_065b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_065b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_065b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_065b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_065b_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2298_l2286_DUPLICATE_a115_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2298_l2286_l2294_DUPLICATE_299f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2286_l2294_DUPLICATE_3180_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2286_l2309_l2294_DUPLICATE_6833_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2298_l2294_DUPLICATE_1acb_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l2298_l2309_l2294_DUPLICATE_0953_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2298_l2309_l2294_DUPLICATE_a6ff_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8152_uxn_opcodes_h_l2315_l2281_DUPLICATE_835c_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7f7b_right := to_unsigned(2, 2);
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2309_c7_065b_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2296_c30_4431_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_065b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c6_e787_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2309_c11_6a21_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2291_c3_cfde := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2291_c3_cfde;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_065b_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2306_c3_49af := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2306_c3_49af;
     VAR_sp_relative_shift_uxn_opcodes_h_l2296_c30_4431_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_4e5b_right := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2296_c30_4431_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c6_e787_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_4e5b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7f7b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2309_c11_6a21_left := VAR_phase;
     VAR_CONST_SR_8_uxn_opcodes_h_l2300_c18_2987_x := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse := t8;
     VAR_tmp16_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse := tmp16;
     -- CONST_SR_8[uxn_opcodes_h_l2300_c18_2987] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2300_c18_2987_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2300_c18_2987_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2300_c18_2987_return_output := CONST_SR_8_uxn_opcodes_h_l2300_c18_2987_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2298_l2294_DUPLICATE_1acb LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2298_l2294_DUPLICATE_1acb_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2298_l2286_DUPLICATE_a115 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2298_l2286_DUPLICATE_a115_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2294_c11_4e5b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2294_c11_4e5b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_4e5b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2294_c11_4e5b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_4e5b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_4e5b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2294_c11_4e5b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2286_c6_e787] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2286_c6_e787_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c6_e787_left;
     BIN_OP_EQ_uxn_opcodes_h_l2286_c6_e787_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c6_e787_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c6_e787_return_output := BIN_OP_EQ_uxn_opcodes_h_l2286_c6_e787_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2298_l2286_l2294_DUPLICATE_299f LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2298_l2286_l2294_DUPLICATE_299f_return_output := result.u16_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2286_l2294_DUPLICATE_3180 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2286_l2294_DUPLICATE_3180_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2286_l2309_l2294_DUPLICATE_6833 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2286_l2309_l2294_DUPLICATE_6833_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2309_c11_6a21] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2309_c11_6a21_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2309_c11_6a21_left;
     BIN_OP_EQ_uxn_opcodes_h_l2309_c11_6a21_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2309_c11_6a21_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2309_c11_6a21_return_output := BIN_OP_EQ_uxn_opcodes_h_l2309_c11_6a21_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2298_c11_7f7b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7f7b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7f7b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7f7b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7f7b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7f7b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7f7b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l2298_l2309_l2294_DUPLICATE_0953 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l2298_l2309_l2294_DUPLICATE_0953_return_output := result.is_stack_operation_16bit;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2298_l2309_l2294_DUPLICATE_a6ff LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2298_l2309_l2294_DUPLICATE_a6ff_return_output := result.is_opc_done;

     -- sp_relative_shift[uxn_opcodes_h_l2296_c30_4431] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2296_c30_4431_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2296_c30_4431_ins;
     sp_relative_shift_uxn_opcodes_h_l2296_c30_4431_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2296_c30_4431_x;
     sp_relative_shift_uxn_opcodes_h_l2296_c30_4431_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2296_c30_4431_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2296_c30_4431_return_output := sp_relative_shift_uxn_opcodes_h_l2296_c30_4431_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2299_c8_93dd] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2299_c8_93dd_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l2286_c2_a82f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c6_e787_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2286_c2_a82f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c6_e787_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c2_a82f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c6_e787_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2286_c2_a82f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c6_e787_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2286_c2_a82f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c6_e787_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c2_a82f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c6_e787_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c2_a82f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c6_e787_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2286_c2_a82f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c6_e787_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2286_c2_a82f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c6_e787_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2286_c2_a82f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c6_e787_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2294_c7_0551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_4e5b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_0551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_4e5b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_0551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_4e5b_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2294_c7_0551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_4e5b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_0551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_4e5b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_0551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_4e5b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_0551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_4e5b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2294_c7_0551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_4e5b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2294_c7_0551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_4e5b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_0551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_4e5b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2298_c7_00c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7f7b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_00c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7f7b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_00c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7f7b_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2298_c7_00c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7f7b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_00c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7f7b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_00c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7f7b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2298_c7_00c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7f7b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2298_c7_00c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7f7b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2298_c7_00c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7f7b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_065b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2309_c11_6a21_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2309_c7_065b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2309_c11_6a21_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_065b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2309_c11_6a21_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2299_c8_93dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2286_l2294_DUPLICATE_3180_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2286_l2294_DUPLICATE_3180_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2298_l2286_l2294_DUPLICATE_299f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2298_l2286_l2294_DUPLICATE_299f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2298_l2286_l2294_DUPLICATE_299f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2298_l2309_l2294_DUPLICATE_a6ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2298_l2309_l2294_DUPLICATE_a6ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_065b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2298_l2309_l2294_DUPLICATE_a6ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2298_l2286_DUPLICATE_a115_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2298_l2286_DUPLICATE_a115_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l2298_l2309_l2294_DUPLICATE_0953_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l2298_l2309_l2294_DUPLICATE_0953_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2309_c7_065b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l2298_l2309_l2294_DUPLICATE_0953_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2286_l2309_l2294_DUPLICATE_6833_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2286_l2309_l2294_DUPLICATE_6833_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_065b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2286_l2309_l2294_DUPLICATE_6833_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2298_l2294_DUPLICATE_1acb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2298_l2294_DUPLICATE_1acb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2296_c30_4431_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2298_c7_00c4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_00c4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_00c4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2294_c7_0551] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_0551_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_0551_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_0551_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_0551_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2298_c7_00c4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_00c4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_00c4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output;

     -- t8_MUX[uxn_opcodes_h_l2298_c7_00c4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2298_c7_00c4_cond <= VAR_t8_MUX_uxn_opcodes_h_l2298_c7_00c4_cond;
     t8_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue;
     t8_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output := t8_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l2309_c7_065b] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2309_c7_065b_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2309_c7_065b_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2309_c7_065b_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2309_c7_065b_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2309_c7_065b_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2309_c7_065b_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2309_c7_065b_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2309_c7_065b_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l2301_c11_b78a] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l2301_c11_b78a_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2299_c8_93dd_return_output);

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2300_c8_bc73] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2300_c8_bc73_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2300_c18_2987_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2309_c7_065b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_065b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_065b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_065b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_065b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_065b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_065b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_065b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_065b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2309_c7_065b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_065b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_065b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_065b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_065b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_065b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_065b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_065b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_065b_return_output;

     -- Submodule level 2
     VAR_CONST_SL_8_uxn_opcodes_h_l2302_c3_08b7_x := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l2301_c11_b78a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2300_c8_bc73_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_065b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse := VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2309_c7_065b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_065b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_0551_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2294_c7_0551] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_0551_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_0551_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_0551_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_0551_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2298_c7_00c4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_00c4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_00c4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2302_c3_08b7] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2302_c3_08b7_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2302_c3_08b7_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2302_c3_08b7_return_output := CONST_SL_8_uxn_opcodes_h_l2302_c3_08b7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2298_c7_00c4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_00c4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_00c4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l2298_c7_00c4] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2298_c7_00c4_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2298_c7_00c4_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output;

     -- t8_MUX[uxn_opcodes_h_l2294_c7_0551] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2294_c7_0551_cond <= VAR_t8_MUX_uxn_opcodes_h_l2294_c7_0551_cond;
     t8_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue;
     t8_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2294_c7_0551_return_output := t8_MUX_uxn_opcodes_h_l2294_c7_0551_return_output;

     -- n8_MUX[uxn_opcodes_h_l2298_c7_00c4] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2298_c7_00c4_cond <= VAR_n8_MUX_uxn_opcodes_h_l2298_c7_00c4_cond;
     n8_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue;
     n8_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output := n8_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2294_c7_0551] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_0551_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_0551_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_0551_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_0551_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2286_c2_a82f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c2_a82f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c2_a82f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l2303_c12_4649] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l2303_c12_4649_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2300_c8_bc73_return_output);

     -- Submodule level 3
     VAR_BIN_OP_OR_uxn_opcodes_h_l2303_c3_9f1f_right := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l2303_c12_4649_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2303_c3_9f1f_left := VAR_CONST_SL_8_uxn_opcodes_h_l2302_c3_08b7_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_0551_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse := VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_0551_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2294_c7_0551_return_output;
     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l2294_c7_0551] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2294_c7_0551_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2294_c7_0551_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2294_c7_0551_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2294_c7_0551_return_output;

     -- t8_MUX[uxn_opcodes_h_l2286_c2_a82f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2286_c2_a82f_cond <= VAR_t8_MUX_uxn_opcodes_h_l2286_c2_a82f_cond;
     t8_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue;
     t8_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output := t8_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output;

     -- n8_MUX[uxn_opcodes_h_l2294_c7_0551] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2294_c7_0551_cond <= VAR_n8_MUX_uxn_opcodes_h_l2294_c7_0551_cond;
     n8_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue;
     n8_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2294_c7_0551_return_output := n8_MUX_uxn_opcodes_h_l2294_c7_0551_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2286_c2_a82f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c2_a82f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c2_a82f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2303_c3_9f1f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2303_c3_9f1f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2303_c3_9f1f_left;
     BIN_OP_OR_uxn_opcodes_h_l2303_c3_9f1f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2303_c3_9f1f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2303_c3_9f1f_return_output := BIN_OP_OR_uxn_opcodes_h_l2303_c3_9f1f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2294_c7_0551] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_0551_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_0551_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_0551_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_0551_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2294_c7_0551] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_0551_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_0551_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_0551_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_0551_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2286_c2_a82f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c2_a82f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c2_a82f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output;

     -- Submodule level 4
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2303_c3_9f1f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2303_c3_9f1f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2294_c7_0551_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_0551_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse := VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2294_c7_0551_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_0551_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2298_c7_00c4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2298_c7_00c4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2298_c7_00c4_cond;
     tmp16_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output := tmp16_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2298_c7_00c4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2298_c7_00c4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2298_c7_00c4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2298_c7_00c4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2298_c7_00c4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output := result_u16_value_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output;

     -- n8_MUX[uxn_opcodes_h_l2286_c2_a82f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2286_c2_a82f_cond <= VAR_n8_MUX_uxn_opcodes_h_l2286_c2_a82f_cond;
     n8_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue;
     n8_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output := n8_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l2286_c2_a82f] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2286_c2_a82f_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2286_c2_a82f_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2286_c2_a82f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2286_c2_a82f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2286_c2_a82f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2286_c2_a82f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2286_c2_a82f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2286_c2_a82f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2298_c7_00c4_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l2294_c7_0551] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2294_c7_0551_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2294_c7_0551_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2294_c7_0551_return_output := result_u16_value_MUX_uxn_opcodes_h_l2294_c7_0551_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2294_c7_0551] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2294_c7_0551_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_0551_cond;
     tmp16_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_0551_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_0551_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_0551_return_output := tmp16_MUX_uxn_opcodes_h_l2294_c7_0551_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2294_c7_0551_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_0551_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l2286_c2_a82f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2286_c2_a82f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2286_c2_a82f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output := result_u16_value_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2286_c2_a82f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2286_c2_a82f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2286_c2_a82f_cond;
     tmp16_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2286_c2_a82f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2286_c2_a82f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output := tmp16_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output;

     -- Submodule level 7
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8152_uxn_opcodes_h_l2315_l2281_DUPLICATE_835c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8152_uxn_opcodes_h_l2315_l2281_DUPLICATE_835c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8152(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output,
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2286_c2_a82f_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8152_uxn_opcodes_h_l2315_l2281_DUPLICATE_835c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8152_uxn_opcodes_h_l2315_l2281_DUPLICATE_835c_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
