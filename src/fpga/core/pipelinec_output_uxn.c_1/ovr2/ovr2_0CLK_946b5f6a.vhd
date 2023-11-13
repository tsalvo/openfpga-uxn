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
-- BIN_OP_EQ[uxn_opcodes_h_l328_c6_e7e9]
signal BIN_OP_EQ_uxn_opcodes_h_l328_c6_e7e9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l328_c6_e7e9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l328_c6_e7e9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l328_c1_2bd4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_2bd4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_2bd4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_2bd4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_2bd4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l328_c2_9ef7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_9ef7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_9ef7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_9ef7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l328_c2_9ef7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_9ef7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_9ef7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_9ef7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l328_c2_9ef7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_9ef7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_9ef7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_9ef7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l328_c2_9ef7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_9ef7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_9ef7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_9ef7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l328_c2_9ef7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_9ef7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_9ef7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_9ef7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l328_c2_9ef7]
signal result_u8_value_MUX_uxn_opcodes_h_l328_c2_9ef7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l328_c2_9ef7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l328_c2_9ef7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l328_c2_9ef7]
signal t16_MUX_uxn_opcodes_h_l328_c2_9ef7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l328_c2_9ef7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l328_c2_9ef7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l328_c2_9ef7]
signal n16_MUX_uxn_opcodes_h_l328_c2_9ef7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l328_c2_9ef7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l328_c2_9ef7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l329_c3_e4c0[uxn_opcodes_h_l329_c3_e4c0]
signal printf_uxn_opcodes_h_l329_c3_e4c0_uxn_opcodes_h_l329_c3_e4c0_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l333_c11_c456]
signal BIN_OP_EQ_uxn_opcodes_h_l333_c11_c456_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l333_c11_c456_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l333_c11_c456_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l333_c7_c712]
signal result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c712_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c712_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c712_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c712_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l333_c7_c712]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c712_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c712_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c712_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c712_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l333_c7_c712]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c712_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c712_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c712_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c712_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l333_c7_c712]
signal result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c712_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c712_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c712_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c712_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l333_c7_c712]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c712_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c712_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c712_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c712_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l333_c7_c712]
signal result_u8_value_MUX_uxn_opcodes_h_l333_c7_c712_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l333_c7_c712_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l333_c7_c712_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l333_c7_c712_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l333_c7_c712]
signal t16_MUX_uxn_opcodes_h_l333_c7_c712_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l333_c7_c712_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l333_c7_c712_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l333_c7_c712_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l333_c7_c712]
signal n16_MUX_uxn_opcodes_h_l333_c7_c712_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l333_c7_c712_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l333_c7_c712_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l333_c7_c712_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l336_c11_368e]
signal BIN_OP_EQ_uxn_opcodes_h_l336_c11_368e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l336_c11_368e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l336_c11_368e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l336_c7_7ddb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7ddb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7ddb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7ddb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l336_c7_7ddb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7ddb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7ddb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7ddb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l336_c7_7ddb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7ddb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7ddb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7ddb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l336_c7_7ddb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7ddb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7ddb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7ddb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l336_c7_7ddb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7ddb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7ddb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7ddb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l336_c7_7ddb]
signal result_u8_value_MUX_uxn_opcodes_h_l336_c7_7ddb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l336_c7_7ddb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l336_c7_7ddb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l336_c7_7ddb]
signal t16_MUX_uxn_opcodes_h_l336_c7_7ddb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l336_c7_7ddb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l336_c7_7ddb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l336_c7_7ddb]
signal n16_MUX_uxn_opcodes_h_l336_c7_7ddb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l336_c7_7ddb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l336_c7_7ddb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l341_c11_a8dc]
signal BIN_OP_EQ_uxn_opcodes_h_l341_c11_a8dc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l341_c11_a8dc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l341_c11_a8dc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l341_c7_bfdb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_bfdb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_bfdb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_bfdb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l341_c7_bfdb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_bfdb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_bfdb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_bfdb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l341_c7_bfdb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_bfdb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_bfdb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_bfdb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l341_c7_bfdb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_bfdb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_bfdb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_bfdb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l341_c7_bfdb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_bfdb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_bfdb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_bfdb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l341_c7_bfdb]
signal result_u8_value_MUX_uxn_opcodes_h_l341_c7_bfdb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l341_c7_bfdb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l341_c7_bfdb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l341_c7_bfdb]
signal t16_MUX_uxn_opcodes_h_l341_c7_bfdb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l341_c7_bfdb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l341_c7_bfdb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l341_c7_bfdb]
signal n16_MUX_uxn_opcodes_h_l341_c7_bfdb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l341_c7_bfdb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l341_c7_bfdb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l342_c3_fb25]
signal BIN_OP_OR_uxn_opcodes_h_l342_c3_fb25_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l342_c3_fb25_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l342_c3_fb25_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l345_c11_259a]
signal BIN_OP_EQ_uxn_opcodes_h_l345_c11_259a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l345_c11_259a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l345_c11_259a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l345_c7_e0fe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_e0fe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_e0fe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_e0fe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_e0fe_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l345_c7_e0fe]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_e0fe_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_e0fe_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_e0fe_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_e0fe_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l345_c7_e0fe]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_e0fe_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_e0fe_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_e0fe_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_e0fe_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l345_c7_e0fe]
signal result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_e0fe_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_e0fe_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_e0fe_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_e0fe_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l345_c7_e0fe]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_e0fe_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_e0fe_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_e0fe_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_e0fe_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l345_c7_e0fe]
signal result_u8_value_MUX_uxn_opcodes_h_l345_c7_e0fe_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l345_c7_e0fe_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l345_c7_e0fe_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l345_c7_e0fe_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l345_c7_e0fe]
signal n16_MUX_uxn_opcodes_h_l345_c7_e0fe_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l345_c7_e0fe_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l345_c7_e0fe_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l345_c7_e0fe_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l349_c11_2d9e]
signal BIN_OP_EQ_uxn_opcodes_h_l349_c11_2d9e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l349_c11_2d9e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l349_c11_2d9e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l349_c7_b829]
signal result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_b829_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_b829_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_b829_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_b829_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l349_c7_b829]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_b829_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_b829_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_b829_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_b829_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l349_c7_b829]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_b829_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_b829_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_b829_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_b829_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l349_c7_b829]
signal result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_b829_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_b829_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_b829_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_b829_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l349_c7_b829]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_b829_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_b829_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_b829_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_b829_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l349_c7_b829]
signal result_u8_value_MUX_uxn_opcodes_h_l349_c7_b829_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l349_c7_b829_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l349_c7_b829_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l349_c7_b829_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l349_c7_b829]
signal n16_MUX_uxn_opcodes_h_l349_c7_b829_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l349_c7_b829_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l349_c7_b829_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l349_c7_b829_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l350_c3_2131]
signal BIN_OP_OR_uxn_opcodes_h_l350_c3_2131_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l350_c3_2131_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l350_c3_2131_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l352_c30_fe6a]
signal sp_relative_shift_uxn_opcodes_h_l352_c30_fe6a_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l352_c30_fe6a_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l352_c30_fe6a_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l352_c30_fe6a_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l357_c11_b74b]
signal BIN_OP_EQ_uxn_opcodes_h_l357_c11_b74b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l357_c11_b74b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l357_c11_b74b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l357_c7_ebab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_ebab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_ebab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_ebab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_ebab_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l357_c7_ebab]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_ebab_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_ebab_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_ebab_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_ebab_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l357_c7_ebab]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_ebab_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_ebab_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_ebab_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_ebab_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l357_c7_ebab]
signal result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_ebab_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_ebab_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_ebab_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_ebab_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l357_c7_ebab]
signal result_u8_value_MUX_uxn_opcodes_h_l357_c7_ebab_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l357_c7_ebab_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l357_c7_ebab_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l357_c7_ebab_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l362_c11_8187]
signal BIN_OP_EQ_uxn_opcodes_h_l362_c11_8187_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l362_c11_8187_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l362_c11_8187_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l362_c7_b43f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_b43f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_b43f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_b43f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_b43f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l362_c7_b43f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_b43f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_b43f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_b43f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_b43f_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l362_c7_b43f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_b43f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_b43f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_b43f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_b43f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l362_c7_b43f]
signal result_u8_value_MUX_uxn_opcodes_h_l362_c7_b43f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l362_c7_b43f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l362_c7_b43f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l362_c7_b43f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l366_c11_3b0c]
signal BIN_OP_EQ_uxn_opcodes_h_l366_c11_3b0c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l366_c11_3b0c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l366_c11_3b0c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l366_c7_f944]
signal result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_f944_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_f944_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_f944_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_f944_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l366_c7_f944]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_f944_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_f944_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_f944_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_f944_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l366_c7_f944]
signal result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_f944_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_f944_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_f944_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_f944_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l366_c7_f944]
signal result_u8_value_MUX_uxn_opcodes_h_l366_c7_f944_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l366_c7_f944_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l366_c7_f944_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l366_c7_f944_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l368_c31_2734]
signal CONST_SR_8_uxn_opcodes_h_l368_c31_2734_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l368_c31_2734_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l370_c11_b4b3]
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_b4b3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_b4b3_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_b4b3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l370_c7_0c78]
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_0c78_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_0c78_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_0c78_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_0c78_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l370_c7_0c78]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_0c78_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_0c78_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_0c78_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_0c78_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l370_c7_0c78]
signal result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_0c78_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_0c78_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_0c78_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_0c78_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l370_c7_0c78]
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_0c78_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_0c78_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_0c78_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_0c78_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l374_c11_f929]
signal BIN_OP_EQ_uxn_opcodes_h_l374_c11_f929_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l374_c11_f929_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l374_c11_f929_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l374_c7_303e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_303e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_303e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_303e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_303e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l374_c7_303e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_303e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_303e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_303e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_303e_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l374_c7_303e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_303e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_303e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_303e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_303e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l374_c7_303e]
signal result_u8_value_MUX_uxn_opcodes_h_l374_c7_303e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l374_c7_303e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l374_c7_303e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l374_c7_303e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l378_c11_c7bf]
signal BIN_OP_EQ_uxn_opcodes_h_l378_c11_c7bf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l378_c11_c7bf_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l378_c11_c7bf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l378_c7_fc0b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_fc0b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_fc0b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_fc0b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_fc0b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l378_c7_fc0b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_fc0b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_fc0b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_fc0b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_fc0b_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l347_l338_DUPLICATE_7525
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l347_l338_DUPLICATE_7525_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l347_l338_DUPLICATE_7525_return_output : unsigned(15 downto 0);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_c439
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_c439_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_c439_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l328_c6_e7e9
BIN_OP_EQ_uxn_opcodes_h_l328_c6_e7e9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l328_c6_e7e9_left,
BIN_OP_EQ_uxn_opcodes_h_l328_c6_e7e9_right,
BIN_OP_EQ_uxn_opcodes_h_l328_c6_e7e9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_2bd4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_2bd4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_2bd4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_2bd4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_2bd4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_2bd4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_9ef7
result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_9ef7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_9ef7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_9ef7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_9ef7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_9ef7
result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_9ef7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_9ef7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_9ef7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_9ef7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_9ef7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_9ef7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_9ef7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_9ef7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_9ef7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_9ef7
result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_9ef7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_9ef7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_9ef7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_9ef7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_9ef7
result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_9ef7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_9ef7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_9ef7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_9ef7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l328_c2_9ef7
result_u8_value_MUX_uxn_opcodes_h_l328_c2_9ef7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l328_c2_9ef7_cond,
result_u8_value_MUX_uxn_opcodes_h_l328_c2_9ef7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l328_c2_9ef7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output);

-- t16_MUX_uxn_opcodes_h_l328_c2_9ef7
t16_MUX_uxn_opcodes_h_l328_c2_9ef7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l328_c2_9ef7_cond,
t16_MUX_uxn_opcodes_h_l328_c2_9ef7_iftrue,
t16_MUX_uxn_opcodes_h_l328_c2_9ef7_iffalse,
t16_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output);

-- n16_MUX_uxn_opcodes_h_l328_c2_9ef7
n16_MUX_uxn_opcodes_h_l328_c2_9ef7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l328_c2_9ef7_cond,
n16_MUX_uxn_opcodes_h_l328_c2_9ef7_iftrue,
n16_MUX_uxn_opcodes_h_l328_c2_9ef7_iffalse,
n16_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output);

-- printf_uxn_opcodes_h_l329_c3_e4c0_uxn_opcodes_h_l329_c3_e4c0
printf_uxn_opcodes_h_l329_c3_e4c0_uxn_opcodes_h_l329_c3_e4c0 : entity work.printf_uxn_opcodes_h_l329_c3_e4c0_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l329_c3_e4c0_uxn_opcodes_h_l329_c3_e4c0_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l333_c11_c456
BIN_OP_EQ_uxn_opcodes_h_l333_c11_c456 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l333_c11_c456_left,
BIN_OP_EQ_uxn_opcodes_h_l333_c11_c456_right,
BIN_OP_EQ_uxn_opcodes_h_l333_c11_c456_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c712
result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c712 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c712_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c712_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c712_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c712_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c712
result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c712 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c712_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c712_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c712_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c712_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c712
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c712 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c712_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c712_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c712_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c712_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c712
result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c712 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c712_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c712_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c712_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c712_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c712
result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c712 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c712_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c712_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c712_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c712_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l333_c7_c712
result_u8_value_MUX_uxn_opcodes_h_l333_c7_c712 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l333_c7_c712_cond,
result_u8_value_MUX_uxn_opcodes_h_l333_c7_c712_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l333_c7_c712_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l333_c7_c712_return_output);

-- t16_MUX_uxn_opcodes_h_l333_c7_c712
t16_MUX_uxn_opcodes_h_l333_c7_c712 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l333_c7_c712_cond,
t16_MUX_uxn_opcodes_h_l333_c7_c712_iftrue,
t16_MUX_uxn_opcodes_h_l333_c7_c712_iffalse,
t16_MUX_uxn_opcodes_h_l333_c7_c712_return_output);

-- n16_MUX_uxn_opcodes_h_l333_c7_c712
n16_MUX_uxn_opcodes_h_l333_c7_c712 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l333_c7_c712_cond,
n16_MUX_uxn_opcodes_h_l333_c7_c712_iftrue,
n16_MUX_uxn_opcodes_h_l333_c7_c712_iffalse,
n16_MUX_uxn_opcodes_h_l333_c7_c712_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l336_c11_368e
BIN_OP_EQ_uxn_opcodes_h_l336_c11_368e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l336_c11_368e_left,
BIN_OP_EQ_uxn_opcodes_h_l336_c11_368e_right,
BIN_OP_EQ_uxn_opcodes_h_l336_c11_368e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7ddb
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7ddb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7ddb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7ddb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7ddb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7ddb
result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7ddb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7ddb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7ddb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7ddb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7ddb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7ddb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7ddb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7ddb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7ddb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7ddb
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7ddb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7ddb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7ddb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7ddb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7ddb
result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7ddb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7ddb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7ddb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7ddb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l336_c7_7ddb
result_u8_value_MUX_uxn_opcodes_h_l336_c7_7ddb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l336_c7_7ddb_cond,
result_u8_value_MUX_uxn_opcodes_h_l336_c7_7ddb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l336_c7_7ddb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output);

-- t16_MUX_uxn_opcodes_h_l336_c7_7ddb
t16_MUX_uxn_opcodes_h_l336_c7_7ddb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l336_c7_7ddb_cond,
t16_MUX_uxn_opcodes_h_l336_c7_7ddb_iftrue,
t16_MUX_uxn_opcodes_h_l336_c7_7ddb_iffalse,
t16_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output);

-- n16_MUX_uxn_opcodes_h_l336_c7_7ddb
n16_MUX_uxn_opcodes_h_l336_c7_7ddb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l336_c7_7ddb_cond,
n16_MUX_uxn_opcodes_h_l336_c7_7ddb_iftrue,
n16_MUX_uxn_opcodes_h_l336_c7_7ddb_iffalse,
n16_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l341_c11_a8dc
BIN_OP_EQ_uxn_opcodes_h_l341_c11_a8dc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l341_c11_a8dc_left,
BIN_OP_EQ_uxn_opcodes_h_l341_c11_a8dc_right,
BIN_OP_EQ_uxn_opcodes_h_l341_c11_a8dc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_bfdb
result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_bfdb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_bfdb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_bfdb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_bfdb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_bfdb
result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_bfdb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_bfdb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_bfdb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_bfdb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_bfdb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_bfdb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_bfdb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_bfdb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_bfdb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_bfdb
result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_bfdb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_bfdb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_bfdb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_bfdb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_bfdb
result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_bfdb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_bfdb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_bfdb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_bfdb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l341_c7_bfdb
result_u8_value_MUX_uxn_opcodes_h_l341_c7_bfdb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l341_c7_bfdb_cond,
result_u8_value_MUX_uxn_opcodes_h_l341_c7_bfdb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l341_c7_bfdb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output);

-- t16_MUX_uxn_opcodes_h_l341_c7_bfdb
t16_MUX_uxn_opcodes_h_l341_c7_bfdb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l341_c7_bfdb_cond,
t16_MUX_uxn_opcodes_h_l341_c7_bfdb_iftrue,
t16_MUX_uxn_opcodes_h_l341_c7_bfdb_iffalse,
t16_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output);

-- n16_MUX_uxn_opcodes_h_l341_c7_bfdb
n16_MUX_uxn_opcodes_h_l341_c7_bfdb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l341_c7_bfdb_cond,
n16_MUX_uxn_opcodes_h_l341_c7_bfdb_iftrue,
n16_MUX_uxn_opcodes_h_l341_c7_bfdb_iffalse,
n16_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l342_c3_fb25
BIN_OP_OR_uxn_opcodes_h_l342_c3_fb25 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l342_c3_fb25_left,
BIN_OP_OR_uxn_opcodes_h_l342_c3_fb25_right,
BIN_OP_OR_uxn_opcodes_h_l342_c3_fb25_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l345_c11_259a
BIN_OP_EQ_uxn_opcodes_h_l345_c11_259a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l345_c11_259a_left,
BIN_OP_EQ_uxn_opcodes_h_l345_c11_259a_right,
BIN_OP_EQ_uxn_opcodes_h_l345_c11_259a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_e0fe
result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_e0fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_e0fe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_e0fe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_e0fe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_e0fe_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_e0fe
result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_e0fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_e0fe_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_e0fe_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_e0fe_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_e0fe_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_e0fe
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_e0fe : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_e0fe_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_e0fe_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_e0fe_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_e0fe_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_e0fe
result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_e0fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_e0fe_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_e0fe_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_e0fe_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_e0fe_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_e0fe
result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_e0fe : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_e0fe_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_e0fe_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_e0fe_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_e0fe_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l345_c7_e0fe
result_u8_value_MUX_uxn_opcodes_h_l345_c7_e0fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l345_c7_e0fe_cond,
result_u8_value_MUX_uxn_opcodes_h_l345_c7_e0fe_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l345_c7_e0fe_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l345_c7_e0fe_return_output);

-- n16_MUX_uxn_opcodes_h_l345_c7_e0fe
n16_MUX_uxn_opcodes_h_l345_c7_e0fe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l345_c7_e0fe_cond,
n16_MUX_uxn_opcodes_h_l345_c7_e0fe_iftrue,
n16_MUX_uxn_opcodes_h_l345_c7_e0fe_iffalse,
n16_MUX_uxn_opcodes_h_l345_c7_e0fe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l349_c11_2d9e
BIN_OP_EQ_uxn_opcodes_h_l349_c11_2d9e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l349_c11_2d9e_left,
BIN_OP_EQ_uxn_opcodes_h_l349_c11_2d9e_right,
BIN_OP_EQ_uxn_opcodes_h_l349_c11_2d9e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_b829
result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_b829 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_b829_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_b829_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_b829_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_b829_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_b829
result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_b829 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_b829_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_b829_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_b829_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_b829_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_b829
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_b829 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_b829_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_b829_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_b829_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_b829_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_b829
result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_b829 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_b829_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_b829_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_b829_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_b829_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_b829
result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_b829 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_b829_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_b829_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_b829_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_b829_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l349_c7_b829
result_u8_value_MUX_uxn_opcodes_h_l349_c7_b829 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l349_c7_b829_cond,
result_u8_value_MUX_uxn_opcodes_h_l349_c7_b829_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l349_c7_b829_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l349_c7_b829_return_output);

-- n16_MUX_uxn_opcodes_h_l349_c7_b829
n16_MUX_uxn_opcodes_h_l349_c7_b829 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l349_c7_b829_cond,
n16_MUX_uxn_opcodes_h_l349_c7_b829_iftrue,
n16_MUX_uxn_opcodes_h_l349_c7_b829_iffalse,
n16_MUX_uxn_opcodes_h_l349_c7_b829_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l350_c3_2131
BIN_OP_OR_uxn_opcodes_h_l350_c3_2131 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l350_c3_2131_left,
BIN_OP_OR_uxn_opcodes_h_l350_c3_2131_right,
BIN_OP_OR_uxn_opcodes_h_l350_c3_2131_return_output);

-- sp_relative_shift_uxn_opcodes_h_l352_c30_fe6a
sp_relative_shift_uxn_opcodes_h_l352_c30_fe6a : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l352_c30_fe6a_ins,
sp_relative_shift_uxn_opcodes_h_l352_c30_fe6a_x,
sp_relative_shift_uxn_opcodes_h_l352_c30_fe6a_y,
sp_relative_shift_uxn_opcodes_h_l352_c30_fe6a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l357_c11_b74b
BIN_OP_EQ_uxn_opcodes_h_l357_c11_b74b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l357_c11_b74b_left,
BIN_OP_EQ_uxn_opcodes_h_l357_c11_b74b_right,
BIN_OP_EQ_uxn_opcodes_h_l357_c11_b74b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_ebab
result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_ebab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_ebab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_ebab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_ebab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_ebab_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_ebab
result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_ebab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_ebab_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_ebab_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_ebab_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_ebab_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_ebab
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_ebab : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_ebab_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_ebab_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_ebab_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_ebab_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_ebab
result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_ebab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_ebab_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_ebab_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_ebab_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_ebab_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l357_c7_ebab
result_u8_value_MUX_uxn_opcodes_h_l357_c7_ebab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l357_c7_ebab_cond,
result_u8_value_MUX_uxn_opcodes_h_l357_c7_ebab_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l357_c7_ebab_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l357_c7_ebab_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l362_c11_8187
BIN_OP_EQ_uxn_opcodes_h_l362_c11_8187 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l362_c11_8187_left,
BIN_OP_EQ_uxn_opcodes_h_l362_c11_8187_right,
BIN_OP_EQ_uxn_opcodes_h_l362_c11_8187_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_b43f
result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_b43f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_b43f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_b43f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_b43f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_b43f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_b43f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_b43f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_b43f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_b43f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_b43f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_b43f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_b43f
result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_b43f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_b43f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_b43f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_b43f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_b43f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l362_c7_b43f
result_u8_value_MUX_uxn_opcodes_h_l362_c7_b43f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l362_c7_b43f_cond,
result_u8_value_MUX_uxn_opcodes_h_l362_c7_b43f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l362_c7_b43f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l362_c7_b43f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l366_c11_3b0c
BIN_OP_EQ_uxn_opcodes_h_l366_c11_3b0c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l366_c11_3b0c_left,
BIN_OP_EQ_uxn_opcodes_h_l366_c11_3b0c_right,
BIN_OP_EQ_uxn_opcodes_h_l366_c11_3b0c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_f944
result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_f944 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_f944_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_f944_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_f944_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_f944_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_f944
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_f944 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_f944_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_f944_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_f944_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_f944_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_f944
result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_f944 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_f944_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_f944_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_f944_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_f944_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l366_c7_f944
result_u8_value_MUX_uxn_opcodes_h_l366_c7_f944 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l366_c7_f944_cond,
result_u8_value_MUX_uxn_opcodes_h_l366_c7_f944_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l366_c7_f944_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l366_c7_f944_return_output);

-- CONST_SR_8_uxn_opcodes_h_l368_c31_2734
CONST_SR_8_uxn_opcodes_h_l368_c31_2734 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l368_c31_2734_x,
CONST_SR_8_uxn_opcodes_h_l368_c31_2734_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l370_c11_b4b3
BIN_OP_EQ_uxn_opcodes_h_l370_c11_b4b3 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l370_c11_b4b3_left,
BIN_OP_EQ_uxn_opcodes_h_l370_c11_b4b3_right,
BIN_OP_EQ_uxn_opcodes_h_l370_c11_b4b3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_0c78
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_0c78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_0c78_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_0c78_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_0c78_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_0c78_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_0c78
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_0c78 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_0c78_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_0c78_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_0c78_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_0c78_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_0c78
result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_0c78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_0c78_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_0c78_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_0c78_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_0c78_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l370_c7_0c78
result_u8_value_MUX_uxn_opcodes_h_l370_c7_0c78 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l370_c7_0c78_cond,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_0c78_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_0c78_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_0c78_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l374_c11_f929
BIN_OP_EQ_uxn_opcodes_h_l374_c11_f929 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l374_c11_f929_left,
BIN_OP_EQ_uxn_opcodes_h_l374_c11_f929_right,
BIN_OP_EQ_uxn_opcodes_h_l374_c11_f929_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_303e
result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_303e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_303e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_303e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_303e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_303e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_303e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_303e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_303e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_303e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_303e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_303e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_303e
result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_303e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_303e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_303e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_303e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_303e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l374_c7_303e
result_u8_value_MUX_uxn_opcodes_h_l374_c7_303e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l374_c7_303e_cond,
result_u8_value_MUX_uxn_opcodes_h_l374_c7_303e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l374_c7_303e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l374_c7_303e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l378_c11_c7bf
BIN_OP_EQ_uxn_opcodes_h_l378_c11_c7bf : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l378_c11_c7bf_left,
BIN_OP_EQ_uxn_opcodes_h_l378_c11_c7bf_right,
BIN_OP_EQ_uxn_opcodes_h_l378_c11_c7bf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_fc0b
result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_fc0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_fc0b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_fc0b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_fc0b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_fc0b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_fc0b
result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_fc0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_fc0b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_fc0b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_fc0b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_fc0b_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l347_l338_DUPLICATE_7525
CONST_SL_8_uint16_t_uxn_opcodes_h_l347_l338_DUPLICATE_7525 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l347_l338_DUPLICATE_7525_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l347_l338_DUPLICATE_7525_return_output);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_c439
CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_c439 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_c439_x,
CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_c439_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l328_c6_e7e9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_2bd4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output,
 t16_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output,
 n16_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l333_c11_c456_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c712_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c712_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c712_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c712_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c712_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l333_c7_c712_return_output,
 t16_MUX_uxn_opcodes_h_l333_c7_c712_return_output,
 n16_MUX_uxn_opcodes_h_l333_c7_c712_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l336_c11_368e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output,
 t16_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output,
 n16_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l341_c11_a8dc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output,
 t16_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output,
 n16_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output,
 BIN_OP_OR_uxn_opcodes_h_l342_c3_fb25_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l345_c11_259a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_e0fe_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_e0fe_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_e0fe_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_e0fe_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_e0fe_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l345_c7_e0fe_return_output,
 n16_MUX_uxn_opcodes_h_l345_c7_e0fe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l349_c11_2d9e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_b829_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_b829_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_b829_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_b829_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_b829_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l349_c7_b829_return_output,
 n16_MUX_uxn_opcodes_h_l349_c7_b829_return_output,
 BIN_OP_OR_uxn_opcodes_h_l350_c3_2131_return_output,
 sp_relative_shift_uxn_opcodes_h_l352_c30_fe6a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l357_c11_b74b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_ebab_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_ebab_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_ebab_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_ebab_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l357_c7_ebab_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l362_c11_8187_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_b43f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_b43f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_b43f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l362_c7_b43f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l366_c11_3b0c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_f944_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_f944_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_f944_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l366_c7_f944_return_output,
 CONST_SR_8_uxn_opcodes_h_l368_c31_2734_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l370_c11_b4b3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_0c78_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_0c78_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_0c78_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l370_c7_0c78_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l374_c11_f929_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_303e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_303e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_303e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l374_c7_303e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l378_c11_c7bf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_fc0b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_fc0b_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l347_l338_DUPLICATE_7525_return_output,
 CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_c439_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_e7e9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_e7e9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_e7e9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_2bd4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_2bd4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_2bd4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_2bd4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_9ef7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_9ef7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c712_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_9ef7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_9ef7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_9ef7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c712_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_9ef7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_9ef7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l330_c3_90ed : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_9ef7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c712_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_9ef7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_9ef7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_9ef7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c712_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_9ef7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_9ef7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_9ef7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c712_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_9ef7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l328_c2_9ef7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l328_c2_9ef7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l333_c7_c712_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l328_c2_9ef7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l328_c2_9ef7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l328_c2_9ef7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l333_c7_c712_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l328_c2_9ef7_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l328_c2_9ef7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l328_c2_9ef7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l333_c7_c712_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l328_c2_9ef7_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l329_c3_e4c0_uxn_opcodes_h_l329_c3_e4c0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_c456_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_c456_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_c456_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c712_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c712_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c712_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c712_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c712_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c712_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c712_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l334_c3_40c4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c712_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c712_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c712_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c712_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c712_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c712_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c712_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c712_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l333_c7_c712_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l333_c7_c712_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l333_c7_c712_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l333_c7_c712_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l333_c7_c712_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l333_c7_c712_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l333_c7_c712_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l333_c7_c712_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l333_c7_c712_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_368e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_368e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_368e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7ddb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7ddb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7ddb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7ddb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7ddb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7ddb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7ddb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l339_c3_f622 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7ddb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7ddb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7ddb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7ddb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7ddb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7ddb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7ddb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7ddb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l336_c7_7ddb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l336_c7_7ddb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l336_c7_7ddb_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l336_c7_7ddb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l336_c7_7ddb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l336_c7_7ddb_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l336_c7_7ddb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l336_c7_7ddb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l336_c7_7ddb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_a8dc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_a8dc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_a8dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_bfdb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_bfdb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_e0fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_bfdb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_bfdb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_bfdb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_e0fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_bfdb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_bfdb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l343_c3_3c8b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_bfdb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_e0fe_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_bfdb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_bfdb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_bfdb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_e0fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_bfdb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_bfdb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_bfdb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_e0fe_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_bfdb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_bfdb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_bfdb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c7_e0fe_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_bfdb_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l341_c7_bfdb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l341_c7_bfdb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l341_c7_bfdb_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l341_c7_bfdb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l341_c7_bfdb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l345_c7_e0fe_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l341_c7_bfdb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l342_c3_fb25_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l342_c3_fb25_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l342_c3_fb25_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_259a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_259a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_259a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_e0fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_e0fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_b829_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_e0fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_e0fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_e0fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_b829_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_e0fe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_e0fe_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_e0fe_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_b829_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_e0fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_e0fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_e0fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_b829_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_e0fe_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_e0fe_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_e0fe_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_b829_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_e0fe_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c7_e0fe_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c7_e0fe_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l349_c7_b829_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c7_e0fe_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l345_c7_e0fe_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l345_c7_e0fe_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l349_c7_b829_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l345_c7_e0fe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_2d9e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_2d9e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_2d9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_b829_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_b829_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_ebab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_b829_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_b829_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_b829_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_ebab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_b829_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_b829_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l354_c3_8b47 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_b829_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_ebab_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_b829_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_b829_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_b829_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_ebab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_b829_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_b829_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_b829_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_b829_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l349_c7_b829_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l349_c7_b829_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_ebab_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l349_c7_b829_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l349_c7_b829_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l349_c7_b829_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l349_c7_b829_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l350_c3_2131_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l350_c3_2131_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l350_c3_2131_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l352_c30_fe6a_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l352_c30_fe6a_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l352_c30_fe6a_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l352_c30_fe6a_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l355_c21_065b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_b74b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_b74b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_b74b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_ebab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_ebab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_b43f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_ebab_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_ebab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_ebab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_ebab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_ebab_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l359_c3_b09d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_ebab_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_b43f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_ebab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_ebab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_ebab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_b43f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_ebab_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_ebab_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_ebab_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l362_c7_b43f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_ebab_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_8187_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_8187_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_8187_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_b43f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_b43f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_f944_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_b43f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_b43f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l363_c3_9c8e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_b43f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_f944_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_b43f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_b43f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_b43f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_f944_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_b43f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l362_c7_b43f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l362_c7_b43f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l366_c7_f944_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l362_c7_b43f_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l364_c21_0118_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_3b0c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_3b0c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_3b0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_f944_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_f944_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_0c78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_f944_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_f944_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_ca33 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_f944_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_0c78_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_f944_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_f944_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_f944_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_0c78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_f944_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l366_c7_f944_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l366_c7_f944_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_0c78_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l366_c7_f944_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l368_c31_2734_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l368_c31_2734_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l368_c21_5aa9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_b4b3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_b4b3_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_b4b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_0c78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_0c78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_303e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_0c78_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_0c78_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l371_c3_52b4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_0c78_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_303e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_0c78_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_0c78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_0c78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_303e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_0c78_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_0c78_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_0c78_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l374_c7_303e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_0c78_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l372_c21_ccff_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_f929_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_f929_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_f929_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_303e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_303e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_fc0b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_303e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_303e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l375_c3_7448 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_303e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_303e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_303e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_303e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_fc0b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_303e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l374_c7_303e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l374_c7_303e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l374_c7_303e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_c7bf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_c7bf_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_c7bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_fc0b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_fc0b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_fc0b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_fc0b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_fc0b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_fc0b_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l336_l333_l328_l357_l345_l341_DUPLICATE_bf6e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l328_l357_l378_l345_l374_l341_DUPLICATE_d589_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l336_l333_l328_l349_l345_l341_DUPLICATE_7cb3_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l336_l333_l328_l345_l374_l341_DUPLICATE_8d40_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l357_l349_l378_l345_l374_l341_DUPLICATE_210d_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l346_l342_l337_l350_DUPLICATE_3e32_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l347_l338_DUPLICATE_7525_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l347_l338_DUPLICATE_7525_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l345_l374_DUPLICATE_ead9_return_output : unsigned(3 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_c439_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_c439_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l376_l360_DUPLICATE_2048_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l324_l383_DUPLICATE_1a2a_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l352_c30_fe6a_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_2d9e_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l339_c3_f622 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7ddb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l339_c3_f622;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l330_c3_90ed := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_9ef7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l330_c3_90ed;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l343_c3_3c8b := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_bfdb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l343_c3_3c8b;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_b829_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l375_c3_7448 := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_303e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l375_c3_7448;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_2bd4_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_3b0c_right := to_unsigned(8, 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l352_c30_fe6a_y := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_ebab_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_c7bf_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_e7e9_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_8187_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l334_c3_40c4 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c712_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l334_c3_40c4;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_b829_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_368e_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_c456_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_fc0b_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l354_c3_8b47 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_b829_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l354_c3_8b47;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l363_c3_9c8e := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_b43f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l363_c3_9c8e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_259a_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l371_c3_52b4 := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_0c78_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l371_c3_52b4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_b4b3_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_b74b_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_f929_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_a8dc_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l359_c3_b09d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_ebab_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l359_c3_b09d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_ca33 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_f944_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_ca33;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_fc0b_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_9ef7_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_2bd4_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l352_c30_fe6a_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l350_c3_2131_left := n16;
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_c439_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l328_c2_9ef7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l333_c7_c712_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l336_c7_7ddb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l341_c7_bfdb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l349_c7_b829_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_e7e9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_c456_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_368e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_a8dc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_259a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_2d9e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_b74b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_8187_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_3b0c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_b4b3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_f929_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_c7bf_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l342_c3_fb25_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l368_c31_2734_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l328_c2_9ef7_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l333_c7_c712_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l341_c7_bfdb_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l366_c11_3b0c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l366_c11_3b0c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_3b0c_left;
     BIN_OP_EQ_uxn_opcodes_h_l366_c11_3b0c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_3b0c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_3b0c_return_output := BIN_OP_EQ_uxn_opcodes_h_l366_c11_3b0c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l349_c11_2d9e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l349_c11_2d9e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_2d9e_left;
     BIN_OP_EQ_uxn_opcodes_h_l349_c11_2d9e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_2d9e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_2d9e_return_output := BIN_OP_EQ_uxn_opcodes_h_l349_c11_2d9e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l328_l357_l378_l345_l374_l341_DUPLICATE_d589 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l328_l357_l378_l345_l374_l341_DUPLICATE_d589_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l346_l342_l337_l350_DUPLICATE_3e32 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l346_l342_l337_l350_DUPLICATE_3e32_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l345_l374_DUPLICATE_ead9 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l345_l374_DUPLICATE_ead9_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l362_c11_8187] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l362_c11_8187_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_8187_left;
     BIN_OP_EQ_uxn_opcodes_h_l362_c11_8187_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_8187_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_8187_return_output := BIN_OP_EQ_uxn_opcodes_h_l362_c11_8187_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l352_c30_fe6a] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l352_c30_fe6a_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l352_c30_fe6a_ins;
     sp_relative_shift_uxn_opcodes_h_l352_c30_fe6a_x <= VAR_sp_relative_shift_uxn_opcodes_h_l352_c30_fe6a_x;
     sp_relative_shift_uxn_opcodes_h_l352_c30_fe6a_y <= VAR_sp_relative_shift_uxn_opcodes_h_l352_c30_fe6a_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l352_c30_fe6a_return_output := sp_relative_shift_uxn_opcodes_h_l352_c30_fe6a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l345_c11_259a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l345_c11_259a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_259a_left;
     BIN_OP_EQ_uxn_opcodes_h_l345_c11_259a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_259a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_259a_return_output := BIN_OP_EQ_uxn_opcodes_h_l345_c11_259a_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l372_c21_ccff] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l372_c21_ccff_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l341_c11_a8dc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l341_c11_a8dc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_a8dc_left;
     BIN_OP_EQ_uxn_opcodes_h_l341_c11_a8dc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_a8dc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_a8dc_return_output := BIN_OP_EQ_uxn_opcodes_h_l341_c11_a8dc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l333_c11_c456] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l333_c11_c456_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_c456_left;
     BIN_OP_EQ_uxn_opcodes_h_l333_c11_c456_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_c456_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_c456_return_output := BIN_OP_EQ_uxn_opcodes_h_l333_c11_c456_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l364_c21_0118] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l364_c21_0118_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l336_l333_l328_l349_l345_l341_DUPLICATE_7cb3 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l336_l333_l328_l349_l345_l341_DUPLICATE_7cb3_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l357_c11_b74b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l357_c11_b74b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_b74b_left;
     BIN_OP_EQ_uxn_opcodes_h_l357_c11_b74b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_b74b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_b74b_return_output := BIN_OP_EQ_uxn_opcodes_h_l357_c11_b74b_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l336_l333_l328_l345_l374_l341_DUPLICATE_8d40 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l336_l333_l328_l345_l374_l341_DUPLICATE_8d40_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l328_c6_e7e9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l328_c6_e7e9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_e7e9_left;
     BIN_OP_EQ_uxn_opcodes_h_l328_c6_e7e9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_e7e9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_e7e9_return_output := BIN_OP_EQ_uxn_opcodes_h_l328_c6_e7e9_return_output;

     -- CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_c439 LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_c439_x <= VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_c439_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_c439_return_output := CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_c439_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l370_c11_b4b3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l370_c11_b4b3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_b4b3_left;
     BIN_OP_EQ_uxn_opcodes_h_l370_c11_b4b3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_b4b3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_b4b3_return_output := BIN_OP_EQ_uxn_opcodes_h_l370_c11_b4b3_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l368_c31_2734] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l368_c31_2734_x <= VAR_CONST_SR_8_uxn_opcodes_h_l368_c31_2734_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l368_c31_2734_return_output := CONST_SR_8_uxn_opcodes_h_l368_c31_2734_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l336_l333_l328_l357_l345_l341_DUPLICATE_bf6e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l336_l333_l328_l357_l345_l341_DUPLICATE_bf6e_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l374_c11_f929] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l374_c11_f929_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_f929_left;
     BIN_OP_EQ_uxn_opcodes_h_l374_c11_f929_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_f929_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_f929_return_output := BIN_OP_EQ_uxn_opcodes_h_l374_c11_f929_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l378_c11_c7bf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l378_c11_c7bf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_c7bf_left;
     BIN_OP_EQ_uxn_opcodes_h_l378_c11_c7bf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_c7bf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_c7bf_return_output := BIN_OP_EQ_uxn_opcodes_h_l378_c11_c7bf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l336_c11_368e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l336_c11_368e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_368e_left;
     BIN_OP_EQ_uxn_opcodes_h_l336_c11_368e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_368e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_368e_return_output := BIN_OP_EQ_uxn_opcodes_h_l336_c11_368e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l357_l349_l378_l345_l374_l341_DUPLICATE_210d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l357_l349_l378_l345_l374_l341_DUPLICATE_210d_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_2bd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_e7e9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l328_c2_9ef7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_e7e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_9ef7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_e7e9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_9ef7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_e7e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_9ef7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_e7e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_9ef7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_e7e9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_9ef7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_e7e9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l328_c2_9ef7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_e7e9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l328_c2_9ef7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_e7e9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l333_c7_c712_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_c456_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c712_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_c456_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c712_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_c456_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c712_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_c456_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c712_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_c456_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c712_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_c456_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l333_c7_c712_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_c456_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l333_c7_c712_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_c456_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l336_c7_7ddb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_368e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7ddb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_368e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7ddb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_368e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7ddb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_368e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7ddb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_368e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7ddb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_368e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l336_c7_7ddb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_368e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l336_c7_7ddb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_368e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l341_c7_bfdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_a8dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_bfdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_a8dc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_bfdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_a8dc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_bfdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_a8dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_bfdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_a8dc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_bfdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_a8dc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_bfdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_a8dc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l341_c7_bfdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_a8dc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l345_c7_e0fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_259a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_e0fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_259a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_e0fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_259a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_e0fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_259a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_e0fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_259a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_e0fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_259a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c7_e0fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_259a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l349_c7_b829_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_2d9e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_b829_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_2d9e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_b829_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_2d9e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_b829_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_2d9e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_b829_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_2d9e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_b829_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_2d9e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l349_c7_b829_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_2d9e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_ebab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_b74b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_ebab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_b74b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_ebab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_b74b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_ebab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_b74b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_ebab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_b74b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_b43f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_8187_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_b43f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_8187_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_b43f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_8187_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l362_c7_b43f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_8187_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_f944_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_3b0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_f944_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_3b0c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_f944_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_3b0c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l366_c7_f944_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_3b0c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_0c78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_b4b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_0c78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_b4b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_0c78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_b4b3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_0c78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_b4b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_303e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_f929_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_303e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_f929_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_303e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_f929_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l374_c7_303e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_f929_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_fc0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_c7bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_fc0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_c7bf_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l342_c3_fb25_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l346_l342_l337_l350_DUPLICATE_3e32_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l350_c3_2131_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l346_l342_l337_l350_DUPLICATE_3e32_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l347_l338_DUPLICATE_7525_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l346_l342_l337_l350_DUPLICATE_3e32_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l362_c7_b43f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l364_c21_0118_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_0c78_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l372_c21_ccff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_9ef7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l336_l333_l328_l349_l345_l341_DUPLICATE_7cb3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c712_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l336_l333_l328_l349_l345_l341_DUPLICATE_7cb3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7ddb_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l336_l333_l328_l349_l345_l341_DUPLICATE_7cb3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_bfdb_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l336_l333_l328_l349_l345_l341_DUPLICATE_7cb3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_e0fe_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l336_l333_l328_l349_l345_l341_DUPLICATE_7cb3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_b829_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l336_l333_l328_l349_l345_l341_DUPLICATE_7cb3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c712_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l357_l349_l378_l345_l374_l341_DUPLICATE_210d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7ddb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l357_l349_l378_l345_l374_l341_DUPLICATE_210d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_bfdb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l357_l349_l378_l345_l374_l341_DUPLICATE_210d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_e0fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l357_l349_l378_l345_l374_l341_DUPLICATE_210d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_b829_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l357_l349_l378_l345_l374_l341_DUPLICATE_210d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_ebab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l357_l349_l378_l345_l374_l341_DUPLICATE_210d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_b43f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l357_l349_l378_l345_l374_l341_DUPLICATE_210d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_f944_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l357_l349_l378_l345_l374_l341_DUPLICATE_210d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_0c78_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l357_l349_l378_l345_l374_l341_DUPLICATE_210d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_303e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l357_l349_l378_l345_l374_l341_DUPLICATE_210d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_fc0b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l357_l349_l378_l345_l374_l341_DUPLICATE_210d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_9ef7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l336_l333_l328_l357_l345_l341_DUPLICATE_bf6e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c712_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l336_l333_l328_l357_l345_l341_DUPLICATE_bf6e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7ddb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l336_l333_l328_l357_l345_l341_DUPLICATE_bf6e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_bfdb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l336_l333_l328_l357_l345_l341_DUPLICATE_bf6e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_e0fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l336_l333_l328_l357_l345_l341_DUPLICATE_bf6e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_ebab_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l336_l333_l328_l357_l345_l341_DUPLICATE_bf6e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_9ef7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l328_l357_l378_l345_l374_l341_DUPLICATE_d589_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c712_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l328_l357_l378_l345_l374_l341_DUPLICATE_d589_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7ddb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l328_l357_l378_l345_l374_l341_DUPLICATE_d589_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_bfdb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l328_l357_l378_l345_l374_l341_DUPLICATE_d589_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_e0fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l328_l357_l378_l345_l374_l341_DUPLICATE_d589_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_ebab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l328_l357_l378_l345_l374_l341_DUPLICATE_d589_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_b43f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l328_l357_l378_l345_l374_l341_DUPLICATE_d589_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_f944_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l328_l357_l378_l345_l374_l341_DUPLICATE_d589_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_0c78_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l328_l357_l378_l345_l374_l341_DUPLICATE_d589_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_303e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l328_l357_l378_l345_l374_l341_DUPLICATE_d589_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_fc0b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l328_l357_l378_l345_l374_l341_DUPLICATE_d589_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_e0fe_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l345_l374_DUPLICATE_ead9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_303e_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l345_l374_DUPLICATE_ead9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l328_c2_9ef7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l336_l333_l328_l345_l374_l341_DUPLICATE_8d40_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l333_c7_c712_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l336_l333_l328_l345_l374_l341_DUPLICATE_8d40_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l336_c7_7ddb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l336_l333_l328_l345_l374_l341_DUPLICATE_8d40_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_bfdb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l336_l333_l328_l345_l374_l341_DUPLICATE_8d40_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c7_e0fe_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l336_l333_l328_l345_l374_l341_DUPLICATE_8d40_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l374_c7_303e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l336_l333_l328_l345_l374_l341_DUPLICATE_8d40_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_b829_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l352_c30_fe6a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l378_c7_fc0b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_fc0b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_fc0b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_fc0b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_fc0b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_fc0b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_fc0b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_fc0b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_fc0b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l350_c3_2131] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l350_c3_2131_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l350_c3_2131_left;
     BIN_OP_OR_uxn_opcodes_h_l350_c3_2131_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l350_c3_2131_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l350_c3_2131_return_output := BIN_OP_OR_uxn_opcodes_h_l350_c3_2131_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l342_c3_fb25] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l342_c3_fb25_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l342_c3_fb25_left;
     BIN_OP_OR_uxn_opcodes_h_l342_c3_fb25_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l342_c3_fb25_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l342_c3_fb25_return_output := BIN_OP_OR_uxn_opcodes_h_l342_c3_fb25_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l368_c21_5aa9] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l368_c21_5aa9_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l368_c31_2734_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l357_c7_ebab] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_ebab_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_ebab_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_ebab_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_ebab_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_ebab_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_ebab_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_ebab_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_ebab_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l378_c7_fc0b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_fc0b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_fc0b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_fc0b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_fc0b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_fc0b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_fc0b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_fc0b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_fc0b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l328_c1_2bd4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_2bd4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_2bd4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_2bd4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_2bd4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_2bd4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_2bd4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_2bd4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_2bd4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l374_c7_303e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_303e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_303e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_303e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_303e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_303e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_303e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_303e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_303e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l349_c7_b829] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_b829_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_b829_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_b829_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_b829_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_b829_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_b829_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_b829_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_b829_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l347_l338_DUPLICATE_7525 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l347_l338_DUPLICATE_7525_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l347_l338_DUPLICATE_7525_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l347_l338_DUPLICATE_7525_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l347_l338_DUPLICATE_7525_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l376_l360_DUPLICATE_2048 LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l376_l360_DUPLICATE_2048_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_c439_return_output);

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l341_c7_bfdb_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l342_c3_fb25_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l349_c7_b829_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l350_c3_2131_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l366_c7_f944_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l368_c21_5aa9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_ebab_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l376_l360_DUPLICATE_2048_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l374_c7_303e_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l376_l360_DUPLICATE_2048_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l345_c7_e0fe_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l347_l338_DUPLICATE_7525_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l336_c7_7ddb_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l347_l338_DUPLICATE_7525_return_output;
     VAR_printf_uxn_opcodes_h_l329_c3_e4c0_uxn_opcodes_h_l329_c3_e4c0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_2bd4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_303e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_fc0b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_b829_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_ebab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_303e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_fc0b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_e0fe_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_b829_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_0c78_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_303e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l370_c7_0c78] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_0c78_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_0c78_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_0c78_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_0c78_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_0c78_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_0c78_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_0c78_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_0c78_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l374_c7_303e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_303e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_303e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_303e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_303e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_303e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_303e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_303e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_303e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l374_c7_303e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l374_c7_303e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l374_c7_303e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l374_c7_303e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l374_c7_303e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l374_c7_303e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l374_c7_303e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l374_c7_303e_return_output := result_u8_value_MUX_uxn_opcodes_h_l374_c7_303e_return_output;

     -- n16_MUX[uxn_opcodes_h_l349_c7_b829] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l349_c7_b829_cond <= VAR_n16_MUX_uxn_opcodes_h_l349_c7_b829_cond;
     n16_MUX_uxn_opcodes_h_l349_c7_b829_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l349_c7_b829_iftrue;
     n16_MUX_uxn_opcodes_h_l349_c7_b829_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l349_c7_b829_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l349_c7_b829_return_output := n16_MUX_uxn_opcodes_h_l349_c7_b829_return_output;

     -- printf_uxn_opcodes_h_l329_c3_e4c0[uxn_opcodes_h_l329_c3_e4c0] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l329_c3_e4c0_uxn_opcodes_h_l329_c3_e4c0_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l329_c3_e4c0_uxn_opcodes_h_l329_c3_e4c0_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- CAST_TO_uint8_t[uxn_opcodes_h_l355_c21_065b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l355_c21_065b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l350_c3_2131_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l349_c7_b829] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_b829_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_b829_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_b829_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_b829_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_b829_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_b829_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_b829_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_b829_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l345_c7_e0fe] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_e0fe_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_e0fe_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_e0fe_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_e0fe_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_e0fe_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_e0fe_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_e0fe_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_e0fe_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l374_c7_303e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_303e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_303e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_303e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_303e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_303e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_303e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_303e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_303e_return_output;

     -- t16_MUX[uxn_opcodes_h_l341_c7_bfdb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l341_c7_bfdb_cond <= VAR_t16_MUX_uxn_opcodes_h_l341_c7_bfdb_cond;
     t16_MUX_uxn_opcodes_h_l341_c7_bfdb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l341_c7_bfdb_iftrue;
     t16_MUX_uxn_opcodes_h_l341_c7_bfdb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l341_c7_bfdb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output := t16_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l349_c7_b829_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l355_c21_065b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l345_c7_e0fe_iffalse := VAR_n16_MUX_uxn_opcodes_h_l349_c7_b829_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_0c78_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_303e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_e0fe_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_b829_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_0c78_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_303e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_bfdb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_e0fe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_f944_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_0c78_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_0c78_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l374_c7_303e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l336_c7_7ddb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l370_c7_0c78] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_0c78_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_0c78_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_0c78_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_0c78_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_0c78_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_0c78_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_0c78_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_0c78_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l341_c7_bfdb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_bfdb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_bfdb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_bfdb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_bfdb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_bfdb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_bfdb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l370_c7_0c78] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_0c78_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_0c78_cond;
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_0c78_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_0c78_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_0c78_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_0c78_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_0c78_return_output := result_u8_value_MUX_uxn_opcodes_h_l370_c7_0c78_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l366_c7_f944] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_f944_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_f944_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_f944_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_f944_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_f944_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_f944_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_f944_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_f944_return_output;

     -- t16_MUX[uxn_opcodes_h_l336_c7_7ddb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l336_c7_7ddb_cond <= VAR_t16_MUX_uxn_opcodes_h_l336_c7_7ddb_cond;
     t16_MUX_uxn_opcodes_h_l336_c7_7ddb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l336_c7_7ddb_iftrue;
     t16_MUX_uxn_opcodes_h_l336_c7_7ddb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l336_c7_7ddb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output := t16_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l345_c7_e0fe] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_e0fe_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_e0fe_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_e0fe_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_e0fe_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_e0fe_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_e0fe_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_e0fe_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_e0fe_return_output;

     -- n16_MUX[uxn_opcodes_h_l345_c7_e0fe] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l345_c7_e0fe_cond <= VAR_n16_MUX_uxn_opcodes_h_l345_c7_e0fe_cond;
     n16_MUX_uxn_opcodes_h_l345_c7_e0fe_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l345_c7_e0fe_iftrue;
     n16_MUX_uxn_opcodes_h_l345_c7_e0fe_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l345_c7_e0fe_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l345_c7_e0fe_return_output := n16_MUX_uxn_opcodes_h_l345_c7_e0fe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l370_c7_0c78] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_0c78_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_0c78_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_0c78_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_0c78_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_0c78_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_0c78_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_0c78_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_0c78_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l341_c7_bfdb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l345_c7_e0fe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_f944_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_0c78_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_bfdb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_e0fe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_f944_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_0c78_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7ddb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_b43f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_f944_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l366_c7_f944_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_0c78_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l333_c7_c712_iffalse := VAR_t16_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l366_c7_f944] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_f944_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_f944_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_f944_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_f944_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_f944_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_f944_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_f944_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_f944_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l341_c7_bfdb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_bfdb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_bfdb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_bfdb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_bfdb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_bfdb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_bfdb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l362_c7_b43f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_b43f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_b43f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_b43f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_b43f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_b43f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_b43f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_b43f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_b43f_return_output;

     -- n16_MUX[uxn_opcodes_h_l341_c7_bfdb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l341_c7_bfdb_cond <= VAR_n16_MUX_uxn_opcodes_h_l341_c7_bfdb_cond;
     n16_MUX_uxn_opcodes_h_l341_c7_bfdb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l341_c7_bfdb_iftrue;
     n16_MUX_uxn_opcodes_h_l341_c7_bfdb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l341_c7_bfdb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output := n16_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l336_c7_7ddb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7ddb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7ddb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7ddb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7ddb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7ddb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7ddb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l366_c7_f944] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l366_c7_f944_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l366_c7_f944_cond;
     result_u8_value_MUX_uxn_opcodes_h_l366_c7_f944_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l366_c7_f944_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l366_c7_f944_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l366_c7_f944_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l366_c7_f944_return_output := result_u8_value_MUX_uxn_opcodes_h_l366_c7_f944_return_output;

     -- t16_MUX[uxn_opcodes_h_l333_c7_c712] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l333_c7_c712_cond <= VAR_t16_MUX_uxn_opcodes_h_l333_c7_c712_cond;
     t16_MUX_uxn_opcodes_h_l333_c7_c712_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l333_c7_c712_iftrue;
     t16_MUX_uxn_opcodes_h_l333_c7_c712_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l333_c7_c712_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l333_c7_c712_return_output := t16_MUX_uxn_opcodes_h_l333_c7_c712_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l366_c7_f944] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_f944_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_f944_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_f944_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_f944_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_f944_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_f944_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_f944_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_f944_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l336_c7_7ddb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_b43f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_f944_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7ddb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_b43f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_f944_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c712_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_ebab_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_b43f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l362_c7_b43f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l366_c7_f944_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l328_c2_9ef7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l333_c7_c712_return_output;
     -- t16_MUX[uxn_opcodes_h_l328_c2_9ef7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l328_c2_9ef7_cond <= VAR_t16_MUX_uxn_opcodes_h_l328_c2_9ef7_cond;
     t16_MUX_uxn_opcodes_h_l328_c2_9ef7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l328_c2_9ef7_iftrue;
     t16_MUX_uxn_opcodes_h_l328_c2_9ef7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l328_c2_9ef7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output := t16_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output;

     -- n16_MUX[uxn_opcodes_h_l336_c7_7ddb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l336_c7_7ddb_cond <= VAR_n16_MUX_uxn_opcodes_h_l336_c7_7ddb_cond;
     n16_MUX_uxn_opcodes_h_l336_c7_7ddb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l336_c7_7ddb_iftrue;
     n16_MUX_uxn_opcodes_h_l336_c7_7ddb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l336_c7_7ddb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output := n16_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l357_c7_ebab] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_ebab_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_ebab_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_ebab_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_ebab_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_ebab_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_ebab_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_ebab_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_ebab_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l336_c7_7ddb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7ddb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7ddb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7ddb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7ddb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7ddb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7ddb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l362_c7_b43f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_b43f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_b43f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_b43f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_b43f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_b43f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_b43f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_b43f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_b43f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l333_c7_c712] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c712_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c712_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c712_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c712_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c712_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c712_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c712_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c712_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l362_c7_b43f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_b43f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_b43f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_b43f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_b43f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_b43f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_b43f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_b43f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_b43f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l362_c7_b43f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l362_c7_b43f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l362_c7_b43f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l362_c7_b43f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l362_c7_b43f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l362_c7_b43f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l362_c7_b43f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l362_c7_b43f_return_output := result_u8_value_MUX_uxn_opcodes_h_l362_c7_b43f_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l333_c7_c712_iffalse := VAR_n16_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_ebab_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_b43f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c712_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_ebab_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_b43f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_9ef7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_c712_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_b829_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_ebab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_ebab_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l362_c7_b43f_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l349_c7_b829] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_b829_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_b829_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_b829_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_b829_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_b829_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_b829_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_b829_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_b829_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l357_c7_ebab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_ebab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_ebab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_ebab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_ebab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_ebab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_ebab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_ebab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_ebab_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l357_c7_ebab] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l357_c7_ebab_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_ebab_cond;
     result_u8_value_MUX_uxn_opcodes_h_l357_c7_ebab_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_ebab_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l357_c7_ebab_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_ebab_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_ebab_return_output := result_u8_value_MUX_uxn_opcodes_h_l357_c7_ebab_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l357_c7_ebab] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_ebab_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_ebab_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_ebab_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_ebab_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_ebab_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_ebab_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_ebab_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_ebab_return_output;

     -- n16_MUX[uxn_opcodes_h_l333_c7_c712] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l333_c7_c712_cond <= VAR_n16_MUX_uxn_opcodes_h_l333_c7_c712_cond;
     n16_MUX_uxn_opcodes_h_l333_c7_c712_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l333_c7_c712_iftrue;
     n16_MUX_uxn_opcodes_h_l333_c7_c712_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l333_c7_c712_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l333_c7_c712_return_output := n16_MUX_uxn_opcodes_h_l333_c7_c712_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l328_c2_9ef7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_9ef7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_9ef7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_9ef7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_9ef7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_9ef7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_9ef7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l333_c7_c712] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c712_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c712_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c712_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c712_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c712_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c712_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c712_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c712_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l328_c2_9ef7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l333_c7_c712_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_b829_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_ebab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_9ef7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_c712_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_b829_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_ebab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_e0fe_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_b829_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l349_c7_b829_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_ebab_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l349_c7_b829] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_b829_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_b829_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_b829_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_b829_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_b829_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_b829_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_b829_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_b829_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l349_c7_b829] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l349_c7_b829_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l349_c7_b829_cond;
     result_u8_value_MUX_uxn_opcodes_h_l349_c7_b829_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l349_c7_b829_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l349_c7_b829_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l349_c7_b829_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l349_c7_b829_return_output := result_u8_value_MUX_uxn_opcodes_h_l349_c7_b829_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l328_c2_9ef7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_9ef7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_9ef7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_9ef7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_9ef7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_9ef7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_9ef7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l349_c7_b829] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_b829_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_b829_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_b829_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_b829_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_b829_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_b829_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_b829_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_b829_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l345_c7_e0fe] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_e0fe_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_e0fe_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_e0fe_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_e0fe_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_e0fe_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_e0fe_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_e0fe_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_e0fe_return_output;

     -- n16_MUX[uxn_opcodes_h_l328_c2_9ef7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l328_c2_9ef7_cond <= VAR_n16_MUX_uxn_opcodes_h_l328_c2_9ef7_cond;
     n16_MUX_uxn_opcodes_h_l328_c2_9ef7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l328_c2_9ef7_iftrue;
     n16_MUX_uxn_opcodes_h_l328_c2_9ef7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l328_c2_9ef7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output := n16_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_e0fe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_b829_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_e0fe_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_b829_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_bfdb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_e0fe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c7_e0fe_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l349_c7_b829_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l341_c7_bfdb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_bfdb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_bfdb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_bfdb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_bfdb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_bfdb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_bfdb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l345_c7_e0fe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_e0fe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_e0fe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_e0fe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_e0fe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_e0fe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_e0fe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_e0fe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_e0fe_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l345_c7_e0fe] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_e0fe_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_e0fe_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_e0fe_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_e0fe_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_e0fe_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_e0fe_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_e0fe_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_e0fe_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l345_c7_e0fe] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l345_c7_e0fe_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c7_e0fe_cond;
     result_u8_value_MUX_uxn_opcodes_h_l345_c7_e0fe_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c7_e0fe_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l345_c7_e0fe_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c7_e0fe_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c7_e0fe_return_output := result_u8_value_MUX_uxn_opcodes_h_l345_c7_e0fe_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_bfdb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_e0fe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_bfdb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_e0fe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7ddb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_bfdb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c7_e0fe_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l336_c7_7ddb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7ddb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7ddb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7ddb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7ddb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7ddb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7ddb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l341_c7_bfdb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_bfdb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_bfdb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_bfdb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_bfdb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_bfdb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_bfdb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l341_c7_bfdb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_bfdb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_bfdb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_bfdb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_bfdb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_bfdb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_bfdb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l341_c7_bfdb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l341_c7_bfdb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_bfdb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l341_c7_bfdb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_bfdb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l341_c7_bfdb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_bfdb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output := result_u8_value_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7ddb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7ddb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c712_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l336_c7_7ddb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_bfdb_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l336_c7_7ddb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7ddb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7ddb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7ddb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7ddb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7ddb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7ddb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l336_c7_7ddb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7ddb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7ddb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7ddb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7ddb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7ddb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7ddb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l333_c7_c712] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c712_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c712_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c712_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c712_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c712_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c712_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c712_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c712_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l336_c7_7ddb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l336_c7_7ddb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l336_c7_7ddb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l336_c7_7ddb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l336_c7_7ddb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l336_c7_7ddb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l336_c7_7ddb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output := result_u8_value_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c712_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c712_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_9ef7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_c712_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l333_c7_c712_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l336_c7_7ddb_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l328_c2_9ef7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_9ef7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_9ef7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_9ef7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_9ef7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_9ef7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_9ef7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l333_c7_c712] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l333_c7_c712_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l333_c7_c712_cond;
     result_u8_value_MUX_uxn_opcodes_h_l333_c7_c712_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l333_c7_c712_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l333_c7_c712_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l333_c7_c712_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l333_c7_c712_return_output := result_u8_value_MUX_uxn_opcodes_h_l333_c7_c712_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l333_c7_c712] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c712_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c712_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c712_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c712_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c712_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c712_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c712_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c712_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l333_c7_c712] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c712_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c712_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c712_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c712_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c712_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c712_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c712_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c712_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_9ef7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_c712_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_9ef7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_c712_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l328_c2_9ef7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l333_c7_c712_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l328_c2_9ef7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_9ef7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_9ef7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_9ef7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_9ef7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_9ef7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_9ef7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l328_c2_9ef7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l328_c2_9ef7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l328_c2_9ef7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l328_c2_9ef7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l328_c2_9ef7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l328_c2_9ef7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l328_c2_9ef7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output := result_u8_value_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l328_c2_9ef7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_9ef7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_9ef7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_9ef7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_9ef7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_9ef7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_9ef7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l324_l383_DUPLICATE_1a2a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l324_l383_DUPLICATE_1a2a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8c29(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l328_c2_9ef7_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l324_l383_DUPLICATE_1a2a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l324_l383_DUPLICATE_1a2a_return_output;
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
