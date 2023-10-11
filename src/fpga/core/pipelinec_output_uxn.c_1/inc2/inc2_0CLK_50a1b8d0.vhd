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
-- Submodules: 72
entity inc2_0CLK_50a1b8d0 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end inc2_0CLK_50a1b8d0;
architecture arch of inc2_0CLK_50a1b8d0 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1464_c6_a602]
signal BIN_OP_EQ_uxn_opcodes_h_l1464_c6_a602_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1464_c6_a602_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1464_c6_a602_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1464_c1_5cd8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1464_c1_5cd8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1464_c1_5cd8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1464_c1_5cd8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1464_c1_5cd8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1464_c2_fef0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1464_c2_fef0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1464_c2_fef0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1464_c2_fef0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1464_c2_fef0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c2_fef0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c2_fef0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c2_fef0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1464_c2_fef0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c2_fef0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c2_fef0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c2_fef0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1464_c2_fef0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1464_c2_fef0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1464_c2_fef0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1464_c2_fef0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1464_c2_fef0]
signal result_stack_value_MUX_uxn_opcodes_h_l1464_c2_fef0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1464_c2_fef0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1464_c2_fef0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1464_c2_fef0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c2_fef0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c2_fef0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c2_fef0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1464_c2_fef0]
signal tmp16_MUX_uxn_opcodes_h_l1464_c2_fef0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1464_c2_fef0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1464_c2_fef0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1464_c2_fef0]
signal t16_MUX_uxn_opcodes_h_l1464_c2_fef0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1464_c2_fef0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1464_c2_fef0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1465_c3_75a2[uxn_opcodes_h_l1465_c3_75a2]
signal printf_uxn_opcodes_h_l1465_c3_75a2_uxn_opcodes_h_l1465_c3_75a2_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1469_c11_80ca]
signal BIN_OP_EQ_uxn_opcodes_h_l1469_c11_80ca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1469_c11_80ca_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1469_c11_80ca_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1469_c7_d10b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_d10b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_d10b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_d10b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1469_c7_d10b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_d10b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_d10b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_d10b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1469_c7_d10b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_d10b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_d10b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_d10b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1469_c7_d10b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_d10b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_d10b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_d10b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1469_c7_d10b]
signal result_stack_value_MUX_uxn_opcodes_h_l1469_c7_d10b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1469_c7_d10b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1469_c7_d10b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1469_c7_d10b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_d10b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_d10b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_d10b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1469_c7_d10b]
signal tmp16_MUX_uxn_opcodes_h_l1469_c7_d10b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1469_c7_d10b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1469_c7_d10b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1469_c7_d10b]
signal t16_MUX_uxn_opcodes_h_l1469_c7_d10b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1469_c7_d10b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1469_c7_d10b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1472_c11_c6ff]
signal BIN_OP_EQ_uxn_opcodes_h_l1472_c11_c6ff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1472_c11_c6ff_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1472_c11_c6ff_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1472_c7_3256]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_3256_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_3256_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_3256_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_3256_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1472_c7_3256]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1472_c7_3256_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1472_c7_3256_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1472_c7_3256_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1472_c7_3256_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1472_c7_3256]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1472_c7_3256_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1472_c7_3256_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1472_c7_3256_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1472_c7_3256_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1472_c7_3256]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_3256_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_3256_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_3256_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_3256_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1472_c7_3256]
signal result_stack_value_MUX_uxn_opcodes_h_l1472_c7_3256_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1472_c7_3256_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1472_c7_3256_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1472_c7_3256_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1472_c7_3256]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1472_c7_3256_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1472_c7_3256_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1472_c7_3256_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1472_c7_3256_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1472_c7_3256]
signal tmp16_MUX_uxn_opcodes_h_l1472_c7_3256_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1472_c7_3256_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1472_c7_3256_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1472_c7_3256_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1472_c7_3256]
signal t16_MUX_uxn_opcodes_h_l1472_c7_3256_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1472_c7_3256_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1472_c7_3256_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1472_c7_3256_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1474_c3_842e]
signal CONST_SL_8_uxn_opcodes_h_l1474_c3_842e_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1474_c3_842e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1477_c11_5b7c]
signal BIN_OP_EQ_uxn_opcodes_h_l1477_c11_5b7c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1477_c11_5b7c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1477_c11_5b7c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1477_c7_85cc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_85cc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_85cc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_85cc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1477_c7_85cc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_85cc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_85cc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_85cc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1477_c7_85cc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_85cc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_85cc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_85cc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1477_c7_85cc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_85cc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_85cc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_85cc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1477_c7_85cc]
signal result_stack_value_MUX_uxn_opcodes_h_l1477_c7_85cc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1477_c7_85cc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1477_c7_85cc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1477_c7_85cc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_85cc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_85cc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_85cc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1477_c7_85cc]
signal tmp16_MUX_uxn_opcodes_h_l1477_c7_85cc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1477_c7_85cc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1477_c7_85cc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1477_c7_85cc]
signal t16_MUX_uxn_opcodes_h_l1477_c7_85cc_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1477_c7_85cc_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1477_c7_85cc_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1480_c11_e2d7]
signal BIN_OP_EQ_uxn_opcodes_h_l1480_c11_e2d7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1480_c11_e2d7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1480_c11_e2d7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1480_c7_46a2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_46a2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_46a2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_46a2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1480_c7_46a2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_46a2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_46a2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_46a2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1480_c7_46a2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_46a2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_46a2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_46a2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1480_c7_46a2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_46a2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_46a2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_46a2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1480_c7_46a2]
signal result_stack_value_MUX_uxn_opcodes_h_l1480_c7_46a2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1480_c7_46a2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1480_c7_46a2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1480_c7_46a2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_46a2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_46a2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_46a2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1480_c7_46a2]
signal tmp16_MUX_uxn_opcodes_h_l1480_c7_46a2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1480_c7_46a2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1480_c7_46a2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1480_c7_46a2]
signal t16_MUX_uxn_opcodes_h_l1480_c7_46a2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1480_c7_46a2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1480_c7_46a2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1481_c3_1a00]
signal BIN_OP_OR_uxn_opcodes_h_l1481_c3_1a00_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1481_c3_1a00_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1481_c3_1a00_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1482_c11_5102]
signal BIN_OP_PLUS_uxn_opcodes_h_l1482_c11_5102_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1482_c11_5102_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1482_c11_5102_return_output : unsigned(16 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1484_c32_852f]
signal BIN_OP_AND_uxn_opcodes_h_l1484_c32_852f_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1484_c32_852f_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1484_c32_852f_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1484_c32_5dfd]
signal BIN_OP_GT_uxn_opcodes_h_l1484_c32_5dfd_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1484_c32_5dfd_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1484_c32_5dfd_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1484_c32_b669]
signal MUX_uxn_opcodes_h_l1484_c32_b669_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1484_c32_b669_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1484_c32_b669_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1484_c32_b669_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1486_c11_03dd]
signal BIN_OP_EQ_uxn_opcodes_h_l1486_c11_03dd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1486_c11_03dd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1486_c11_03dd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1486_c7_ee8f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1486_c7_ee8f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1486_c7_ee8f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1486_c7_ee8f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1486_c7_ee8f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1486_c7_ee8f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1486_c7_ee8f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1486_c7_ee8f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1486_c7_ee8f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1486_c7_ee8f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1486_c7_ee8f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1486_c7_ee8f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1486_c7_ee8f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1486_c7_ee8f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1486_c7_ee8f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1486_c7_ee8f]
signal result_stack_value_MUX_uxn_opcodes_h_l1486_c7_ee8f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1486_c7_ee8f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1486_c7_ee8f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1486_c7_ee8f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1486_c7_ee8f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1486_c7_ee8f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1486_c7_ee8f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1486_c7_ee8f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1486_c7_ee8f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1492_c11_cf40]
signal BIN_OP_EQ_uxn_opcodes_h_l1492_c11_cf40_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1492_c11_cf40_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1492_c11_cf40_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1492_c7_52ef]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_52ef_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_52ef_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_52ef_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_52ef_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1492_c7_52ef]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_52ef_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_52ef_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_52ef_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_52ef_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1492_c7_52ef]
signal result_stack_value_MUX_uxn_opcodes_h_l1492_c7_52ef_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1492_c7_52ef_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1492_c7_52ef_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1492_c7_52ef_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1492_c7_52ef]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_52ef_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_52ef_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_52ef_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_52ef_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1494_c34_96a6]
signal CONST_SR_8_uxn_opcodes_h_l1494_c34_96a6_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1494_c34_96a6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1496_c11_e9f8]
signal BIN_OP_EQ_uxn_opcodes_h_l1496_c11_e9f8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1496_c11_e9f8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1496_c11_e9f8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1496_c7_705c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_705c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_705c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_705c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_705c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1496_c7_705c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_705c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_705c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_705c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_705c_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1464_c6_a602
BIN_OP_EQ_uxn_opcodes_h_l1464_c6_a602 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1464_c6_a602_left,
BIN_OP_EQ_uxn_opcodes_h_l1464_c6_a602_right,
BIN_OP_EQ_uxn_opcodes_h_l1464_c6_a602_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1464_c1_5cd8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1464_c1_5cd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1464_c1_5cd8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1464_c1_5cd8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1464_c1_5cd8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1464_c1_5cd8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1464_c2_fef0
result_is_stack_write_MUX_uxn_opcodes_h_l1464_c2_fef0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1464_c2_fef0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1464_c2_fef0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1464_c2_fef0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c2_fef0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c2_fef0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c2_fef0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c2_fef0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c2_fef0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c2_fef0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c2_fef0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c2_fef0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c2_fef0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c2_fef0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1464_c2_fef0
result_is_opc_done_MUX_uxn_opcodes_h_l1464_c2_fef0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1464_c2_fef0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1464_c2_fef0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1464_c2_fef0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1464_c2_fef0
result_stack_value_MUX_uxn_opcodes_h_l1464_c2_fef0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1464_c2_fef0_cond,
result_stack_value_MUX_uxn_opcodes_h_l1464_c2_fef0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1464_c2_fef0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c2_fef0
result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c2_fef0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c2_fef0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c2_fef0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c2_fef0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1464_c2_fef0
tmp16_MUX_uxn_opcodes_h_l1464_c2_fef0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1464_c2_fef0_cond,
tmp16_MUX_uxn_opcodes_h_l1464_c2_fef0_iftrue,
tmp16_MUX_uxn_opcodes_h_l1464_c2_fef0_iffalse,
tmp16_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output);

-- t16_MUX_uxn_opcodes_h_l1464_c2_fef0
t16_MUX_uxn_opcodes_h_l1464_c2_fef0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1464_c2_fef0_cond,
t16_MUX_uxn_opcodes_h_l1464_c2_fef0_iftrue,
t16_MUX_uxn_opcodes_h_l1464_c2_fef0_iffalse,
t16_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output);

-- printf_uxn_opcodes_h_l1465_c3_75a2_uxn_opcodes_h_l1465_c3_75a2
printf_uxn_opcodes_h_l1465_c3_75a2_uxn_opcodes_h_l1465_c3_75a2 : entity work.printf_uxn_opcodes_h_l1465_c3_75a2_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1465_c3_75a2_uxn_opcodes_h_l1465_c3_75a2_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1469_c11_80ca
BIN_OP_EQ_uxn_opcodes_h_l1469_c11_80ca : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1469_c11_80ca_left,
BIN_OP_EQ_uxn_opcodes_h_l1469_c11_80ca_right,
BIN_OP_EQ_uxn_opcodes_h_l1469_c11_80ca_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_d10b
result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_d10b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_d10b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_d10b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_d10b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_d10b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_d10b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_d10b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_d10b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_d10b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_d10b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_d10b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_d10b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_d10b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_d10b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_d10b
result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_d10b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_d10b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_d10b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_d10b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1469_c7_d10b
result_stack_value_MUX_uxn_opcodes_h_l1469_c7_d10b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1469_c7_d10b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1469_c7_d10b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1469_c7_d10b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_d10b
result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_d10b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_d10b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_d10b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_d10b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1469_c7_d10b
tmp16_MUX_uxn_opcodes_h_l1469_c7_d10b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1469_c7_d10b_cond,
tmp16_MUX_uxn_opcodes_h_l1469_c7_d10b_iftrue,
tmp16_MUX_uxn_opcodes_h_l1469_c7_d10b_iffalse,
tmp16_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output);

-- t16_MUX_uxn_opcodes_h_l1469_c7_d10b
t16_MUX_uxn_opcodes_h_l1469_c7_d10b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1469_c7_d10b_cond,
t16_MUX_uxn_opcodes_h_l1469_c7_d10b_iftrue,
t16_MUX_uxn_opcodes_h_l1469_c7_d10b_iffalse,
t16_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1472_c11_c6ff
BIN_OP_EQ_uxn_opcodes_h_l1472_c11_c6ff : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1472_c11_c6ff_left,
BIN_OP_EQ_uxn_opcodes_h_l1472_c11_c6ff_right,
BIN_OP_EQ_uxn_opcodes_h_l1472_c11_c6ff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_3256
result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_3256 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_3256_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_3256_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_3256_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_3256_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1472_c7_3256
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1472_c7_3256 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1472_c7_3256_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1472_c7_3256_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1472_c7_3256_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1472_c7_3256_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1472_c7_3256
result_sp_relative_shift_MUX_uxn_opcodes_h_l1472_c7_3256 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1472_c7_3256_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1472_c7_3256_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1472_c7_3256_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1472_c7_3256_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_3256
result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_3256 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_3256_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_3256_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_3256_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_3256_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1472_c7_3256
result_stack_value_MUX_uxn_opcodes_h_l1472_c7_3256 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1472_c7_3256_cond,
result_stack_value_MUX_uxn_opcodes_h_l1472_c7_3256_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1472_c7_3256_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1472_c7_3256_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1472_c7_3256
result_is_sp_shift_MUX_uxn_opcodes_h_l1472_c7_3256 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1472_c7_3256_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1472_c7_3256_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1472_c7_3256_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1472_c7_3256_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1472_c7_3256
tmp16_MUX_uxn_opcodes_h_l1472_c7_3256 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1472_c7_3256_cond,
tmp16_MUX_uxn_opcodes_h_l1472_c7_3256_iftrue,
tmp16_MUX_uxn_opcodes_h_l1472_c7_3256_iffalse,
tmp16_MUX_uxn_opcodes_h_l1472_c7_3256_return_output);

-- t16_MUX_uxn_opcodes_h_l1472_c7_3256
t16_MUX_uxn_opcodes_h_l1472_c7_3256 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1472_c7_3256_cond,
t16_MUX_uxn_opcodes_h_l1472_c7_3256_iftrue,
t16_MUX_uxn_opcodes_h_l1472_c7_3256_iffalse,
t16_MUX_uxn_opcodes_h_l1472_c7_3256_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1474_c3_842e
CONST_SL_8_uxn_opcodes_h_l1474_c3_842e : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1474_c3_842e_x,
CONST_SL_8_uxn_opcodes_h_l1474_c3_842e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1477_c11_5b7c
BIN_OP_EQ_uxn_opcodes_h_l1477_c11_5b7c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1477_c11_5b7c_left,
BIN_OP_EQ_uxn_opcodes_h_l1477_c11_5b7c_right,
BIN_OP_EQ_uxn_opcodes_h_l1477_c11_5b7c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_85cc
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_85cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_85cc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_85cc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_85cc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_85cc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_85cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_85cc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_85cc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_85cc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_85cc
result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_85cc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_85cc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_85cc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_85cc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_85cc
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_85cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_85cc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_85cc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_85cc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1477_c7_85cc
result_stack_value_MUX_uxn_opcodes_h_l1477_c7_85cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1477_c7_85cc_cond,
result_stack_value_MUX_uxn_opcodes_h_l1477_c7_85cc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1477_c7_85cc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_85cc
result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_85cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_85cc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_85cc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_85cc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1477_c7_85cc
tmp16_MUX_uxn_opcodes_h_l1477_c7_85cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1477_c7_85cc_cond,
tmp16_MUX_uxn_opcodes_h_l1477_c7_85cc_iftrue,
tmp16_MUX_uxn_opcodes_h_l1477_c7_85cc_iffalse,
tmp16_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output);

-- t16_MUX_uxn_opcodes_h_l1477_c7_85cc
t16_MUX_uxn_opcodes_h_l1477_c7_85cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1477_c7_85cc_cond,
t16_MUX_uxn_opcodes_h_l1477_c7_85cc_iftrue,
t16_MUX_uxn_opcodes_h_l1477_c7_85cc_iffalse,
t16_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1480_c11_e2d7
BIN_OP_EQ_uxn_opcodes_h_l1480_c11_e2d7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1480_c11_e2d7_left,
BIN_OP_EQ_uxn_opcodes_h_l1480_c11_e2d7_right,
BIN_OP_EQ_uxn_opcodes_h_l1480_c11_e2d7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_46a2
result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_46a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_46a2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_46a2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_46a2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_46a2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_46a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_46a2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_46a2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_46a2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_46a2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_46a2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_46a2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_46a2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_46a2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_46a2
result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_46a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_46a2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_46a2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_46a2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1480_c7_46a2
result_stack_value_MUX_uxn_opcodes_h_l1480_c7_46a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1480_c7_46a2_cond,
result_stack_value_MUX_uxn_opcodes_h_l1480_c7_46a2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1480_c7_46a2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_46a2
result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_46a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_46a2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_46a2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_46a2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1480_c7_46a2
tmp16_MUX_uxn_opcodes_h_l1480_c7_46a2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1480_c7_46a2_cond,
tmp16_MUX_uxn_opcodes_h_l1480_c7_46a2_iftrue,
tmp16_MUX_uxn_opcodes_h_l1480_c7_46a2_iffalse,
tmp16_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output);

-- t16_MUX_uxn_opcodes_h_l1480_c7_46a2
t16_MUX_uxn_opcodes_h_l1480_c7_46a2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1480_c7_46a2_cond,
t16_MUX_uxn_opcodes_h_l1480_c7_46a2_iftrue,
t16_MUX_uxn_opcodes_h_l1480_c7_46a2_iffalse,
t16_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1481_c3_1a00
BIN_OP_OR_uxn_opcodes_h_l1481_c3_1a00 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1481_c3_1a00_left,
BIN_OP_OR_uxn_opcodes_h_l1481_c3_1a00_right,
BIN_OP_OR_uxn_opcodes_h_l1481_c3_1a00_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1482_c11_5102
BIN_OP_PLUS_uxn_opcodes_h_l1482_c11_5102 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1482_c11_5102_left,
BIN_OP_PLUS_uxn_opcodes_h_l1482_c11_5102_right,
BIN_OP_PLUS_uxn_opcodes_h_l1482_c11_5102_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1484_c32_852f
BIN_OP_AND_uxn_opcodes_h_l1484_c32_852f : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1484_c32_852f_left,
BIN_OP_AND_uxn_opcodes_h_l1484_c32_852f_right,
BIN_OP_AND_uxn_opcodes_h_l1484_c32_852f_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1484_c32_5dfd
BIN_OP_GT_uxn_opcodes_h_l1484_c32_5dfd : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1484_c32_5dfd_left,
BIN_OP_GT_uxn_opcodes_h_l1484_c32_5dfd_right,
BIN_OP_GT_uxn_opcodes_h_l1484_c32_5dfd_return_output);

-- MUX_uxn_opcodes_h_l1484_c32_b669
MUX_uxn_opcodes_h_l1484_c32_b669 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1484_c32_b669_cond,
MUX_uxn_opcodes_h_l1484_c32_b669_iftrue,
MUX_uxn_opcodes_h_l1484_c32_b669_iffalse,
MUX_uxn_opcodes_h_l1484_c32_b669_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1486_c11_03dd
BIN_OP_EQ_uxn_opcodes_h_l1486_c11_03dd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1486_c11_03dd_left,
BIN_OP_EQ_uxn_opcodes_h_l1486_c11_03dd_right,
BIN_OP_EQ_uxn_opcodes_h_l1486_c11_03dd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1486_c7_ee8f
result_is_stack_write_MUX_uxn_opcodes_h_l1486_c7_ee8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1486_c7_ee8f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1486_c7_ee8f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1486_c7_ee8f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1486_c7_ee8f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1486_c7_ee8f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1486_c7_ee8f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1486_c7_ee8f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1486_c7_ee8f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1486_c7_ee8f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1486_c7_ee8f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1486_c7_ee8f
result_is_opc_done_MUX_uxn_opcodes_h_l1486_c7_ee8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1486_c7_ee8f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1486_c7_ee8f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1486_c7_ee8f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1486_c7_ee8f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1486_c7_ee8f
result_stack_value_MUX_uxn_opcodes_h_l1486_c7_ee8f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1486_c7_ee8f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1486_c7_ee8f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1486_c7_ee8f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1486_c7_ee8f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1486_c7_ee8f
result_is_sp_shift_MUX_uxn_opcodes_h_l1486_c7_ee8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1486_c7_ee8f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1486_c7_ee8f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1486_c7_ee8f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1486_c7_ee8f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1492_c11_cf40
BIN_OP_EQ_uxn_opcodes_h_l1492_c11_cf40 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1492_c11_cf40_left,
BIN_OP_EQ_uxn_opcodes_h_l1492_c11_cf40_right,
BIN_OP_EQ_uxn_opcodes_h_l1492_c11_cf40_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_52ef
result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_52ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_52ef_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_52ef_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_52ef_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_52ef_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_52ef
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_52ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_52ef_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_52ef_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_52ef_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_52ef_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1492_c7_52ef
result_stack_value_MUX_uxn_opcodes_h_l1492_c7_52ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1492_c7_52ef_cond,
result_stack_value_MUX_uxn_opcodes_h_l1492_c7_52ef_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1492_c7_52ef_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1492_c7_52ef_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_52ef
result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_52ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_52ef_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_52ef_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_52ef_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_52ef_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1494_c34_96a6
CONST_SR_8_uxn_opcodes_h_l1494_c34_96a6 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1494_c34_96a6_x,
CONST_SR_8_uxn_opcodes_h_l1494_c34_96a6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1496_c11_e9f8
BIN_OP_EQ_uxn_opcodes_h_l1496_c11_e9f8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1496_c11_e9f8_left,
BIN_OP_EQ_uxn_opcodes_h_l1496_c11_e9f8_right,
BIN_OP_EQ_uxn_opcodes_h_l1496_c11_e9f8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_705c
result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_705c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_705c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_705c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_705c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_705c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_705c
result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_705c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_705c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_705c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_705c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_705c_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1464_c6_a602_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1464_c1_5cd8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output,
 tmp16_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output,
 t16_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1469_c11_80ca_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output,
 tmp16_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output,
 t16_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1472_c11_c6ff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_3256_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1472_c7_3256_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1472_c7_3256_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_3256_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1472_c7_3256_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1472_c7_3256_return_output,
 tmp16_MUX_uxn_opcodes_h_l1472_c7_3256_return_output,
 t16_MUX_uxn_opcodes_h_l1472_c7_3256_return_output,
 CONST_SL_8_uxn_opcodes_h_l1474_c3_842e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1477_c11_5b7c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output,
 tmp16_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output,
 t16_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1480_c11_e2d7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output,
 tmp16_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output,
 t16_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1481_c3_1a00_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1482_c11_5102_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1484_c32_852f_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1484_c32_5dfd_return_output,
 MUX_uxn_opcodes_h_l1484_c32_b669_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1486_c11_03dd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1486_c7_ee8f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1486_c7_ee8f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1486_c7_ee8f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1486_c7_ee8f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1486_c7_ee8f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1492_c11_cf40_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_52ef_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_52ef_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1492_c7_52ef_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_52ef_return_output,
 CONST_SR_8_uxn_opcodes_h_l1494_c34_96a6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1496_c11_e9f8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_705c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_705c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c6_a602_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c6_a602_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c6_a602_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1464_c1_5cd8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1464_c1_5cd8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1464_c1_5cd8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1464_c1_5cd8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1464_c2_fef0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1464_c2_fef0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1464_c2_fef0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c2_fef0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1466_c3_c0ca : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c2_fef0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c2_fef0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c2_fef0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c2_fef0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c2_fef0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1464_c2_fef0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1464_c2_fef0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1464_c2_fef0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1464_c2_fef0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1464_c2_fef0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1464_c2_fef0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c2_fef0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c2_fef0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c2_fef0_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1464_c2_fef0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1464_c2_fef0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1464_c2_fef0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1464_c2_fef0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1464_c2_fef0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1464_c2_fef0_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1465_c3_75a2_uxn_opcodes_h_l1465_c3_75a2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1469_c11_80ca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1469_c11_80ca_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1469_c11_80ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_d10b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_d10b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_3256_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_d10b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_d10b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1470_c3_3015 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_d10b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1472_c7_3256_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_d10b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_d10b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_d10b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1472_c7_3256_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_d10b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_d10b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_d10b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_3256_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_d10b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1469_c7_d10b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1469_c7_d10b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1472_c7_3256_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1469_c7_d10b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_d10b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_d10b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1472_c7_3256_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_d10b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1469_c7_d10b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1469_c7_d10b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1472_c7_3256_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1469_c7_d10b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1469_c7_d10b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1469_c7_d10b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1472_c7_3256_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1469_c7_d10b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1472_c11_c6ff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1472_c11_c6ff_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1472_c11_c6ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_3256_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_3256_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_3256_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1472_c7_3256_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1475_c3_6e88 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1472_c7_3256_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1472_c7_3256_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1472_c7_3256_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1472_c7_3256_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1472_c7_3256_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_3256_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_3256_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_3256_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1472_c7_3256_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1472_c7_3256_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1472_c7_3256_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1472_c7_3256_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1472_c7_3256_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1472_c7_3256_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1472_c7_3256_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1472_c7_3256_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1472_c7_3256_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1472_c7_3256_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1472_c7_3256_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1472_c7_3256_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1474_c3_842e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1474_c3_842e_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_5b7c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_5b7c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_5b7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_85cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_85cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_85cc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_85cc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1478_c3_4316 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_85cc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_85cc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_85cc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_85cc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_85cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_85cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_85cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_85cc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1477_c7_85cc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1477_c7_85cc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1477_c7_85cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_85cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_85cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_85cc_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1477_c7_85cc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1477_c7_85cc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1477_c7_85cc_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1477_c7_85cc_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1477_c7_85cc_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1477_c7_85cc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1480_c11_e2d7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1480_c11_e2d7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1480_c11_e2d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_46a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_46a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1486_c7_ee8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_46a2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_46a2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_46a2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1486_c7_ee8f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_46a2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_46a2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_46a2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_46a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_46a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_46a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1486_c7_ee8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_46a2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1480_c7_46a2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1480_c7_46a2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1486_c7_ee8f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1480_c7_46a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_46a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_46a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1486_c7_ee8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_46a2_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1480_c7_46a2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l1482_c3_97ce : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1480_c7_46a2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1480_c7_46a2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1480_c7_46a2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1480_c7_46a2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1480_c7_46a2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1481_c3_1a00_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1481_c3_1a00_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1481_c3_1a00_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1482_c11_5102_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1482_c11_5102_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1482_c11_5102_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1484_c32_b669_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1484_c32_b669_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1484_c32_b669_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1484_c32_852f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1484_c32_852f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1484_c32_852f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1484_c32_5dfd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1484_c32_5dfd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1484_c32_5dfd_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1484_c32_b669_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1486_c11_03dd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1486_c11_03dd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1486_c11_03dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1486_c7_ee8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1486_c7_ee8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_52ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1486_c7_ee8f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1486_c7_ee8f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1489_c3_1807 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1486_c7_ee8f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_52ef_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1486_c7_ee8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1486_c7_ee8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1486_c7_ee8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_52ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1486_c7_ee8f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1486_c7_ee8f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1486_c7_ee8f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1492_c7_52ef_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1486_c7_ee8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1486_c7_ee8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1486_c7_ee8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1486_c7_ee8f_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1490_c24_9d4b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_cf40_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_cf40_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_cf40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_52ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_52ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_705c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_52ef_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_52ef_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1493_c3_0841 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_52ef_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_52ef_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1492_c7_52ef_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1492_c7_52ef_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1492_c7_52ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_52ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_52ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_705c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_52ef_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1494_c34_96a6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1494_c34_96a6_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1494_c24_a6b0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_e9f8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_e9f8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_e9f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_705c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_705c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_705c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_705c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_705c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_705c_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1480_l1477_l1472_l1469_l1496_l1464_l1492_DUPLICATE_c0a2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1480_l1477_l1472_l1469_l1464_DUPLICATE_c8bc_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1480_l1477_l1472_l1469_l1464_l1492_DUPLICATE_50df_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1477_l1472_l1469_l1464_l1486_DUPLICATE_11a1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1480_l1477_l1472_l1469_l1496_l1492_l1486_DUPLICATE_030f_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1481_l1473_DUPLICATE_6155_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1492_l1480_DUPLICATE_7516_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1501_l1460_DUPLICATE_c5cd_return_output : opcode_result_t;
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
     VAR_MUX_uxn_opcodes_h_l1484_c32_b669_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_e9f8_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1469_c11_80ca_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1493_c3_0841 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_52ef_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1493_c3_0841;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1486_c11_03dd_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c6_a602_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1484_c32_b669_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1486_c7_ee8f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_5b7c_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1464_c2_fef0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1472_c11_c6ff_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_46a2_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1484_c32_852f_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1466_c3_c0ca := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c2_fef0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1466_c3_c0ca;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1484_c32_5dfd_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1489_c3_1807 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1486_c7_ee8f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1489_c3_1807;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_cf40_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1475_c3_6e88 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1472_c7_3256_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1475_c3_6e88;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1464_c1_5cd8_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1486_c7_ee8f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1482_c11_5102_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1478_c3_4316 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_85cc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1478_c3_4316;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_705c_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1470_c3_3015 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_d10b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1470_c3_3015;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_705c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1480_c11_e2d7_right := to_unsigned(4, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1464_c1_5cd8_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1484_c32_852f_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c6_a602_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1469_c11_80ca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1472_c11_c6ff_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_5b7c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1480_c11_e2d7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1486_c11_03dd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_cf40_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_e9f8_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1481_c3_1a00_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1464_c2_fef0_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1469_c7_d10b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1477_c7_85cc_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1480_c7_46a2_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1494_c34_96a6_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1464_c2_fef0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1469_c7_d10b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1472_c7_3256_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1477_c7_85cc_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1480_c7_46a2_iffalse := tmp16;
     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1492_l1480_DUPLICATE_7516 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1492_l1480_DUPLICATE_7516_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1472_c11_c6ff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1472_c11_c6ff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1472_c11_c6ff_left;
     BIN_OP_EQ_uxn_opcodes_h_l1472_c11_c6ff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1472_c11_c6ff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1472_c11_c6ff_return_output := BIN_OP_EQ_uxn_opcodes_h_l1472_c11_c6ff_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1480_l1477_l1472_l1469_l1496_l1492_l1486_DUPLICATE_030f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1480_l1477_l1472_l1469_l1496_l1492_l1486_DUPLICATE_030f_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1477_c11_5b7c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1477_c11_5b7c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_5b7c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1477_c11_5b7c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_5b7c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_5b7c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1477_c11_5b7c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1486_c11_03dd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1486_c11_03dd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1486_c11_03dd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1486_c11_03dd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1486_c11_03dd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1486_c11_03dd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1486_c11_03dd_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1480_l1477_l1472_l1469_l1464_l1492_DUPLICATE_50df LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1480_l1477_l1472_l1469_l1464_l1492_DUPLICATE_50df_return_output := result.stack_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1481_l1473_DUPLICATE_6155 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1481_l1473_DUPLICATE_6155_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_SR_8[uxn_opcodes_h_l1494_c34_96a6] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1494_c34_96a6_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1494_c34_96a6_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1494_c34_96a6_return_output := CONST_SR_8_uxn_opcodes_h_l1494_c34_96a6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1464_c6_a602] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1464_c6_a602_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c6_a602_left;
     BIN_OP_EQ_uxn_opcodes_h_l1464_c6_a602_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c6_a602_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c6_a602_return_output := BIN_OP_EQ_uxn_opcodes_h_l1464_c6_a602_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1469_c11_80ca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1469_c11_80ca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1469_c11_80ca_left;
     BIN_OP_EQ_uxn_opcodes_h_l1469_c11_80ca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1469_c11_80ca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1469_c11_80ca_return_output := BIN_OP_EQ_uxn_opcodes_h_l1469_c11_80ca_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1496_c11_e9f8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1496_c11_e9f8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_e9f8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1496_c11_e9f8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_e9f8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_e9f8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1496_c11_e9f8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1480_c11_e2d7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1480_c11_e2d7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1480_c11_e2d7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1480_c11_e2d7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1480_c11_e2d7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1480_c11_e2d7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1480_c11_e2d7_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1490_c24_9d4b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1490_c24_9d4b_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1477_l1472_l1469_l1464_l1486_DUPLICATE_11a1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1477_l1472_l1469_l1464_l1486_DUPLICATE_11a1_return_output := result.is_sp_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l1484_c32_852f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1484_c32_852f_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1484_c32_852f_left;
     BIN_OP_AND_uxn_opcodes_h_l1484_c32_852f_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1484_c32_852f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1484_c32_852f_return_output := BIN_OP_AND_uxn_opcodes_h_l1484_c32_852f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1492_c11_cf40] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1492_c11_cf40_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_cf40_left;
     BIN_OP_EQ_uxn_opcodes_h_l1492_c11_cf40_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_cf40_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_cf40_return_output := BIN_OP_EQ_uxn_opcodes_h_l1492_c11_cf40_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1480_l1477_l1472_l1469_l1496_l1464_l1492_DUPLICATE_c0a2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1480_l1477_l1472_l1469_l1496_l1464_l1492_DUPLICATE_c0a2_return_output := result.is_stack_write;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1480_l1477_l1472_l1469_l1464_DUPLICATE_c8bc LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1480_l1477_l1472_l1469_l1464_DUPLICATE_c8bc_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1484_c32_5dfd_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1484_c32_852f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1464_c1_5cd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c6_a602_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1464_c2_fef0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c6_a602_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c2_fef0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c6_a602_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1464_c2_fef0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c6_a602_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c2_fef0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c6_a602_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c2_fef0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c6_a602_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1464_c2_fef0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c6_a602_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1464_c2_fef0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c6_a602_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1464_c2_fef0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c6_a602_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_d10b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1469_c11_80ca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_d10b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1469_c11_80ca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_d10b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1469_c11_80ca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_d10b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1469_c11_80ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_d10b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1469_c11_80ca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1469_c7_d10b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1469_c11_80ca_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1469_c7_d10b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1469_c11_80ca_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1469_c7_d10b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1469_c11_80ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_3256_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1472_c11_c6ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1472_c7_3256_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1472_c11_c6ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_3256_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1472_c11_c6ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1472_c7_3256_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1472_c11_c6ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1472_c7_3256_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1472_c11_c6ff_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1472_c7_3256_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1472_c11_c6ff_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1472_c7_3256_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1472_c11_c6ff_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1472_c7_3256_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1472_c11_c6ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_85cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_5b7c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_85cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_5b7c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_85cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_5b7c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_85cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_5b7c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_85cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_5b7c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1477_c7_85cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_5b7c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1477_c7_85cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_5b7c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1477_c7_85cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_5b7c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_46a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1480_c11_e2d7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_46a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1480_c11_e2d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_46a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1480_c11_e2d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_46a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1480_c11_e2d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_46a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1480_c11_e2d7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1480_c7_46a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1480_c11_e2d7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1480_c7_46a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1480_c11_e2d7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1480_c7_46a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1480_c11_e2d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1486_c7_ee8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1486_c11_03dd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1486_c7_ee8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1486_c11_03dd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1486_c7_ee8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1486_c11_03dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1486_c7_ee8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1486_c11_03dd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1486_c7_ee8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1486_c11_03dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_52ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_cf40_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_52ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_cf40_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_52ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_cf40_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1492_c7_52ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_cf40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_705c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_e9f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_705c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_e9f8_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1481_c3_1a00_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1481_l1473_DUPLICATE_6155_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1474_c3_842e_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1481_l1473_DUPLICATE_6155_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1486_c7_ee8f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1490_c24_9d4b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c2_fef0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1480_l1477_l1472_l1469_l1464_DUPLICATE_c8bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_d10b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1480_l1477_l1472_l1469_l1464_DUPLICATE_c8bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1472_c7_3256_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1480_l1477_l1472_l1469_l1464_DUPLICATE_c8bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_85cc_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1480_l1477_l1472_l1469_l1464_DUPLICATE_c8bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_46a2_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1480_l1477_l1472_l1469_l1464_DUPLICATE_c8bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_d10b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1480_l1477_l1472_l1469_l1496_l1492_l1486_DUPLICATE_030f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_3256_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1480_l1477_l1472_l1469_l1496_l1492_l1486_DUPLICATE_030f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_85cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1480_l1477_l1472_l1469_l1496_l1492_l1486_DUPLICATE_030f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_46a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1480_l1477_l1472_l1469_l1496_l1492_l1486_DUPLICATE_030f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1486_c7_ee8f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1480_l1477_l1472_l1469_l1496_l1492_l1486_DUPLICATE_030f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_52ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1480_l1477_l1472_l1469_l1496_l1492_l1486_DUPLICATE_030f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_705c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1480_l1477_l1472_l1469_l1496_l1492_l1486_DUPLICATE_030f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c2_fef0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1477_l1472_l1469_l1464_l1486_DUPLICATE_11a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_d10b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1477_l1472_l1469_l1464_l1486_DUPLICATE_11a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1472_c7_3256_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1477_l1472_l1469_l1464_l1486_DUPLICATE_11a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_85cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1477_l1472_l1469_l1464_l1486_DUPLICATE_11a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1486_c7_ee8f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1477_l1472_l1469_l1464_l1486_DUPLICATE_11a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1464_c2_fef0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1480_l1477_l1472_l1469_l1496_l1464_l1492_DUPLICATE_c0a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_d10b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1480_l1477_l1472_l1469_l1496_l1464_l1492_DUPLICATE_c0a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_3256_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1480_l1477_l1472_l1469_l1496_l1464_l1492_DUPLICATE_c0a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_85cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1480_l1477_l1472_l1469_l1496_l1464_l1492_DUPLICATE_c0a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_46a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1480_l1477_l1472_l1469_l1496_l1464_l1492_DUPLICATE_c0a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_52ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1480_l1477_l1472_l1469_l1496_l1464_l1492_DUPLICATE_c0a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_705c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1480_l1477_l1472_l1469_l1496_l1464_l1492_DUPLICATE_c0a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_46a2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1492_l1480_DUPLICATE_7516_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_52ef_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1492_l1480_DUPLICATE_7516_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1464_c2_fef0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1480_l1477_l1472_l1469_l1464_l1492_DUPLICATE_50df_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1469_c7_d10b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1480_l1477_l1472_l1469_l1464_l1492_DUPLICATE_50df_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1472_c7_3256_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1480_l1477_l1472_l1469_l1464_l1492_DUPLICATE_50df_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1477_c7_85cc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1480_l1477_l1472_l1469_l1464_l1492_DUPLICATE_50df_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1480_c7_46a2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1480_l1477_l1472_l1469_l1464_l1492_DUPLICATE_50df_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1492_c7_52ef_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1480_l1477_l1472_l1469_l1464_l1492_DUPLICATE_50df_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1464_c1_5cd8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1464_c1_5cd8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1464_c1_5cd8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1464_c1_5cd8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1464_c1_5cd8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1464_c1_5cd8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1464_c1_5cd8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1464_c1_5cd8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1464_c1_5cd8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1492_c7_52ef] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_52ef_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_52ef_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_52ef_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_52ef_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_52ef_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_52ef_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_52ef_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_52ef_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1496_c7_705c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_705c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_705c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_705c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_705c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_705c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_705c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_705c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_705c_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1481_c3_1a00] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1481_c3_1a00_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1481_c3_1a00_left;
     BIN_OP_OR_uxn_opcodes_h_l1481_c3_1a00_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1481_c3_1a00_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1481_c3_1a00_return_output := BIN_OP_OR_uxn_opcodes_h_l1481_c3_1a00_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1486_c7_ee8f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1486_c7_ee8f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1486_c7_ee8f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1486_c7_ee8f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1486_c7_ee8f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1486_c7_ee8f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1486_c7_ee8f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1486_c7_ee8f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1486_c7_ee8f_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1484_c32_5dfd] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1484_c32_5dfd_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1484_c32_5dfd_left;
     BIN_OP_GT_uxn_opcodes_h_l1484_c32_5dfd_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1484_c32_5dfd_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1484_c32_5dfd_return_output := BIN_OP_GT_uxn_opcodes_h_l1484_c32_5dfd_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1494_c24_a6b0] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1494_c24_a6b0_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1494_c34_96a6_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1496_c7_705c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_705c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_705c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_705c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_705c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_705c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_705c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_705c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_705c_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1474_c3_842e] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1474_c3_842e_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1474_c3_842e_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1474_c3_842e_return_output := CONST_SL_8_uxn_opcodes_h_l1474_c3_842e_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1484_c32_b669_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1484_c32_5dfd_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1482_c11_5102_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1481_c3_1a00_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1480_c7_46a2_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1481_c3_1a00_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1492_c7_52ef_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1494_c24_a6b0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1472_c7_3256_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1474_c3_842e_return_output;
     VAR_printf_uxn_opcodes_h_l1465_c3_75a2_uxn_opcodes_h_l1465_c3_75a2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1464_c1_5cd8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_52ef_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_705c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_46a2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1486_c7_ee8f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_52ef_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_705c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1486_c7_ee8f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_52ef_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1486_c7_ee8f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1486_c7_ee8f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1486_c7_ee8f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1486_c7_ee8f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1486_c7_ee8f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1486_c7_ee8f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1486_c7_ee8f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1486_c7_ee8f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1486_c7_ee8f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1492_c7_52ef] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_52ef_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_52ef_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_52ef_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_52ef_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_52ef_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_52ef_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_52ef_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_52ef_return_output;

     -- t16_MUX[uxn_opcodes_h_l1480_c7_46a2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1480_c7_46a2_cond <= VAR_t16_MUX_uxn_opcodes_h_l1480_c7_46a2_cond;
     t16_MUX_uxn_opcodes_h_l1480_c7_46a2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1480_c7_46a2_iftrue;
     t16_MUX_uxn_opcodes_h_l1480_c7_46a2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1480_c7_46a2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output := t16_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output;

     -- MUX[uxn_opcodes_h_l1484_c32_b669] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1484_c32_b669_cond <= VAR_MUX_uxn_opcodes_h_l1484_c32_b669_cond;
     MUX_uxn_opcodes_h_l1484_c32_b669_iftrue <= VAR_MUX_uxn_opcodes_h_l1484_c32_b669_iftrue;
     MUX_uxn_opcodes_h_l1484_c32_b669_iffalse <= VAR_MUX_uxn_opcodes_h_l1484_c32_b669_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1484_c32_b669_return_output := MUX_uxn_opcodes_h_l1484_c32_b669_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1482_c11_5102] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1482_c11_5102_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1482_c11_5102_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1482_c11_5102_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1482_c11_5102_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1482_c11_5102_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1482_c11_5102_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1492_c7_52ef] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1492_c7_52ef_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1492_c7_52ef_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1492_c7_52ef_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1492_c7_52ef_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1492_c7_52ef_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1492_c7_52ef_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1492_c7_52ef_return_output := result_stack_value_MUX_uxn_opcodes_h_l1492_c7_52ef_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1492_c7_52ef] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_52ef_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_52ef_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_52ef_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_52ef_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_52ef_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_52ef_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_52ef_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_52ef_return_output;

     -- printf_uxn_opcodes_h_l1465_c3_75a2[uxn_opcodes_h_l1465_c3_75a2] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1465_c3_75a2_uxn_opcodes_h_l1465_c3_75a2_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1465_c3_75a2_uxn_opcodes_h_l1465_c3_75a2_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1480_c7_46a2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_46a2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_46a2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_46a2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_46a2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_46a2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_46a2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l1482_c3_97ce := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1482_c11_5102_return_output, 16);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_46a2_iftrue := VAR_MUX_uxn_opcodes_h_l1484_c32_b669_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1486_c7_ee8f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_52ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_85cc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1486_c7_ee8f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_52ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_46a2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1486_c7_ee8f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1486_c7_ee8f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1492_c7_52ef_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1477_c7_85cc_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1480_c7_46a2_iftrue := VAR_tmp16_uxn_opcodes_h_l1482_c3_97ce;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1486_c7_ee8f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1486_c7_ee8f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1486_c7_ee8f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1486_c7_ee8f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1486_c7_ee8f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1486_c7_ee8f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1486_c7_ee8f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1486_c7_ee8f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1486_c7_ee8f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1480_c7_46a2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1480_c7_46a2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1480_c7_46a2_cond;
     tmp16_MUX_uxn_opcodes_h_l1480_c7_46a2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1480_c7_46a2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1480_c7_46a2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1480_c7_46a2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output := tmp16_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1480_c7_46a2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_46a2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_46a2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_46a2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_46a2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_46a2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_46a2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1486_c7_ee8f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1486_c7_ee8f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1486_c7_ee8f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1486_c7_ee8f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1486_c7_ee8f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1486_c7_ee8f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1486_c7_ee8f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1486_c7_ee8f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1486_c7_ee8f_return_output;

     -- t16_MUX[uxn_opcodes_h_l1477_c7_85cc] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1477_c7_85cc_cond <= VAR_t16_MUX_uxn_opcodes_h_l1477_c7_85cc_cond;
     t16_MUX_uxn_opcodes_h_l1477_c7_85cc_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1477_c7_85cc_iftrue;
     t16_MUX_uxn_opcodes_h_l1477_c7_85cc_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1477_c7_85cc_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output := t16_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1480_c7_46a2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_46a2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_46a2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_46a2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_46a2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_46a2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_46a2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1477_c7_85cc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_85cc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_85cc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_85cc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_85cc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_85cc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_85cc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1486_c7_ee8f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1486_c7_ee8f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1486_c7_ee8f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1486_c7_ee8f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1486_c7_ee8f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1486_c7_ee8f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1486_c7_ee8f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1486_c7_ee8f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1486_c7_ee8f_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_46a2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1486_c7_ee8f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1472_c7_3256_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_46a2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1486_c7_ee8f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_85cc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_85cc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1480_c7_46a2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1486_c7_ee8f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1472_c7_3256_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1477_c7_85cc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1480_c7_46a2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_46a2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_46a2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_46a2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_46a2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_46a2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_46a2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1477_c7_85cc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1477_c7_85cc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1477_c7_85cc_cond;
     tmp16_MUX_uxn_opcodes_h_l1477_c7_85cc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1477_c7_85cc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1477_c7_85cc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1477_c7_85cc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output := tmp16_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output;

     -- t16_MUX[uxn_opcodes_h_l1472_c7_3256] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1472_c7_3256_cond <= VAR_t16_MUX_uxn_opcodes_h_l1472_c7_3256_cond;
     t16_MUX_uxn_opcodes_h_l1472_c7_3256_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1472_c7_3256_iftrue;
     t16_MUX_uxn_opcodes_h_l1472_c7_3256_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1472_c7_3256_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1472_c7_3256_return_output := t16_MUX_uxn_opcodes_h_l1472_c7_3256_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1480_c7_46a2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_46a2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_46a2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_46a2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_46a2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_46a2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_46a2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1477_c7_85cc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_85cc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_85cc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_85cc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_85cc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_85cc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_85cc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1480_c7_46a2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1480_c7_46a2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1480_c7_46a2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1480_c7_46a2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1480_c7_46a2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1480_c7_46a2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1480_c7_46a2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output := result_stack_value_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1472_c7_3256] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1472_c7_3256_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1472_c7_3256_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1472_c7_3256_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1472_c7_3256_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1472_c7_3256_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1472_c7_3256_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1472_c7_3256_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1472_c7_3256_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1477_c7_85cc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_85cc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_85cc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_85cc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_85cc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_85cc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_85cc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_85cc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_d10b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1472_c7_3256_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_85cc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1472_c7_3256_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1472_c7_3256_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1477_c7_85cc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1480_c7_46a2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1469_c7_d10b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1472_c7_3256_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1472_c7_3256_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1477_c7_85cc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_85cc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_85cc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_85cc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_85cc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_85cc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_85cc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1472_c7_3256] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1472_c7_3256_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1472_c7_3256_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1472_c7_3256_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1472_c7_3256_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1472_c7_3256_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1472_c7_3256_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1472_c7_3256_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1472_c7_3256_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1472_c7_3256] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1472_c7_3256_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1472_c7_3256_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1472_c7_3256_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1472_c7_3256_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1472_c7_3256_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1472_c7_3256_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1472_c7_3256_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1472_c7_3256_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1472_c7_3256] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1472_c7_3256_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1472_c7_3256_cond;
     tmp16_MUX_uxn_opcodes_h_l1472_c7_3256_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1472_c7_3256_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1472_c7_3256_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1472_c7_3256_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1472_c7_3256_return_output := tmp16_MUX_uxn_opcodes_h_l1472_c7_3256_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1477_c7_85cc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_85cc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_85cc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_85cc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_85cc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_85cc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_85cc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1469_c7_d10b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_d10b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_d10b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_d10b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_d10b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_d10b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_d10b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1477_c7_85cc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1477_c7_85cc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1477_c7_85cc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1477_c7_85cc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1477_c7_85cc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1477_c7_85cc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1477_c7_85cc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output := result_stack_value_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output;

     -- t16_MUX[uxn_opcodes_h_l1469_c7_d10b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1469_c7_d10b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1469_c7_d10b_cond;
     t16_MUX_uxn_opcodes_h_l1469_c7_d10b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1469_c7_d10b_iftrue;
     t16_MUX_uxn_opcodes_h_l1469_c7_d10b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1469_c7_d10b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output := t16_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_3256_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c2_fef0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_3256_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_d10b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1472_c7_3256_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_d10b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1472_c7_3256_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1472_c7_3256_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1477_c7_85cc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1464_c2_fef0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1469_c7_d10b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1472_c7_3256_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1469_c7_d10b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_d10b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_d10b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_d10b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_d10b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_d10b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_d10b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1469_c7_d10b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1469_c7_d10b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1469_c7_d10b_cond;
     tmp16_MUX_uxn_opcodes_h_l1469_c7_d10b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1469_c7_d10b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1469_c7_d10b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1469_c7_d10b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output := tmp16_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1472_c7_3256] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1472_c7_3256_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1472_c7_3256_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1472_c7_3256_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1472_c7_3256_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1472_c7_3256_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1472_c7_3256_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1472_c7_3256_return_output := result_stack_value_MUX_uxn_opcodes_h_l1472_c7_3256_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1469_c7_d10b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_d10b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_d10b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_d10b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_d10b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_d10b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_d10b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1472_c7_3256] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_3256_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_3256_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_3256_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_3256_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_3256_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_3256_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_3256_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_3256_return_output;

     -- t16_MUX[uxn_opcodes_h_l1464_c2_fef0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1464_c2_fef0_cond <= VAR_t16_MUX_uxn_opcodes_h_l1464_c2_fef0_cond;
     t16_MUX_uxn_opcodes_h_l1464_c2_fef0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1464_c2_fef0_iftrue;
     t16_MUX_uxn_opcodes_h_l1464_c2_fef0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1464_c2_fef0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output := t16_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1472_c7_3256] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_3256_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_3256_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_3256_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_3256_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_3256_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_3256_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_3256_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_3256_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1464_c2_fef0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c2_fef0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c2_fef0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c2_fef0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c2_fef0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c2_fef0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c2_fef0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_d10b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_3256_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_d10b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_3256_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c2_fef0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c2_fef0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1469_c7_d10b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1472_c7_3256_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1464_c2_fef0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1464_c2_fef0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c2_fef0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c2_fef0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c2_fef0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c2_fef0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c2_fef0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c2_fef0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1469_c7_d10b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1469_c7_d10b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1469_c7_d10b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1469_c7_d10b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1469_c7_d10b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1469_c7_d10b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1469_c7_d10b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1469_c7_d10b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_d10b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_d10b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_d10b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_d10b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_d10b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_d10b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1469_c7_d10b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_d10b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_d10b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_d10b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_d10b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_d10b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_d10b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1464_c2_fef0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1464_c2_fef0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1464_c2_fef0_cond;
     tmp16_MUX_uxn_opcodes_h_l1464_c2_fef0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1464_c2_fef0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1464_c2_fef0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1464_c2_fef0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output := tmp16_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1464_c2_fef0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c2_fef0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c2_fef0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c2_fef0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c2_fef0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c2_fef0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c2_fef0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1464_c2_fef0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1464_c2_fef0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1464_c2_fef0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1469_c7_d10b_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1464_c2_fef0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1464_c2_fef0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1464_c2_fef0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1464_c2_fef0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1464_c2_fef0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1464_c2_fef0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1464_c2_fef0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output := result_stack_value_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1464_c2_fef0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1464_c2_fef0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1464_c2_fef0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1464_c2_fef0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1464_c2_fef0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1464_c2_fef0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1464_c2_fef0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1464_c2_fef0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1464_c2_fef0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1464_c2_fef0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1464_c2_fef0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1464_c2_fef0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1464_c2_fef0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1464_c2_fef0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1501_l1460_DUPLICATE_c5cd LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1501_l1460_DUPLICATE_c5cd_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_53ff(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1464_c2_fef0_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1501_l1460_DUPLICATE_c5cd_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1501_l1460_DUPLICATE_c5cd_return_output;
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
