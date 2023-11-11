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
-- Submodules: 96
entity ovr2_0CLK_946b5f6a is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ovr2_0CLK_946b5f6a;
architecture arch of ovr2_0CLK_946b5f6a is
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
-- BIN_OP_EQ[uxn_opcodes_h_l328_c6_ed3c]
signal BIN_OP_EQ_uxn_opcodes_h_l328_c6_ed3c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l328_c6_ed3c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l328_c6_ed3c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l328_c1_912b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_912b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_912b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_912b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_912b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l328_c2_bd87]
signal n16_MUX_uxn_opcodes_h_l328_c2_bd87_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l328_c2_bd87_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l328_c2_bd87_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l328_c2_bd87_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l328_c2_bd87]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_bd87_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_bd87_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_bd87_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_bd87_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l328_c2_bd87]
signal result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_bd87_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_bd87_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_bd87_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_bd87_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l328_c2_bd87]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_bd87_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_bd87_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_bd87_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_bd87_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l328_c2_bd87]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_bd87_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_bd87_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_bd87_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_bd87_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l328_c2_bd87]
signal result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_bd87_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_bd87_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_bd87_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_bd87_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l328_c2_bd87]
signal result_u8_value_MUX_uxn_opcodes_h_l328_c2_bd87_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l328_c2_bd87_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l328_c2_bd87_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l328_c2_bd87_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l328_c2_bd87]
signal t16_MUX_uxn_opcodes_h_l328_c2_bd87_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l328_c2_bd87_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l328_c2_bd87_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l328_c2_bd87_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l329_c3_8f14[uxn_opcodes_h_l329_c3_8f14]
signal printf_uxn_opcodes_h_l329_c3_8f14_uxn_opcodes_h_l329_c3_8f14_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l333_c11_bb79]
signal BIN_OP_EQ_uxn_opcodes_h_l333_c11_bb79_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l333_c11_bb79_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l333_c11_bb79_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l333_c7_c509]
signal n16_MUX_uxn_opcodes_h_l333_c7_c509_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l333_c7_c509_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l333_c7_c509_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l333_c7_c509_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l333_c7_c509]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c509_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c509_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c509_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c509_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l333_c7_c509]
signal result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c509_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c509_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c509_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c509_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l333_c7_c509]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c509_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c509_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c509_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c509_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l333_c7_c509]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c509_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c509_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c509_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c509_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l333_c7_c509]
signal result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c509_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c509_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c509_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c509_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l333_c7_c509]
signal result_u8_value_MUX_uxn_opcodes_h_l333_c7_c509_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l333_c7_c509_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l333_c7_c509_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l333_c7_c509_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l333_c7_c509]
signal t16_MUX_uxn_opcodes_h_l333_c7_c509_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l333_c7_c509_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l333_c7_c509_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l333_c7_c509_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l336_c11_27bf]
signal BIN_OP_EQ_uxn_opcodes_h_l336_c11_27bf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l336_c11_27bf_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l336_c11_27bf_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l336_c7_1771]
signal n16_MUX_uxn_opcodes_h_l336_c7_1771_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l336_c7_1771_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l336_c7_1771_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l336_c7_1771_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l336_c7_1771]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1771_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1771_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1771_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1771_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l336_c7_1771]
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1771_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1771_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1771_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1771_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l336_c7_1771]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1771_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1771_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1771_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1771_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l336_c7_1771]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1771_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1771_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1771_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1771_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l336_c7_1771]
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1771_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1771_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1771_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1771_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l336_c7_1771]
signal result_u8_value_MUX_uxn_opcodes_h_l336_c7_1771_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l336_c7_1771_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l336_c7_1771_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l336_c7_1771_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l336_c7_1771]
signal t16_MUX_uxn_opcodes_h_l336_c7_1771_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l336_c7_1771_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l336_c7_1771_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l336_c7_1771_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l341_c11_6a5a]
signal BIN_OP_EQ_uxn_opcodes_h_l341_c11_6a5a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l341_c11_6a5a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l341_c11_6a5a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l341_c7_4d8b]
signal n16_MUX_uxn_opcodes_h_l341_c7_4d8b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l341_c7_4d8b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l341_c7_4d8b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l341_c7_4d8b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_4d8b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_4d8b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_4d8b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l341_c7_4d8b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_4d8b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_4d8b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_4d8b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l341_c7_4d8b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_4d8b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_4d8b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_4d8b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l341_c7_4d8b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_4d8b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_4d8b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_4d8b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l341_c7_4d8b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_4d8b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_4d8b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_4d8b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l341_c7_4d8b]
signal result_u8_value_MUX_uxn_opcodes_h_l341_c7_4d8b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l341_c7_4d8b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l341_c7_4d8b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l341_c7_4d8b]
signal t16_MUX_uxn_opcodes_h_l341_c7_4d8b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l341_c7_4d8b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l341_c7_4d8b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l342_c3_9f5b]
signal BIN_OP_OR_uxn_opcodes_h_l342_c3_9f5b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l342_c3_9f5b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l342_c3_9f5b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l345_c11_7126]
signal BIN_OP_EQ_uxn_opcodes_h_l345_c11_7126_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l345_c11_7126_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l345_c11_7126_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l345_c7_33ea]
signal n16_MUX_uxn_opcodes_h_l345_c7_33ea_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l345_c7_33ea_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l345_c7_33ea_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l345_c7_33ea_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l345_c7_33ea]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_33ea_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_33ea_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_33ea_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_33ea_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l345_c7_33ea]
signal result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_33ea_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_33ea_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_33ea_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_33ea_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l345_c7_33ea]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_33ea_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_33ea_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_33ea_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_33ea_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l345_c7_33ea]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_33ea_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_33ea_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_33ea_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_33ea_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l345_c7_33ea]
signal result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_33ea_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_33ea_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_33ea_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_33ea_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l345_c7_33ea]
signal result_u8_value_MUX_uxn_opcodes_h_l345_c7_33ea_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l345_c7_33ea_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l345_c7_33ea_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l345_c7_33ea_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l349_c11_f94f]
signal BIN_OP_EQ_uxn_opcodes_h_l349_c11_f94f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l349_c11_f94f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l349_c11_f94f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l349_c7_2dfa]
signal n16_MUX_uxn_opcodes_h_l349_c7_2dfa_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l349_c7_2dfa_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l349_c7_2dfa_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l349_c7_2dfa_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l349_c7_2dfa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_2dfa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_2dfa_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_2dfa_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_2dfa_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l349_c7_2dfa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_2dfa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_2dfa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_2dfa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_2dfa_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l349_c7_2dfa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_2dfa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_2dfa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_2dfa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_2dfa_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l349_c7_2dfa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_2dfa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_2dfa_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_2dfa_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_2dfa_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l349_c7_2dfa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_2dfa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_2dfa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_2dfa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_2dfa_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l349_c7_2dfa]
signal result_u8_value_MUX_uxn_opcodes_h_l349_c7_2dfa_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l349_c7_2dfa_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l349_c7_2dfa_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l349_c7_2dfa_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l350_c3_3a44]
signal BIN_OP_OR_uxn_opcodes_h_l350_c3_3a44_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l350_c3_3a44_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l350_c3_3a44_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l352_c30_9195]
signal sp_relative_shift_uxn_opcodes_h_l352_c30_9195_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l352_c30_9195_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l352_c30_9195_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l352_c30_9195_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l357_c11_51f5]
signal BIN_OP_EQ_uxn_opcodes_h_l357_c11_51f5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l357_c11_51f5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l357_c11_51f5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l357_c7_720b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_720b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_720b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_720b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_720b_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l357_c7_720b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_720b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_720b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_720b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_720b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l357_c7_720b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_720b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_720b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_720b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_720b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l357_c7_720b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_720b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_720b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_720b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_720b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l357_c7_720b]
signal result_u8_value_MUX_uxn_opcodes_h_l357_c7_720b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l357_c7_720b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l357_c7_720b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l357_c7_720b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l362_c11_a0c2]
signal BIN_OP_EQ_uxn_opcodes_h_l362_c11_a0c2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l362_c11_a0c2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l362_c11_a0c2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l362_c7_2b7e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_2b7e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_2b7e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_2b7e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_2b7e_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l362_c7_2b7e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_2b7e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_2b7e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_2b7e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_2b7e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l362_c7_2b7e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_2b7e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_2b7e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_2b7e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_2b7e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l362_c7_2b7e]
signal result_u8_value_MUX_uxn_opcodes_h_l362_c7_2b7e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l362_c7_2b7e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l362_c7_2b7e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l362_c7_2b7e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l366_c11_61a0]
signal BIN_OP_EQ_uxn_opcodes_h_l366_c11_61a0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l366_c11_61a0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l366_c11_61a0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l366_c7_d3d4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d3d4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d3d4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d3d4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d3d4_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l366_c7_d3d4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d3d4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d3d4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d3d4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d3d4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l366_c7_d3d4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d3d4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d3d4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d3d4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d3d4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l366_c7_d3d4]
signal result_u8_value_MUX_uxn_opcodes_h_l366_c7_d3d4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l366_c7_d3d4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l366_c7_d3d4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l366_c7_d3d4_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l368_c31_fdd4]
signal CONST_SR_8_uxn_opcodes_h_l368_c31_fdd4_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l368_c31_fdd4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l370_c11_742a]
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_742a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_742a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_742a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l370_c7_4a9f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_4a9f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_4a9f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_4a9f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_4a9f_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l370_c7_4a9f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_4a9f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_4a9f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_4a9f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_4a9f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l370_c7_4a9f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_4a9f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_4a9f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_4a9f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_4a9f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l370_c7_4a9f]
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_4a9f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_4a9f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_4a9f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_4a9f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l374_c11_1c3f]
signal BIN_OP_EQ_uxn_opcodes_h_l374_c11_1c3f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l374_c11_1c3f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l374_c11_1c3f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l374_c7_a42b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_a42b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_a42b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_a42b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_a42b_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l374_c7_a42b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_a42b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_a42b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_a42b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_a42b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l374_c7_a42b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_a42b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_a42b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_a42b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_a42b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l374_c7_a42b]
signal result_u8_value_MUX_uxn_opcodes_h_l374_c7_a42b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l374_c7_a42b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l374_c7_a42b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l374_c7_a42b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l378_c11_a7d8]
signal BIN_OP_EQ_uxn_opcodes_h_l378_c11_a7d8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l378_c11_a7d8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l378_c11_a7d8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l378_c7_b2e4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b2e4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b2e4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b2e4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b2e4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l378_c7_b2e4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b2e4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b2e4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b2e4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b2e4_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l338_l347_DUPLICATE_1a63
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l338_l347_DUPLICATE_1a63_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l338_l347_DUPLICATE_1a63_return_output : unsigned(15 downto 0);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_ca0f
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_ca0f_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_ca0f_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_4e73( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l328_c6_ed3c
BIN_OP_EQ_uxn_opcodes_h_l328_c6_ed3c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l328_c6_ed3c_left,
BIN_OP_EQ_uxn_opcodes_h_l328_c6_ed3c_right,
BIN_OP_EQ_uxn_opcodes_h_l328_c6_ed3c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_912b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_912b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_912b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_912b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_912b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_912b_return_output);

-- n16_MUX_uxn_opcodes_h_l328_c2_bd87
n16_MUX_uxn_opcodes_h_l328_c2_bd87 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l328_c2_bd87_cond,
n16_MUX_uxn_opcodes_h_l328_c2_bd87_iftrue,
n16_MUX_uxn_opcodes_h_l328_c2_bd87_iffalse,
n16_MUX_uxn_opcodes_h_l328_c2_bd87_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_bd87
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_bd87 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_bd87_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_bd87_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_bd87_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_bd87_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_bd87
result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_bd87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_bd87_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_bd87_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_bd87_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_bd87_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_bd87
result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_bd87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_bd87_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_bd87_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_bd87_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_bd87_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_bd87
result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_bd87 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_bd87_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_bd87_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_bd87_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_bd87_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_bd87
result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_bd87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_bd87_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_bd87_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_bd87_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_bd87_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l328_c2_bd87
result_u8_value_MUX_uxn_opcodes_h_l328_c2_bd87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l328_c2_bd87_cond,
result_u8_value_MUX_uxn_opcodes_h_l328_c2_bd87_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l328_c2_bd87_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l328_c2_bd87_return_output);

-- t16_MUX_uxn_opcodes_h_l328_c2_bd87
t16_MUX_uxn_opcodes_h_l328_c2_bd87 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l328_c2_bd87_cond,
t16_MUX_uxn_opcodes_h_l328_c2_bd87_iftrue,
t16_MUX_uxn_opcodes_h_l328_c2_bd87_iffalse,
t16_MUX_uxn_opcodes_h_l328_c2_bd87_return_output);

-- printf_uxn_opcodes_h_l329_c3_8f14_uxn_opcodes_h_l329_c3_8f14
printf_uxn_opcodes_h_l329_c3_8f14_uxn_opcodes_h_l329_c3_8f14 : entity work.printf_uxn_opcodes_h_l329_c3_8f14_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l329_c3_8f14_uxn_opcodes_h_l329_c3_8f14_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l333_c11_bb79
BIN_OP_EQ_uxn_opcodes_h_l333_c11_bb79 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l333_c11_bb79_left,
BIN_OP_EQ_uxn_opcodes_h_l333_c11_bb79_right,
BIN_OP_EQ_uxn_opcodes_h_l333_c11_bb79_return_output);

-- n16_MUX_uxn_opcodes_h_l333_c7_c509
n16_MUX_uxn_opcodes_h_l333_c7_c509 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l333_c7_c509_cond,
n16_MUX_uxn_opcodes_h_l333_c7_c509_iftrue,
n16_MUX_uxn_opcodes_h_l333_c7_c509_iffalse,
n16_MUX_uxn_opcodes_h_l333_c7_c509_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c509
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c509 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c509_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c509_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c509_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c509_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c509
result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c509 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c509_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c509_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c509_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c509_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c509
result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c509 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c509_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c509_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c509_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c509_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c509
result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c509 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c509_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c509_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c509_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c509_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c509
result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c509 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c509_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c509_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c509_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c509_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l333_c7_c509
result_u8_value_MUX_uxn_opcodes_h_l333_c7_c509 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l333_c7_c509_cond,
result_u8_value_MUX_uxn_opcodes_h_l333_c7_c509_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l333_c7_c509_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l333_c7_c509_return_output);

-- t16_MUX_uxn_opcodes_h_l333_c7_c509
t16_MUX_uxn_opcodes_h_l333_c7_c509 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l333_c7_c509_cond,
t16_MUX_uxn_opcodes_h_l333_c7_c509_iftrue,
t16_MUX_uxn_opcodes_h_l333_c7_c509_iffalse,
t16_MUX_uxn_opcodes_h_l333_c7_c509_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l336_c11_27bf
BIN_OP_EQ_uxn_opcodes_h_l336_c11_27bf : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l336_c11_27bf_left,
BIN_OP_EQ_uxn_opcodes_h_l336_c11_27bf_right,
BIN_OP_EQ_uxn_opcodes_h_l336_c11_27bf_return_output);

-- n16_MUX_uxn_opcodes_h_l336_c7_1771
n16_MUX_uxn_opcodes_h_l336_c7_1771 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l336_c7_1771_cond,
n16_MUX_uxn_opcodes_h_l336_c7_1771_iftrue,
n16_MUX_uxn_opcodes_h_l336_c7_1771_iffalse,
n16_MUX_uxn_opcodes_h_l336_c7_1771_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1771
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1771 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1771_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1771_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1771_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1771_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1771
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1771 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1771_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1771_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1771_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1771_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1771
result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1771 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1771_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1771_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1771_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1771_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1771
result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1771 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1771_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1771_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1771_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1771_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1771
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1771 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1771_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1771_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1771_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1771_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l336_c7_1771
result_u8_value_MUX_uxn_opcodes_h_l336_c7_1771 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l336_c7_1771_cond,
result_u8_value_MUX_uxn_opcodes_h_l336_c7_1771_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l336_c7_1771_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l336_c7_1771_return_output);

-- t16_MUX_uxn_opcodes_h_l336_c7_1771
t16_MUX_uxn_opcodes_h_l336_c7_1771 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l336_c7_1771_cond,
t16_MUX_uxn_opcodes_h_l336_c7_1771_iftrue,
t16_MUX_uxn_opcodes_h_l336_c7_1771_iffalse,
t16_MUX_uxn_opcodes_h_l336_c7_1771_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l341_c11_6a5a
BIN_OP_EQ_uxn_opcodes_h_l341_c11_6a5a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l341_c11_6a5a_left,
BIN_OP_EQ_uxn_opcodes_h_l341_c11_6a5a_right,
BIN_OP_EQ_uxn_opcodes_h_l341_c11_6a5a_return_output);

-- n16_MUX_uxn_opcodes_h_l341_c7_4d8b
n16_MUX_uxn_opcodes_h_l341_c7_4d8b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l341_c7_4d8b_cond,
n16_MUX_uxn_opcodes_h_l341_c7_4d8b_iftrue,
n16_MUX_uxn_opcodes_h_l341_c7_4d8b_iffalse,
n16_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_4d8b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_4d8b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_4d8b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_4d8b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_4d8b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_4d8b
result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_4d8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_4d8b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_4d8b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_4d8b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_4d8b
result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_4d8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_4d8b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_4d8b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_4d8b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_4d8b
result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_4d8b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_4d8b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_4d8b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_4d8b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_4d8b
result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_4d8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_4d8b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_4d8b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_4d8b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l341_c7_4d8b
result_u8_value_MUX_uxn_opcodes_h_l341_c7_4d8b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l341_c7_4d8b_cond,
result_u8_value_MUX_uxn_opcodes_h_l341_c7_4d8b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l341_c7_4d8b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output);

-- t16_MUX_uxn_opcodes_h_l341_c7_4d8b
t16_MUX_uxn_opcodes_h_l341_c7_4d8b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l341_c7_4d8b_cond,
t16_MUX_uxn_opcodes_h_l341_c7_4d8b_iftrue,
t16_MUX_uxn_opcodes_h_l341_c7_4d8b_iffalse,
t16_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l342_c3_9f5b
BIN_OP_OR_uxn_opcodes_h_l342_c3_9f5b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l342_c3_9f5b_left,
BIN_OP_OR_uxn_opcodes_h_l342_c3_9f5b_right,
BIN_OP_OR_uxn_opcodes_h_l342_c3_9f5b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l345_c11_7126
BIN_OP_EQ_uxn_opcodes_h_l345_c11_7126 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l345_c11_7126_left,
BIN_OP_EQ_uxn_opcodes_h_l345_c11_7126_right,
BIN_OP_EQ_uxn_opcodes_h_l345_c11_7126_return_output);

-- n16_MUX_uxn_opcodes_h_l345_c7_33ea
n16_MUX_uxn_opcodes_h_l345_c7_33ea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l345_c7_33ea_cond,
n16_MUX_uxn_opcodes_h_l345_c7_33ea_iftrue,
n16_MUX_uxn_opcodes_h_l345_c7_33ea_iffalse,
n16_MUX_uxn_opcodes_h_l345_c7_33ea_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_33ea
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_33ea : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_33ea_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_33ea_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_33ea_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_33ea_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_33ea
result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_33ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_33ea_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_33ea_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_33ea_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_33ea_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_33ea
result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_33ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_33ea_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_33ea_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_33ea_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_33ea_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_33ea
result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_33ea : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_33ea_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_33ea_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_33ea_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_33ea_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_33ea
result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_33ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_33ea_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_33ea_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_33ea_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_33ea_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l345_c7_33ea
result_u8_value_MUX_uxn_opcodes_h_l345_c7_33ea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l345_c7_33ea_cond,
result_u8_value_MUX_uxn_opcodes_h_l345_c7_33ea_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l345_c7_33ea_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l345_c7_33ea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l349_c11_f94f
BIN_OP_EQ_uxn_opcodes_h_l349_c11_f94f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l349_c11_f94f_left,
BIN_OP_EQ_uxn_opcodes_h_l349_c11_f94f_right,
BIN_OP_EQ_uxn_opcodes_h_l349_c11_f94f_return_output);

-- n16_MUX_uxn_opcodes_h_l349_c7_2dfa
n16_MUX_uxn_opcodes_h_l349_c7_2dfa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l349_c7_2dfa_cond,
n16_MUX_uxn_opcodes_h_l349_c7_2dfa_iftrue,
n16_MUX_uxn_opcodes_h_l349_c7_2dfa_iffalse,
n16_MUX_uxn_opcodes_h_l349_c7_2dfa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_2dfa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_2dfa : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_2dfa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_2dfa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_2dfa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_2dfa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_2dfa
result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_2dfa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_2dfa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_2dfa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_2dfa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_2dfa_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_2dfa
result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_2dfa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_2dfa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_2dfa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_2dfa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_2dfa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_2dfa
result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_2dfa : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_2dfa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_2dfa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_2dfa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_2dfa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_2dfa
result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_2dfa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_2dfa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_2dfa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_2dfa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_2dfa_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l349_c7_2dfa
result_u8_value_MUX_uxn_opcodes_h_l349_c7_2dfa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l349_c7_2dfa_cond,
result_u8_value_MUX_uxn_opcodes_h_l349_c7_2dfa_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l349_c7_2dfa_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l349_c7_2dfa_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l350_c3_3a44
BIN_OP_OR_uxn_opcodes_h_l350_c3_3a44 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l350_c3_3a44_left,
BIN_OP_OR_uxn_opcodes_h_l350_c3_3a44_right,
BIN_OP_OR_uxn_opcodes_h_l350_c3_3a44_return_output);

-- sp_relative_shift_uxn_opcodes_h_l352_c30_9195
sp_relative_shift_uxn_opcodes_h_l352_c30_9195 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l352_c30_9195_ins,
sp_relative_shift_uxn_opcodes_h_l352_c30_9195_x,
sp_relative_shift_uxn_opcodes_h_l352_c30_9195_y,
sp_relative_shift_uxn_opcodes_h_l352_c30_9195_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l357_c11_51f5
BIN_OP_EQ_uxn_opcodes_h_l357_c11_51f5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l357_c11_51f5_left,
BIN_OP_EQ_uxn_opcodes_h_l357_c11_51f5_right,
BIN_OP_EQ_uxn_opcodes_h_l357_c11_51f5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_720b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_720b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_720b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_720b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_720b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_720b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_720b
result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_720b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_720b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_720b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_720b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_720b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_720b
result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_720b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_720b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_720b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_720b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_720b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_720b
result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_720b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_720b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_720b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_720b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_720b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l357_c7_720b
result_u8_value_MUX_uxn_opcodes_h_l357_c7_720b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l357_c7_720b_cond,
result_u8_value_MUX_uxn_opcodes_h_l357_c7_720b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l357_c7_720b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l357_c7_720b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l362_c11_a0c2
BIN_OP_EQ_uxn_opcodes_h_l362_c11_a0c2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l362_c11_a0c2_left,
BIN_OP_EQ_uxn_opcodes_h_l362_c11_a0c2_right,
BIN_OP_EQ_uxn_opcodes_h_l362_c11_a0c2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_2b7e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_2b7e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_2b7e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_2b7e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_2b7e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_2b7e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_2b7e
result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_2b7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_2b7e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_2b7e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_2b7e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_2b7e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_2b7e
result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_2b7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_2b7e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_2b7e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_2b7e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_2b7e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l362_c7_2b7e
result_u8_value_MUX_uxn_opcodes_h_l362_c7_2b7e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l362_c7_2b7e_cond,
result_u8_value_MUX_uxn_opcodes_h_l362_c7_2b7e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l362_c7_2b7e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l362_c7_2b7e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l366_c11_61a0
BIN_OP_EQ_uxn_opcodes_h_l366_c11_61a0 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l366_c11_61a0_left,
BIN_OP_EQ_uxn_opcodes_h_l366_c11_61a0_right,
BIN_OP_EQ_uxn_opcodes_h_l366_c11_61a0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d3d4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d3d4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d3d4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d3d4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d3d4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d3d4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d3d4
result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d3d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d3d4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d3d4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d3d4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d3d4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d3d4
result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d3d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d3d4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d3d4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d3d4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d3d4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l366_c7_d3d4
result_u8_value_MUX_uxn_opcodes_h_l366_c7_d3d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l366_c7_d3d4_cond,
result_u8_value_MUX_uxn_opcodes_h_l366_c7_d3d4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l366_c7_d3d4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l366_c7_d3d4_return_output);

-- CONST_SR_8_uxn_opcodes_h_l368_c31_fdd4
CONST_SR_8_uxn_opcodes_h_l368_c31_fdd4 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l368_c31_fdd4_x,
CONST_SR_8_uxn_opcodes_h_l368_c31_fdd4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l370_c11_742a
BIN_OP_EQ_uxn_opcodes_h_l370_c11_742a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l370_c11_742a_left,
BIN_OP_EQ_uxn_opcodes_h_l370_c11_742a_right,
BIN_OP_EQ_uxn_opcodes_h_l370_c11_742a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_4a9f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_4a9f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_4a9f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_4a9f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_4a9f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_4a9f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_4a9f
result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_4a9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_4a9f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_4a9f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_4a9f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_4a9f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_4a9f
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_4a9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_4a9f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_4a9f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_4a9f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_4a9f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l370_c7_4a9f
result_u8_value_MUX_uxn_opcodes_h_l370_c7_4a9f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l370_c7_4a9f_cond,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_4a9f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_4a9f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_4a9f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l374_c11_1c3f
BIN_OP_EQ_uxn_opcodes_h_l374_c11_1c3f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l374_c11_1c3f_left,
BIN_OP_EQ_uxn_opcodes_h_l374_c11_1c3f_right,
BIN_OP_EQ_uxn_opcodes_h_l374_c11_1c3f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_a42b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_a42b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_a42b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_a42b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_a42b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_a42b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_a42b
result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_a42b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_a42b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_a42b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_a42b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_a42b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_a42b
result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_a42b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_a42b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_a42b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_a42b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_a42b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l374_c7_a42b
result_u8_value_MUX_uxn_opcodes_h_l374_c7_a42b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l374_c7_a42b_cond,
result_u8_value_MUX_uxn_opcodes_h_l374_c7_a42b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l374_c7_a42b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l374_c7_a42b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l378_c11_a7d8
BIN_OP_EQ_uxn_opcodes_h_l378_c11_a7d8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l378_c11_a7d8_left,
BIN_OP_EQ_uxn_opcodes_h_l378_c11_a7d8_right,
BIN_OP_EQ_uxn_opcodes_h_l378_c11_a7d8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b2e4
result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b2e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b2e4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b2e4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b2e4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b2e4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b2e4
result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b2e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b2e4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b2e4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b2e4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b2e4_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l338_l347_DUPLICATE_1a63
CONST_SL_8_uint16_t_uxn_opcodes_h_l338_l347_DUPLICATE_1a63 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l338_l347_DUPLICATE_1a63_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l338_l347_DUPLICATE_1a63_return_output);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_ca0f
CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_ca0f : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_ca0f_x,
CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_ca0f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l328_c6_ed3c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_912b_return_output,
 n16_MUX_uxn_opcodes_h_l328_c2_bd87_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_bd87_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_bd87_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_bd87_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_bd87_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_bd87_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l328_c2_bd87_return_output,
 t16_MUX_uxn_opcodes_h_l328_c2_bd87_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l333_c11_bb79_return_output,
 n16_MUX_uxn_opcodes_h_l333_c7_c509_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c509_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c509_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c509_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c509_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c509_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l333_c7_c509_return_output,
 t16_MUX_uxn_opcodes_h_l333_c7_c509_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l336_c11_27bf_return_output,
 n16_MUX_uxn_opcodes_h_l336_c7_1771_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1771_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1771_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1771_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1771_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1771_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l336_c7_1771_return_output,
 t16_MUX_uxn_opcodes_h_l336_c7_1771_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l341_c11_6a5a_return_output,
 n16_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output,
 t16_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l342_c3_9f5b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l345_c11_7126_return_output,
 n16_MUX_uxn_opcodes_h_l345_c7_33ea_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_33ea_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_33ea_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_33ea_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_33ea_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_33ea_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l345_c7_33ea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l349_c11_f94f_return_output,
 n16_MUX_uxn_opcodes_h_l349_c7_2dfa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_2dfa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_2dfa_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_2dfa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_2dfa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_2dfa_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l349_c7_2dfa_return_output,
 BIN_OP_OR_uxn_opcodes_h_l350_c3_3a44_return_output,
 sp_relative_shift_uxn_opcodes_h_l352_c30_9195_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l357_c11_51f5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_720b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_720b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_720b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_720b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l357_c7_720b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l362_c11_a0c2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_2b7e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_2b7e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_2b7e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l362_c7_2b7e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l366_c11_61a0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d3d4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d3d4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d3d4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l366_c7_d3d4_return_output,
 CONST_SR_8_uxn_opcodes_h_l368_c31_fdd4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l370_c11_742a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_4a9f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_4a9f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_4a9f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l370_c7_4a9f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l374_c11_1c3f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_a42b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_a42b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_a42b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l374_c7_a42b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l378_c11_a7d8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b2e4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b2e4_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l338_l347_DUPLICATE_1a63_return_output,
 CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_ca0f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_ed3c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_ed3c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_ed3c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_912b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_912b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_912b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_912b_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l328_c2_bd87_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l328_c2_bd87_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l333_c7_c509_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l328_c2_bd87_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l328_c2_bd87_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_bd87_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l330_c3_1eee : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_bd87_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c509_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_bd87_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_bd87_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_bd87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_bd87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c509_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_bd87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_bd87_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_bd87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_bd87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c509_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_bd87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_bd87_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_bd87_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_bd87_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c509_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_bd87_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_bd87_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_bd87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_bd87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c509_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_bd87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_bd87_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l328_c2_bd87_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l328_c2_bd87_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l333_c7_c509_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l328_c2_bd87_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l328_c2_bd87_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l328_c2_bd87_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l328_c2_bd87_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l333_c7_c509_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l328_c2_bd87_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l328_c2_bd87_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l329_c3_8f14_uxn_opcodes_h_l329_c3_8f14_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_bb79_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_bb79_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_bb79_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l333_c7_c509_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l333_c7_c509_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l336_c7_1771_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l333_c7_c509_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c509_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l334_c3_1263 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c509_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1771_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c509_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c509_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c509_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1771_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c509_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c509_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c509_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1771_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c509_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c509_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c509_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1771_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c509_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c509_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c509_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1771_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c509_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l333_c7_c509_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l333_c7_c509_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l336_c7_1771_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l333_c7_c509_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l333_c7_c509_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l333_c7_c509_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l336_c7_1771_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l333_c7_c509_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_27bf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_27bf_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_27bf_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l336_c7_1771_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l336_c7_1771_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l336_c7_1771_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1771_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l339_c3_c4ee : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1771_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1771_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1771_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1771_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1771_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1771_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1771_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1771_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1771_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1771_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1771_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1771_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1771_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1771_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l336_c7_1771_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l336_c7_1771_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l336_c7_1771_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l336_c7_1771_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l336_c7_1771_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l336_c7_1771_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_6a5a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_6a5a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_6a5a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l341_c7_4d8b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l341_c7_4d8b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l345_c7_33ea_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l341_c7_4d8b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_4d8b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l343_c3_6680 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_4d8b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_33ea_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_4d8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_4d8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_4d8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_33ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_4d8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_4d8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_4d8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_33ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_4d8b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_4d8b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_4d8b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_33ea_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_4d8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_4d8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_4d8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_33ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_4d8b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_4d8b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_4d8b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c7_33ea_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_4d8b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l341_c7_4d8b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l341_c7_4d8b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l341_c7_4d8b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l342_c3_9f5b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l342_c3_9f5b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l342_c3_9f5b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_7126_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_7126_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_7126_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l345_c7_33ea_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l345_c7_33ea_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l349_c7_2dfa_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l345_c7_33ea_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_33ea_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_33ea_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_2dfa_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_33ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_33ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_33ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_2dfa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_33ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_33ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_33ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_2dfa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_33ea_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_33ea_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_33ea_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_2dfa_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_33ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_33ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_33ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_2dfa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_33ea_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c7_33ea_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c7_33ea_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l349_c7_2dfa_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c7_33ea_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_f94f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_f94f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_f94f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l349_c7_2dfa_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l349_c7_2dfa_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l349_c7_2dfa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_2dfa_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l354_c3_a075 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_2dfa_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_720b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_2dfa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_2dfa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_2dfa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_720b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_2dfa_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_2dfa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_2dfa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_720b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_2dfa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_2dfa_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_2dfa_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_2dfa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_2dfa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_2dfa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_720b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_2dfa_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l349_c7_2dfa_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l349_c7_2dfa_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_720b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l349_c7_2dfa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l350_c3_3a44_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l350_c3_3a44_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l350_c3_3a44_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l352_c30_9195_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l352_c30_9195_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l352_c30_9195_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l352_c30_9195_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l355_c21_e29a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_51f5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_51f5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_51f5_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_720b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l359_c3_e5b5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_720b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_2b7e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_720b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_720b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_720b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_2b7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_720b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_720b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_720b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_2b7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_720b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_720b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_720b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_720b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_720b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_720b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l362_c7_2b7e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_720b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_a0c2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_a0c2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_a0c2_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_2b7e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l363_c3_06c5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_2b7e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d3d4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_2b7e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_2b7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_2b7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d3d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_2b7e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_2b7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_2b7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d3d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_2b7e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l362_c7_2b7e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l362_c7_2b7e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l366_c7_d3d4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l362_c7_2b7e_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l364_c21_7526_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_61a0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_61a0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_61a0_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d3d4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_86ee : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d3d4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_4a9f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d3d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d3d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d3d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_4a9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d3d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d3d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d3d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_4a9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d3d4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l366_c7_d3d4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l366_c7_d3d4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_4a9f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l366_c7_d3d4_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l368_c31_fdd4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l368_c31_fdd4_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l368_c21_8ac1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_742a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_742a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_742a_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_4a9f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l371_c3_6a9a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_4a9f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_a42b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_4a9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_4a9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_4a9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_a42b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_4a9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_4a9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_4a9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_a42b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_4a9f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_4a9f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_4a9f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l374_c7_a42b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_4a9f_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l372_c21_b67c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_1c3f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_1c3f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_1c3f_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_a42b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l375_c3_487e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_a42b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_a42b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_a42b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_a42b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b2e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_a42b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_a42b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_a42b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b2e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_a42b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l374_c7_a42b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l374_c7_a42b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l374_c7_a42b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_a7d8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_a7d8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_a7d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b2e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b2e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b2e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b2e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b2e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b2e4_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l378_l345_l374_l341_l370_l336_l366_l333_l362_l328_l357_DUPLICATE_aaf1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l345_l341_l336_l333_l328_l357_DUPLICATE_e591_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l349_l345_l341_l336_l333_l328_DUPLICATE_2181_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l345_l374_l341_l336_l333_l328_DUPLICATE_6bc8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l349_l378_l345_l374_l341_l370_l336_l366_l333_l362_l357_DUPLICATE_7db4_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l337_l346_l350_l342_DUPLICATE_f089_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l338_l347_DUPLICATE_1a63_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l338_l347_DUPLICATE_1a63_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l345_l374_DUPLICATE_ff67_return_output : unsigned(3 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_ca0f_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_ca0f_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_f95d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l383_l324_DUPLICATE_7347_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_1c3f_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_86ee := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d3d4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_86ee;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_51f5_right := to_unsigned(6, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l352_c30_9195_y := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_a7d8_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_bb79_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l343_c3_6680 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_4d8b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l343_c3_6680;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l375_c3_487e := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_a42b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l375_c3_487e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l330_c3_1eee := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_bd87_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l330_c3_1eee;
     VAR_sp_relative_shift_uxn_opcodes_h_l352_c30_9195_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l371_c3_6a9a := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_4a9f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l371_c3_6a9a;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_912b_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l334_c3_1263 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c509_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l334_c3_1263;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l339_c3_c4ee := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1771_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l339_c3_c4ee;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_742a_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l363_c3_06c5 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_2b7e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l363_c3_06c5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_a0c2_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l359_c3_e5b5 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_720b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l359_c3_e5b5;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b2e4_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_720b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_7126_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b2e4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_27bf_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_2dfa_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_f94f_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_61a0_right := to_unsigned(8, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_2dfa_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_ed3c_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_6a5a_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l354_c3_a075 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_2dfa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l354_c3_a075;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_bd87_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_912b_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l352_c30_9195_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l350_c3_3a44_left := n16;
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_ca0f_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l328_c2_bd87_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l333_c7_c509_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l336_c7_1771_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l341_c7_4d8b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l349_c7_2dfa_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_ed3c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_bb79_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_27bf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_6a5a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_7126_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_f94f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_51f5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_a0c2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_61a0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_742a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_1c3f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_a7d8_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l342_c3_9f5b_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l368_c31_fdd4_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l328_c2_bd87_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l333_c7_c509_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l341_c7_4d8b_iffalse := t16;
     -- CONST_SR_8[uxn_opcodes_h_l368_c31_fdd4] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l368_c31_fdd4_x <= VAR_CONST_SR_8_uxn_opcodes_h_l368_c31_fdd4_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l368_c31_fdd4_return_output := CONST_SR_8_uxn_opcodes_h_l368_c31_fdd4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l349_l378_l345_l374_l341_l370_l336_l366_l333_l362_l357_DUPLICATE_7db4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l349_l378_l345_l374_l341_l370_l336_l366_l333_l362_l357_DUPLICATE_7db4_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l333_c11_bb79] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l333_c11_bb79_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_bb79_left;
     BIN_OP_EQ_uxn_opcodes_h_l333_c11_bb79_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_bb79_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_bb79_return_output := BIN_OP_EQ_uxn_opcodes_h_l333_c11_bb79_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l372_c21_b67c] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l372_c21_b67c_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l349_l345_l341_l336_l333_l328_DUPLICATE_2181 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l349_l345_l341_l336_l333_l328_DUPLICATE_2181_return_output := result.sp_relative_shift;

     -- sp_relative_shift[uxn_opcodes_h_l352_c30_9195] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l352_c30_9195_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l352_c30_9195_ins;
     sp_relative_shift_uxn_opcodes_h_l352_c30_9195_x <= VAR_sp_relative_shift_uxn_opcodes_h_l352_c30_9195_x;
     sp_relative_shift_uxn_opcodes_h_l352_c30_9195_y <= VAR_sp_relative_shift_uxn_opcodes_h_l352_c30_9195_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l352_c30_9195_return_output := sp_relative_shift_uxn_opcodes_h_l352_c30_9195_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l366_c11_61a0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l366_c11_61a0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_61a0_left;
     BIN_OP_EQ_uxn_opcodes_h_l366_c11_61a0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_61a0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_61a0_return_output := BIN_OP_EQ_uxn_opcodes_h_l366_c11_61a0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l328_c6_ed3c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l328_c6_ed3c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_ed3c_left;
     BIN_OP_EQ_uxn_opcodes_h_l328_c6_ed3c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_ed3c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_ed3c_return_output := BIN_OP_EQ_uxn_opcodes_h_l328_c6_ed3c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l370_c11_742a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l370_c11_742a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_742a_left;
     BIN_OP_EQ_uxn_opcodes_h_l370_c11_742a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_742a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_742a_return_output := BIN_OP_EQ_uxn_opcodes_h_l370_c11_742a_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l364_c21_7526] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l364_c21_7526_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_ca0f LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_ca0f_x <= VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_ca0f_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_ca0f_return_output := CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_ca0f_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l337_l346_l350_l342_DUPLICATE_f089 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l337_l346_l350_l342_DUPLICATE_f089_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l374_c11_1c3f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l374_c11_1c3f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_1c3f_left;
     BIN_OP_EQ_uxn_opcodes_h_l374_c11_1c3f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_1c3f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_1c3f_return_output := BIN_OP_EQ_uxn_opcodes_h_l374_c11_1c3f_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l345_l374_DUPLICATE_ff67 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l345_l374_DUPLICATE_ff67_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l362_c11_a0c2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l362_c11_a0c2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_a0c2_left;
     BIN_OP_EQ_uxn_opcodes_h_l362_c11_a0c2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_a0c2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_a0c2_return_output := BIN_OP_EQ_uxn_opcodes_h_l362_c11_a0c2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l349_c11_f94f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l349_c11_f94f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_f94f_left;
     BIN_OP_EQ_uxn_opcodes_h_l349_c11_f94f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_f94f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_f94f_return_output := BIN_OP_EQ_uxn_opcodes_h_l349_c11_f94f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l336_c11_27bf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l336_c11_27bf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_27bf_left;
     BIN_OP_EQ_uxn_opcodes_h_l336_c11_27bf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_27bf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_27bf_return_output := BIN_OP_EQ_uxn_opcodes_h_l336_c11_27bf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l341_c11_6a5a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l341_c11_6a5a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_6a5a_left;
     BIN_OP_EQ_uxn_opcodes_h_l341_c11_6a5a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_6a5a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_6a5a_return_output := BIN_OP_EQ_uxn_opcodes_h_l341_c11_6a5a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l378_c11_a7d8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l378_c11_a7d8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_a7d8_left;
     BIN_OP_EQ_uxn_opcodes_h_l378_c11_a7d8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_a7d8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_a7d8_return_output := BIN_OP_EQ_uxn_opcodes_h_l378_c11_a7d8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l345_l341_l336_l333_l328_l357_DUPLICATE_e591 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l345_l341_l336_l333_l328_l357_DUPLICATE_e591_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l378_l345_l374_l341_l370_l336_l366_l333_l362_l328_l357_DUPLICATE_aaf1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l378_l345_l374_l341_l370_l336_l366_l333_l362_l328_l357_DUPLICATE_aaf1_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l345_l374_l341_l336_l333_l328_DUPLICATE_6bc8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l345_l374_l341_l336_l333_l328_DUPLICATE_6bc8_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l345_c11_7126] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l345_c11_7126_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_7126_left;
     BIN_OP_EQ_uxn_opcodes_h_l345_c11_7126_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_7126_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_7126_return_output := BIN_OP_EQ_uxn_opcodes_h_l345_c11_7126_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l357_c11_51f5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l357_c11_51f5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_51f5_left;
     BIN_OP_EQ_uxn_opcodes_h_l357_c11_51f5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_51f5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_51f5_return_output := BIN_OP_EQ_uxn_opcodes_h_l357_c11_51f5_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_912b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_ed3c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l328_c2_bd87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_ed3c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_bd87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_ed3c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_bd87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_ed3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_bd87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_ed3c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_bd87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_ed3c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_bd87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_ed3c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l328_c2_bd87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_ed3c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l328_c2_bd87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_ed3c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l333_c7_c509_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_bb79_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c509_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_bb79_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c509_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_bb79_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c509_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_bb79_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c509_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_bb79_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c509_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_bb79_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l333_c7_c509_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_bb79_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l333_c7_c509_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_bb79_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l336_c7_1771_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_27bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1771_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_27bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1771_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_27bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1771_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_27bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1771_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_27bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1771_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_27bf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l336_c7_1771_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_27bf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l336_c7_1771_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_27bf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l341_c7_4d8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_6a5a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_4d8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_6a5a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_4d8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_6a5a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_4d8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_6a5a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_4d8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_6a5a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_4d8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_6a5a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_4d8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_6a5a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l341_c7_4d8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_6a5a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l345_c7_33ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_7126_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_33ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_7126_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_33ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_7126_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_33ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_7126_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_33ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_7126_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_33ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_7126_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c7_33ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_7126_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l349_c7_2dfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_f94f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_2dfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_f94f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_2dfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_f94f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_2dfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_f94f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_2dfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_f94f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_2dfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_f94f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l349_c7_2dfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_f94f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_720b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_51f5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_720b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_51f5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_720b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_51f5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_720b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_51f5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_720b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_51f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_2b7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_a0c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_2b7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_a0c2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_2b7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_a0c2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l362_c7_2b7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_a0c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d3d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_61a0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d3d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_61a0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d3d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_61a0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l366_c7_d3d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_61a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_4a9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_742a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_4a9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_742a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_4a9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_742a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_4a9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_742a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_a42b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_1c3f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_a42b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_1c3f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_a42b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_1c3f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l374_c7_a42b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_1c3f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b2e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_a7d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b2e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_a7d8_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l342_c3_9f5b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l337_l346_l350_l342_DUPLICATE_f089_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l350_c3_3a44_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l337_l346_l350_l342_DUPLICATE_f089_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l338_l347_DUPLICATE_1a63_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l337_l346_l350_l342_DUPLICATE_f089_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l362_c7_2b7e_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l364_c21_7526_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_4a9f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l372_c21_b67c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_bd87_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l349_l345_l341_l336_l333_l328_DUPLICATE_2181_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c509_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l349_l345_l341_l336_l333_l328_DUPLICATE_2181_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1771_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l349_l345_l341_l336_l333_l328_DUPLICATE_2181_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_4d8b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l349_l345_l341_l336_l333_l328_DUPLICATE_2181_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_33ea_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l349_l345_l341_l336_l333_l328_DUPLICATE_2181_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_2dfa_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l349_l345_l341_l336_l333_l328_DUPLICATE_2181_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c509_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l349_l378_l345_l374_l341_l370_l336_l366_l333_l362_l357_DUPLICATE_7db4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1771_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l349_l378_l345_l374_l341_l370_l336_l366_l333_l362_l357_DUPLICATE_7db4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_4d8b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l349_l378_l345_l374_l341_l370_l336_l366_l333_l362_l357_DUPLICATE_7db4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_33ea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l349_l378_l345_l374_l341_l370_l336_l366_l333_l362_l357_DUPLICATE_7db4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_2dfa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l349_l378_l345_l374_l341_l370_l336_l366_l333_l362_l357_DUPLICATE_7db4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_720b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l349_l378_l345_l374_l341_l370_l336_l366_l333_l362_l357_DUPLICATE_7db4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_2b7e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l349_l378_l345_l374_l341_l370_l336_l366_l333_l362_l357_DUPLICATE_7db4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d3d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l349_l378_l345_l374_l341_l370_l336_l366_l333_l362_l357_DUPLICATE_7db4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_4a9f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l349_l378_l345_l374_l341_l370_l336_l366_l333_l362_l357_DUPLICATE_7db4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_a42b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l349_l378_l345_l374_l341_l370_l336_l366_l333_l362_l357_DUPLICATE_7db4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b2e4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l349_l378_l345_l374_l341_l370_l336_l366_l333_l362_l357_DUPLICATE_7db4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_bd87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l345_l341_l336_l333_l328_l357_DUPLICATE_e591_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c509_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l345_l341_l336_l333_l328_l357_DUPLICATE_e591_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1771_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l345_l341_l336_l333_l328_l357_DUPLICATE_e591_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_4d8b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l345_l341_l336_l333_l328_l357_DUPLICATE_e591_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_33ea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l345_l341_l336_l333_l328_l357_DUPLICATE_e591_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_720b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l345_l341_l336_l333_l328_l357_DUPLICATE_e591_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_bd87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l378_l345_l374_l341_l370_l336_l366_l333_l362_l328_l357_DUPLICATE_aaf1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c509_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l378_l345_l374_l341_l370_l336_l366_l333_l362_l328_l357_DUPLICATE_aaf1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1771_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l378_l345_l374_l341_l370_l336_l366_l333_l362_l328_l357_DUPLICATE_aaf1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_4d8b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l378_l345_l374_l341_l370_l336_l366_l333_l362_l328_l357_DUPLICATE_aaf1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_33ea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l378_l345_l374_l341_l370_l336_l366_l333_l362_l328_l357_DUPLICATE_aaf1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_720b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l378_l345_l374_l341_l370_l336_l366_l333_l362_l328_l357_DUPLICATE_aaf1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_2b7e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l378_l345_l374_l341_l370_l336_l366_l333_l362_l328_l357_DUPLICATE_aaf1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d3d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l378_l345_l374_l341_l370_l336_l366_l333_l362_l328_l357_DUPLICATE_aaf1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_4a9f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l378_l345_l374_l341_l370_l336_l366_l333_l362_l328_l357_DUPLICATE_aaf1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_a42b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l378_l345_l374_l341_l370_l336_l366_l333_l362_l328_l357_DUPLICATE_aaf1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b2e4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l378_l345_l374_l341_l370_l336_l366_l333_l362_l328_l357_DUPLICATE_aaf1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_33ea_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l345_l374_DUPLICATE_ff67_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_a42b_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l345_l374_DUPLICATE_ff67_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l328_c2_bd87_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l345_l374_l341_l336_l333_l328_DUPLICATE_6bc8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l333_c7_c509_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l345_l374_l341_l336_l333_l328_DUPLICATE_6bc8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l336_c7_1771_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l345_l374_l341_l336_l333_l328_DUPLICATE_6bc8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_4d8b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l345_l374_l341_l336_l333_l328_DUPLICATE_6bc8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c7_33ea_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l345_l374_l341_l336_l333_l328_DUPLICATE_6bc8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l374_c7_a42b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l345_l374_l341_l336_l333_l328_DUPLICATE_6bc8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_2dfa_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l352_c30_9195_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l342_c3_9f5b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l342_c3_9f5b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l342_c3_9f5b_left;
     BIN_OP_OR_uxn_opcodes_h_l342_c3_9f5b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l342_c3_9f5b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l342_c3_9f5b_return_output := BIN_OP_OR_uxn_opcodes_h_l342_c3_9f5b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l357_c7_720b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_720b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_720b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_720b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_720b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_720b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_720b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_720b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_720b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l378_c7_b2e4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b2e4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b2e4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b2e4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b2e4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b2e4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b2e4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b2e4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b2e4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l349_c7_2dfa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_2dfa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_2dfa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_2dfa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_2dfa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_2dfa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_2dfa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_2dfa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_2dfa_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_f95d LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_f95d_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_ca0f_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l374_c7_a42b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_a42b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_a42b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_a42b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_a42b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_a42b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_a42b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_a42b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_a42b_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l338_l347_DUPLICATE_1a63 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l338_l347_DUPLICATE_1a63_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l338_l347_DUPLICATE_1a63_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l338_l347_DUPLICATE_1a63_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l338_l347_DUPLICATE_1a63_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l350_c3_3a44] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l350_c3_3a44_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l350_c3_3a44_left;
     BIN_OP_OR_uxn_opcodes_h_l350_c3_3a44_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l350_c3_3a44_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l350_c3_3a44_return_output := BIN_OP_OR_uxn_opcodes_h_l350_c3_3a44_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l378_c7_b2e4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b2e4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b2e4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b2e4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b2e4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b2e4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b2e4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b2e4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b2e4_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l368_c21_8ac1] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l368_c21_8ac1_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l368_c31_fdd4_return_output);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l328_c1_912b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_912b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_912b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_912b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_912b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_912b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_912b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_912b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_912b_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l341_c7_4d8b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l342_c3_9f5b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l349_c7_2dfa_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l350_c3_3a44_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l366_c7_d3d4_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l368_c21_8ac1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_720b_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_f95d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l374_c7_a42b_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_f95d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l345_c7_33ea_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l338_l347_DUPLICATE_1a63_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l336_c7_1771_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l338_l347_DUPLICATE_1a63_return_output;
     VAR_printf_uxn_opcodes_h_l329_c3_8f14_uxn_opcodes_h_l329_c3_8f14_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_912b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_a42b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b2e4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_2dfa_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_720b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_a42b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b2e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_33ea_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_2dfa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_4a9f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_a42b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l374_c7_a42b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_a42b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_a42b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_a42b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_a42b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_a42b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_a42b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_a42b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_a42b_return_output;

     -- n16_MUX[uxn_opcodes_h_l349_c7_2dfa] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l349_c7_2dfa_cond <= VAR_n16_MUX_uxn_opcodes_h_l349_c7_2dfa_cond;
     n16_MUX_uxn_opcodes_h_l349_c7_2dfa_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l349_c7_2dfa_iftrue;
     n16_MUX_uxn_opcodes_h_l349_c7_2dfa_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l349_c7_2dfa_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l349_c7_2dfa_return_output := n16_MUX_uxn_opcodes_h_l349_c7_2dfa_return_output;

     -- t16_MUX[uxn_opcodes_h_l341_c7_4d8b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l341_c7_4d8b_cond <= VAR_t16_MUX_uxn_opcodes_h_l341_c7_4d8b_cond;
     t16_MUX_uxn_opcodes_h_l341_c7_4d8b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l341_c7_4d8b_iftrue;
     t16_MUX_uxn_opcodes_h_l341_c7_4d8b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l341_c7_4d8b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output := t16_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l349_c7_2dfa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_2dfa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_2dfa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_2dfa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_2dfa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_2dfa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_2dfa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_2dfa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_2dfa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l374_c7_a42b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_a42b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_a42b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_a42b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_a42b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_a42b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_a42b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_a42b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_a42b_return_output;

     -- printf_uxn_opcodes_h_l329_c3_8f14[uxn_opcodes_h_l329_c3_8f14] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l329_c3_8f14_uxn_opcodes_h_l329_c3_8f14_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l329_c3_8f14_uxn_opcodes_h_l329_c3_8f14_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_u8_value_MUX[uxn_opcodes_h_l374_c7_a42b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l374_c7_a42b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l374_c7_a42b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l374_c7_a42b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l374_c7_a42b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l374_c7_a42b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l374_c7_a42b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l374_c7_a42b_return_output := result_u8_value_MUX_uxn_opcodes_h_l374_c7_a42b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l345_c7_33ea] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_33ea_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_33ea_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_33ea_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_33ea_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_33ea_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_33ea_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_33ea_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_33ea_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l355_c21_e29a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l355_c21_e29a_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l350_c3_3a44_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l370_c7_4a9f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_4a9f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_4a9f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_4a9f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_4a9f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_4a9f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_4a9f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_4a9f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_4a9f_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l349_c7_2dfa_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l355_c21_e29a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l345_c7_33ea_iffalse := VAR_n16_MUX_uxn_opcodes_h_l349_c7_2dfa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_4a9f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_a42b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_33ea_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_2dfa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_4a9f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_a42b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_4d8b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_33ea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d3d4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_4a9f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_4a9f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l374_c7_a42b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l336_c7_1771_iffalse := VAR_t16_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output;
     -- n16_MUX[uxn_opcodes_h_l345_c7_33ea] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l345_c7_33ea_cond <= VAR_n16_MUX_uxn_opcodes_h_l345_c7_33ea_cond;
     n16_MUX_uxn_opcodes_h_l345_c7_33ea_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l345_c7_33ea_iftrue;
     n16_MUX_uxn_opcodes_h_l345_c7_33ea_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l345_c7_33ea_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l345_c7_33ea_return_output := n16_MUX_uxn_opcodes_h_l345_c7_33ea_return_output;

     -- t16_MUX[uxn_opcodes_h_l336_c7_1771] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l336_c7_1771_cond <= VAR_t16_MUX_uxn_opcodes_h_l336_c7_1771_cond;
     t16_MUX_uxn_opcodes_h_l336_c7_1771_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l336_c7_1771_iftrue;
     t16_MUX_uxn_opcodes_h_l336_c7_1771_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l336_c7_1771_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l336_c7_1771_return_output := t16_MUX_uxn_opcodes_h_l336_c7_1771_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l370_c7_4a9f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_4a9f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_4a9f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_4a9f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_4a9f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_4a9f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_4a9f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_4a9f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_4a9f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l370_c7_4a9f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_4a9f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_4a9f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_4a9f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_4a9f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_4a9f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_4a9f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_4a9f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_4a9f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l341_c7_4d8b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_4d8b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_4d8b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_4d8b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_4d8b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_4d8b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_4d8b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l370_c7_4a9f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_4a9f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_4a9f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_4a9f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_4a9f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_4a9f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_4a9f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_4a9f_return_output := result_u8_value_MUX_uxn_opcodes_h_l370_c7_4a9f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l345_c7_33ea] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_33ea_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_33ea_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_33ea_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_33ea_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_33ea_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_33ea_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_33ea_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_33ea_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l366_c7_d3d4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d3d4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d3d4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d3d4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d3d4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d3d4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d3d4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d3d4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d3d4_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l341_c7_4d8b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l345_c7_33ea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d3d4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_4a9f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_4d8b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_33ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d3d4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_4a9f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1771_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_2b7e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_d3d4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l366_c7_d3d4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_4a9f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l333_c7_c509_iffalse := VAR_t16_MUX_uxn_opcodes_h_l336_c7_1771_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l366_c7_d3d4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d3d4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d3d4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d3d4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d3d4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d3d4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d3d4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d3d4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d3d4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l341_c7_4d8b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_4d8b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_4d8b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_4d8b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_4d8b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_4d8b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_4d8b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l362_c7_2b7e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_2b7e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_2b7e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_2b7e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_2b7e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_2b7e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_2b7e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_2b7e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_2b7e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l366_c7_d3d4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l366_c7_d3d4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l366_c7_d3d4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l366_c7_d3d4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l366_c7_d3d4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l366_c7_d3d4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l366_c7_d3d4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l366_c7_d3d4_return_output := result_u8_value_MUX_uxn_opcodes_h_l366_c7_d3d4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l336_c7_1771] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1771_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1771_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1771_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1771_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1771_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1771_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1771_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1771_return_output;

     -- t16_MUX[uxn_opcodes_h_l333_c7_c509] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l333_c7_c509_cond <= VAR_t16_MUX_uxn_opcodes_h_l333_c7_c509_cond;
     t16_MUX_uxn_opcodes_h_l333_c7_c509_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l333_c7_c509_iftrue;
     t16_MUX_uxn_opcodes_h_l333_c7_c509_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l333_c7_c509_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l333_c7_c509_return_output := t16_MUX_uxn_opcodes_h_l333_c7_c509_return_output;

     -- n16_MUX[uxn_opcodes_h_l341_c7_4d8b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l341_c7_4d8b_cond <= VAR_n16_MUX_uxn_opcodes_h_l341_c7_4d8b_cond;
     n16_MUX_uxn_opcodes_h_l341_c7_4d8b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l341_c7_4d8b_iftrue;
     n16_MUX_uxn_opcodes_h_l341_c7_4d8b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l341_c7_4d8b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output := n16_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l366_c7_d3d4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d3d4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d3d4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d3d4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d3d4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d3d4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d3d4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d3d4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d3d4_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l336_c7_1771_iffalse := VAR_n16_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_2b7e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_d3d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1771_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_2b7e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_d3d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c509_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1771_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_720b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_2b7e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l362_c7_2b7e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l366_c7_d3d4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l328_c2_bd87_iffalse := VAR_t16_MUX_uxn_opcodes_h_l333_c7_c509_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l362_c7_2b7e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l362_c7_2b7e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l362_c7_2b7e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l362_c7_2b7e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l362_c7_2b7e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l362_c7_2b7e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l362_c7_2b7e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l362_c7_2b7e_return_output := result_u8_value_MUX_uxn_opcodes_h_l362_c7_2b7e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l333_c7_c509] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c509_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c509_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c509_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c509_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c509_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c509_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c509_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c509_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l357_c7_720b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_720b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_720b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_720b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_720b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_720b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_720b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_720b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_720b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l362_c7_2b7e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_2b7e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_2b7e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_2b7e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_2b7e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_2b7e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_2b7e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_2b7e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_2b7e_return_output;

     -- t16_MUX[uxn_opcodes_h_l328_c2_bd87] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l328_c2_bd87_cond <= VAR_t16_MUX_uxn_opcodes_h_l328_c2_bd87_cond;
     t16_MUX_uxn_opcodes_h_l328_c2_bd87_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l328_c2_bd87_iftrue;
     t16_MUX_uxn_opcodes_h_l328_c2_bd87_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l328_c2_bd87_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l328_c2_bd87_return_output := t16_MUX_uxn_opcodes_h_l328_c2_bd87_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l362_c7_2b7e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_2b7e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_2b7e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_2b7e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_2b7e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_2b7e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_2b7e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_2b7e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_2b7e_return_output;

     -- n16_MUX[uxn_opcodes_h_l336_c7_1771] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l336_c7_1771_cond <= VAR_n16_MUX_uxn_opcodes_h_l336_c7_1771_cond;
     n16_MUX_uxn_opcodes_h_l336_c7_1771_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l336_c7_1771_iftrue;
     n16_MUX_uxn_opcodes_h_l336_c7_1771_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l336_c7_1771_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l336_c7_1771_return_output := n16_MUX_uxn_opcodes_h_l336_c7_1771_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l336_c7_1771] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1771_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1771_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1771_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1771_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1771_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1771_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1771_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1771_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l333_c7_c509_iffalse := VAR_n16_MUX_uxn_opcodes_h_l336_c7_1771_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_720b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_2b7e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c509_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1771_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_720b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_2b7e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_bd87_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c509_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_2dfa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_720b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_720b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l362_c7_2b7e_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l328_c2_bd87_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l349_c7_2dfa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_2dfa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_2dfa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_2dfa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_2dfa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_2dfa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_2dfa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_2dfa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_2dfa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l357_c7_720b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_720b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_720b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_720b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_720b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_720b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_720b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_720b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_720b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l328_c2_bd87] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_bd87_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_bd87_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_bd87_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_bd87_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_bd87_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_bd87_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_bd87_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_bd87_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l357_c7_720b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_720b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_720b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_720b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_720b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_720b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_720b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_720b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_720b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l357_c7_720b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l357_c7_720b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_720b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l357_c7_720b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_720b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l357_c7_720b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_720b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_720b_return_output := result_u8_value_MUX_uxn_opcodes_h_l357_c7_720b_return_output;

     -- n16_MUX[uxn_opcodes_h_l333_c7_c509] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l333_c7_c509_cond <= VAR_n16_MUX_uxn_opcodes_h_l333_c7_c509_cond;
     n16_MUX_uxn_opcodes_h_l333_c7_c509_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l333_c7_c509_iftrue;
     n16_MUX_uxn_opcodes_h_l333_c7_c509_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l333_c7_c509_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l333_c7_c509_return_output := n16_MUX_uxn_opcodes_h_l333_c7_c509_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l333_c7_c509] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c509_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c509_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c509_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c509_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c509_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c509_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c509_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c509_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l328_c2_bd87_iffalse := VAR_n16_MUX_uxn_opcodes_h_l333_c7_c509_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_2dfa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_720b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_bd87_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c509_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_2dfa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_720b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_33ea_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_2dfa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l349_c7_2dfa_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_720b_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l349_c7_2dfa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_2dfa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_2dfa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_2dfa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_2dfa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_2dfa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_2dfa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_2dfa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_2dfa_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l349_c7_2dfa] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l349_c7_2dfa_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l349_c7_2dfa_cond;
     result_u8_value_MUX_uxn_opcodes_h_l349_c7_2dfa_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l349_c7_2dfa_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l349_c7_2dfa_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l349_c7_2dfa_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l349_c7_2dfa_return_output := result_u8_value_MUX_uxn_opcodes_h_l349_c7_2dfa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l349_c7_2dfa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_2dfa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_2dfa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_2dfa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_2dfa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_2dfa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_2dfa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_2dfa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_2dfa_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l345_c7_33ea] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_33ea_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_33ea_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_33ea_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_33ea_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_33ea_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_33ea_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_33ea_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_33ea_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l328_c2_bd87] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_bd87_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_bd87_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_bd87_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_bd87_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_bd87_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_bd87_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_bd87_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_bd87_return_output;

     -- n16_MUX[uxn_opcodes_h_l328_c2_bd87] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l328_c2_bd87_cond <= VAR_n16_MUX_uxn_opcodes_h_l328_c2_bd87_cond;
     n16_MUX_uxn_opcodes_h_l328_c2_bd87_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l328_c2_bd87_iftrue;
     n16_MUX_uxn_opcodes_h_l328_c2_bd87_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l328_c2_bd87_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l328_c2_bd87_return_output := n16_MUX_uxn_opcodes_h_l328_c2_bd87_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l328_c2_bd87_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_33ea_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_2dfa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_33ea_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_2dfa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_4d8b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_33ea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c7_33ea_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l349_c7_2dfa_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l341_c7_4d8b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_4d8b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_4d8b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_4d8b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_4d8b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_4d8b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_4d8b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l345_c7_33ea] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l345_c7_33ea_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c7_33ea_cond;
     result_u8_value_MUX_uxn_opcodes_h_l345_c7_33ea_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c7_33ea_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l345_c7_33ea_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c7_33ea_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c7_33ea_return_output := result_u8_value_MUX_uxn_opcodes_h_l345_c7_33ea_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l345_c7_33ea] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_33ea_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_33ea_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_33ea_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_33ea_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_33ea_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_33ea_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_33ea_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_33ea_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l345_c7_33ea] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_33ea_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_33ea_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_33ea_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_33ea_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_33ea_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_33ea_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_33ea_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_33ea_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_4d8b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_33ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_4d8b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_33ea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1771_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_4d8b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c7_33ea_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l336_c7_1771] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1771_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1771_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1771_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1771_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1771_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1771_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1771_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1771_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l341_c7_4d8b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_4d8b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_4d8b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_4d8b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_4d8b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_4d8b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_4d8b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l341_c7_4d8b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l341_c7_4d8b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_4d8b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l341_c7_4d8b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_4d8b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l341_c7_4d8b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_4d8b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output := result_u8_value_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l341_c7_4d8b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_4d8b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_4d8b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_4d8b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_4d8b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_4d8b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_4d8b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1771_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1771_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c509_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1771_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l336_c7_1771_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_4d8b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l336_c7_1771] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1771_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1771_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1771_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1771_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1771_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1771_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1771_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1771_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l333_c7_c509] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c509_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c509_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c509_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c509_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c509_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c509_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c509_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c509_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l336_c7_1771] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1771_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1771_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1771_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1771_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1771_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1771_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1771_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1771_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l336_c7_1771] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l336_c7_1771_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l336_c7_1771_cond;
     result_u8_value_MUX_uxn_opcodes_h_l336_c7_1771_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l336_c7_1771_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l336_c7_1771_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l336_c7_1771_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l336_c7_1771_return_output := result_u8_value_MUX_uxn_opcodes_h_l336_c7_1771_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c509_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1771_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c509_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1771_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_bd87_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c509_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l333_c7_c509_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l336_c7_1771_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l333_c7_c509] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c509_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c509_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c509_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c509_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c509_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c509_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c509_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c509_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l333_c7_c509] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c509_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c509_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c509_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c509_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c509_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c509_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c509_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c509_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l328_c2_bd87] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_bd87_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_bd87_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_bd87_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_bd87_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_bd87_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_bd87_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_bd87_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_bd87_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l333_c7_c509] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l333_c7_c509_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l333_c7_c509_cond;
     result_u8_value_MUX_uxn_opcodes_h_l333_c7_c509_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l333_c7_c509_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l333_c7_c509_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l333_c7_c509_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l333_c7_c509_return_output := result_u8_value_MUX_uxn_opcodes_h_l333_c7_c509_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_bd87_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c509_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_bd87_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c509_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l328_c2_bd87_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l333_c7_c509_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l328_c2_bd87] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_bd87_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_bd87_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_bd87_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_bd87_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_bd87_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_bd87_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_bd87_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_bd87_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l328_c2_bd87] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l328_c2_bd87_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l328_c2_bd87_cond;
     result_u8_value_MUX_uxn_opcodes_h_l328_c2_bd87_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l328_c2_bd87_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l328_c2_bd87_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l328_c2_bd87_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l328_c2_bd87_return_output := result_u8_value_MUX_uxn_opcodes_h_l328_c2_bd87_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l328_c2_bd87] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_bd87_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_bd87_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_bd87_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_bd87_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_bd87_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_bd87_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_bd87_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_bd87_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l383_l324_DUPLICATE_7347 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l383_l324_DUPLICATE_7347_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4e73(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_bd87_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_bd87_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_bd87_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_bd87_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_bd87_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l328_c2_bd87_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l383_l324_DUPLICATE_7347_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l383_l324_DUPLICATE_7347_return_output;
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
