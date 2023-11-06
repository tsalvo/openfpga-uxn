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
-- BIN_OP_EQ[uxn_opcodes_h_l328_c6_9a9b]
signal BIN_OP_EQ_uxn_opcodes_h_l328_c6_9a9b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l328_c6_9a9b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l328_c6_9a9b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l328_c1_f79f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_f79f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_f79f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_f79f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_f79f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l328_c2_16e6]
signal n16_MUX_uxn_opcodes_h_l328_c2_16e6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l328_c2_16e6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l328_c2_16e6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l328_c2_16e6_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l328_c2_16e6]
signal result_u8_value_MUX_uxn_opcodes_h_l328_c2_16e6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l328_c2_16e6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l328_c2_16e6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l328_c2_16e6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l328_c2_16e6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_16e6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_16e6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_16e6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_16e6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l328_c2_16e6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_16e6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_16e6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_16e6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_16e6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l328_c2_16e6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_16e6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_16e6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_16e6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_16e6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l328_c2_16e6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_16e6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_16e6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_16e6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_16e6_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l328_c2_16e6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_16e6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_16e6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_16e6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_16e6_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l328_c2_16e6]
signal t16_MUX_uxn_opcodes_h_l328_c2_16e6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l328_c2_16e6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l328_c2_16e6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l328_c2_16e6_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l329_c3_1565[uxn_opcodes_h_l329_c3_1565]
signal printf_uxn_opcodes_h_l329_c3_1565_uxn_opcodes_h_l329_c3_1565_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l333_c11_c95b]
signal BIN_OP_EQ_uxn_opcodes_h_l333_c11_c95b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l333_c11_c95b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l333_c11_c95b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l333_c7_7925]
signal n16_MUX_uxn_opcodes_h_l333_c7_7925_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l333_c7_7925_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l333_c7_7925_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l333_c7_7925_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l333_c7_7925]
signal result_u8_value_MUX_uxn_opcodes_h_l333_c7_7925_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l333_c7_7925_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l333_c7_7925_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l333_c7_7925_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l333_c7_7925]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_7925_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_7925_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_7925_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_7925_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l333_c7_7925]
signal result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_7925_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_7925_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_7925_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_7925_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l333_c7_7925]
signal result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_7925_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_7925_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_7925_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_7925_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l333_c7_7925]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_7925_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_7925_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_7925_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_7925_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l333_c7_7925]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_7925_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_7925_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_7925_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_7925_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l333_c7_7925]
signal t16_MUX_uxn_opcodes_h_l333_c7_7925_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l333_c7_7925_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l333_c7_7925_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l333_c7_7925_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l336_c11_fd58]
signal BIN_OP_EQ_uxn_opcodes_h_l336_c11_fd58_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l336_c11_fd58_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l336_c11_fd58_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l336_c7_0d36]
signal n16_MUX_uxn_opcodes_h_l336_c7_0d36_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l336_c7_0d36_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l336_c7_0d36_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l336_c7_0d36_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l336_c7_0d36]
signal result_u8_value_MUX_uxn_opcodes_h_l336_c7_0d36_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l336_c7_0d36_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l336_c7_0d36_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l336_c7_0d36_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l336_c7_0d36]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_0d36_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_0d36_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_0d36_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_0d36_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l336_c7_0d36]
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_0d36_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_0d36_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_0d36_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_0d36_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l336_c7_0d36]
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_0d36_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_0d36_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_0d36_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_0d36_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l336_c7_0d36]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_0d36_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_0d36_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_0d36_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_0d36_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l336_c7_0d36]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_0d36_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_0d36_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_0d36_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_0d36_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l336_c7_0d36]
signal t16_MUX_uxn_opcodes_h_l336_c7_0d36_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l336_c7_0d36_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l336_c7_0d36_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l336_c7_0d36_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l341_c11_a762]
signal BIN_OP_EQ_uxn_opcodes_h_l341_c11_a762_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l341_c11_a762_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l341_c11_a762_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l341_c7_67d4]
signal n16_MUX_uxn_opcodes_h_l341_c7_67d4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l341_c7_67d4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l341_c7_67d4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l341_c7_67d4_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l341_c7_67d4]
signal result_u8_value_MUX_uxn_opcodes_h_l341_c7_67d4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l341_c7_67d4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l341_c7_67d4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l341_c7_67d4_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l341_c7_67d4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_67d4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_67d4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_67d4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_67d4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l341_c7_67d4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_67d4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_67d4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_67d4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_67d4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l341_c7_67d4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_67d4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_67d4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_67d4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_67d4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l341_c7_67d4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_67d4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_67d4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_67d4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_67d4_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l341_c7_67d4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_67d4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_67d4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_67d4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_67d4_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l341_c7_67d4]
signal t16_MUX_uxn_opcodes_h_l341_c7_67d4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l341_c7_67d4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l341_c7_67d4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l341_c7_67d4_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l342_c3_8b18]
signal BIN_OP_OR_uxn_opcodes_h_l342_c3_8b18_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l342_c3_8b18_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l342_c3_8b18_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l345_c11_28de]
signal BIN_OP_EQ_uxn_opcodes_h_l345_c11_28de_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l345_c11_28de_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l345_c11_28de_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l345_c7_d3a8]
signal n16_MUX_uxn_opcodes_h_l345_c7_d3a8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l345_c7_d3a8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l345_c7_d3a8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l345_c7_d3a8_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l345_c7_d3a8]
signal result_u8_value_MUX_uxn_opcodes_h_l345_c7_d3a8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l345_c7_d3a8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l345_c7_d3a8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l345_c7_d3a8_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l345_c7_d3a8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_d3a8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_d3a8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_d3a8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_d3a8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l345_c7_d3a8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_d3a8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_d3a8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_d3a8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_d3a8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l345_c7_d3a8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_d3a8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_d3a8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_d3a8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_d3a8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l345_c7_d3a8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_d3a8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_d3a8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_d3a8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_d3a8_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l345_c7_d3a8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_d3a8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_d3a8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_d3a8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_d3a8_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l349_c11_05b7]
signal BIN_OP_EQ_uxn_opcodes_h_l349_c11_05b7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l349_c11_05b7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l349_c11_05b7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l349_c7_e6b3]
signal n16_MUX_uxn_opcodes_h_l349_c7_e6b3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l349_c7_e6b3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l349_c7_e6b3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l349_c7_e6b3_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l349_c7_e6b3]
signal result_u8_value_MUX_uxn_opcodes_h_l349_c7_e6b3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l349_c7_e6b3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l349_c7_e6b3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l349_c7_e6b3_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l349_c7_e6b3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e6b3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e6b3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e6b3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e6b3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l349_c7_e6b3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e6b3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e6b3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e6b3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e6b3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l349_c7_e6b3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e6b3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e6b3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e6b3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e6b3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l349_c7_e6b3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e6b3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e6b3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e6b3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e6b3_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l349_c7_e6b3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e6b3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e6b3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e6b3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e6b3_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l350_c3_35a6]
signal BIN_OP_OR_uxn_opcodes_h_l350_c3_35a6_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l350_c3_35a6_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l350_c3_35a6_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l352_c30_5807]
signal sp_relative_shift_uxn_opcodes_h_l352_c30_5807_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l352_c30_5807_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l352_c30_5807_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l352_c30_5807_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l357_c11_f00b]
signal BIN_OP_EQ_uxn_opcodes_h_l357_c11_f00b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l357_c11_f00b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l357_c11_f00b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l357_c7_dfcb]
signal result_u8_value_MUX_uxn_opcodes_h_l357_c7_dfcb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l357_c7_dfcb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l357_c7_dfcb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l357_c7_dfcb_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l357_c7_dfcb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_dfcb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_dfcb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_dfcb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_dfcb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l357_c7_dfcb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_dfcb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_dfcb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_dfcb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_dfcb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l357_c7_dfcb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_dfcb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_dfcb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_dfcb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_dfcb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l357_c7_dfcb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_dfcb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_dfcb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_dfcb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_dfcb_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l362_c11_31e7]
signal BIN_OP_EQ_uxn_opcodes_h_l362_c11_31e7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l362_c11_31e7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l362_c11_31e7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l362_c7_621b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_621b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_621b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_621b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_621b_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l362_c7_621b]
signal result_u8_value_MUX_uxn_opcodes_h_l362_c7_621b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l362_c7_621b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l362_c7_621b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l362_c7_621b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l362_c7_621b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_621b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_621b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_621b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_621b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l362_c7_621b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_621b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_621b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_621b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_621b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l366_c11_2705]
signal BIN_OP_EQ_uxn_opcodes_h_l366_c11_2705_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l366_c11_2705_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l366_c11_2705_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l366_c7_418d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_418d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_418d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_418d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_418d_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l366_c7_418d]
signal result_u8_value_MUX_uxn_opcodes_h_l366_c7_418d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l366_c7_418d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l366_c7_418d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l366_c7_418d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l366_c7_418d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_418d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_418d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_418d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_418d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l366_c7_418d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_418d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_418d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_418d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_418d_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l368_c31_c1f0]
signal CONST_SR_8_uxn_opcodes_h_l368_c31_c1f0_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l368_c31_c1f0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l370_c11_bc7b]
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_bc7b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_bc7b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_bc7b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l370_c7_a875]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_a875_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_a875_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_a875_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_a875_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l370_c7_a875]
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_a875_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_a875_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_a875_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_a875_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l370_c7_a875]
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_a875_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_a875_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_a875_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_a875_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l370_c7_a875]
signal result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_a875_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_a875_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_a875_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_a875_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l374_c11_dbc4]
signal BIN_OP_EQ_uxn_opcodes_h_l374_c11_dbc4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l374_c11_dbc4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l374_c11_dbc4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l374_c7_62d6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_62d6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_62d6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_62d6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_62d6_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l374_c7_62d6]
signal result_u8_value_MUX_uxn_opcodes_h_l374_c7_62d6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l374_c7_62d6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l374_c7_62d6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l374_c7_62d6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l374_c7_62d6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_62d6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_62d6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_62d6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_62d6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l374_c7_62d6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_62d6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_62d6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_62d6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_62d6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l378_c11_8a71]
signal BIN_OP_EQ_uxn_opcodes_h_l378_c11_8a71_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l378_c11_8a71_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l378_c11_8a71_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l378_c7_d2e4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_d2e4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_d2e4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_d2e4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_d2e4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l378_c7_d2e4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_d2e4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_d2e4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_d2e4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_d2e4_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l338_l347_DUPLICATE_5a4f
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l338_l347_DUPLICATE_5a4f_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l338_l347_DUPLICATE_5a4f_return_output : unsigned(15 downto 0);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_30bc
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_30bc_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_30bc_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l328_c6_9a9b
BIN_OP_EQ_uxn_opcodes_h_l328_c6_9a9b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l328_c6_9a9b_left,
BIN_OP_EQ_uxn_opcodes_h_l328_c6_9a9b_right,
BIN_OP_EQ_uxn_opcodes_h_l328_c6_9a9b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_f79f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_f79f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_f79f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_f79f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_f79f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_f79f_return_output);

-- n16_MUX_uxn_opcodes_h_l328_c2_16e6
n16_MUX_uxn_opcodes_h_l328_c2_16e6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l328_c2_16e6_cond,
n16_MUX_uxn_opcodes_h_l328_c2_16e6_iftrue,
n16_MUX_uxn_opcodes_h_l328_c2_16e6_iffalse,
n16_MUX_uxn_opcodes_h_l328_c2_16e6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l328_c2_16e6
result_u8_value_MUX_uxn_opcodes_h_l328_c2_16e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l328_c2_16e6_cond,
result_u8_value_MUX_uxn_opcodes_h_l328_c2_16e6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l328_c2_16e6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l328_c2_16e6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_16e6
result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_16e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_16e6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_16e6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_16e6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_16e6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_16e6
result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_16e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_16e6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_16e6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_16e6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_16e6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_16e6
result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_16e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_16e6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_16e6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_16e6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_16e6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_16e6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_16e6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_16e6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_16e6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_16e6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_16e6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_16e6
result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_16e6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_16e6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_16e6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_16e6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_16e6_return_output);

-- t16_MUX_uxn_opcodes_h_l328_c2_16e6
t16_MUX_uxn_opcodes_h_l328_c2_16e6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l328_c2_16e6_cond,
t16_MUX_uxn_opcodes_h_l328_c2_16e6_iftrue,
t16_MUX_uxn_opcodes_h_l328_c2_16e6_iffalse,
t16_MUX_uxn_opcodes_h_l328_c2_16e6_return_output);

-- printf_uxn_opcodes_h_l329_c3_1565_uxn_opcodes_h_l329_c3_1565
printf_uxn_opcodes_h_l329_c3_1565_uxn_opcodes_h_l329_c3_1565 : entity work.printf_uxn_opcodes_h_l329_c3_1565_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l329_c3_1565_uxn_opcodes_h_l329_c3_1565_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l333_c11_c95b
BIN_OP_EQ_uxn_opcodes_h_l333_c11_c95b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l333_c11_c95b_left,
BIN_OP_EQ_uxn_opcodes_h_l333_c11_c95b_right,
BIN_OP_EQ_uxn_opcodes_h_l333_c11_c95b_return_output);

-- n16_MUX_uxn_opcodes_h_l333_c7_7925
n16_MUX_uxn_opcodes_h_l333_c7_7925 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l333_c7_7925_cond,
n16_MUX_uxn_opcodes_h_l333_c7_7925_iftrue,
n16_MUX_uxn_opcodes_h_l333_c7_7925_iffalse,
n16_MUX_uxn_opcodes_h_l333_c7_7925_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l333_c7_7925
result_u8_value_MUX_uxn_opcodes_h_l333_c7_7925 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l333_c7_7925_cond,
result_u8_value_MUX_uxn_opcodes_h_l333_c7_7925_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l333_c7_7925_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l333_c7_7925_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_7925
result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_7925 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_7925_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_7925_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_7925_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_7925_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_7925
result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_7925 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_7925_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_7925_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_7925_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_7925_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_7925
result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_7925 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_7925_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_7925_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_7925_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_7925_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_7925
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_7925 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_7925_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_7925_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_7925_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_7925_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_7925
result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_7925 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_7925_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_7925_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_7925_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_7925_return_output);

-- t16_MUX_uxn_opcodes_h_l333_c7_7925
t16_MUX_uxn_opcodes_h_l333_c7_7925 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l333_c7_7925_cond,
t16_MUX_uxn_opcodes_h_l333_c7_7925_iftrue,
t16_MUX_uxn_opcodes_h_l333_c7_7925_iffalse,
t16_MUX_uxn_opcodes_h_l333_c7_7925_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l336_c11_fd58
BIN_OP_EQ_uxn_opcodes_h_l336_c11_fd58 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l336_c11_fd58_left,
BIN_OP_EQ_uxn_opcodes_h_l336_c11_fd58_right,
BIN_OP_EQ_uxn_opcodes_h_l336_c11_fd58_return_output);

-- n16_MUX_uxn_opcodes_h_l336_c7_0d36
n16_MUX_uxn_opcodes_h_l336_c7_0d36 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l336_c7_0d36_cond,
n16_MUX_uxn_opcodes_h_l336_c7_0d36_iftrue,
n16_MUX_uxn_opcodes_h_l336_c7_0d36_iffalse,
n16_MUX_uxn_opcodes_h_l336_c7_0d36_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l336_c7_0d36
result_u8_value_MUX_uxn_opcodes_h_l336_c7_0d36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l336_c7_0d36_cond,
result_u8_value_MUX_uxn_opcodes_h_l336_c7_0d36_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l336_c7_0d36_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l336_c7_0d36_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_0d36
result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_0d36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_0d36_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_0d36_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_0d36_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_0d36_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_0d36
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_0d36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_0d36_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_0d36_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_0d36_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_0d36_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_0d36
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_0d36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_0d36_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_0d36_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_0d36_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_0d36_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_0d36
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_0d36 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_0d36_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_0d36_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_0d36_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_0d36_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_0d36
result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_0d36 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_0d36_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_0d36_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_0d36_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_0d36_return_output);

-- t16_MUX_uxn_opcodes_h_l336_c7_0d36
t16_MUX_uxn_opcodes_h_l336_c7_0d36 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l336_c7_0d36_cond,
t16_MUX_uxn_opcodes_h_l336_c7_0d36_iftrue,
t16_MUX_uxn_opcodes_h_l336_c7_0d36_iffalse,
t16_MUX_uxn_opcodes_h_l336_c7_0d36_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l341_c11_a762
BIN_OP_EQ_uxn_opcodes_h_l341_c11_a762 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l341_c11_a762_left,
BIN_OP_EQ_uxn_opcodes_h_l341_c11_a762_right,
BIN_OP_EQ_uxn_opcodes_h_l341_c11_a762_return_output);

-- n16_MUX_uxn_opcodes_h_l341_c7_67d4
n16_MUX_uxn_opcodes_h_l341_c7_67d4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l341_c7_67d4_cond,
n16_MUX_uxn_opcodes_h_l341_c7_67d4_iftrue,
n16_MUX_uxn_opcodes_h_l341_c7_67d4_iffalse,
n16_MUX_uxn_opcodes_h_l341_c7_67d4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l341_c7_67d4
result_u8_value_MUX_uxn_opcodes_h_l341_c7_67d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l341_c7_67d4_cond,
result_u8_value_MUX_uxn_opcodes_h_l341_c7_67d4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l341_c7_67d4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l341_c7_67d4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_67d4
result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_67d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_67d4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_67d4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_67d4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_67d4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_67d4
result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_67d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_67d4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_67d4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_67d4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_67d4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_67d4
result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_67d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_67d4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_67d4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_67d4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_67d4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_67d4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_67d4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_67d4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_67d4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_67d4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_67d4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_67d4
result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_67d4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_67d4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_67d4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_67d4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_67d4_return_output);

-- t16_MUX_uxn_opcodes_h_l341_c7_67d4
t16_MUX_uxn_opcodes_h_l341_c7_67d4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l341_c7_67d4_cond,
t16_MUX_uxn_opcodes_h_l341_c7_67d4_iftrue,
t16_MUX_uxn_opcodes_h_l341_c7_67d4_iffalse,
t16_MUX_uxn_opcodes_h_l341_c7_67d4_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l342_c3_8b18
BIN_OP_OR_uxn_opcodes_h_l342_c3_8b18 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l342_c3_8b18_left,
BIN_OP_OR_uxn_opcodes_h_l342_c3_8b18_right,
BIN_OP_OR_uxn_opcodes_h_l342_c3_8b18_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l345_c11_28de
BIN_OP_EQ_uxn_opcodes_h_l345_c11_28de : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l345_c11_28de_left,
BIN_OP_EQ_uxn_opcodes_h_l345_c11_28de_right,
BIN_OP_EQ_uxn_opcodes_h_l345_c11_28de_return_output);

-- n16_MUX_uxn_opcodes_h_l345_c7_d3a8
n16_MUX_uxn_opcodes_h_l345_c7_d3a8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l345_c7_d3a8_cond,
n16_MUX_uxn_opcodes_h_l345_c7_d3a8_iftrue,
n16_MUX_uxn_opcodes_h_l345_c7_d3a8_iffalse,
n16_MUX_uxn_opcodes_h_l345_c7_d3a8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l345_c7_d3a8
result_u8_value_MUX_uxn_opcodes_h_l345_c7_d3a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l345_c7_d3a8_cond,
result_u8_value_MUX_uxn_opcodes_h_l345_c7_d3a8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l345_c7_d3a8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l345_c7_d3a8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_d3a8
result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_d3a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_d3a8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_d3a8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_d3a8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_d3a8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_d3a8
result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_d3a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_d3a8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_d3a8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_d3a8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_d3a8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_d3a8
result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_d3a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_d3a8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_d3a8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_d3a8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_d3a8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_d3a8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_d3a8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_d3a8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_d3a8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_d3a8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_d3a8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_d3a8
result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_d3a8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_d3a8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_d3a8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_d3a8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_d3a8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l349_c11_05b7
BIN_OP_EQ_uxn_opcodes_h_l349_c11_05b7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l349_c11_05b7_left,
BIN_OP_EQ_uxn_opcodes_h_l349_c11_05b7_right,
BIN_OP_EQ_uxn_opcodes_h_l349_c11_05b7_return_output);

-- n16_MUX_uxn_opcodes_h_l349_c7_e6b3
n16_MUX_uxn_opcodes_h_l349_c7_e6b3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l349_c7_e6b3_cond,
n16_MUX_uxn_opcodes_h_l349_c7_e6b3_iftrue,
n16_MUX_uxn_opcodes_h_l349_c7_e6b3_iffalse,
n16_MUX_uxn_opcodes_h_l349_c7_e6b3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l349_c7_e6b3
result_u8_value_MUX_uxn_opcodes_h_l349_c7_e6b3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l349_c7_e6b3_cond,
result_u8_value_MUX_uxn_opcodes_h_l349_c7_e6b3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l349_c7_e6b3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l349_c7_e6b3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e6b3
result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e6b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e6b3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e6b3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e6b3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e6b3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e6b3
result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e6b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e6b3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e6b3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e6b3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e6b3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e6b3
result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e6b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e6b3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e6b3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e6b3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e6b3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e6b3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e6b3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e6b3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e6b3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e6b3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e6b3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e6b3
result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e6b3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e6b3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e6b3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e6b3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e6b3_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l350_c3_35a6
BIN_OP_OR_uxn_opcodes_h_l350_c3_35a6 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l350_c3_35a6_left,
BIN_OP_OR_uxn_opcodes_h_l350_c3_35a6_right,
BIN_OP_OR_uxn_opcodes_h_l350_c3_35a6_return_output);

-- sp_relative_shift_uxn_opcodes_h_l352_c30_5807
sp_relative_shift_uxn_opcodes_h_l352_c30_5807 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l352_c30_5807_ins,
sp_relative_shift_uxn_opcodes_h_l352_c30_5807_x,
sp_relative_shift_uxn_opcodes_h_l352_c30_5807_y,
sp_relative_shift_uxn_opcodes_h_l352_c30_5807_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l357_c11_f00b
BIN_OP_EQ_uxn_opcodes_h_l357_c11_f00b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l357_c11_f00b_left,
BIN_OP_EQ_uxn_opcodes_h_l357_c11_f00b_right,
BIN_OP_EQ_uxn_opcodes_h_l357_c11_f00b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l357_c7_dfcb
result_u8_value_MUX_uxn_opcodes_h_l357_c7_dfcb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l357_c7_dfcb_cond,
result_u8_value_MUX_uxn_opcodes_h_l357_c7_dfcb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l357_c7_dfcb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l357_c7_dfcb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_dfcb
result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_dfcb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_dfcb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_dfcb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_dfcb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_dfcb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_dfcb
result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_dfcb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_dfcb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_dfcb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_dfcb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_dfcb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_dfcb
result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_dfcb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_dfcb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_dfcb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_dfcb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_dfcb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_dfcb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_dfcb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_dfcb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_dfcb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_dfcb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_dfcb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l362_c11_31e7
BIN_OP_EQ_uxn_opcodes_h_l362_c11_31e7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l362_c11_31e7_left,
BIN_OP_EQ_uxn_opcodes_h_l362_c11_31e7_right,
BIN_OP_EQ_uxn_opcodes_h_l362_c11_31e7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_621b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_621b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_621b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_621b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_621b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_621b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l362_c7_621b
result_u8_value_MUX_uxn_opcodes_h_l362_c7_621b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l362_c7_621b_cond,
result_u8_value_MUX_uxn_opcodes_h_l362_c7_621b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l362_c7_621b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l362_c7_621b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_621b
result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_621b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_621b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_621b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_621b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_621b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_621b
result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_621b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_621b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_621b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_621b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_621b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l366_c11_2705
BIN_OP_EQ_uxn_opcodes_h_l366_c11_2705 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l366_c11_2705_left,
BIN_OP_EQ_uxn_opcodes_h_l366_c11_2705_right,
BIN_OP_EQ_uxn_opcodes_h_l366_c11_2705_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_418d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_418d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_418d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_418d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_418d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_418d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l366_c7_418d
result_u8_value_MUX_uxn_opcodes_h_l366_c7_418d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l366_c7_418d_cond,
result_u8_value_MUX_uxn_opcodes_h_l366_c7_418d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l366_c7_418d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l366_c7_418d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_418d
result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_418d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_418d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_418d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_418d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_418d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_418d
result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_418d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_418d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_418d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_418d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_418d_return_output);

-- CONST_SR_8_uxn_opcodes_h_l368_c31_c1f0
CONST_SR_8_uxn_opcodes_h_l368_c31_c1f0 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l368_c31_c1f0_x,
CONST_SR_8_uxn_opcodes_h_l368_c31_c1f0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l370_c11_bc7b
BIN_OP_EQ_uxn_opcodes_h_l370_c11_bc7b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l370_c11_bc7b_left,
BIN_OP_EQ_uxn_opcodes_h_l370_c11_bc7b_right,
BIN_OP_EQ_uxn_opcodes_h_l370_c11_bc7b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_a875
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_a875 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_a875_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_a875_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_a875_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_a875_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l370_c7_a875
result_u8_value_MUX_uxn_opcodes_h_l370_c7_a875 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l370_c7_a875_cond,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_a875_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_a875_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_a875_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_a875
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_a875 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_a875_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_a875_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_a875_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_a875_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_a875
result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_a875 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_a875_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_a875_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_a875_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_a875_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l374_c11_dbc4
BIN_OP_EQ_uxn_opcodes_h_l374_c11_dbc4 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l374_c11_dbc4_left,
BIN_OP_EQ_uxn_opcodes_h_l374_c11_dbc4_right,
BIN_OP_EQ_uxn_opcodes_h_l374_c11_dbc4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_62d6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_62d6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_62d6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_62d6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_62d6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_62d6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l374_c7_62d6
result_u8_value_MUX_uxn_opcodes_h_l374_c7_62d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l374_c7_62d6_cond,
result_u8_value_MUX_uxn_opcodes_h_l374_c7_62d6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l374_c7_62d6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l374_c7_62d6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_62d6
result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_62d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_62d6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_62d6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_62d6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_62d6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_62d6
result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_62d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_62d6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_62d6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_62d6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_62d6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l378_c11_8a71
BIN_OP_EQ_uxn_opcodes_h_l378_c11_8a71 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l378_c11_8a71_left,
BIN_OP_EQ_uxn_opcodes_h_l378_c11_8a71_right,
BIN_OP_EQ_uxn_opcodes_h_l378_c11_8a71_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_d2e4
result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_d2e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_d2e4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_d2e4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_d2e4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_d2e4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_d2e4
result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_d2e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_d2e4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_d2e4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_d2e4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_d2e4_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l338_l347_DUPLICATE_5a4f
CONST_SL_8_uint16_t_uxn_opcodes_h_l338_l347_DUPLICATE_5a4f : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l338_l347_DUPLICATE_5a4f_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l338_l347_DUPLICATE_5a4f_return_output);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_30bc
CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_30bc : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_30bc_x,
CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_30bc_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l328_c6_9a9b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_f79f_return_output,
 n16_MUX_uxn_opcodes_h_l328_c2_16e6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l328_c2_16e6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_16e6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_16e6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_16e6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_16e6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_16e6_return_output,
 t16_MUX_uxn_opcodes_h_l328_c2_16e6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l333_c11_c95b_return_output,
 n16_MUX_uxn_opcodes_h_l333_c7_7925_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l333_c7_7925_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_7925_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_7925_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_7925_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_7925_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_7925_return_output,
 t16_MUX_uxn_opcodes_h_l333_c7_7925_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l336_c11_fd58_return_output,
 n16_MUX_uxn_opcodes_h_l336_c7_0d36_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l336_c7_0d36_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_0d36_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_0d36_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_0d36_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_0d36_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_0d36_return_output,
 t16_MUX_uxn_opcodes_h_l336_c7_0d36_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l341_c11_a762_return_output,
 n16_MUX_uxn_opcodes_h_l341_c7_67d4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l341_c7_67d4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_67d4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_67d4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_67d4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_67d4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_67d4_return_output,
 t16_MUX_uxn_opcodes_h_l341_c7_67d4_return_output,
 BIN_OP_OR_uxn_opcodes_h_l342_c3_8b18_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l345_c11_28de_return_output,
 n16_MUX_uxn_opcodes_h_l345_c7_d3a8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l345_c7_d3a8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_d3a8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_d3a8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_d3a8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_d3a8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_d3a8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l349_c11_05b7_return_output,
 n16_MUX_uxn_opcodes_h_l349_c7_e6b3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l349_c7_e6b3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e6b3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e6b3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e6b3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e6b3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e6b3_return_output,
 BIN_OP_OR_uxn_opcodes_h_l350_c3_35a6_return_output,
 sp_relative_shift_uxn_opcodes_h_l352_c30_5807_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l357_c11_f00b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l357_c7_dfcb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_dfcb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_dfcb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_dfcb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_dfcb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l362_c11_31e7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_621b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l362_c7_621b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_621b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_621b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l366_c11_2705_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_418d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l366_c7_418d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_418d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_418d_return_output,
 CONST_SR_8_uxn_opcodes_h_l368_c31_c1f0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l370_c11_bc7b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_a875_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l370_c7_a875_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_a875_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_a875_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l374_c11_dbc4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_62d6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l374_c7_62d6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_62d6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_62d6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l378_c11_8a71_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_d2e4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_d2e4_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l338_l347_DUPLICATE_5a4f_return_output,
 CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_30bc_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_9a9b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_9a9b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_9a9b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_f79f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_f79f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_f79f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_f79f_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l328_c2_16e6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l328_c2_16e6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l333_c7_7925_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l328_c2_16e6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l328_c2_16e6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l328_c2_16e6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l328_c2_16e6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l333_c7_7925_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l328_c2_16e6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l328_c2_16e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_16e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_16e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_7925_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_16e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_16e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_16e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_16e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_7925_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_16e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_16e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_16e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_16e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_7925_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_16e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_16e6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_16e6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l330_c3_0aa3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_16e6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_7925_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_16e6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_16e6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_16e6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_16e6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_7925_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_16e6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_16e6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l328_c2_16e6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l328_c2_16e6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l333_c7_7925_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l328_c2_16e6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l328_c2_16e6_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l329_c3_1565_uxn_opcodes_h_l329_c3_1565_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_c95b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_c95b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_c95b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l333_c7_7925_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l333_c7_7925_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l336_c7_0d36_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l333_c7_7925_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l333_c7_7925_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l333_c7_7925_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l336_c7_0d36_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l333_c7_7925_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_7925_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_7925_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_0d36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_7925_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_7925_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_7925_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_0d36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_7925_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_7925_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_7925_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_0d36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_7925_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_7925_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l334_c3_854a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_7925_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_0d36_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_7925_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_7925_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_7925_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_0d36_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_7925_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l333_c7_7925_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l333_c7_7925_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l336_c7_0d36_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l333_c7_7925_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_fd58_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_fd58_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_fd58_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l336_c7_0d36_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l336_c7_0d36_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l341_c7_67d4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l336_c7_0d36_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l336_c7_0d36_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l336_c7_0d36_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_67d4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l336_c7_0d36_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_0d36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_0d36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_67d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_0d36_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_0d36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_0d36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_67d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_0d36_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_0d36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_0d36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_67d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_0d36_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_0d36_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l339_c3_7d1e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_0d36_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_67d4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_0d36_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_0d36_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_0d36_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_67d4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_0d36_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l336_c7_0d36_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l336_c7_0d36_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l341_c7_67d4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l336_c7_0d36_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_a762_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_a762_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_a762_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l341_c7_67d4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l341_c7_67d4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l345_c7_d3a8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l341_c7_67d4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_67d4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_67d4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c7_d3a8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_67d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_67d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_67d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_d3a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_67d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_67d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_67d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_d3a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_67d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_67d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_67d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_d3a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_67d4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_67d4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l343_c3_5b6e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_67d4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_d3a8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_67d4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_67d4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_67d4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_d3a8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_67d4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l341_c7_67d4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l341_c7_67d4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l341_c7_67d4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l342_c3_8b18_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l342_c3_8b18_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l342_c3_8b18_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_28de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_28de_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_28de_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l345_c7_d3a8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l345_c7_d3a8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l349_c7_e6b3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l345_c7_d3a8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c7_d3a8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c7_d3a8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l349_c7_e6b3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c7_d3a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_d3a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_d3a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e6b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_d3a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_d3a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_d3a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e6b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_d3a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_d3a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_d3a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e6b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_d3a8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_d3a8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_d3a8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e6b3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_d3a8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_d3a8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_d3a8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e6b3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_d3a8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_05b7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_05b7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_05b7_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l349_c7_e6b3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l349_c7_e6b3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l349_c7_e6b3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l349_c7_e6b3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l349_c7_e6b3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_dfcb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l349_c7_e6b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e6b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e6b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_dfcb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e6b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e6b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e6b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_dfcb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e6b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e6b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e6b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_dfcb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e6b3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e6b3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l354_c3_6aaf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e6b3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_dfcb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e6b3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e6b3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e6b3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e6b3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l350_c3_35a6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l350_c3_35a6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l350_c3_35a6_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l352_c30_5807_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l352_c30_5807_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l352_c30_5807_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l352_c30_5807_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l355_c21_b09e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_f00b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_f00b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_f00b_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_dfcb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_dfcb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l362_c7_621b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_dfcb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_dfcb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_dfcb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_dfcb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_dfcb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_dfcb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_621b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_dfcb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_dfcb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_dfcb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_621b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_dfcb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_dfcb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l359_c3_e971 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_dfcb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_621b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_dfcb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_31e7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_31e7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_31e7_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_621b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l363_c3_b82e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_621b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_418d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_621b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l362_c7_621b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l362_c7_621b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l366_c7_418d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l362_c7_621b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_621b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_621b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_418d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_621b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_621b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_621b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_418d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_621b_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l364_c21_d25c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_2705_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_2705_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_2705_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_418d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_d43f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_418d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_a875_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_418d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l366_c7_418d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l366_c7_418d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_a875_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l366_c7_418d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_418d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_418d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_a875_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_418d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_418d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_418d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_a875_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_418d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l368_c31_c1f0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l368_c31_c1f0_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l368_c21_a8f4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_bc7b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_bc7b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_bc7b_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_a875_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l371_c3_f943 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_a875_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_62d6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_a875_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_a875_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_a875_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l374_c7_62d6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_a875_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_a875_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_a875_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_62d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_a875_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_a875_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_a875_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_62d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_a875_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l372_c21_9355_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_dbc4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_dbc4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_dbc4_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_62d6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l375_c3_6821 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_62d6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_62d6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l374_c7_62d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l374_c7_62d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l374_c7_62d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_62d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_62d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_d2e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_62d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_62d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_62d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_d2e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_62d6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_8a71_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_8a71_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_8a71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_d2e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_d2e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_d2e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_d2e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_d2e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_d2e4_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l341_l333_l374_l328_l345_l336_DUPLICATE_f1d8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l341_l333_l328_l357_l345_l336_DUPLICATE_4542_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l341_l333_l374_l328_l378_l370_l366_l357_l362_l345_l336_DUPLICATE_28d5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l341_l333_l328_l349_l345_l336_DUPLICATE_6def_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l341_l333_l374_l378_l370_l366_l357_l362_l349_l345_l336_DUPLICATE_0b67_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l337_l350_l346_l342_DUPLICATE_5701_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l338_l347_DUPLICATE_5a4f_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l338_l347_DUPLICATE_5a4f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l345_l374_DUPLICATE_1c35_return_output : unsigned(3 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_30bc_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_30bc_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l376_l360_DUPLICATE_b287_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l383_l324_DUPLICATE_a693_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_05b7_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_f00b_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_8a71_right := to_unsigned(11, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e6b3_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_d2e4_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_d43f := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_418d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_d43f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l354_c3_6aaf := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e6b3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l354_c3_6aaf;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l334_c3_854a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_7925_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l334_c3_854a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_9a9b_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_fd58_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l363_c3_b82e := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_621b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l363_c3_b82e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_dbc4_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l330_c3_0aa3 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_16e6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l330_c3_0aa3;
     VAR_sp_relative_shift_uxn_opcodes_h_l352_c30_5807_y := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_f79f_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_2705_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_c95b_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_dfcb_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l343_c3_5b6e := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_67d4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l343_c3_5b6e;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e6b3_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_d2e4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_28de_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_16e6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_bc7b_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l371_c3_f943 := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_a875_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l371_c3_f943;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_a762_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l375_c3_6821 := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_62d6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l375_c3_6821;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l339_c3_7d1e := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_0d36_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l339_c3_7d1e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l359_c3_e971 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_dfcb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l359_c3_e971;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_31e7_right := to_unsigned(7, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l352_c30_5807_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_f79f_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l352_c30_5807_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l350_c3_35a6_left := n16;
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_30bc_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l328_c2_16e6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l333_c7_7925_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l336_c7_0d36_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l341_c7_67d4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l349_c7_e6b3_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_9a9b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_c95b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_fd58_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_a762_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_28de_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_05b7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_f00b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_31e7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_2705_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_bc7b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_dbc4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_8a71_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l342_c3_8b18_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l368_c31_c1f0_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l328_c2_16e6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l333_c7_7925_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l341_c7_67d4_iffalse := t16;
     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l341_l333_l328_l349_l345_l336_DUPLICATE_6def LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l341_l333_l328_l349_l345_l336_DUPLICATE_6def_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l362_c11_31e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l362_c11_31e7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_31e7_left;
     BIN_OP_EQ_uxn_opcodes_h_l362_c11_31e7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_31e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_31e7_return_output := BIN_OP_EQ_uxn_opcodes_h_l362_c11_31e7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l378_c11_8a71] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l378_c11_8a71_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_8a71_left;
     BIN_OP_EQ_uxn_opcodes_h_l378_c11_8a71_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_8a71_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_8a71_return_output := BIN_OP_EQ_uxn_opcodes_h_l378_c11_8a71_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l349_c11_05b7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l349_c11_05b7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_05b7_left;
     BIN_OP_EQ_uxn_opcodes_h_l349_c11_05b7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_05b7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_05b7_return_output := BIN_OP_EQ_uxn_opcodes_h_l349_c11_05b7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l345_c11_28de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l345_c11_28de_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_28de_left;
     BIN_OP_EQ_uxn_opcodes_h_l345_c11_28de_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_28de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_28de_return_output := BIN_OP_EQ_uxn_opcodes_h_l345_c11_28de_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l366_c11_2705] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l366_c11_2705_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_2705_left;
     BIN_OP_EQ_uxn_opcodes_h_l366_c11_2705_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_2705_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_2705_return_output := BIN_OP_EQ_uxn_opcodes_h_l366_c11_2705_return_output;

     -- CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_30bc LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_30bc_x <= VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_30bc_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_30bc_return_output := CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_30bc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l370_c11_bc7b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l370_c11_bc7b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_bc7b_left;
     BIN_OP_EQ_uxn_opcodes_h_l370_c11_bc7b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_bc7b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_bc7b_return_output := BIN_OP_EQ_uxn_opcodes_h_l370_c11_bc7b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l357_c11_f00b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l357_c11_f00b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_f00b_left;
     BIN_OP_EQ_uxn_opcodes_h_l357_c11_f00b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_f00b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_f00b_return_output := BIN_OP_EQ_uxn_opcodes_h_l357_c11_f00b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l364_c21_d25c] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l364_c21_d25c_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l341_c11_a762] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l341_c11_a762_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_a762_left;
     BIN_OP_EQ_uxn_opcodes_h_l341_c11_a762_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_a762_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_a762_return_output := BIN_OP_EQ_uxn_opcodes_h_l341_c11_a762_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l341_l333_l328_l357_l345_l336_DUPLICATE_4542 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l341_l333_l328_l357_l345_l336_DUPLICATE_4542_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l333_c11_c95b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l333_c11_c95b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_c95b_left;
     BIN_OP_EQ_uxn_opcodes_h_l333_c11_c95b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_c95b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_c95b_return_output := BIN_OP_EQ_uxn_opcodes_h_l333_c11_c95b_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l337_l350_l346_l342_DUPLICATE_5701 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l337_l350_l346_l342_DUPLICATE_5701_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l345_l374_DUPLICATE_1c35 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l345_l374_DUPLICATE_1c35_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l372_c21_9355] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l372_c21_9355_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l328_c6_9a9b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l328_c6_9a9b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_9a9b_left;
     BIN_OP_EQ_uxn_opcodes_h_l328_c6_9a9b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_9a9b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_9a9b_return_output := BIN_OP_EQ_uxn_opcodes_h_l328_c6_9a9b_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l341_l333_l374_l328_l345_l336_DUPLICATE_f1d8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l341_l333_l374_l328_l345_l336_DUPLICATE_f1d8_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l336_c11_fd58] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l336_c11_fd58_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_fd58_left;
     BIN_OP_EQ_uxn_opcodes_h_l336_c11_fd58_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_fd58_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_fd58_return_output := BIN_OP_EQ_uxn_opcodes_h_l336_c11_fd58_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l368_c31_c1f0] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l368_c31_c1f0_x <= VAR_CONST_SR_8_uxn_opcodes_h_l368_c31_c1f0_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l368_c31_c1f0_return_output := CONST_SR_8_uxn_opcodes_h_l368_c31_c1f0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l341_l333_l374_l328_l378_l370_l366_l357_l362_l345_l336_DUPLICATE_28d5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l341_l333_l374_l328_l378_l370_l366_l357_l362_l345_l336_DUPLICATE_28d5_return_output := result.is_stack_write;

     -- sp_relative_shift[uxn_opcodes_h_l352_c30_5807] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l352_c30_5807_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l352_c30_5807_ins;
     sp_relative_shift_uxn_opcodes_h_l352_c30_5807_x <= VAR_sp_relative_shift_uxn_opcodes_h_l352_c30_5807_x;
     sp_relative_shift_uxn_opcodes_h_l352_c30_5807_y <= VAR_sp_relative_shift_uxn_opcodes_h_l352_c30_5807_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l352_c30_5807_return_output := sp_relative_shift_uxn_opcodes_h_l352_c30_5807_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l374_c11_dbc4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l374_c11_dbc4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_dbc4_left;
     BIN_OP_EQ_uxn_opcodes_h_l374_c11_dbc4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_dbc4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_dbc4_return_output := BIN_OP_EQ_uxn_opcodes_h_l374_c11_dbc4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l341_l333_l374_l378_l370_l366_l357_l362_l349_l345_l336_DUPLICATE_0b67 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l341_l333_l374_l378_l370_l366_l357_l362_l349_l345_l336_DUPLICATE_0b67_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_f79f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_9a9b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l328_c2_16e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_9a9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_16e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_9a9b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_16e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_9a9b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_16e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_9a9b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_16e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_9a9b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_16e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_9a9b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l328_c2_16e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_9a9b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l328_c2_16e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_9a9b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l333_c7_7925_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_c95b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_7925_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_c95b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_7925_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_c95b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_7925_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_c95b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_7925_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_c95b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_7925_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_c95b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l333_c7_7925_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_c95b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l333_c7_7925_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_c95b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l336_c7_0d36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_fd58_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_0d36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_fd58_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_0d36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_fd58_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_0d36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_fd58_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_0d36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_fd58_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_0d36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_fd58_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l336_c7_0d36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_fd58_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l336_c7_0d36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_fd58_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l341_c7_67d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_a762_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_67d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_a762_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_67d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_a762_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_67d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_a762_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_67d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_a762_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_67d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_a762_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_67d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_a762_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l341_c7_67d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_a762_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l345_c7_d3a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_28de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_d3a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_28de_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_d3a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_28de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_d3a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_28de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_d3a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_28de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_d3a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_28de_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c7_d3a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_28de_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l349_c7_e6b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_05b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e6b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_05b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e6b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_05b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e6b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_05b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e6b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_05b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e6b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_05b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l349_c7_e6b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_05b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_dfcb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_f00b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_dfcb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_f00b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_dfcb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_f00b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_dfcb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_f00b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_dfcb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_f00b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_621b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_31e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_621b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_31e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_621b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_31e7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l362_c7_621b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_31e7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_418d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_2705_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_418d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_2705_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_418d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_2705_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l366_c7_418d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_2705_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_a875_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_bc7b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_a875_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_bc7b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_a875_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_bc7b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_a875_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_bc7b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_62d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_dbc4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_62d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_dbc4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_62d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_dbc4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l374_c7_62d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_dbc4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_d2e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_8a71_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_d2e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_8a71_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l342_c3_8b18_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l337_l350_l346_l342_DUPLICATE_5701_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l350_c3_35a6_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l337_l350_l346_l342_DUPLICATE_5701_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l338_l347_DUPLICATE_5a4f_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l337_l350_l346_l342_DUPLICATE_5701_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l362_c7_621b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l364_c21_d25c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_a875_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l372_c21_9355_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_16e6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l341_l333_l328_l349_l345_l336_DUPLICATE_6def_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_7925_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l341_l333_l328_l349_l345_l336_DUPLICATE_6def_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_0d36_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l341_l333_l328_l349_l345_l336_DUPLICATE_6def_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_67d4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l341_l333_l328_l349_l345_l336_DUPLICATE_6def_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_d3a8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l341_l333_l328_l349_l345_l336_DUPLICATE_6def_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e6b3_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l341_l333_l328_l349_l345_l336_DUPLICATE_6def_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_7925_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l341_l333_l374_l378_l370_l366_l357_l362_l349_l345_l336_DUPLICATE_0b67_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_0d36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l341_l333_l374_l378_l370_l366_l357_l362_l349_l345_l336_DUPLICATE_0b67_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_67d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l341_l333_l374_l378_l370_l366_l357_l362_l349_l345_l336_DUPLICATE_0b67_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_d3a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l341_l333_l374_l378_l370_l366_l357_l362_l349_l345_l336_DUPLICATE_0b67_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e6b3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l341_l333_l374_l378_l370_l366_l357_l362_l349_l345_l336_DUPLICATE_0b67_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_dfcb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l341_l333_l374_l378_l370_l366_l357_l362_l349_l345_l336_DUPLICATE_0b67_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_621b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l341_l333_l374_l378_l370_l366_l357_l362_l349_l345_l336_DUPLICATE_0b67_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_418d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l341_l333_l374_l378_l370_l366_l357_l362_l349_l345_l336_DUPLICATE_0b67_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_a875_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l341_l333_l374_l378_l370_l366_l357_l362_l349_l345_l336_DUPLICATE_0b67_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_62d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l341_l333_l374_l378_l370_l366_l357_l362_l349_l345_l336_DUPLICATE_0b67_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_d2e4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l341_l333_l374_l378_l370_l366_l357_l362_l349_l345_l336_DUPLICATE_0b67_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_16e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l341_l333_l328_l357_l345_l336_DUPLICATE_4542_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_7925_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l341_l333_l328_l357_l345_l336_DUPLICATE_4542_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_0d36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l341_l333_l328_l357_l345_l336_DUPLICATE_4542_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_67d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l341_l333_l328_l357_l345_l336_DUPLICATE_4542_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_d3a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l341_l333_l328_l357_l345_l336_DUPLICATE_4542_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_dfcb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l341_l333_l328_l357_l345_l336_DUPLICATE_4542_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_16e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l341_l333_l374_l328_l378_l370_l366_l357_l362_l345_l336_DUPLICATE_28d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_7925_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l341_l333_l374_l328_l378_l370_l366_l357_l362_l345_l336_DUPLICATE_28d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_0d36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l341_l333_l374_l328_l378_l370_l366_l357_l362_l345_l336_DUPLICATE_28d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_67d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l341_l333_l374_l328_l378_l370_l366_l357_l362_l345_l336_DUPLICATE_28d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_d3a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l341_l333_l374_l328_l378_l370_l366_l357_l362_l345_l336_DUPLICATE_28d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_dfcb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l341_l333_l374_l328_l378_l370_l366_l357_l362_l345_l336_DUPLICATE_28d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_621b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l341_l333_l374_l328_l378_l370_l366_l357_l362_l345_l336_DUPLICATE_28d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_418d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l341_l333_l374_l328_l378_l370_l366_l357_l362_l345_l336_DUPLICATE_28d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_a875_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l341_l333_l374_l328_l378_l370_l366_l357_l362_l345_l336_DUPLICATE_28d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_62d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l341_l333_l374_l328_l378_l370_l366_l357_l362_l345_l336_DUPLICATE_28d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_d2e4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l341_l333_l374_l328_l378_l370_l366_l357_l362_l345_l336_DUPLICATE_28d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_d3a8_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l345_l374_DUPLICATE_1c35_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_62d6_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l345_l374_DUPLICATE_1c35_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l328_c2_16e6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l341_l333_l374_l328_l345_l336_DUPLICATE_f1d8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l333_c7_7925_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l341_l333_l374_l328_l345_l336_DUPLICATE_f1d8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l336_c7_0d36_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l341_l333_l374_l328_l345_l336_DUPLICATE_f1d8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_67d4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l341_l333_l374_l328_l345_l336_DUPLICATE_f1d8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c7_d3a8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l341_l333_l374_l328_l345_l336_DUPLICATE_f1d8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l374_c7_62d6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l341_l333_l374_l328_l345_l336_DUPLICATE_f1d8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e6b3_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l352_c30_5807_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l374_c7_62d6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_62d6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_62d6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_62d6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_62d6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_62d6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_62d6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_62d6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_62d6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l378_c7_d2e4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_d2e4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_d2e4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_d2e4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_d2e4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_d2e4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_d2e4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_d2e4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_d2e4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l378_c7_d2e4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_d2e4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_d2e4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_d2e4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_d2e4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_d2e4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_d2e4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_d2e4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_d2e4_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l350_c3_35a6] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l350_c3_35a6_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l350_c3_35a6_left;
     BIN_OP_OR_uxn_opcodes_h_l350_c3_35a6_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l350_c3_35a6_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l350_c3_35a6_return_output := BIN_OP_OR_uxn_opcodes_h_l350_c3_35a6_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l368_c21_a8f4] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l368_c21_a8f4_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l368_c31_c1f0_return_output);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l328_c1_f79f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_f79f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_f79f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_f79f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_f79f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_f79f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_f79f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_f79f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_f79f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l357_c7_dfcb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_dfcb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_dfcb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_dfcb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_dfcb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_dfcb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_dfcb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_dfcb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_dfcb_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l338_l347_DUPLICATE_5a4f LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l338_l347_DUPLICATE_5a4f_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l338_l347_DUPLICATE_5a4f_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l338_l347_DUPLICATE_5a4f_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l338_l347_DUPLICATE_5a4f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l349_c7_e6b3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e6b3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e6b3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e6b3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e6b3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e6b3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e6b3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e6b3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e6b3_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l342_c3_8b18] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l342_c3_8b18_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l342_c3_8b18_left;
     BIN_OP_OR_uxn_opcodes_h_l342_c3_8b18_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l342_c3_8b18_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l342_c3_8b18_return_output := BIN_OP_OR_uxn_opcodes_h_l342_c3_8b18_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l376_l360_DUPLICATE_b287 LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l376_l360_DUPLICATE_b287_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_30bc_return_output);

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l341_c7_67d4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l342_c3_8b18_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l349_c7_e6b3_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l350_c3_35a6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l366_c7_418d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l368_c21_a8f4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_dfcb_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l376_l360_DUPLICATE_b287_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l374_c7_62d6_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l376_l360_DUPLICATE_b287_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l345_c7_d3a8_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l338_l347_DUPLICATE_5a4f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l336_c7_0d36_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l338_l347_DUPLICATE_5a4f_return_output;
     VAR_printf_uxn_opcodes_h_l329_c3_1565_uxn_opcodes_h_l329_c3_1565_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_f79f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_62d6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_d2e4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e6b3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_dfcb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_62d6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_d2e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_d3a8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e6b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_a875_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_62d6_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l370_c7_a875] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_a875_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_a875_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_a875_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_a875_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_a875_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_a875_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_a875_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_a875_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l374_c7_62d6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_62d6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_62d6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_62d6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_62d6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_62d6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_62d6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_62d6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_62d6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l345_c7_d3a8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_d3a8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_d3a8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_d3a8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_d3a8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_d3a8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_d3a8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_d3a8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_d3a8_return_output;

     -- printf_uxn_opcodes_h_l329_c3_1565[uxn_opcodes_h_l329_c3_1565] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l329_c3_1565_uxn_opcodes_h_l329_c3_1565_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l329_c3_1565_uxn_opcodes_h_l329_c3_1565_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l349_c7_e6b3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e6b3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e6b3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e6b3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e6b3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e6b3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e6b3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e6b3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e6b3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l374_c7_62d6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l374_c7_62d6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l374_c7_62d6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l374_c7_62d6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l374_c7_62d6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l374_c7_62d6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l374_c7_62d6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l374_c7_62d6_return_output := result_u8_value_MUX_uxn_opcodes_h_l374_c7_62d6_return_output;

     -- t16_MUX[uxn_opcodes_h_l341_c7_67d4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l341_c7_67d4_cond <= VAR_t16_MUX_uxn_opcodes_h_l341_c7_67d4_cond;
     t16_MUX_uxn_opcodes_h_l341_c7_67d4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l341_c7_67d4_iftrue;
     t16_MUX_uxn_opcodes_h_l341_c7_67d4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l341_c7_67d4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l341_c7_67d4_return_output := t16_MUX_uxn_opcodes_h_l341_c7_67d4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l374_c7_62d6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_62d6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_62d6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_62d6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_62d6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_62d6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_62d6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_62d6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_62d6_return_output;

     -- n16_MUX[uxn_opcodes_h_l349_c7_e6b3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l349_c7_e6b3_cond <= VAR_n16_MUX_uxn_opcodes_h_l349_c7_e6b3_cond;
     n16_MUX_uxn_opcodes_h_l349_c7_e6b3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l349_c7_e6b3_iftrue;
     n16_MUX_uxn_opcodes_h_l349_c7_e6b3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l349_c7_e6b3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l349_c7_e6b3_return_output := n16_MUX_uxn_opcodes_h_l349_c7_e6b3_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l355_c21_b09e] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l355_c21_b09e_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l350_c3_35a6_return_output);

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l349_c7_e6b3_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l355_c21_b09e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l345_c7_d3a8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l349_c7_e6b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_a875_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_62d6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_d3a8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e6b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_a875_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_62d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_67d4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_d3a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_418d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_a875_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_a875_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l374_c7_62d6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l336_c7_0d36_iffalse := VAR_t16_MUX_uxn_opcodes_h_l341_c7_67d4_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l370_c7_a875] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_a875_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_a875_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_a875_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_a875_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_a875_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_a875_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_a875_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_a875_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l341_c7_67d4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_67d4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_67d4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_67d4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_67d4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_67d4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_67d4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_67d4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_67d4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l370_c7_a875] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_a875_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_a875_cond;
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_a875_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_a875_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_a875_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_a875_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_a875_return_output := result_u8_value_MUX_uxn_opcodes_h_l370_c7_a875_return_output;

     -- t16_MUX[uxn_opcodes_h_l336_c7_0d36] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l336_c7_0d36_cond <= VAR_t16_MUX_uxn_opcodes_h_l336_c7_0d36_cond;
     t16_MUX_uxn_opcodes_h_l336_c7_0d36_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l336_c7_0d36_iftrue;
     t16_MUX_uxn_opcodes_h_l336_c7_0d36_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l336_c7_0d36_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l336_c7_0d36_return_output := t16_MUX_uxn_opcodes_h_l336_c7_0d36_return_output;

     -- n16_MUX[uxn_opcodes_h_l345_c7_d3a8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l345_c7_d3a8_cond <= VAR_n16_MUX_uxn_opcodes_h_l345_c7_d3a8_cond;
     n16_MUX_uxn_opcodes_h_l345_c7_d3a8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l345_c7_d3a8_iftrue;
     n16_MUX_uxn_opcodes_h_l345_c7_d3a8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l345_c7_d3a8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l345_c7_d3a8_return_output := n16_MUX_uxn_opcodes_h_l345_c7_d3a8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l345_c7_d3a8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_d3a8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_d3a8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_d3a8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_d3a8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_d3a8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_d3a8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_d3a8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_d3a8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l366_c7_418d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_418d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_418d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_418d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_418d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_418d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_418d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_418d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_418d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l370_c7_a875] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_a875_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_a875_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_a875_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_a875_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_a875_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_a875_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_a875_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_a875_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l341_c7_67d4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l345_c7_d3a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_418d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_a875_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_67d4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_d3a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_418d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_a875_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_0d36_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_67d4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_621b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_418d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l366_c7_418d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_a875_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l333_c7_7925_iffalse := VAR_t16_MUX_uxn_opcodes_h_l336_c7_0d36_return_output;
     -- t16_MUX[uxn_opcodes_h_l333_c7_7925] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l333_c7_7925_cond <= VAR_t16_MUX_uxn_opcodes_h_l333_c7_7925_cond;
     t16_MUX_uxn_opcodes_h_l333_c7_7925_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l333_c7_7925_iftrue;
     t16_MUX_uxn_opcodes_h_l333_c7_7925_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l333_c7_7925_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l333_c7_7925_return_output := t16_MUX_uxn_opcodes_h_l333_c7_7925_return_output;

     -- n16_MUX[uxn_opcodes_h_l341_c7_67d4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l341_c7_67d4_cond <= VAR_n16_MUX_uxn_opcodes_h_l341_c7_67d4_cond;
     n16_MUX_uxn_opcodes_h_l341_c7_67d4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l341_c7_67d4_iftrue;
     n16_MUX_uxn_opcodes_h_l341_c7_67d4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l341_c7_67d4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l341_c7_67d4_return_output := n16_MUX_uxn_opcodes_h_l341_c7_67d4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l336_c7_0d36] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_0d36_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_0d36_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_0d36_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_0d36_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_0d36_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_0d36_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_0d36_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_0d36_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l362_c7_621b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_621b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_621b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_621b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_621b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_621b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_621b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_621b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_621b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l366_c7_418d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_418d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_418d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_418d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_418d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_418d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_418d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_418d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_418d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l366_c7_418d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_418d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_418d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_418d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_418d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_418d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_418d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_418d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_418d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l366_c7_418d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l366_c7_418d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l366_c7_418d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l366_c7_418d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l366_c7_418d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l366_c7_418d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l366_c7_418d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l366_c7_418d_return_output := result_u8_value_MUX_uxn_opcodes_h_l366_c7_418d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l341_c7_67d4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_67d4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_67d4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_67d4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_67d4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_67d4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_67d4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_67d4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_67d4_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l336_c7_0d36_iffalse := VAR_n16_MUX_uxn_opcodes_h_l341_c7_67d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_621b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_418d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_0d36_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_67d4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_621b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_418d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_7925_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_0d36_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_dfcb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_621b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l362_c7_621b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l366_c7_418d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l328_c2_16e6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l333_c7_7925_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l362_c7_621b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l362_c7_621b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l362_c7_621b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l362_c7_621b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l362_c7_621b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l362_c7_621b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l362_c7_621b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l362_c7_621b_return_output := result_u8_value_MUX_uxn_opcodes_h_l362_c7_621b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l362_c7_621b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_621b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_621b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_621b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_621b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_621b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_621b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_621b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_621b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l357_c7_dfcb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_dfcb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_dfcb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_dfcb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_dfcb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_dfcb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_dfcb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_dfcb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_dfcb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l362_c7_621b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_621b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_621b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_621b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_621b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_621b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_621b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_621b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_621b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l333_c7_7925] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_7925_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_7925_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_7925_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_7925_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_7925_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_7925_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_7925_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_7925_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l336_c7_0d36] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_0d36_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_0d36_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_0d36_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_0d36_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_0d36_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_0d36_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_0d36_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_0d36_return_output;

     -- n16_MUX[uxn_opcodes_h_l336_c7_0d36] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l336_c7_0d36_cond <= VAR_n16_MUX_uxn_opcodes_h_l336_c7_0d36_cond;
     n16_MUX_uxn_opcodes_h_l336_c7_0d36_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l336_c7_0d36_iftrue;
     n16_MUX_uxn_opcodes_h_l336_c7_0d36_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l336_c7_0d36_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l336_c7_0d36_return_output := n16_MUX_uxn_opcodes_h_l336_c7_0d36_return_output;

     -- t16_MUX[uxn_opcodes_h_l328_c2_16e6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l328_c2_16e6_cond <= VAR_t16_MUX_uxn_opcodes_h_l328_c2_16e6_cond;
     t16_MUX_uxn_opcodes_h_l328_c2_16e6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l328_c2_16e6_iftrue;
     t16_MUX_uxn_opcodes_h_l328_c2_16e6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l328_c2_16e6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l328_c2_16e6_return_output := t16_MUX_uxn_opcodes_h_l328_c2_16e6_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l333_c7_7925_iffalse := VAR_n16_MUX_uxn_opcodes_h_l336_c7_0d36_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_dfcb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_621b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_7925_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_0d36_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_dfcb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_621b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_16e6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_7925_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e6b3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_dfcb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_dfcb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l362_c7_621b_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l328_c2_16e6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l357_c7_dfcb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_dfcb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_dfcb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_dfcb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_dfcb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_dfcb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_dfcb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_dfcb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_dfcb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l357_c7_dfcb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l357_c7_dfcb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_dfcb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l357_c7_dfcb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_dfcb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l357_c7_dfcb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_dfcb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_dfcb_return_output := result_u8_value_MUX_uxn_opcodes_h_l357_c7_dfcb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l357_c7_dfcb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_dfcb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_dfcb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_dfcb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_dfcb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_dfcb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_dfcb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_dfcb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_dfcb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l328_c2_16e6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_16e6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_16e6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_16e6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_16e6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_16e6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_16e6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_16e6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_16e6_return_output;

     -- n16_MUX[uxn_opcodes_h_l333_c7_7925] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l333_c7_7925_cond <= VAR_n16_MUX_uxn_opcodes_h_l333_c7_7925_cond;
     n16_MUX_uxn_opcodes_h_l333_c7_7925_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l333_c7_7925_iftrue;
     n16_MUX_uxn_opcodes_h_l333_c7_7925_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l333_c7_7925_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l333_c7_7925_return_output := n16_MUX_uxn_opcodes_h_l333_c7_7925_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l349_c7_e6b3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e6b3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e6b3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e6b3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e6b3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e6b3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e6b3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e6b3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e6b3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l333_c7_7925] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_7925_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_7925_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_7925_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_7925_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_7925_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_7925_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_7925_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_7925_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l328_c2_16e6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l333_c7_7925_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e6b3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_dfcb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_16e6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_7925_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e6b3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_dfcb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_d3a8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e6b3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l349_c7_e6b3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_dfcb_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l349_c7_e6b3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e6b3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e6b3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e6b3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e6b3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e6b3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e6b3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e6b3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e6b3_return_output;

     -- n16_MUX[uxn_opcodes_h_l328_c2_16e6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l328_c2_16e6_cond <= VAR_n16_MUX_uxn_opcodes_h_l328_c2_16e6_cond;
     n16_MUX_uxn_opcodes_h_l328_c2_16e6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l328_c2_16e6_iftrue;
     n16_MUX_uxn_opcodes_h_l328_c2_16e6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l328_c2_16e6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l328_c2_16e6_return_output := n16_MUX_uxn_opcodes_h_l328_c2_16e6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l349_c7_e6b3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l349_c7_e6b3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l349_c7_e6b3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l349_c7_e6b3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l349_c7_e6b3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l349_c7_e6b3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l349_c7_e6b3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l349_c7_e6b3_return_output := result_u8_value_MUX_uxn_opcodes_h_l349_c7_e6b3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l345_c7_d3a8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_d3a8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_d3a8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_d3a8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_d3a8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_d3a8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_d3a8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_d3a8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_d3a8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l349_c7_e6b3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e6b3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e6b3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e6b3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e6b3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e6b3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e6b3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e6b3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e6b3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l328_c2_16e6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_16e6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_16e6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_16e6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_16e6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_16e6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_16e6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_16e6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_16e6_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l328_c2_16e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_d3a8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e6b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_d3a8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e6b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_67d4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_d3a8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c7_d3a8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l349_c7_e6b3_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l341_c7_67d4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_67d4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_67d4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_67d4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_67d4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_67d4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_67d4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_67d4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_67d4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l345_c7_d3a8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_d3a8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_d3a8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_d3a8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_d3a8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_d3a8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_d3a8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_d3a8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_d3a8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l345_c7_d3a8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l345_c7_d3a8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c7_d3a8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l345_c7_d3a8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c7_d3a8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l345_c7_d3a8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c7_d3a8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c7_d3a8_return_output := result_u8_value_MUX_uxn_opcodes_h_l345_c7_d3a8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l345_c7_d3a8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_d3a8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_d3a8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_d3a8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_d3a8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_d3a8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_d3a8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_d3a8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_d3a8_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_67d4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_d3a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_67d4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_d3a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_0d36_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_67d4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_67d4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c7_d3a8_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l341_c7_67d4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l341_c7_67d4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_67d4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l341_c7_67d4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_67d4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l341_c7_67d4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_67d4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_67d4_return_output := result_u8_value_MUX_uxn_opcodes_h_l341_c7_67d4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l336_c7_0d36] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_0d36_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_0d36_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_0d36_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_0d36_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_0d36_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_0d36_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_0d36_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_0d36_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l341_c7_67d4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_67d4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_67d4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_67d4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_67d4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_67d4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_67d4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_67d4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_67d4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l341_c7_67d4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_67d4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_67d4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_67d4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_67d4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_67d4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_67d4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_67d4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_67d4_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_0d36_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_67d4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_0d36_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_67d4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_7925_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_0d36_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l336_c7_0d36_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_67d4_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l336_c7_0d36] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_0d36_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_0d36_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_0d36_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_0d36_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_0d36_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_0d36_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_0d36_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_0d36_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l336_c7_0d36] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_0d36_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_0d36_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_0d36_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_0d36_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_0d36_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_0d36_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_0d36_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_0d36_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l333_c7_7925] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_7925_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_7925_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_7925_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_7925_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_7925_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_7925_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_7925_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_7925_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l336_c7_0d36] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l336_c7_0d36_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l336_c7_0d36_cond;
     result_u8_value_MUX_uxn_opcodes_h_l336_c7_0d36_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l336_c7_0d36_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l336_c7_0d36_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l336_c7_0d36_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l336_c7_0d36_return_output := result_u8_value_MUX_uxn_opcodes_h_l336_c7_0d36_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_7925_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_0d36_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_7925_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_0d36_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_16e6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_7925_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l333_c7_7925_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l336_c7_0d36_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l328_c2_16e6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_16e6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_16e6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_16e6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_16e6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_16e6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_16e6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_16e6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_16e6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l333_c7_7925] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_7925_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_7925_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_7925_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_7925_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_7925_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_7925_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_7925_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_7925_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l333_c7_7925] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_7925_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_7925_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_7925_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_7925_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_7925_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_7925_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_7925_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_7925_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l333_c7_7925] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l333_c7_7925_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l333_c7_7925_cond;
     result_u8_value_MUX_uxn_opcodes_h_l333_c7_7925_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l333_c7_7925_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l333_c7_7925_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l333_c7_7925_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l333_c7_7925_return_output := result_u8_value_MUX_uxn_opcodes_h_l333_c7_7925_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_16e6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_7925_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_16e6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_7925_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l328_c2_16e6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l333_c7_7925_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l328_c2_16e6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_16e6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_16e6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_16e6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_16e6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_16e6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_16e6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_16e6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_16e6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l328_c2_16e6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_16e6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_16e6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_16e6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_16e6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_16e6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_16e6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_16e6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_16e6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l328_c2_16e6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l328_c2_16e6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l328_c2_16e6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l328_c2_16e6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l328_c2_16e6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l328_c2_16e6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l328_c2_16e6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l328_c2_16e6_return_output := result_u8_value_MUX_uxn_opcodes_h_l328_c2_16e6_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l383_l324_DUPLICATE_a693 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l383_l324_DUPLICATE_a693_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l328_c2_16e6_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_16e6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_16e6_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_16e6_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_16e6_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_16e6_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l383_l324_DUPLICATE_a693_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l383_l324_DUPLICATE_a693_return_output;
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
