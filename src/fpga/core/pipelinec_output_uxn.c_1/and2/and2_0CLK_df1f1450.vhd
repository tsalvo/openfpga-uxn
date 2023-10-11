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
-- Submodules: 114
entity and2_0CLK_df1f1450 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end and2_0CLK_df1f1450;
architecture arch of and2_0CLK_df1f1450 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l996_c6_1ab8]
signal BIN_OP_EQ_uxn_opcodes_h_l996_c6_1ab8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l996_c6_1ab8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l996_c6_1ab8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l996_c1_35cb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l996_c1_35cb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l996_c1_35cb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l996_c1_35cb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l996_c1_35cb_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l996_c2_81e7]
signal n16_MUX_uxn_opcodes_h_l996_c2_81e7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l996_c2_81e7_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l996_c2_81e7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l996_c2_81e7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l996_c2_81e7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l996_c2_81e7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c2_81e7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c2_81e7_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l996_c2_81e7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c2_81e7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c2_81e7_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l996_c2_81e7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l996_c2_81e7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l996_c2_81e7_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l996_c2_81e7]
signal result_stack_value_MUX_uxn_opcodes_h_l996_c2_81e7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l996_c2_81e7_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l996_c2_81e7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l996_c2_81e7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l996_c2_81e7_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l996_c2_81e7]
signal tmp16_MUX_uxn_opcodes_h_l996_c2_81e7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l996_c2_81e7_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l996_c2_81e7]
signal t16_MUX_uxn_opcodes_h_l996_c2_81e7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l996_c2_81e7_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l997_c3_f68d[uxn_opcodes_h_l997_c3_f68d]
signal printf_uxn_opcodes_h_l997_c3_f68d_uxn_opcodes_h_l997_c3_f68d_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1001_c11_9137]
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9137_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9137_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9137_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1001_c7_d6d5]
signal n16_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1001_c7_d6d5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1001_c7_d6d5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1001_c7_d6d5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1001_c7_d6d5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1001_c7_d6d5]
signal result_stack_value_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1001_c7_d6d5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1001_c7_d6d5]
signal tmp16_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1001_c7_d6d5]
signal t16_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1004_c11_769f]
signal BIN_OP_EQ_uxn_opcodes_h_l1004_c11_769f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1004_c11_769f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1004_c11_769f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1004_c7_4d76]
signal n16_MUX_uxn_opcodes_h_l1004_c7_4d76_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1004_c7_4d76]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_4d76_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1004_c7_4d76]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_4d76_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1004_c7_4d76]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_4d76_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1004_c7_4d76]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_4d76_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1004_c7_4d76]
signal result_stack_value_MUX_uxn_opcodes_h_l1004_c7_4d76_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1004_c7_4d76]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_4d76_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1004_c7_4d76]
signal tmp16_MUX_uxn_opcodes_h_l1004_c7_4d76_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1004_c7_4d76]
signal t16_MUX_uxn_opcodes_h_l1004_c7_4d76_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1009_c11_1c54]
signal BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1c54_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1c54_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1c54_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1009_c7_525f]
signal n16_MUX_uxn_opcodes_h_l1009_c7_525f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1009_c7_525f_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1009_c7_525f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_525f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_525f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1009_c7_525f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_525f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_525f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1009_c7_525f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_525f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_525f_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1009_c7_525f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_525f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_525f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1009_c7_525f]
signal result_stack_value_MUX_uxn_opcodes_h_l1009_c7_525f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1009_c7_525f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1009_c7_525f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_525f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_525f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1009_c7_525f]
signal tmp16_MUX_uxn_opcodes_h_l1009_c7_525f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1009_c7_525f_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1009_c7_525f]
signal t16_MUX_uxn_opcodes_h_l1009_c7_525f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1009_c7_525f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1012_c11_57d2]
signal BIN_OP_EQ_uxn_opcodes_h_l1012_c11_57d2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1012_c11_57d2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1012_c11_57d2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1012_c7_7f9a]
signal n16_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1012_c7_7f9a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1012_c7_7f9a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1012_c7_7f9a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1012_c7_7f9a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1012_c7_7f9a]
signal result_stack_value_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1012_c7_7f9a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1012_c7_7f9a]
signal tmp16_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1012_c7_7f9a]
signal t16_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1013_c3_1a15]
signal BIN_OP_OR_uxn_opcodes_h_l1013_c3_1a15_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1013_c3_1a15_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1013_c3_1a15_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1016_c11_e51b]
signal BIN_OP_EQ_uxn_opcodes_h_l1016_c11_e51b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1016_c11_e51b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1016_c11_e51b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1016_c7_621f]
signal n16_MUX_uxn_opcodes_h_l1016_c7_621f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1016_c7_621f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1016_c7_621f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1016_c7_621f_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1016_c7_621f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_621f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_621f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_621f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_621f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1016_c7_621f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_621f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_621f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_621f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_621f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1016_c7_621f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_621f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_621f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_621f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_621f_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1016_c7_621f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_621f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_621f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_621f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_621f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1016_c7_621f]
signal result_stack_value_MUX_uxn_opcodes_h_l1016_c7_621f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1016_c7_621f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1016_c7_621f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1016_c7_621f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1016_c7_621f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_621f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_621f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_621f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_621f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1016_c7_621f]
signal tmp16_MUX_uxn_opcodes_h_l1016_c7_621f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1016_c7_621f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1016_c7_621f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1016_c7_621f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1019_c11_bf2e]
signal BIN_OP_EQ_uxn_opcodes_h_l1019_c11_bf2e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1019_c11_bf2e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1019_c11_bf2e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1019_c7_e7ac]
signal n16_MUX_uxn_opcodes_h_l1019_c7_e7ac_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1019_c7_e7ac_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1019_c7_e7ac_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1019_c7_e7ac]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_e7ac_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_e7ac_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_e7ac_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1019_c7_e7ac]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_e7ac_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_e7ac_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_e7ac_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1019_c7_e7ac]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1019_c7_e7ac]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_e7ac_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_e7ac_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_e7ac_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1019_c7_e7ac]
signal result_stack_value_MUX_uxn_opcodes_h_l1019_c7_e7ac_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1019_c7_e7ac_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1019_c7_e7ac_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1019_c7_e7ac]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1019_c7_e7ac]
signal tmp16_MUX_uxn_opcodes_h_l1019_c7_e7ac_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1019_c7_e7ac_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1019_c7_e7ac_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1024_c11_0586]
signal BIN_OP_EQ_uxn_opcodes_h_l1024_c11_0586_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1024_c11_0586_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1024_c11_0586_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1024_c7_a54f]
signal n16_MUX_uxn_opcodes_h_l1024_c7_a54f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1024_c7_a54f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1024_c7_a54f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1024_c7_a54f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1024_c7_a54f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1024_c7_a54f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1024_c7_a54f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1024_c7_a54f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1024_c7_a54f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1024_c7_a54f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1024_c7_a54f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1024_c7_a54f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1024_c7_a54f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1024_c7_a54f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1024_c7_a54f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1024_c7_a54f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1024_c7_a54f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1024_c7_a54f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1024_c7_a54f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1024_c7_a54f]
signal result_stack_value_MUX_uxn_opcodes_h_l1024_c7_a54f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1024_c7_a54f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1024_c7_a54f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1024_c7_a54f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1024_c7_a54f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1024_c7_a54f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1024_c7_a54f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1024_c7_a54f]
signal tmp16_MUX_uxn_opcodes_h_l1024_c7_a54f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1024_c7_a54f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1024_c7_a54f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1027_c11_a62b]
signal BIN_OP_EQ_uxn_opcodes_h_l1027_c11_a62b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1027_c11_a62b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1027_c11_a62b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1027_c7_2f5c]
signal n16_MUX_uxn_opcodes_h_l1027_c7_2f5c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1027_c7_2f5c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1027_c7_2f5c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1027_c7_2f5c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2f5c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2f5c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2f5c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1027_c7_2f5c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_2f5c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_2f5c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_2f5c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1027_c7_2f5c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1027_c7_2f5c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2f5c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2f5c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2f5c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1027_c7_2f5c]
signal result_stack_value_MUX_uxn_opcodes_h_l1027_c7_2f5c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1027_c7_2f5c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1027_c7_2f5c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1027_c7_2f5c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1027_c7_2f5c]
signal tmp16_MUX_uxn_opcodes_h_l1027_c7_2f5c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1027_c7_2f5c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1027_c7_2f5c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1028_c3_01f8]
signal BIN_OP_OR_uxn_opcodes_h_l1028_c3_01f8_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1028_c3_01f8_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1028_c3_01f8_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1029_c11_6576]
signal BIN_OP_AND_uxn_opcodes_h_l1029_c11_6576_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1029_c11_6576_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1029_c11_6576_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1031_c32_e150]
signal BIN_OP_AND_uxn_opcodes_h_l1031_c32_e150_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1031_c32_e150_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1031_c32_e150_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1031_c32_2dcc]
signal BIN_OP_GT_uxn_opcodes_h_l1031_c32_2dcc_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1031_c32_2dcc_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1031_c32_2dcc_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1031_c32_628e]
signal MUX_uxn_opcodes_h_l1031_c32_628e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1031_c32_628e_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1031_c32_628e_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1031_c32_628e_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1033_c11_f9cc]
signal BIN_OP_EQ_uxn_opcodes_h_l1033_c11_f9cc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1033_c11_f9cc_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1033_c11_f9cc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1033_c7_1cbd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1cbd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1cbd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1cbd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1cbd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1033_c7_1cbd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1cbd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1cbd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1cbd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1cbd_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1033_c7_1cbd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1cbd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1cbd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1cbd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1cbd_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1033_c7_1cbd]
signal result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1cbd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1cbd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1cbd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1cbd_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1033_c7_1cbd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1cbd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1cbd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1cbd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1cbd_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1039_c11_aae6]
signal BIN_OP_EQ_uxn_opcodes_h_l1039_c11_aae6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1039_c11_aae6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1039_c11_aae6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1039_c7_4d91]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_4d91_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_4d91_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_4d91_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_4d91_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1039_c7_4d91]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_4d91_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_4d91_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_4d91_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_4d91_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1039_c7_4d91]
signal result_stack_value_MUX_uxn_opcodes_h_l1039_c7_4d91_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1039_c7_4d91_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1039_c7_4d91_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1039_c7_4d91_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1039_c7_4d91]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_4d91_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_4d91_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_4d91_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_4d91_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1041_c34_f8da]
signal CONST_SR_8_uxn_opcodes_h_l1041_c34_f8da_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1041_c34_f8da_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1043_c11_b086]
signal BIN_OP_EQ_uxn_opcodes_h_l1043_c11_b086_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1043_c11_b086_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1043_c11_b086_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1043_c7_d215]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d215_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d215_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d215_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d215_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1043_c7_d215]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d215_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d215_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d215_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d215_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1021_l1006_DUPLICATE_a491
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1021_l1006_DUPLICATE_a491_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1021_l1006_DUPLICATE_a491_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l996_c6_1ab8
BIN_OP_EQ_uxn_opcodes_h_l996_c6_1ab8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l996_c6_1ab8_left,
BIN_OP_EQ_uxn_opcodes_h_l996_c6_1ab8_right,
BIN_OP_EQ_uxn_opcodes_h_l996_c6_1ab8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l996_c1_35cb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l996_c1_35cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l996_c1_35cb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l996_c1_35cb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l996_c1_35cb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l996_c1_35cb_return_output);

-- n16_MUX_uxn_opcodes_h_l996_c2_81e7
n16_MUX_uxn_opcodes_h_l996_c2_81e7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l996_c2_81e7_cond,
n16_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue,
n16_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse,
n16_MUX_uxn_opcodes_h_l996_c2_81e7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l996_c2_81e7
result_is_stack_write_MUX_uxn_opcodes_h_l996_c2_81e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l996_c2_81e7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l996_c2_81e7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c2_81e7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c2_81e7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c2_81e7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c2_81e7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c2_81e7
result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c2_81e7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c2_81e7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c2_81e7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l996_c2_81e7
result_is_opc_done_MUX_uxn_opcodes_h_l996_c2_81e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l996_c2_81e7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l996_c2_81e7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l996_c2_81e7
result_stack_value_MUX_uxn_opcodes_h_l996_c2_81e7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l996_c2_81e7_cond,
result_stack_value_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l996_c2_81e7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l996_c2_81e7
result_is_sp_shift_MUX_uxn_opcodes_h_l996_c2_81e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l996_c2_81e7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l996_c2_81e7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l996_c2_81e7
tmp16_MUX_uxn_opcodes_h_l996_c2_81e7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l996_c2_81e7_cond,
tmp16_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue,
tmp16_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse,
tmp16_MUX_uxn_opcodes_h_l996_c2_81e7_return_output);

-- t16_MUX_uxn_opcodes_h_l996_c2_81e7
t16_MUX_uxn_opcodes_h_l996_c2_81e7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l996_c2_81e7_cond,
t16_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue,
t16_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse,
t16_MUX_uxn_opcodes_h_l996_c2_81e7_return_output);

-- printf_uxn_opcodes_h_l997_c3_f68d_uxn_opcodes_h_l997_c3_f68d
printf_uxn_opcodes_h_l997_c3_f68d_uxn_opcodes_h_l997_c3_f68d : entity work.printf_uxn_opcodes_h_l997_c3_f68d_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l997_c3_f68d_uxn_opcodes_h_l997_c3_f68d_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9137
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9137 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9137_left,
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9137_right,
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9137_return_output);

-- n16_MUX_uxn_opcodes_h_l1001_c7_d6d5
n16_MUX_uxn_opcodes_h_l1001_c7_d6d5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond,
n16_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue,
n16_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse,
n16_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_d6d5
result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_d6d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_d6d5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_d6d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_d6d5
result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_d6d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1001_c7_d6d5
result_stack_value_MUX_uxn_opcodes_h_l1001_c7_d6d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond,
result_stack_value_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5
result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1001_c7_d6d5
tmp16_MUX_uxn_opcodes_h_l1001_c7_d6d5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond,
tmp16_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue,
tmp16_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse,
tmp16_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output);

-- t16_MUX_uxn_opcodes_h_l1001_c7_d6d5
t16_MUX_uxn_opcodes_h_l1001_c7_d6d5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond,
t16_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue,
t16_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse,
t16_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1004_c11_769f
BIN_OP_EQ_uxn_opcodes_h_l1004_c11_769f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1004_c11_769f_left,
BIN_OP_EQ_uxn_opcodes_h_l1004_c11_769f_right,
BIN_OP_EQ_uxn_opcodes_h_l1004_c11_769f_return_output);

-- n16_MUX_uxn_opcodes_h_l1004_c7_4d76
n16_MUX_uxn_opcodes_h_l1004_c7_4d76 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1004_c7_4d76_cond,
n16_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue,
n16_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse,
n16_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_4d76
result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_4d76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_4d76_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_4d76
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_4d76 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_4d76_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_4d76
result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_4d76 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_4d76_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_4d76
result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_4d76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_4d76_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1004_c7_4d76
result_stack_value_MUX_uxn_opcodes_h_l1004_c7_4d76 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1004_c7_4d76_cond,
result_stack_value_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_4d76
result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_4d76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_4d76_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1004_c7_4d76
tmp16_MUX_uxn_opcodes_h_l1004_c7_4d76 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1004_c7_4d76_cond,
tmp16_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue,
tmp16_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse,
tmp16_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output);

-- t16_MUX_uxn_opcodes_h_l1004_c7_4d76
t16_MUX_uxn_opcodes_h_l1004_c7_4d76 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1004_c7_4d76_cond,
t16_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue,
t16_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse,
t16_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1c54
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1c54 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1c54_left,
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1c54_right,
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1c54_return_output);

-- n16_MUX_uxn_opcodes_h_l1009_c7_525f
n16_MUX_uxn_opcodes_h_l1009_c7_525f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1009_c7_525f_cond,
n16_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue,
n16_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse,
n16_MUX_uxn_opcodes_h_l1009_c7_525f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_525f
result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_525f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_525f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_525f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_525f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_525f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_525f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_525f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_525f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_525f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_525f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_525f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_525f
result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_525f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_525f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_525f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1009_c7_525f
result_stack_value_MUX_uxn_opcodes_h_l1009_c7_525f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1009_c7_525f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1009_c7_525f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_525f
result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_525f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_525f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_525f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1009_c7_525f
tmp16_MUX_uxn_opcodes_h_l1009_c7_525f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1009_c7_525f_cond,
tmp16_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1009_c7_525f_return_output);

-- t16_MUX_uxn_opcodes_h_l1009_c7_525f
t16_MUX_uxn_opcodes_h_l1009_c7_525f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1009_c7_525f_cond,
t16_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue,
t16_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse,
t16_MUX_uxn_opcodes_h_l1009_c7_525f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1012_c11_57d2
BIN_OP_EQ_uxn_opcodes_h_l1012_c11_57d2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1012_c11_57d2_left,
BIN_OP_EQ_uxn_opcodes_h_l1012_c11_57d2_right,
BIN_OP_EQ_uxn_opcodes_h_l1012_c11_57d2_return_output);

-- n16_MUX_uxn_opcodes_h_l1012_c7_7f9a
n16_MUX_uxn_opcodes_h_l1012_c7_7f9a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond,
n16_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue,
n16_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse,
n16_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_7f9a
result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_7f9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_7f9a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_7f9a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_7f9a
result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_7f9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1012_c7_7f9a
result_stack_value_MUX_uxn_opcodes_h_l1012_c7_7f9a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a
result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1012_c7_7f9a
tmp16_MUX_uxn_opcodes_h_l1012_c7_7f9a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond,
tmp16_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output);

-- t16_MUX_uxn_opcodes_h_l1012_c7_7f9a
t16_MUX_uxn_opcodes_h_l1012_c7_7f9a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond,
t16_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue,
t16_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse,
t16_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1013_c3_1a15
BIN_OP_OR_uxn_opcodes_h_l1013_c3_1a15 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1013_c3_1a15_left,
BIN_OP_OR_uxn_opcodes_h_l1013_c3_1a15_right,
BIN_OP_OR_uxn_opcodes_h_l1013_c3_1a15_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1016_c11_e51b
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_e51b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_e51b_left,
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_e51b_right,
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_e51b_return_output);

-- n16_MUX_uxn_opcodes_h_l1016_c7_621f
n16_MUX_uxn_opcodes_h_l1016_c7_621f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1016_c7_621f_cond,
n16_MUX_uxn_opcodes_h_l1016_c7_621f_iftrue,
n16_MUX_uxn_opcodes_h_l1016_c7_621f_iffalse,
n16_MUX_uxn_opcodes_h_l1016_c7_621f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_621f
result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_621f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_621f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_621f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_621f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_621f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_621f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_621f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_621f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_621f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_621f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_621f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_621f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_621f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_621f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_621f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_621f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_621f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_621f
result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_621f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_621f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_621f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_621f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_621f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1016_c7_621f
result_stack_value_MUX_uxn_opcodes_h_l1016_c7_621f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1016_c7_621f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1016_c7_621f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1016_c7_621f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1016_c7_621f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_621f
result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_621f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_621f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_621f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_621f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_621f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1016_c7_621f
tmp16_MUX_uxn_opcodes_h_l1016_c7_621f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1016_c7_621f_cond,
tmp16_MUX_uxn_opcodes_h_l1016_c7_621f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1016_c7_621f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1016_c7_621f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1019_c11_bf2e
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_bf2e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_bf2e_left,
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_bf2e_right,
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_bf2e_return_output);

-- n16_MUX_uxn_opcodes_h_l1019_c7_e7ac
n16_MUX_uxn_opcodes_h_l1019_c7_e7ac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1019_c7_e7ac_cond,
n16_MUX_uxn_opcodes_h_l1019_c7_e7ac_iftrue,
n16_MUX_uxn_opcodes_h_l1019_c7_e7ac_iffalse,
n16_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_e7ac
result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_e7ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_e7ac_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_e7ac_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_e7ac_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_e7ac
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_e7ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_e7ac_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_e7ac_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_e7ac_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac
result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_e7ac
result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_e7ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_e7ac_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_e7ac_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_e7ac_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1019_c7_e7ac
result_stack_value_MUX_uxn_opcodes_h_l1019_c7_e7ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1019_c7_e7ac_cond,
result_stack_value_MUX_uxn_opcodes_h_l1019_c7_e7ac_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1019_c7_e7ac_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac
result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1019_c7_e7ac
tmp16_MUX_uxn_opcodes_h_l1019_c7_e7ac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1019_c7_e7ac_cond,
tmp16_MUX_uxn_opcodes_h_l1019_c7_e7ac_iftrue,
tmp16_MUX_uxn_opcodes_h_l1019_c7_e7ac_iffalse,
tmp16_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1024_c11_0586
BIN_OP_EQ_uxn_opcodes_h_l1024_c11_0586 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1024_c11_0586_left,
BIN_OP_EQ_uxn_opcodes_h_l1024_c11_0586_right,
BIN_OP_EQ_uxn_opcodes_h_l1024_c11_0586_return_output);

-- n16_MUX_uxn_opcodes_h_l1024_c7_a54f
n16_MUX_uxn_opcodes_h_l1024_c7_a54f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1024_c7_a54f_cond,
n16_MUX_uxn_opcodes_h_l1024_c7_a54f_iftrue,
n16_MUX_uxn_opcodes_h_l1024_c7_a54f_iffalse,
n16_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1024_c7_a54f
result_is_stack_write_MUX_uxn_opcodes_h_l1024_c7_a54f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1024_c7_a54f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1024_c7_a54f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1024_c7_a54f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1024_c7_a54f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1024_c7_a54f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1024_c7_a54f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1024_c7_a54f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1024_c7_a54f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1024_c7_a54f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1024_c7_a54f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1024_c7_a54f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1024_c7_a54f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1024_c7_a54f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1024_c7_a54f
result_is_opc_done_MUX_uxn_opcodes_h_l1024_c7_a54f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1024_c7_a54f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1024_c7_a54f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1024_c7_a54f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1024_c7_a54f
result_stack_value_MUX_uxn_opcodes_h_l1024_c7_a54f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1024_c7_a54f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1024_c7_a54f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1024_c7_a54f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1024_c7_a54f
result_is_sp_shift_MUX_uxn_opcodes_h_l1024_c7_a54f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1024_c7_a54f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1024_c7_a54f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1024_c7_a54f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1024_c7_a54f
tmp16_MUX_uxn_opcodes_h_l1024_c7_a54f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1024_c7_a54f_cond,
tmp16_MUX_uxn_opcodes_h_l1024_c7_a54f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1024_c7_a54f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1027_c11_a62b
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_a62b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_a62b_left,
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_a62b_right,
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_a62b_return_output);

-- n16_MUX_uxn_opcodes_h_l1027_c7_2f5c
n16_MUX_uxn_opcodes_h_l1027_c7_2f5c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1027_c7_2f5c_cond,
n16_MUX_uxn_opcodes_h_l1027_c7_2f5c_iftrue,
n16_MUX_uxn_opcodes_h_l1027_c7_2f5c_iffalse,
n16_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2f5c
result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2f5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2f5c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2f5c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2f5c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_2f5c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_2f5c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_2f5c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_2f5c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_2f5c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2f5c
result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2f5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2f5c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2f5c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2f5c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1027_c7_2f5c
result_stack_value_MUX_uxn_opcodes_h_l1027_c7_2f5c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1027_c7_2f5c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1027_c7_2f5c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1027_c7_2f5c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c
result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1027_c7_2f5c
tmp16_MUX_uxn_opcodes_h_l1027_c7_2f5c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1027_c7_2f5c_cond,
tmp16_MUX_uxn_opcodes_h_l1027_c7_2f5c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1027_c7_2f5c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1028_c3_01f8
BIN_OP_OR_uxn_opcodes_h_l1028_c3_01f8 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1028_c3_01f8_left,
BIN_OP_OR_uxn_opcodes_h_l1028_c3_01f8_right,
BIN_OP_OR_uxn_opcodes_h_l1028_c3_01f8_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1029_c11_6576
BIN_OP_AND_uxn_opcodes_h_l1029_c11_6576 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1029_c11_6576_left,
BIN_OP_AND_uxn_opcodes_h_l1029_c11_6576_right,
BIN_OP_AND_uxn_opcodes_h_l1029_c11_6576_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1031_c32_e150
BIN_OP_AND_uxn_opcodes_h_l1031_c32_e150 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1031_c32_e150_left,
BIN_OP_AND_uxn_opcodes_h_l1031_c32_e150_right,
BIN_OP_AND_uxn_opcodes_h_l1031_c32_e150_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1031_c32_2dcc
BIN_OP_GT_uxn_opcodes_h_l1031_c32_2dcc : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1031_c32_2dcc_left,
BIN_OP_GT_uxn_opcodes_h_l1031_c32_2dcc_right,
BIN_OP_GT_uxn_opcodes_h_l1031_c32_2dcc_return_output);

-- MUX_uxn_opcodes_h_l1031_c32_628e
MUX_uxn_opcodes_h_l1031_c32_628e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1031_c32_628e_cond,
MUX_uxn_opcodes_h_l1031_c32_628e_iftrue,
MUX_uxn_opcodes_h_l1031_c32_628e_iffalse,
MUX_uxn_opcodes_h_l1031_c32_628e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1033_c11_f9cc
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_f9cc : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_f9cc_left,
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_f9cc_right,
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_f9cc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1cbd
result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1cbd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1cbd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1cbd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1cbd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1cbd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1cbd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1cbd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1cbd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1cbd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1cbd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1cbd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1cbd
result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1cbd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1cbd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1cbd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1cbd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1cbd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1cbd
result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1cbd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1cbd_cond,
result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1cbd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1cbd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1cbd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1cbd
result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1cbd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1cbd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1cbd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1cbd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1cbd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1039_c11_aae6
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_aae6 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_aae6_left,
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_aae6_right,
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_aae6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_4d91
result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_4d91 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_4d91_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_4d91_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_4d91_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_4d91_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_4d91
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_4d91 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_4d91_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_4d91_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_4d91_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_4d91_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1039_c7_4d91
result_stack_value_MUX_uxn_opcodes_h_l1039_c7_4d91 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1039_c7_4d91_cond,
result_stack_value_MUX_uxn_opcodes_h_l1039_c7_4d91_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1039_c7_4d91_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1039_c7_4d91_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_4d91
result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_4d91 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_4d91_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_4d91_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_4d91_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_4d91_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1041_c34_f8da
CONST_SR_8_uxn_opcodes_h_l1041_c34_f8da : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1041_c34_f8da_x,
CONST_SR_8_uxn_opcodes_h_l1041_c34_f8da_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1043_c11_b086
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_b086 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_b086_left,
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_b086_right,
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_b086_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d215
result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d215 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d215_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d215_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d215_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d215_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d215
result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d215 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d215_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d215_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d215_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d215_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1021_l1006_DUPLICATE_a491
CONST_SL_8_uint16_t_uxn_opcodes_h_l1021_l1006_DUPLICATE_a491 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1021_l1006_DUPLICATE_a491_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1021_l1006_DUPLICATE_a491_return_output);



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
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l996_c6_1ab8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l996_c1_35cb_return_output,
 n16_MUX_uxn_opcodes_h_l996_c2_81e7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l996_c2_81e7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c2_81e7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c2_81e7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l996_c2_81e7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l996_c2_81e7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l996_c2_81e7_return_output,
 tmp16_MUX_uxn_opcodes_h_l996_c2_81e7_return_output,
 t16_MUX_uxn_opcodes_h_l996_c2_81e7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9137_return_output,
 n16_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output,
 tmp16_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output,
 t16_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1004_c11_769f_return_output,
 n16_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output,
 tmp16_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output,
 t16_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1c54_return_output,
 n16_MUX_uxn_opcodes_h_l1009_c7_525f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_525f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_525f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_525f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_525f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1009_c7_525f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_525f_return_output,
 tmp16_MUX_uxn_opcodes_h_l1009_c7_525f_return_output,
 t16_MUX_uxn_opcodes_h_l1009_c7_525f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1012_c11_57d2_return_output,
 n16_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output,
 t16_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1013_c3_1a15_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1016_c11_e51b_return_output,
 n16_MUX_uxn_opcodes_h_l1016_c7_621f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_621f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_621f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_621f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_621f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1016_c7_621f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_621f_return_output,
 tmp16_MUX_uxn_opcodes_h_l1016_c7_621f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1019_c11_bf2e_return_output,
 n16_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output,
 tmp16_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1024_c11_0586_return_output,
 n16_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output,
 tmp16_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1027_c11_a62b_return_output,
 n16_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1028_c3_01f8_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1029_c11_6576_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1031_c32_e150_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1031_c32_2dcc_return_output,
 MUX_uxn_opcodes_h_l1031_c32_628e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1033_c11_f9cc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1cbd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1cbd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1cbd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1cbd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1cbd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1039_c11_aae6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_4d91_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_4d91_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1039_c7_4d91_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_4d91_return_output,
 CONST_SR_8_uxn_opcodes_h_l1041_c34_f8da_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1043_c11_b086_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d215_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d215_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1021_l1006_DUPLICATE_a491_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c6_1ab8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c6_1ab8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c6_1ab8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l996_c1_35cb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l996_c1_35cb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l996_c1_35cb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l996_c1_35cb_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l996_c2_81e7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l996_c2_81e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c2_81e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c2_81e7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l998_c3_4206 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c2_81e7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c2_81e7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c2_81e7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c2_81e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c2_81e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c2_81e7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l996_c2_81e7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l996_c2_81e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c2_81e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c2_81e7_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l996_c2_81e7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l996_c2_81e7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l996_c2_81e7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l996_c2_81e7_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l997_c3_f68d_uxn_opcodes_h_l997_c3_f68d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9137_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9137_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9137_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1002_c3_38be : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_769f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_769f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_769f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1009_c7_525f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1004_c7_4d76_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_525f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_4d76_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1007_c3_52f0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_525f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_4d76_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_525f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_4d76_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_525f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_4d76_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1009_c7_525f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1004_c7_4d76_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_525f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_4d76_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_525f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1004_c7_4d76_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1009_c7_525f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1004_c7_4d76_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1c54_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1c54_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1c54_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1009_c7_525f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_525f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1010_c3_f94d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_525f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_525f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_525f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1009_c7_525f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_525f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_525f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1009_c7_525f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_57d2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_57d2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_57d2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1016_c7_621f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_621f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1014_c3_35e2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_621f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_621f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_621f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_621f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_621f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1016_c7_621f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1013_c3_1a15_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1013_c3_1a15_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1013_c3_1a15_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_e51b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_e51b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_e51b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1016_c7_621f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1016_c7_621f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1016_c7_621f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_621f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_621f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_621f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_621f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1017_c3_6a5a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_621f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_621f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_621f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_621f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_621f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_621f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_621f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_621f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_621f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_621f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_621f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_621f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_621f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_621f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1016_c7_621f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1016_c7_621f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1016_c7_621f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_bf2e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_bf2e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_bf2e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1019_c7_e7ac_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1019_c7_e7ac_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1019_c7_e7ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_e7ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_e7ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_e7ac_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_e7ac_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1022_c3_4632 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_e7ac_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_e7ac_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_e7ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_e7ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_e7ac_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1019_c7_e7ac_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1019_c7_e7ac_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1019_c7_e7ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1019_c7_e7ac_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1019_c7_e7ac_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1019_c7_e7ac_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_0586_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_0586_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_0586_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1024_c7_a54f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1024_c7_a54f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1024_c7_a54f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1024_c7_a54f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1024_c7_a54f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1024_c7_a54f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1024_c7_a54f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1025_c3_5aaa : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1024_c7_a54f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1024_c7_a54f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1024_c7_a54f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1024_c7_a54f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1024_c7_a54f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1024_c7_a54f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1024_c7_a54f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1024_c7_a54f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1024_c7_a54f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1024_c7_a54f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1024_c7_a54f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1024_c7_a54f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1024_c7_a54f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1024_c7_a54f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1024_c7_a54f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1024_c7_a54f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1024_c7_a54f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_a62b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_a62b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_a62b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1027_c7_2f5c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1027_c7_2f5c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1027_c7_2f5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2f5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2f5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1cbd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2f5c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_2f5c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_2f5c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1cbd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_2f5c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2f5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2f5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1cbd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2f5c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1027_c7_2f5c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1027_c7_2f5c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1cbd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1027_c7_2f5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1cbd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_2f5c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_2f5c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_2f5c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1028_c3_01f8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1028_c3_01f8_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1028_c3_01f8_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1029_c11_6576_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1029_c11_6576_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1029_c11_6576_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1031_c32_628e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1031_c32_628e_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1031_c32_628e_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1031_c32_e150_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1031_c32_e150_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1031_c32_e150_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1031_c32_2dcc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1031_c32_2dcc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1031_c32_2dcc_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1031_c32_628e_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_f9cc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_f9cc_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_f9cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1cbd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1cbd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_4d91_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1cbd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1cbd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1036_c3_e5a0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1cbd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_4d91_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1cbd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1cbd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1cbd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_4d91_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1cbd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1cbd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1cbd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1039_c7_4d91_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1cbd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1cbd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1cbd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1cbd_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1037_c24_0dc6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_aae6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_aae6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_aae6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_4d91_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_4d91_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d215_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_4d91_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_4d91_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1040_c3_a2bc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_4d91_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_4d91_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1039_c7_4d91_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1039_c7_4d91_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1039_c7_4d91_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_4d91_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_4d91_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d215_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_4d91_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1041_c34_f8da_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1041_c34_f8da_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1041_c24_1c45_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_b086_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_b086_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_b086_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d215_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d215_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d215_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d215_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d215_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d215_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1043_l1012_l1039_l1009_l1004_l1027_l1001_l1024_l996_l1019_l1016_DUPLICATE_6d82_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1012_l1009_l1004_l1027_l1001_l1024_l996_l1019_l1016_DUPLICATE_eeaf_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1012_l1039_l1009_l1004_l1027_l1001_l1024_l996_l1019_l1016_DUPLICATE_88d7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1012_l1009_l1033_l1004_l1001_l1024_l996_l1019_l1016_DUPLICATE_977f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1043_l1012_l1039_l1009_l1033_l1004_l1027_l1001_l1024_l1019_l1016_DUPLICATE_71c7_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1013_l1005_l1020_l1028_DUPLICATE_b568_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1021_l1006_DUPLICATE_a491_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1021_l1006_DUPLICATE_a491_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1027_l1039_DUPLICATE_a8e7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1048_l992_DUPLICATE_2373_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_0586_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_bf2e_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_57d2_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c6_1ab8_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1002_c3_38be := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1002_c3_38be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_f9cc_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1022_c3_4632 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_e7ac_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1022_c3_4632;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1c54_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_a62b_right := to_unsigned(8, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d215_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1025_c3_5aaa := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1024_c7_a54f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1025_c3_5aaa;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l996_c1_35cb_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_769f_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l1031_c32_628e_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l998_c3_4206 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l998_c3_4206;
     VAR_MUX_uxn_opcodes_h_l1031_c32_628e_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1040_c3_a2bc := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_4d91_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1040_c3_a2bc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9137_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1007_c3_52f0 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1007_c3_52f0;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1017_c3_6a5a := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_621f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1017_c3_6a5a;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_b086_right := to_unsigned(11, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1014_c3_35e2 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1014_c3_35e2;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1010_c3_f94d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1010_c3_f94d;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d215_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1031_c32_e150_right := to_unsigned(128, 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1031_c32_2dcc_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1cbd_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1cbd_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_e51b_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1036_c3_e5a0 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1cbd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1036_c3_e5a0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_aae6_right := to_unsigned(10, 4);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l996_c1_35cb_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1031_c32_e150_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1028_c3_01f8_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1016_c7_621f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1024_c7_a54f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1027_c7_2f5c_iffalse := n16;
     VAR_n16_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9137_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_769f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1c54_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_57d2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_e51b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_bf2e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_0586_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_a62b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_f9cc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_aae6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_b086_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c6_1ab8_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1029_c11_6576_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1013_c3_1a15_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse := t16;
     VAR_t16_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1041_c34_f8da_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1016_c7_621f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1019_c7_e7ac_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1024_c7_a54f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_2f5c_iffalse := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1043_l1012_l1039_l1009_l1033_l1004_l1027_l1001_l1024_l1019_l1016_DUPLICATE_71c7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1043_l1012_l1039_l1009_l1033_l1004_l1027_l1001_l1024_l1019_l1016_DUPLICATE_71c7_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1016_c11_e51b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1016_c11_e51b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_e51b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1016_c11_e51b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_e51b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_e51b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1016_c11_e51b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1012_c11_57d2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1012_c11_57d2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_57d2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1012_c11_57d2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_57d2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_57d2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1012_c11_57d2_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1012_l1009_l1004_l1027_l1001_l1024_l996_l1019_l1016_DUPLICATE_eeaf LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1012_l1009_l1004_l1027_l1001_l1024_l996_l1019_l1016_DUPLICATE_eeaf_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1012_l1009_l1033_l1004_l1001_l1024_l996_l1019_l1016_DUPLICATE_977f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1012_l1009_l1033_l1004_l1001_l1024_l996_l1019_l1016_DUPLICATE_977f_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1019_c11_bf2e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1019_c11_bf2e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_bf2e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1019_c11_bf2e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_bf2e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_bf2e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1019_c11_bf2e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1009_c11_1c54] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1c54_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1c54_left;
     BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1c54_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1c54_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1c54_return_output := BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1c54_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1033_c11_f9cc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1033_c11_f9cc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_f9cc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1033_c11_f9cc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_f9cc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_f9cc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1033_c11_f9cc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1027_c11_a62b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1027_c11_a62b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_a62b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1027_c11_a62b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_a62b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_a62b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1027_c11_a62b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1037_c24_0dc6] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1037_c24_0dc6_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- CONST_SR_8[uxn_opcodes_h_l1041_c34_f8da] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1041_c34_f8da_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1041_c34_f8da_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1041_c34_f8da_return_output := CONST_SR_8_uxn_opcodes_h_l1041_c34_f8da_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1043_c11_b086] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1043_c11_b086_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_b086_left;
     BIN_OP_EQ_uxn_opcodes_h_l1043_c11_b086_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_b086_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_b086_return_output := BIN_OP_EQ_uxn_opcodes_h_l1043_c11_b086_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1013_l1005_l1020_l1028_DUPLICATE_b568 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1013_l1005_l1020_l1028_DUPLICATE_b568_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1027_l1039_DUPLICATE_a8e7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1027_l1039_DUPLICATE_a8e7_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1043_l1012_l1039_l1009_l1004_l1027_l1001_l1024_l996_l1019_l1016_DUPLICATE_6d82 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1043_l1012_l1039_l1009_l1004_l1027_l1001_l1024_l996_l1019_l1016_DUPLICATE_6d82_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1024_c11_0586] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1024_c11_0586_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_0586_left;
     BIN_OP_EQ_uxn_opcodes_h_l1024_c11_0586_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_0586_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_0586_return_output := BIN_OP_EQ_uxn_opcodes_h_l1024_c11_0586_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l996_c6_1ab8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l996_c6_1ab8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c6_1ab8_left;
     BIN_OP_EQ_uxn_opcodes_h_l996_c6_1ab8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c6_1ab8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c6_1ab8_return_output := BIN_OP_EQ_uxn_opcodes_h_l996_c6_1ab8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1004_c11_769f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1004_c11_769f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_769f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1004_c11_769f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_769f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_769f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1004_c11_769f_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1031_c32_e150] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1031_c32_e150_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1031_c32_e150_left;
     BIN_OP_AND_uxn_opcodes_h_l1031_c32_e150_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1031_c32_e150_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1031_c32_e150_return_output := BIN_OP_AND_uxn_opcodes_h_l1031_c32_e150_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1039_c11_aae6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1039_c11_aae6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_aae6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1039_c11_aae6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_aae6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_aae6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1039_c11_aae6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1001_c11_9137] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9137_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9137_left;
     BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9137_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9137_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9137_return_output := BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9137_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1012_l1039_l1009_l1004_l1027_l1001_l1024_l996_l1019_l1016_DUPLICATE_88d7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1012_l1039_l1009_l1004_l1027_l1001_l1024_l996_l1019_l1016_DUPLICATE_88d7_return_output := result.stack_value;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1031_c32_2dcc_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1031_c32_e150_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9137_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9137_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9137_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9137_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9137_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9137_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9137_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9137_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9137_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1004_c7_4d76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_769f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_4d76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_769f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_4d76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_769f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_4d76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_769f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_4d76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_769f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_4d76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_769f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1004_c7_4d76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_769f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1004_c7_4d76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_769f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1004_c7_4d76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_769f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1009_c7_525f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1c54_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_525f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1c54_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_525f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1c54_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_525f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1c54_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_525f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1c54_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_525f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1c54_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1009_c7_525f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1c54_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1009_c7_525f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1c54_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_525f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1c54_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_57d2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_57d2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_57d2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_57d2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_57d2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_57d2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_57d2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_57d2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_57d2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1016_c7_621f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_e51b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_621f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_e51b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_621f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_e51b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_621f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_e51b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_621f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_e51b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_621f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_e51b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_621f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_e51b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1016_c7_621f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_e51b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1019_c7_e7ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_bf2e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_e7ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_bf2e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_bf2e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_e7ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_bf2e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_bf2e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_e7ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_bf2e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1019_c7_e7ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_bf2e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1019_c7_e7ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_bf2e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1024_c7_a54f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_0586_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1024_c7_a54f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_0586_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1024_c7_a54f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_0586_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1024_c7_a54f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_0586_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1024_c7_a54f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_0586_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1024_c7_a54f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_0586_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1024_c7_a54f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_0586_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1024_c7_a54f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_0586_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1027_c7_2f5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_a62b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2f5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_a62b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_a62b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2f5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_a62b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_a62b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_2f5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_a62b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1027_c7_2f5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_a62b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_2f5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_a62b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1cbd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_f9cc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1cbd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_f9cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1cbd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_f9cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1cbd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_f9cc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1cbd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_f9cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_4d91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_aae6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_4d91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_aae6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_4d91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_aae6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1039_c7_4d91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_aae6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d215_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_b086_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d215_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_b086_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l996_c1_35cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c6_1ab8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l996_c2_81e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c6_1ab8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c2_81e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c6_1ab8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c2_81e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c6_1ab8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c2_81e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c6_1ab8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c2_81e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c6_1ab8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c2_81e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c6_1ab8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l996_c2_81e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c6_1ab8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l996_c2_81e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c6_1ab8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l996_c2_81e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c6_1ab8_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1013_c3_1a15_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1013_l1005_l1020_l1028_DUPLICATE_b568_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1028_c3_01f8_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1013_l1005_l1020_l1028_DUPLICATE_b568_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1021_l1006_DUPLICATE_a491_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1013_l1005_l1020_l1028_DUPLICATE_b568_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1cbd_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1037_c24_0dc6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1012_l1009_l1004_l1027_l1001_l1024_l996_l1019_l1016_DUPLICATE_eeaf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1012_l1009_l1004_l1027_l1001_l1024_l996_l1019_l1016_DUPLICATE_eeaf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1012_l1009_l1004_l1027_l1001_l1024_l996_l1019_l1016_DUPLICATE_eeaf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1012_l1009_l1004_l1027_l1001_l1024_l996_l1019_l1016_DUPLICATE_eeaf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_621f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1012_l1009_l1004_l1027_l1001_l1024_l996_l1019_l1016_DUPLICATE_eeaf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1012_l1009_l1004_l1027_l1001_l1024_l996_l1019_l1016_DUPLICATE_eeaf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1024_c7_a54f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1012_l1009_l1004_l1027_l1001_l1024_l996_l1019_l1016_DUPLICATE_eeaf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1012_l1009_l1004_l1027_l1001_l1024_l996_l1019_l1016_DUPLICATE_eeaf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1012_l1009_l1004_l1027_l1001_l1024_l996_l1019_l1016_DUPLICATE_eeaf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1043_l1012_l1039_l1009_l1033_l1004_l1027_l1001_l1024_l1019_l1016_DUPLICATE_71c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1043_l1012_l1039_l1009_l1033_l1004_l1027_l1001_l1024_l1019_l1016_DUPLICATE_71c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1043_l1012_l1039_l1009_l1033_l1004_l1027_l1001_l1024_l1019_l1016_DUPLICATE_71c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1043_l1012_l1039_l1009_l1033_l1004_l1027_l1001_l1024_l1019_l1016_DUPLICATE_71c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_621f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1043_l1012_l1039_l1009_l1033_l1004_l1027_l1001_l1024_l1019_l1016_DUPLICATE_71c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_e7ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1043_l1012_l1039_l1009_l1033_l1004_l1027_l1001_l1024_l1019_l1016_DUPLICATE_71c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1024_c7_a54f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1043_l1012_l1039_l1009_l1033_l1004_l1027_l1001_l1024_l1019_l1016_DUPLICATE_71c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2f5c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1043_l1012_l1039_l1009_l1033_l1004_l1027_l1001_l1024_l1019_l1016_DUPLICATE_71c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1cbd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1043_l1012_l1039_l1009_l1033_l1004_l1027_l1001_l1024_l1019_l1016_DUPLICATE_71c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_4d91_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1043_l1012_l1039_l1009_l1033_l1004_l1027_l1001_l1024_l1019_l1016_DUPLICATE_71c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d215_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1043_l1012_l1039_l1009_l1033_l1004_l1027_l1001_l1024_l1019_l1016_DUPLICATE_71c7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1012_l1009_l1033_l1004_l1001_l1024_l996_l1019_l1016_DUPLICATE_977f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1012_l1009_l1033_l1004_l1001_l1024_l996_l1019_l1016_DUPLICATE_977f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1012_l1009_l1033_l1004_l1001_l1024_l996_l1019_l1016_DUPLICATE_977f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1012_l1009_l1033_l1004_l1001_l1024_l996_l1019_l1016_DUPLICATE_977f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_621f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1012_l1009_l1033_l1004_l1001_l1024_l996_l1019_l1016_DUPLICATE_977f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1012_l1009_l1033_l1004_l1001_l1024_l996_l1019_l1016_DUPLICATE_977f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1024_c7_a54f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1012_l1009_l1033_l1004_l1001_l1024_l996_l1019_l1016_DUPLICATE_977f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1cbd_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1012_l1009_l1033_l1004_l1001_l1024_l996_l1019_l1016_DUPLICATE_977f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1012_l1009_l1033_l1004_l1001_l1024_l996_l1019_l1016_DUPLICATE_977f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1043_l1012_l1039_l1009_l1004_l1027_l1001_l1024_l996_l1019_l1016_DUPLICATE_6d82_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1043_l1012_l1039_l1009_l1004_l1027_l1001_l1024_l996_l1019_l1016_DUPLICATE_6d82_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1043_l1012_l1039_l1009_l1004_l1027_l1001_l1024_l996_l1019_l1016_DUPLICATE_6d82_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1043_l1012_l1039_l1009_l1004_l1027_l1001_l1024_l996_l1019_l1016_DUPLICATE_6d82_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_621f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1043_l1012_l1039_l1009_l1004_l1027_l1001_l1024_l996_l1019_l1016_DUPLICATE_6d82_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_e7ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1043_l1012_l1039_l1009_l1004_l1027_l1001_l1024_l996_l1019_l1016_DUPLICATE_6d82_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1024_c7_a54f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1043_l1012_l1039_l1009_l1004_l1027_l1001_l1024_l996_l1019_l1016_DUPLICATE_6d82_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2f5c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1043_l1012_l1039_l1009_l1004_l1027_l1001_l1024_l996_l1019_l1016_DUPLICATE_6d82_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_4d91_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1043_l1012_l1039_l1009_l1004_l1027_l1001_l1024_l996_l1019_l1016_DUPLICATE_6d82_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d215_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1043_l1012_l1039_l1009_l1004_l1027_l1001_l1024_l996_l1019_l1016_DUPLICATE_6d82_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1043_l1012_l1039_l1009_l1004_l1027_l1001_l1024_l996_l1019_l1016_DUPLICATE_6d82_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_2f5c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1027_l1039_DUPLICATE_a8e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_4d91_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1027_l1039_DUPLICATE_a8e7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1012_l1039_l1009_l1004_l1027_l1001_l1024_l996_l1019_l1016_DUPLICATE_88d7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1012_l1039_l1009_l1004_l1027_l1001_l1024_l996_l1019_l1016_DUPLICATE_88d7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1012_l1039_l1009_l1004_l1027_l1001_l1024_l996_l1019_l1016_DUPLICATE_88d7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1012_l1039_l1009_l1004_l1027_l1001_l1024_l996_l1019_l1016_DUPLICATE_88d7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_621f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1012_l1039_l1009_l1004_l1027_l1001_l1024_l996_l1019_l1016_DUPLICATE_88d7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1019_c7_e7ac_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1012_l1039_l1009_l1004_l1027_l1001_l1024_l996_l1019_l1016_DUPLICATE_88d7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1024_c7_a54f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1012_l1039_l1009_l1004_l1027_l1001_l1024_l996_l1019_l1016_DUPLICATE_88d7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1027_c7_2f5c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1012_l1039_l1009_l1004_l1027_l1001_l1024_l996_l1019_l1016_DUPLICATE_88d7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1039_c7_4d91_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1012_l1039_l1009_l1004_l1027_l1001_l1024_l996_l1019_l1016_DUPLICATE_88d7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1012_l1039_l1009_l1004_l1027_l1001_l1024_l996_l1019_l1016_DUPLICATE_88d7_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1039_c7_4d91] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_4d91_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_4d91_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_4d91_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_4d91_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_4d91_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_4d91_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_4d91_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_4d91_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1031_c32_2dcc] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1031_c32_2dcc_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1031_c32_2dcc_left;
     BIN_OP_GT_uxn_opcodes_h_l1031_c32_2dcc_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1031_c32_2dcc_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1031_c32_2dcc_return_output := BIN_OP_GT_uxn_opcodes_h_l1031_c32_2dcc_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1013_c3_1a15] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1013_c3_1a15_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1013_c3_1a15_left;
     BIN_OP_OR_uxn_opcodes_h_l1013_c3_1a15_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1013_c3_1a15_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1013_c3_1a15_return_output := BIN_OP_OR_uxn_opcodes_h_l1013_c3_1a15_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1028_c3_01f8] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1028_c3_01f8_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1028_c3_01f8_left;
     BIN_OP_OR_uxn_opcodes_h_l1028_c3_01f8_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1028_c3_01f8_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1028_c3_01f8_return_output := BIN_OP_OR_uxn_opcodes_h_l1028_c3_01f8_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1021_l1006_DUPLICATE_a491 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1021_l1006_DUPLICATE_a491_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1021_l1006_DUPLICATE_a491_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1021_l1006_DUPLICATE_a491_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1021_l1006_DUPLICATE_a491_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1033_c7_1cbd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1cbd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1cbd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1cbd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1cbd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1cbd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1cbd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1cbd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1cbd_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1041_c24_1c45] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1041_c24_1c45_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1041_c34_f8da_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1043_c7_d215] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d215_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d215_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d215_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d215_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d215_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d215_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d215_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d215_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l996_c1_35cb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l996_c1_35cb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l996_c1_35cb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l996_c1_35cb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l996_c1_35cb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l996_c1_35cb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l996_c1_35cb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l996_c1_35cb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l996_c1_35cb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1043_c7_d215] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d215_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d215_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d215_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d215_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d215_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d215_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d215_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d215_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1031_c32_628e_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1031_c32_2dcc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1013_c3_1a15_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1029_c11_6576_right := VAR_BIN_OP_OR_uxn_opcodes_h_l1028_c3_01f8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1027_c7_2f5c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1028_c3_01f8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1039_c7_4d91_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1041_c24_1c45_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1019_c7_e7ac_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1021_l1006_DUPLICATE_a491_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1021_l1006_DUPLICATE_a491_return_output;
     VAR_printf_uxn_opcodes_h_l997_c3_f68d_uxn_opcodes_h_l997_c3_f68d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l996_c1_35cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_4d91_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d215_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1cbd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_4d91_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d215_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1cbd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_4d91_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1039_c7_4d91] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_4d91_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_4d91_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_4d91_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_4d91_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_4d91_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_4d91_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_4d91_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_4d91_return_output;

     -- n16_MUX[uxn_opcodes_h_l1027_c7_2f5c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1027_c7_2f5c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1027_c7_2f5c_cond;
     n16_MUX_uxn_opcodes_h_l1027_c7_2f5c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1027_c7_2f5c_iftrue;
     n16_MUX_uxn_opcodes_h_l1027_c7_2f5c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1027_c7_2f5c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output := n16_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1033_c7_1cbd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1cbd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1cbd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1cbd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1cbd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1cbd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1cbd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1cbd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1cbd_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1029_c11_6576] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1029_c11_6576_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1029_c11_6576_left;
     BIN_OP_AND_uxn_opcodes_h_l1029_c11_6576_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1029_c11_6576_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1029_c11_6576_return_output := BIN_OP_AND_uxn_opcodes_h_l1029_c11_6576_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1039_c7_4d91] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_4d91_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_4d91_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_4d91_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_4d91_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_4d91_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_4d91_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_4d91_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_4d91_return_output;

     -- t16_MUX[uxn_opcodes_h_l1012_c7_7f9a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond;
     t16_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue;
     t16_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output := t16_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output;

     -- MUX[uxn_opcodes_h_l1031_c32_628e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1031_c32_628e_cond <= VAR_MUX_uxn_opcodes_h_l1031_c32_628e_cond;
     MUX_uxn_opcodes_h_l1031_c32_628e_iftrue <= VAR_MUX_uxn_opcodes_h_l1031_c32_628e_iftrue;
     MUX_uxn_opcodes_h_l1031_c32_628e_iffalse <= VAR_MUX_uxn_opcodes_h_l1031_c32_628e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1031_c32_628e_return_output := MUX_uxn_opcodes_h_l1031_c32_628e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1027_c7_2f5c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output;

     -- printf_uxn_opcodes_h_l997_c3_f68d[uxn_opcodes_h_l997_c3_f68d] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l997_c3_f68d_uxn_opcodes_h_l997_c3_f68d_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l997_c3_f68d_uxn_opcodes_h_l997_c3_f68d_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_value_MUX[uxn_opcodes_h_l1039_c7_4d91] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1039_c7_4d91_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1039_c7_4d91_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1039_c7_4d91_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1039_c7_4d91_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1039_c7_4d91_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1039_c7_4d91_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1039_c7_4d91_return_output := result_stack_value_MUX_uxn_opcodes_h_l1039_c7_4d91_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_2f5c_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l1029_c11_6576_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c_iftrue := VAR_MUX_uxn_opcodes_h_l1031_c32_628e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1024_c7_a54f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1cbd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_4d91_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1024_c7_a54f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1cbd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_4d91_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_2f5c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1cbd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1cbd_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1039_c7_4d91_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1033_c7_1cbd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1cbd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1cbd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1cbd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1cbd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1cbd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1cbd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1cbd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1cbd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1033_c7_1cbd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1cbd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1cbd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1cbd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1cbd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1cbd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1cbd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1cbd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1cbd_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1033_c7_1cbd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1cbd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1cbd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1cbd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1cbd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1cbd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1cbd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1cbd_return_output := result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1cbd_return_output;

     -- t16_MUX[uxn_opcodes_h_l1009_c7_525f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1009_c7_525f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1009_c7_525f_cond;
     t16_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue;
     t16_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1009_c7_525f_return_output := t16_MUX_uxn_opcodes_h_l1009_c7_525f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1024_c7_a54f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1024_c7_a54f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1024_c7_a54f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1024_c7_a54f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1024_c7_a54f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1024_c7_a54f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1024_c7_a54f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1024_c7_a54f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1024_c7_a54f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1024_c7_a54f_cond;
     n16_MUX_uxn_opcodes_h_l1024_c7_a54f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1024_c7_a54f_iftrue;
     n16_MUX_uxn_opcodes_h_l1024_c7_a54f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1024_c7_a54f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output := n16_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1027_c7_2f5c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1027_c7_2f5c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_2f5c_cond;
     tmp16_MUX_uxn_opcodes_h_l1027_c7_2f5c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_2f5c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1027_c7_2f5c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_2f5c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output := tmp16_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1027_c7_2f5c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_2f5c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_2f5c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_2f5c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_2f5c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_2f5c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_2f5c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1027_c7_2f5c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1019_c7_e7ac_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2f5c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1cbd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2f5c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1cbd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1024_c7_a54f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1024_c7_a54f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1027_c7_2f5c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1cbd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1009_c7_525f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1024_c7_a54f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1024_c7_a54f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1024_c7_a54f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1024_c7_a54f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1024_c7_a54f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1024_c7_a54f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1024_c7_a54f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1024_c7_a54f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1027_c7_2f5c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2f5c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2f5c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2f5c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2f5c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2f5c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2f5c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1004_c7_4d76] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1004_c7_4d76_cond <= VAR_t16_MUX_uxn_opcodes_h_l1004_c7_4d76_cond;
     t16_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue;
     t16_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output := t16_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output;

     -- n16_MUX[uxn_opcodes_h_l1019_c7_e7ac] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1019_c7_e7ac_cond <= VAR_n16_MUX_uxn_opcodes_h_l1019_c7_e7ac_cond;
     n16_MUX_uxn_opcodes_h_l1019_c7_e7ac_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1019_c7_e7ac_iftrue;
     n16_MUX_uxn_opcodes_h_l1019_c7_e7ac_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1019_c7_e7ac_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output := n16_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1024_c7_a54f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1024_c7_a54f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1024_c7_a54f_cond;
     tmp16_MUX_uxn_opcodes_h_l1024_c7_a54f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1024_c7_a54f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1024_c7_a54f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1024_c7_a54f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output := tmp16_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1027_c7_2f5c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1027_c7_2f5c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1027_c7_2f5c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1027_c7_2f5c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1027_c7_2f5c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1027_c7_2f5c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1027_c7_2f5c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1024_c7_a54f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1024_c7_a54f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1024_c7_a54f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1024_c7_a54f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1024_c7_a54f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1024_c7_a54f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1024_c7_a54f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1027_c7_2f5c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2f5c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2f5c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2f5c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2f5c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2f5c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2f5c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1019_c7_e7ac] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1016_c7_621f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1024_c7_a54f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_621f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1024_c7_a54f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_e7ac_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1024_c7_a54f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1027_c7_2f5c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1019_c7_e7ac_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1019_c7_e7ac] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_e7ac_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_e7ac_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_e7ac_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_e7ac_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_e7ac_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_e7ac_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output;

     -- t16_MUX[uxn_opcodes_h_l1001_c7_d6d5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond <= VAR_t16_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond;
     t16_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue;
     t16_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output := t16_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1024_c7_a54f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1024_c7_a54f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1024_c7_a54f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1024_c7_a54f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1024_c7_a54f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1024_c7_a54f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1024_c7_a54f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1024_c7_a54f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1024_c7_a54f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1024_c7_a54f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1024_c7_a54f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1024_c7_a54f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1024_c7_a54f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1024_c7_a54f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1019_c7_e7ac] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output;

     -- n16_MUX[uxn_opcodes_h_l1016_c7_621f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1016_c7_621f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1016_c7_621f_cond;
     n16_MUX_uxn_opcodes_h_l1016_c7_621f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1016_c7_621f_iftrue;
     n16_MUX_uxn_opcodes_h_l1016_c7_621f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1016_c7_621f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1016_c7_621f_return_output := n16_MUX_uxn_opcodes_h_l1016_c7_621f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1019_c7_e7ac] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1019_c7_e7ac_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1019_c7_e7ac_cond;
     tmp16_MUX_uxn_opcodes_h_l1019_c7_e7ac_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1019_c7_e7ac_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1019_c7_e7ac_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1019_c7_e7ac_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output := tmp16_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1024_c7_a54f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1024_c7_a54f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1024_c7_a54f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1024_c7_a54f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1024_c7_a54f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1024_c7_a54f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1024_c7_a54f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1016_c7_621f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_621f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_621f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_621f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_621f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_621f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_621f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_621f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_621f_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1016_c7_621f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_e7ac_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_621f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_e7ac_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_621f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_621f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1019_c7_e7ac_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1024_c7_a54f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1016_c7_621f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output;
     -- n16_MUX[uxn_opcodes_h_l1012_c7_7f9a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond;
     n16_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue;
     n16_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output := n16_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1016_c7_621f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_621f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_621f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_621f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_621f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_621f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_621f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_621f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_621f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1016_c7_621f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1016_c7_621f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1016_c7_621f_cond;
     tmp16_MUX_uxn_opcodes_h_l1016_c7_621f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1016_c7_621f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1016_c7_621f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1016_c7_621f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1016_c7_621f_return_output := tmp16_MUX_uxn_opcodes_h_l1016_c7_621f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1019_c7_e7ac] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_e7ac_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_e7ac_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_e7ac_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_e7ac_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_e7ac_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_e7ac_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1016_c7_621f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_621f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_621f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_621f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_621f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_621f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_621f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_621f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_621f_return_output;

     -- t16_MUX[uxn_opcodes_h_l996_c2_81e7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l996_c2_81e7_cond <= VAR_t16_MUX_uxn_opcodes_h_l996_c2_81e7_cond;
     t16_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue;
     t16_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l996_c2_81e7_return_output := t16_MUX_uxn_opcodes_h_l996_c2_81e7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1019_c7_e7ac] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1019_c7_e7ac_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1019_c7_e7ac_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1019_c7_e7ac_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1019_c7_e7ac_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1019_c7_e7ac_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1019_c7_e7ac_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output := result_stack_value_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1012_c7_7f9a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1019_c7_e7ac] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_e7ac_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_e7ac_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_e7ac_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_e7ac_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_e7ac_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_e7ac_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_621f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_621f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_621f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_621f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_621f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1019_c7_e7ac_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l996_c2_81e7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1016_c7_621f_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1012_c7_7f9a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond;
     tmp16_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output := tmp16_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1012_c7_7f9a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1016_c7_621f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_621f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_621f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_621f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_621f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_621f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_621f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_621f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_621f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1012_c7_7f9a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1009_c7_525f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1009_c7_525f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1009_c7_525f_cond;
     n16_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue;
     n16_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1009_c7_525f_return_output := n16_MUX_uxn_opcodes_h_l1009_c7_525f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1016_c7_621f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_621f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_621f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_621f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_621f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_621f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_621f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_621f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_621f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1016_c7_621f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1016_c7_621f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_621f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1016_c7_621f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_621f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1016_c7_621f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_621f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_621f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1016_c7_621f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1009_c7_525f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_525f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_525f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_525f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_525f_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1009_c7_525f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_621f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_525f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_621f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_621f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1012_c7_7f9a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1009_c7_525f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1009_c7_525f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_525f_cond;
     tmp16_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_525f_return_output := tmp16_MUX_uxn_opcodes_h_l1009_c7_525f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1004_c7_4d76] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_4d76_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_4d76_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1009_c7_525f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_525f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_525f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_525f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_525f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1012_c7_7f9a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1012_c7_7f9a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1012_c7_7f9a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1012_c7_7f9a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1012_c7_7f9a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1004_c7_4d76] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1004_c7_4d76_cond <= VAR_n16_MUX_uxn_opcodes_h_l1004_c7_4d76_cond;
     n16_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue;
     n16_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output := n16_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1009_c7_525f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_525f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_525f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_525f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_525f_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_525f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_525f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1012_c7_7f9a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_525f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1009_c7_525f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_525f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_525f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_525f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_525f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1009_c7_525f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1009_c7_525f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1009_c7_525f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1009_c7_525f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1009_c7_525f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1004_c7_4d76] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1004_c7_4d76_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1004_c7_4d76_cond;
     tmp16_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output := tmp16_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1001_c7_d6d5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1004_c7_4d76] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_4d76_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_4d76_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output;

     -- n16_MUX[uxn_opcodes_h_l1001_c7_d6d5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond <= VAR_n16_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond;
     n16_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue;
     n16_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output := n16_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1004_c7_4d76] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_4d76_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_4d76_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1009_c7_525f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_525f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_525f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_525f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_525f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_525f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_525f_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_525f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_525f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1009_c7_525f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1004_c7_4d76] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_4d76_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_4d76_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output;

     -- n16_MUX[uxn_opcodes_h_l996_c2_81e7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l996_c2_81e7_cond <= VAR_n16_MUX_uxn_opcodes_h_l996_c2_81e7_cond;
     n16_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue;
     n16_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l996_c2_81e7_return_output := n16_MUX_uxn_opcodes_h_l996_c2_81e7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1001_c7_d6d5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond;
     tmp16_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output := tmp16_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1001_c7_d6d5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1001_c7_d6d5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1004_c7_4d76] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1004_c7_4d76_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1004_c7_4d76_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output := result_stack_value_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1004_c7_4d76] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_4d76_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_4d76_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_4d76_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_4d76_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l996_c2_81e7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l996_c2_81e7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c2_81e7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c2_81e7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l996_c2_81e7_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l996_c2_81e7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1004_c7_4d76_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1001_c7_d6d5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output := result_stack_value_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1001_c7_d6d5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l996_c2_81e7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l996_c2_81e7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l996_c2_81e7_cond;
     tmp16_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l996_c2_81e7_return_output := tmp16_MUX_uxn_opcodes_h_l996_c2_81e7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l996_c2_81e7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c2_81e7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c2_81e7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c2_81e7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c2_81e7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l996_c2_81e7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c2_81e7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c2_81e7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c2_81e7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c2_81e7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1001_c7_d6d5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_d6d5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_d6d5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_d6d5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1001_c7_d6d5_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l996_c2_81e7_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l996_c2_81e7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l996_c2_81e7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c2_81e7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c2_81e7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l996_c2_81e7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l996_c2_81e7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l996_c2_81e7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c2_81e7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c2_81e7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l996_c2_81e7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l996_c2_81e7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l996_c2_81e7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l996_c2_81e7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l996_c2_81e7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l996_c2_81e7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l996_c2_81e7_return_output := result_stack_value_MUX_uxn_opcodes_h_l996_c2_81e7_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1048_l992_DUPLICATE_2373 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1048_l992_DUPLICATE_2373_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_53ff(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c2_81e7_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c2_81e7_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c2_81e7_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c2_81e7_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l996_c2_81e7_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c2_81e7_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1048_l992_DUPLICATE_2373_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1048_l992_DUPLICATE_2373_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
