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
-- Submodules: 79
entity add2_0CLK_f74041be is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end add2_0CLK_f74041be;
architecture arch of add2_0CLK_f74041be is
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
-- BIN_OP_EQ[uxn_opcodes_h_l822_c6_745a]
signal BIN_OP_EQ_uxn_opcodes_h_l822_c6_745a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l822_c6_745a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l822_c6_745a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l822_c1_135e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l822_c1_135e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l822_c1_135e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l822_c1_135e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l822_c1_135e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l822_c2_43db]
signal n16_MUX_uxn_opcodes_h_l822_c2_43db_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l822_c2_43db_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l822_c2_43db_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l822_c2_43db_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l822_c2_43db]
signal tmp16_MUX_uxn_opcodes_h_l822_c2_43db_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l822_c2_43db_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l822_c2_43db_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l822_c2_43db_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l822_c2_43db]
signal result_is_stack_write_MUX_uxn_opcodes_h_l822_c2_43db_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l822_c2_43db_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l822_c2_43db_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l822_c2_43db_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l822_c2_43db]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c2_43db_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c2_43db_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c2_43db_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c2_43db_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l822_c2_43db]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c2_43db_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c2_43db_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c2_43db_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c2_43db_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l822_c2_43db]
signal result_u8_value_MUX_uxn_opcodes_h_l822_c2_43db_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l822_c2_43db_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l822_c2_43db_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l822_c2_43db_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l822_c2_43db]
signal result_is_opc_done_MUX_uxn_opcodes_h_l822_c2_43db_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l822_c2_43db_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l822_c2_43db_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l822_c2_43db_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l822_c2_43db]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l822_c2_43db_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l822_c2_43db_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l822_c2_43db_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l822_c2_43db_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l822_c2_43db]
signal t16_MUX_uxn_opcodes_h_l822_c2_43db_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l822_c2_43db_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l822_c2_43db_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l822_c2_43db_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l823_c3_831d[uxn_opcodes_h_l823_c3_831d]
signal printf_uxn_opcodes_h_l823_c3_831d_uxn_opcodes_h_l823_c3_831d_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l827_c11_2e4f]
signal BIN_OP_EQ_uxn_opcodes_h_l827_c11_2e4f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l827_c11_2e4f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l827_c11_2e4f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l827_c7_7637]
signal n16_MUX_uxn_opcodes_h_l827_c7_7637_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l827_c7_7637_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l827_c7_7637_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l827_c7_7637_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l827_c7_7637]
signal tmp16_MUX_uxn_opcodes_h_l827_c7_7637_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l827_c7_7637_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l827_c7_7637_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l827_c7_7637_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l827_c7_7637]
signal result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_7637_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_7637_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_7637_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_7637_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l827_c7_7637]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_7637_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_7637_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_7637_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_7637_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l827_c7_7637]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_7637_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_7637_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_7637_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_7637_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l827_c7_7637]
signal result_u8_value_MUX_uxn_opcodes_h_l827_c7_7637_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l827_c7_7637_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l827_c7_7637_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l827_c7_7637_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l827_c7_7637]
signal result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_7637_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_7637_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_7637_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_7637_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l827_c7_7637]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_7637_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_7637_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_7637_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_7637_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l827_c7_7637]
signal t16_MUX_uxn_opcodes_h_l827_c7_7637_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l827_c7_7637_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l827_c7_7637_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l827_c7_7637_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l830_c11_aff6]
signal BIN_OP_EQ_uxn_opcodes_h_l830_c11_aff6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l830_c11_aff6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l830_c11_aff6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l830_c7_e21f]
signal n16_MUX_uxn_opcodes_h_l830_c7_e21f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l830_c7_e21f_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l830_c7_e21f]
signal tmp16_MUX_uxn_opcodes_h_l830_c7_e21f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l830_c7_e21f_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l830_c7_e21f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_e21f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_e21f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l830_c7_e21f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_e21f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_e21f_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l830_c7_e21f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_e21f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_e21f_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l830_c7_e21f]
signal result_u8_value_MUX_uxn_opcodes_h_l830_c7_e21f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l830_c7_e21f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l830_c7_e21f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_e21f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_e21f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l830_c7_e21f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_e21f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_e21f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l830_c7_e21f]
signal t16_MUX_uxn_opcodes_h_l830_c7_e21f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l830_c7_e21f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l835_c11_9723]
signal BIN_OP_EQ_uxn_opcodes_h_l835_c11_9723_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l835_c11_9723_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l835_c11_9723_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l835_c7_8df1]
signal n16_MUX_uxn_opcodes_h_l835_c7_8df1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l835_c7_8df1_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l835_c7_8df1]
signal tmp16_MUX_uxn_opcodes_h_l835_c7_8df1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l835_c7_8df1_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l835_c7_8df1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_8df1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_8df1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l835_c7_8df1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_8df1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_8df1_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l835_c7_8df1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_8df1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_8df1_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l835_c7_8df1]
signal result_u8_value_MUX_uxn_opcodes_h_l835_c7_8df1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l835_c7_8df1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l835_c7_8df1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_8df1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_8df1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l835_c7_8df1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_8df1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_8df1_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l835_c7_8df1]
signal t16_MUX_uxn_opcodes_h_l835_c7_8df1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l835_c7_8df1_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l836_c3_2daa]
signal BIN_OP_OR_uxn_opcodes_h_l836_c3_2daa_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l836_c3_2daa_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l836_c3_2daa_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l839_c11_0d9c]
signal BIN_OP_EQ_uxn_opcodes_h_l839_c11_0d9c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l839_c11_0d9c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l839_c11_0d9c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l839_c7_ca4a]
signal n16_MUX_uxn_opcodes_h_l839_c7_ca4a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l839_c7_ca4a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l839_c7_ca4a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l839_c7_ca4a]
signal tmp16_MUX_uxn_opcodes_h_l839_c7_ca4a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l839_c7_ca4a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l839_c7_ca4a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l839_c7_ca4a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_ca4a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_ca4a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_ca4a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l839_c7_ca4a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_ca4a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_ca4a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_ca4a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l839_c7_ca4a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l839_c7_ca4a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l839_c7_ca4a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l839_c7_ca4a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l839_c7_ca4a]
signal result_u8_value_MUX_uxn_opcodes_h_l839_c7_ca4a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l839_c7_ca4a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l839_c7_ca4a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l839_c7_ca4a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_ca4a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_ca4a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_ca4a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l839_c7_ca4a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_ca4a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_ca4a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_ca4a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l843_c11_17c6]
signal BIN_OP_EQ_uxn_opcodes_h_l843_c11_17c6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l843_c11_17c6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l843_c11_17c6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l843_c7_d048]
signal n16_MUX_uxn_opcodes_h_l843_c7_d048_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l843_c7_d048_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l843_c7_d048_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l843_c7_d048_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l843_c7_d048]
signal tmp16_MUX_uxn_opcodes_h_l843_c7_d048_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l843_c7_d048_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l843_c7_d048_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l843_c7_d048_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l843_c7_d048]
signal result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d048_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d048_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d048_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d048_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l843_c7_d048]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d048_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d048_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d048_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d048_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l843_c7_d048]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d048_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d048_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d048_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d048_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l843_c7_d048]
signal result_u8_value_MUX_uxn_opcodes_h_l843_c7_d048_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l843_c7_d048_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l843_c7_d048_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l843_c7_d048_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l843_c7_d048]
signal result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d048_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d048_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d048_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d048_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l843_c7_d048]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d048_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d048_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d048_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d048_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l844_c3_1e8d]
signal BIN_OP_OR_uxn_opcodes_h_l844_c3_1e8d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l844_c3_1e8d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l844_c3_1e8d_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l845_c11_771f]
signal BIN_OP_PLUS_uxn_opcodes_h_l845_c11_771f_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l845_c11_771f_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l845_c11_771f_return_output : unsigned(16 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l847_c30_71b7]
signal sp_relative_shift_uxn_opcodes_h_l847_c30_71b7_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l847_c30_71b7_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l847_c30_71b7_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l847_c30_71b7_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l852_c11_3ad7]
signal BIN_OP_EQ_uxn_opcodes_h_l852_c11_3ad7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l852_c11_3ad7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l852_c11_3ad7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l852_c7_29bd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_29bd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_29bd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_29bd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_29bd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l852_c7_29bd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_29bd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_29bd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_29bd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_29bd_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l852_c7_29bd]
signal result_u8_value_MUX_uxn_opcodes_h_l852_c7_29bd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l852_c7_29bd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l852_c7_29bd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l852_c7_29bd_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l852_c7_29bd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_29bd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_29bd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_29bd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_29bd_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l852_c7_29bd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_29bd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_29bd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_29bd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_29bd_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l855_c31_1553]
signal CONST_SR_8_uxn_opcodes_h_l855_c31_1553_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l855_c31_1553_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l857_c11_e2b6]
signal BIN_OP_EQ_uxn_opcodes_h_l857_c11_e2b6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l857_c11_e2b6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l857_c11_e2b6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l857_c7_31b4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_31b4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_31b4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_31b4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_31b4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l857_c7_31b4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_31b4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_31b4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_31b4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_31b4_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l832_l841_DUPLICATE_8955
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l832_l841_DUPLICATE_8955_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l832_l841_DUPLICATE_8955_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l822_c6_745a
BIN_OP_EQ_uxn_opcodes_h_l822_c6_745a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l822_c6_745a_left,
BIN_OP_EQ_uxn_opcodes_h_l822_c6_745a_right,
BIN_OP_EQ_uxn_opcodes_h_l822_c6_745a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l822_c1_135e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l822_c1_135e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l822_c1_135e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l822_c1_135e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l822_c1_135e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l822_c1_135e_return_output);

-- n16_MUX_uxn_opcodes_h_l822_c2_43db
n16_MUX_uxn_opcodes_h_l822_c2_43db : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l822_c2_43db_cond,
n16_MUX_uxn_opcodes_h_l822_c2_43db_iftrue,
n16_MUX_uxn_opcodes_h_l822_c2_43db_iffalse,
n16_MUX_uxn_opcodes_h_l822_c2_43db_return_output);

-- tmp16_MUX_uxn_opcodes_h_l822_c2_43db
tmp16_MUX_uxn_opcodes_h_l822_c2_43db : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l822_c2_43db_cond,
tmp16_MUX_uxn_opcodes_h_l822_c2_43db_iftrue,
tmp16_MUX_uxn_opcodes_h_l822_c2_43db_iffalse,
tmp16_MUX_uxn_opcodes_h_l822_c2_43db_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l822_c2_43db
result_is_stack_write_MUX_uxn_opcodes_h_l822_c2_43db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l822_c2_43db_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l822_c2_43db_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l822_c2_43db_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l822_c2_43db_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c2_43db
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c2_43db : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c2_43db_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c2_43db_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c2_43db_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c2_43db_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c2_43db
result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c2_43db : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c2_43db_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c2_43db_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c2_43db_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c2_43db_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l822_c2_43db
result_u8_value_MUX_uxn_opcodes_h_l822_c2_43db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l822_c2_43db_cond,
result_u8_value_MUX_uxn_opcodes_h_l822_c2_43db_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l822_c2_43db_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l822_c2_43db_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l822_c2_43db
result_is_opc_done_MUX_uxn_opcodes_h_l822_c2_43db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l822_c2_43db_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l822_c2_43db_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l822_c2_43db_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l822_c2_43db_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l822_c2_43db
result_is_sp_shift_MUX_uxn_opcodes_h_l822_c2_43db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l822_c2_43db_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l822_c2_43db_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l822_c2_43db_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l822_c2_43db_return_output);

-- t16_MUX_uxn_opcodes_h_l822_c2_43db
t16_MUX_uxn_opcodes_h_l822_c2_43db : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l822_c2_43db_cond,
t16_MUX_uxn_opcodes_h_l822_c2_43db_iftrue,
t16_MUX_uxn_opcodes_h_l822_c2_43db_iffalse,
t16_MUX_uxn_opcodes_h_l822_c2_43db_return_output);

-- printf_uxn_opcodes_h_l823_c3_831d_uxn_opcodes_h_l823_c3_831d
printf_uxn_opcodes_h_l823_c3_831d_uxn_opcodes_h_l823_c3_831d : entity work.printf_uxn_opcodes_h_l823_c3_831d_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l823_c3_831d_uxn_opcodes_h_l823_c3_831d_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l827_c11_2e4f
BIN_OP_EQ_uxn_opcodes_h_l827_c11_2e4f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l827_c11_2e4f_left,
BIN_OP_EQ_uxn_opcodes_h_l827_c11_2e4f_right,
BIN_OP_EQ_uxn_opcodes_h_l827_c11_2e4f_return_output);

-- n16_MUX_uxn_opcodes_h_l827_c7_7637
n16_MUX_uxn_opcodes_h_l827_c7_7637 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l827_c7_7637_cond,
n16_MUX_uxn_opcodes_h_l827_c7_7637_iftrue,
n16_MUX_uxn_opcodes_h_l827_c7_7637_iffalse,
n16_MUX_uxn_opcodes_h_l827_c7_7637_return_output);

-- tmp16_MUX_uxn_opcodes_h_l827_c7_7637
tmp16_MUX_uxn_opcodes_h_l827_c7_7637 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l827_c7_7637_cond,
tmp16_MUX_uxn_opcodes_h_l827_c7_7637_iftrue,
tmp16_MUX_uxn_opcodes_h_l827_c7_7637_iffalse,
tmp16_MUX_uxn_opcodes_h_l827_c7_7637_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_7637
result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_7637 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_7637_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_7637_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_7637_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_7637_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_7637
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_7637 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_7637_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_7637_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_7637_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_7637_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_7637
result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_7637 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_7637_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_7637_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_7637_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_7637_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l827_c7_7637
result_u8_value_MUX_uxn_opcodes_h_l827_c7_7637 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l827_c7_7637_cond,
result_u8_value_MUX_uxn_opcodes_h_l827_c7_7637_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l827_c7_7637_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l827_c7_7637_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_7637
result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_7637 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_7637_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_7637_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_7637_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_7637_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_7637
result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_7637 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_7637_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_7637_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_7637_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_7637_return_output);

-- t16_MUX_uxn_opcodes_h_l827_c7_7637
t16_MUX_uxn_opcodes_h_l827_c7_7637 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l827_c7_7637_cond,
t16_MUX_uxn_opcodes_h_l827_c7_7637_iftrue,
t16_MUX_uxn_opcodes_h_l827_c7_7637_iffalse,
t16_MUX_uxn_opcodes_h_l827_c7_7637_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l830_c11_aff6
BIN_OP_EQ_uxn_opcodes_h_l830_c11_aff6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l830_c11_aff6_left,
BIN_OP_EQ_uxn_opcodes_h_l830_c11_aff6_right,
BIN_OP_EQ_uxn_opcodes_h_l830_c11_aff6_return_output);

-- n16_MUX_uxn_opcodes_h_l830_c7_e21f
n16_MUX_uxn_opcodes_h_l830_c7_e21f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l830_c7_e21f_cond,
n16_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue,
n16_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse,
n16_MUX_uxn_opcodes_h_l830_c7_e21f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l830_c7_e21f
tmp16_MUX_uxn_opcodes_h_l830_c7_e21f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l830_c7_e21f_cond,
tmp16_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue,
tmp16_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse,
tmp16_MUX_uxn_opcodes_h_l830_c7_e21f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_e21f
result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_e21f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_e21f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_e21f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_e21f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_e21f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_e21f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_e21f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_e21f
result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_e21f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_e21f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_e21f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l830_c7_e21f
result_u8_value_MUX_uxn_opcodes_h_l830_c7_e21f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l830_c7_e21f_cond,
result_u8_value_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l830_c7_e21f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_e21f
result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_e21f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_e21f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_e21f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_e21f
result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_e21f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_e21f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_e21f_return_output);

-- t16_MUX_uxn_opcodes_h_l830_c7_e21f
t16_MUX_uxn_opcodes_h_l830_c7_e21f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l830_c7_e21f_cond,
t16_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue,
t16_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse,
t16_MUX_uxn_opcodes_h_l830_c7_e21f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l835_c11_9723
BIN_OP_EQ_uxn_opcodes_h_l835_c11_9723 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l835_c11_9723_left,
BIN_OP_EQ_uxn_opcodes_h_l835_c11_9723_right,
BIN_OP_EQ_uxn_opcodes_h_l835_c11_9723_return_output);

-- n16_MUX_uxn_opcodes_h_l835_c7_8df1
n16_MUX_uxn_opcodes_h_l835_c7_8df1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l835_c7_8df1_cond,
n16_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue,
n16_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse,
n16_MUX_uxn_opcodes_h_l835_c7_8df1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l835_c7_8df1
tmp16_MUX_uxn_opcodes_h_l835_c7_8df1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l835_c7_8df1_cond,
tmp16_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue,
tmp16_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse,
tmp16_MUX_uxn_opcodes_h_l835_c7_8df1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_8df1
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_8df1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_8df1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_8df1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_8df1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_8df1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_8df1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_8df1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_8df1
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_8df1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_8df1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_8df1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l835_c7_8df1
result_u8_value_MUX_uxn_opcodes_h_l835_c7_8df1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l835_c7_8df1_cond,
result_u8_value_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l835_c7_8df1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_8df1
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_8df1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_8df1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_8df1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_8df1
result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_8df1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_8df1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_8df1_return_output);

-- t16_MUX_uxn_opcodes_h_l835_c7_8df1
t16_MUX_uxn_opcodes_h_l835_c7_8df1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l835_c7_8df1_cond,
t16_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue,
t16_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse,
t16_MUX_uxn_opcodes_h_l835_c7_8df1_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l836_c3_2daa
BIN_OP_OR_uxn_opcodes_h_l836_c3_2daa : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l836_c3_2daa_left,
BIN_OP_OR_uxn_opcodes_h_l836_c3_2daa_right,
BIN_OP_OR_uxn_opcodes_h_l836_c3_2daa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l839_c11_0d9c
BIN_OP_EQ_uxn_opcodes_h_l839_c11_0d9c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l839_c11_0d9c_left,
BIN_OP_EQ_uxn_opcodes_h_l839_c11_0d9c_right,
BIN_OP_EQ_uxn_opcodes_h_l839_c11_0d9c_return_output);

-- n16_MUX_uxn_opcodes_h_l839_c7_ca4a
n16_MUX_uxn_opcodes_h_l839_c7_ca4a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l839_c7_ca4a_cond,
n16_MUX_uxn_opcodes_h_l839_c7_ca4a_iftrue,
n16_MUX_uxn_opcodes_h_l839_c7_ca4a_iffalse,
n16_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l839_c7_ca4a
tmp16_MUX_uxn_opcodes_h_l839_c7_ca4a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l839_c7_ca4a_cond,
tmp16_MUX_uxn_opcodes_h_l839_c7_ca4a_iftrue,
tmp16_MUX_uxn_opcodes_h_l839_c7_ca4a_iffalse,
tmp16_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_ca4a
result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_ca4a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_ca4a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_ca4a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_ca4a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_ca4a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_ca4a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_ca4a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_ca4a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_ca4a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l839_c7_ca4a
result_sp_relative_shift_MUX_uxn_opcodes_h_l839_c7_ca4a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l839_c7_ca4a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l839_c7_ca4a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l839_c7_ca4a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l839_c7_ca4a
result_u8_value_MUX_uxn_opcodes_h_l839_c7_ca4a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l839_c7_ca4a_cond,
result_u8_value_MUX_uxn_opcodes_h_l839_c7_ca4a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l839_c7_ca4a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_ca4a
result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_ca4a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_ca4a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_ca4a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_ca4a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_ca4a
result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_ca4a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_ca4a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_ca4a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_ca4a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l843_c11_17c6
BIN_OP_EQ_uxn_opcodes_h_l843_c11_17c6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l843_c11_17c6_left,
BIN_OP_EQ_uxn_opcodes_h_l843_c11_17c6_right,
BIN_OP_EQ_uxn_opcodes_h_l843_c11_17c6_return_output);

-- n16_MUX_uxn_opcodes_h_l843_c7_d048
n16_MUX_uxn_opcodes_h_l843_c7_d048 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l843_c7_d048_cond,
n16_MUX_uxn_opcodes_h_l843_c7_d048_iftrue,
n16_MUX_uxn_opcodes_h_l843_c7_d048_iffalse,
n16_MUX_uxn_opcodes_h_l843_c7_d048_return_output);

-- tmp16_MUX_uxn_opcodes_h_l843_c7_d048
tmp16_MUX_uxn_opcodes_h_l843_c7_d048 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l843_c7_d048_cond,
tmp16_MUX_uxn_opcodes_h_l843_c7_d048_iftrue,
tmp16_MUX_uxn_opcodes_h_l843_c7_d048_iffalse,
tmp16_MUX_uxn_opcodes_h_l843_c7_d048_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d048
result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d048 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d048_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d048_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d048_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d048_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d048
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d048 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d048_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d048_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d048_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d048_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d048
result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d048 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d048_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d048_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d048_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d048_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l843_c7_d048
result_u8_value_MUX_uxn_opcodes_h_l843_c7_d048 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l843_c7_d048_cond,
result_u8_value_MUX_uxn_opcodes_h_l843_c7_d048_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l843_c7_d048_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l843_c7_d048_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d048
result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d048 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d048_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d048_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d048_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d048_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d048
result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d048 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d048_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d048_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d048_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d048_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l844_c3_1e8d
BIN_OP_OR_uxn_opcodes_h_l844_c3_1e8d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l844_c3_1e8d_left,
BIN_OP_OR_uxn_opcodes_h_l844_c3_1e8d_right,
BIN_OP_OR_uxn_opcodes_h_l844_c3_1e8d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l845_c11_771f
BIN_OP_PLUS_uxn_opcodes_h_l845_c11_771f : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l845_c11_771f_left,
BIN_OP_PLUS_uxn_opcodes_h_l845_c11_771f_right,
BIN_OP_PLUS_uxn_opcodes_h_l845_c11_771f_return_output);

-- sp_relative_shift_uxn_opcodes_h_l847_c30_71b7
sp_relative_shift_uxn_opcodes_h_l847_c30_71b7 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l847_c30_71b7_ins,
sp_relative_shift_uxn_opcodes_h_l847_c30_71b7_x,
sp_relative_shift_uxn_opcodes_h_l847_c30_71b7_y,
sp_relative_shift_uxn_opcodes_h_l847_c30_71b7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l852_c11_3ad7
BIN_OP_EQ_uxn_opcodes_h_l852_c11_3ad7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l852_c11_3ad7_left,
BIN_OP_EQ_uxn_opcodes_h_l852_c11_3ad7_right,
BIN_OP_EQ_uxn_opcodes_h_l852_c11_3ad7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_29bd
result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_29bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_29bd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_29bd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_29bd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_29bd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_29bd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_29bd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_29bd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_29bd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_29bd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_29bd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l852_c7_29bd
result_u8_value_MUX_uxn_opcodes_h_l852_c7_29bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l852_c7_29bd_cond,
result_u8_value_MUX_uxn_opcodes_h_l852_c7_29bd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l852_c7_29bd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l852_c7_29bd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_29bd
result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_29bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_29bd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_29bd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_29bd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_29bd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_29bd
result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_29bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_29bd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_29bd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_29bd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_29bd_return_output);

-- CONST_SR_8_uxn_opcodes_h_l855_c31_1553
CONST_SR_8_uxn_opcodes_h_l855_c31_1553 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l855_c31_1553_x,
CONST_SR_8_uxn_opcodes_h_l855_c31_1553_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l857_c11_e2b6
BIN_OP_EQ_uxn_opcodes_h_l857_c11_e2b6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l857_c11_e2b6_left,
BIN_OP_EQ_uxn_opcodes_h_l857_c11_e2b6_right,
BIN_OP_EQ_uxn_opcodes_h_l857_c11_e2b6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_31b4
result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_31b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_31b4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_31b4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_31b4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_31b4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_31b4
result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_31b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_31b4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_31b4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_31b4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_31b4_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l832_l841_DUPLICATE_8955
CONST_SL_8_uint16_t_uxn_opcodes_h_l832_l841_DUPLICATE_8955 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l832_l841_DUPLICATE_8955_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l832_l841_DUPLICATE_8955_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l822_c6_745a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l822_c1_135e_return_output,
 n16_MUX_uxn_opcodes_h_l822_c2_43db_return_output,
 tmp16_MUX_uxn_opcodes_h_l822_c2_43db_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l822_c2_43db_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c2_43db_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c2_43db_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l822_c2_43db_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l822_c2_43db_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l822_c2_43db_return_output,
 t16_MUX_uxn_opcodes_h_l822_c2_43db_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l827_c11_2e4f_return_output,
 n16_MUX_uxn_opcodes_h_l827_c7_7637_return_output,
 tmp16_MUX_uxn_opcodes_h_l827_c7_7637_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_7637_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_7637_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_7637_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l827_c7_7637_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_7637_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_7637_return_output,
 t16_MUX_uxn_opcodes_h_l827_c7_7637_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l830_c11_aff6_return_output,
 n16_MUX_uxn_opcodes_h_l830_c7_e21f_return_output,
 tmp16_MUX_uxn_opcodes_h_l830_c7_e21f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_e21f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_e21f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_e21f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l830_c7_e21f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_e21f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_e21f_return_output,
 t16_MUX_uxn_opcodes_h_l830_c7_e21f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l835_c11_9723_return_output,
 n16_MUX_uxn_opcodes_h_l835_c7_8df1_return_output,
 tmp16_MUX_uxn_opcodes_h_l835_c7_8df1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_8df1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_8df1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_8df1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l835_c7_8df1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_8df1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_8df1_return_output,
 t16_MUX_uxn_opcodes_h_l835_c7_8df1_return_output,
 BIN_OP_OR_uxn_opcodes_h_l836_c3_2daa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l839_c11_0d9c_return_output,
 n16_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output,
 tmp16_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l843_c11_17c6_return_output,
 n16_MUX_uxn_opcodes_h_l843_c7_d048_return_output,
 tmp16_MUX_uxn_opcodes_h_l843_c7_d048_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d048_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d048_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d048_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l843_c7_d048_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d048_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d048_return_output,
 BIN_OP_OR_uxn_opcodes_h_l844_c3_1e8d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l845_c11_771f_return_output,
 sp_relative_shift_uxn_opcodes_h_l847_c30_71b7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l852_c11_3ad7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_29bd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_29bd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l852_c7_29bd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_29bd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_29bd_return_output,
 CONST_SR_8_uxn_opcodes_h_l855_c31_1553_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l857_c11_e2b6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_31b4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_31b4_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l832_l841_DUPLICATE_8955_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c6_745a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c6_745a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c6_745a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l822_c1_135e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l822_c1_135e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l822_c1_135e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l822_c1_135e_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l822_c2_43db_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l822_c2_43db_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l827_c7_7637_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l822_c2_43db_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l822_c2_43db_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l822_c2_43db_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l822_c2_43db_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l827_c7_7637_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l822_c2_43db_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l822_c2_43db_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c2_43db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c2_43db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_7637_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c2_43db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c2_43db_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c2_43db_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l824_c3_26ee : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c2_43db_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_7637_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c2_43db_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c2_43db_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c2_43db_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c2_43db_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_7637_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c2_43db_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c2_43db_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l822_c2_43db_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l822_c2_43db_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l827_c7_7637_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l822_c2_43db_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l822_c2_43db_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c2_43db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c2_43db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_7637_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c2_43db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c2_43db_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l822_c2_43db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l822_c2_43db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_7637_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l822_c2_43db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l822_c2_43db_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l822_c2_43db_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l822_c2_43db_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l827_c7_7637_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l822_c2_43db_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l822_c2_43db_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l823_c3_831d_uxn_opcodes_h_l823_c3_831d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_2e4f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_2e4f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_2e4f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l827_c7_7637_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l827_c7_7637_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l830_c7_e21f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l827_c7_7637_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l827_c7_7637_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l827_c7_7637_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l830_c7_e21f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l827_c7_7637_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_7637_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_7637_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_e21f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_7637_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_7637_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l828_c3_feb8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_7637_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_e21f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_7637_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_7637_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_7637_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_e21f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_7637_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l827_c7_7637_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l827_c7_7637_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c7_e21f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l827_c7_7637_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_7637_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_7637_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_e21f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_7637_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_7637_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_7637_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_e21f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_7637_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l827_c7_7637_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l827_c7_7637_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l830_c7_e21f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l827_c7_7637_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_aff6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_aff6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_aff6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l835_c7_8df1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l830_c7_e21f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_8df1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l830_c7_e21f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_8df1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_e21f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l833_c3_a2bf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_8df1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_e21f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_8df1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_e21f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_8df1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c7_e21f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_8df1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_e21f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_8df1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_e21f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l835_c7_8df1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l830_c7_e21f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9723_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9723_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9723_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l835_c7_8df1_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_8df1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_8df1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l837_c3_75b2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_8df1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_8df1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_8df1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_8df1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_8df1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l835_c7_8df1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l836_c3_2daa_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l836_c3_2daa_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l836_c3_2daa_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l839_c11_0d9c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l839_c11_0d9c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l839_c11_0d9c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l839_c7_ca4a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l839_c7_ca4a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l843_c7_d048_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l839_c7_ca4a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l839_c7_ca4a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l839_c7_ca4a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_d048_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l839_c7_ca4a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_ca4a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_ca4a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d048_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_ca4a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_ca4a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_ca4a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d048_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_ca4a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l839_c7_ca4a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l839_c7_ca4a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d048_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l839_c7_ca4a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l839_c7_ca4a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l839_c7_ca4a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_d048_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l839_c7_ca4a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_ca4a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_ca4a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d048_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_ca4a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_ca4a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_ca4a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d048_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_ca4a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_17c6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_17c6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_17c6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l843_c7_d048_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l843_c7_d048_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l843_c7_d048_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_d048_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l845_c3_a0cc : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_d048_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_d048_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d048_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d048_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_29bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d048_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d048_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l849_c3_3846 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d048_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_29bd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d048_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d048_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d048_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d048_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_d048_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_d048_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l852_c7_29bd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_d048_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d048_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d048_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_29bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d048_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d048_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d048_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_29bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d048_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l844_c3_1e8d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l844_c3_1e8d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l844_c3_1e8d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l845_c11_771f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l845_c11_771f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l845_c11_771f_return_output : unsigned(16 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l847_c30_71b7_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l847_c30_71b7_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l847_c30_71b7_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l847_c30_71b7_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l850_c21_26da_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_3ad7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_3ad7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_3ad7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_29bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_29bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_31b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_29bd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_29bd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l854_c3_a6d2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_29bd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_29bd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l852_c7_29bd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l852_c7_29bd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l852_c7_29bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_29bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_29bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_31b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_29bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_29bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_29bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_29bd_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l855_c31_1553_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l855_c31_1553_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l855_c21_7e30_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_e2b6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_e2b6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_e2b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_31b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_31b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_31b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_31b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_31b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_31b4_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l839_l835_l830_l827_l857_l822_l852_DUPLICATE_a62b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l843_l839_l835_l830_l827_l822_DUPLICATE_cbeb_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l839_l835_l830_l827_l822_l852_DUPLICATE_8f88_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l839_l835_l830_l827_l822_l852_DUPLICATE_a36e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l843_l839_l835_l830_l827_l857_l852_DUPLICATE_1f59_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l831_l844_l836_l840_DUPLICATE_3377_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l832_l841_DUPLICATE_8955_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l832_l841_DUPLICATE_8955_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l852_l839_DUPLICATE_7b99_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l862_l818_DUPLICATE_5377_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l824_c3_26ee := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c2_43db_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l824_c3_26ee;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c2_43db_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l847_c30_71b7_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_29bd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_17c6_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_31b4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9723_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c6_745a_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_31b4_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d048_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l839_c11_0d9c_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_2e4f_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l828_c3_feb8 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_7637_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l828_c3_feb8;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l854_c3_a6d2 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_29bd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l854_c3_a6d2;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l837_c3_75b2 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l837_c3_75b2;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d048_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l847_c30_71b7_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_3ad7_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l833_c3_a2bf := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l833_c3_a2bf;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_e2b6_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l849_c3_3846 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d048_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l849_c3_3846;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_aff6_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l822_c1_135e_iffalse := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l822_c1_135e_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l847_c30_71b7_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l844_c3_1e8d_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l822_c2_43db_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l827_c7_7637_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l843_c7_d048_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c6_745a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_2e4f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_aff6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9723_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l839_c11_0d9c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_17c6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_3ad7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_e2b6_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l836_c3_2daa_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l845_c11_771f_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l822_c2_43db_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l827_c7_7637_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l855_c31_1553_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l822_c2_43db_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l827_c7_7637_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l839_c7_ca4a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_d048_iffalse := tmp16;
     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l831_l844_l836_l840_DUPLICATE_3377 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l831_l844_l836_l840_DUPLICATE_3377_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- sp_relative_shift[uxn_opcodes_h_l847_c30_71b7] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l847_c30_71b7_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l847_c30_71b7_ins;
     sp_relative_shift_uxn_opcodes_h_l847_c30_71b7_x <= VAR_sp_relative_shift_uxn_opcodes_h_l847_c30_71b7_x;
     sp_relative_shift_uxn_opcodes_h_l847_c30_71b7_y <= VAR_sp_relative_shift_uxn_opcodes_h_l847_c30_71b7_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l847_c30_71b7_return_output := sp_relative_shift_uxn_opcodes_h_l847_c30_71b7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l843_c11_17c6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l843_c11_17c6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_17c6_left;
     BIN_OP_EQ_uxn_opcodes_h_l843_c11_17c6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_17c6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_17c6_return_output := BIN_OP_EQ_uxn_opcodes_h_l843_c11_17c6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l822_c6_745a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l822_c6_745a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c6_745a_left;
     BIN_OP_EQ_uxn_opcodes_h_l822_c6_745a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c6_745a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c6_745a_return_output := BIN_OP_EQ_uxn_opcodes_h_l822_c6_745a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l827_c11_2e4f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l827_c11_2e4f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_2e4f_left;
     BIN_OP_EQ_uxn_opcodes_h_l827_c11_2e4f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_2e4f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_2e4f_return_output := BIN_OP_EQ_uxn_opcodes_h_l827_c11_2e4f_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l843_l839_l835_l830_l827_l822_DUPLICATE_cbeb LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l843_l839_l835_l830_l827_l822_DUPLICATE_cbeb_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l857_c11_e2b6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l857_c11_e2b6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_e2b6_left;
     BIN_OP_EQ_uxn_opcodes_h_l857_c11_e2b6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_e2b6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_e2b6_return_output := BIN_OP_EQ_uxn_opcodes_h_l857_c11_e2b6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l835_c11_9723] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l835_c11_9723_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9723_left;
     BIN_OP_EQ_uxn_opcodes_h_l835_c11_9723_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9723_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9723_return_output := BIN_OP_EQ_uxn_opcodes_h_l835_c11_9723_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l839_l835_l830_l827_l822_l852_DUPLICATE_a36e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l839_l835_l830_l827_l822_l852_DUPLICATE_a36e_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l839_c11_0d9c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l839_c11_0d9c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l839_c11_0d9c_left;
     BIN_OP_EQ_uxn_opcodes_h_l839_c11_0d9c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l839_c11_0d9c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l839_c11_0d9c_return_output := BIN_OP_EQ_uxn_opcodes_h_l839_c11_0d9c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l830_c11_aff6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l830_c11_aff6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_aff6_left;
     BIN_OP_EQ_uxn_opcodes_h_l830_c11_aff6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_aff6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_aff6_return_output := BIN_OP_EQ_uxn_opcodes_h_l830_c11_aff6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l852_c11_3ad7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l852_c11_3ad7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_3ad7_left;
     BIN_OP_EQ_uxn_opcodes_h_l852_c11_3ad7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_3ad7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_3ad7_return_output := BIN_OP_EQ_uxn_opcodes_h_l852_c11_3ad7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l843_l839_l835_l830_l827_l857_l852_DUPLICATE_1f59 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l843_l839_l835_l830_l827_l857_l852_DUPLICATE_1f59_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l839_l835_l830_l827_l822_l852_DUPLICATE_8f88 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l839_l835_l830_l827_l822_l852_DUPLICATE_8f88_return_output := result.u8_value;

     -- CONST_SR_8[uxn_opcodes_h_l855_c31_1553] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l855_c31_1553_x <= VAR_CONST_SR_8_uxn_opcodes_h_l855_c31_1553_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l855_c31_1553_return_output := CONST_SR_8_uxn_opcodes_h_l855_c31_1553_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l839_l835_l830_l827_l857_l822_l852_DUPLICATE_a62b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l839_l835_l830_l827_l857_l822_l852_DUPLICATE_a62b_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l852_l839_DUPLICATE_7b99 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l852_l839_DUPLICATE_7b99_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l822_c1_135e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c6_745a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l822_c2_43db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c6_745a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c2_43db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c6_745a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l822_c2_43db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c6_745a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c2_43db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c6_745a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c2_43db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c6_745a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c2_43db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c6_745a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l822_c2_43db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c6_745a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l822_c2_43db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c6_745a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l822_c2_43db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c6_745a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l827_c7_7637_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_2e4f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_7637_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_2e4f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_7637_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_2e4f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_7637_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_2e4f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_7637_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_2e4f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_7637_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_2e4f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l827_c7_7637_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_2e4f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l827_c7_7637_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_2e4f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l827_c7_7637_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_2e4f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l830_c7_e21f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_aff6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_e21f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_aff6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_e21f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_aff6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_e21f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_aff6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_e21f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_aff6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_e21f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_aff6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c7_e21f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_aff6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l830_c7_e21f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_aff6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l830_c7_e21f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_aff6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l835_c7_8df1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9723_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_8df1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9723_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_8df1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9723_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_8df1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9723_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_8df1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9723_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_8df1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9723_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_8df1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9723_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l835_c7_8df1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9723_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_8df1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9723_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l839_c7_ca4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l839_c11_0d9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_ca4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l839_c11_0d9c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_ca4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l839_c11_0d9c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_ca4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l839_c11_0d9c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l839_c7_ca4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l839_c11_0d9c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_ca4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l839_c11_0d9c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l839_c7_ca4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l839_c11_0d9c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l839_c7_ca4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l839_c11_0d9c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l843_c7_d048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_17c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_17c6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_17c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_17c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_17c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_17c6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_d048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_17c6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_d048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_17c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_29bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_3ad7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_29bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_3ad7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_29bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_3ad7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_29bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_3ad7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l852_c7_29bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_3ad7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_31b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_e2b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_31b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_e2b6_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l836_c3_2daa_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l831_l844_l836_l840_DUPLICATE_3377_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l844_c3_1e8d_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l831_l844_l836_l840_DUPLICATE_3377_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l832_l841_DUPLICATE_8955_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l831_l844_l836_l840_DUPLICATE_3377_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c2_43db_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l843_l839_l835_l830_l827_l822_DUPLICATE_cbeb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_7637_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l843_l839_l835_l830_l827_l822_DUPLICATE_cbeb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l843_l839_l835_l830_l827_l822_DUPLICATE_cbeb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l843_l839_l835_l830_l827_l822_DUPLICATE_cbeb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l839_c7_ca4a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l843_l839_l835_l830_l827_l822_DUPLICATE_cbeb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d048_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l843_l839_l835_l830_l827_l822_DUPLICATE_cbeb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_7637_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l843_l839_l835_l830_l827_l857_l852_DUPLICATE_1f59_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l843_l839_l835_l830_l827_l857_l852_DUPLICATE_1f59_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l843_l839_l835_l830_l827_l857_l852_DUPLICATE_1f59_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_ca4a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l843_l839_l835_l830_l827_l857_l852_DUPLICATE_1f59_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d048_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l843_l839_l835_l830_l827_l857_l852_DUPLICATE_1f59_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_29bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l843_l839_l835_l830_l827_l857_l852_DUPLICATE_1f59_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_31b4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l843_l839_l835_l830_l827_l857_l852_DUPLICATE_1f59_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l822_c2_43db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l839_l835_l830_l827_l822_l852_DUPLICATE_a36e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_7637_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l839_l835_l830_l827_l822_l852_DUPLICATE_a36e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l839_l835_l830_l827_l822_l852_DUPLICATE_a36e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l839_l835_l830_l827_l822_l852_DUPLICATE_a36e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_ca4a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l839_l835_l830_l827_l822_l852_DUPLICATE_a36e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_29bd_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l839_l835_l830_l827_l822_l852_DUPLICATE_a36e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c2_43db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l839_l835_l830_l827_l857_l822_l852_DUPLICATE_a62b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_7637_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l839_l835_l830_l827_l857_l822_l852_DUPLICATE_a62b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l839_l835_l830_l827_l857_l822_l852_DUPLICATE_a62b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l839_l835_l830_l827_l857_l822_l852_DUPLICATE_a62b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_ca4a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l839_l835_l830_l827_l857_l822_l852_DUPLICATE_a62b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_29bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l839_l835_l830_l827_l857_l822_l852_DUPLICATE_a62b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_31b4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l839_l835_l830_l827_l857_l822_l852_DUPLICATE_a62b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_ca4a_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l852_l839_DUPLICATE_7b99_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_29bd_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l852_l839_DUPLICATE_7b99_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l822_c2_43db_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l839_l835_l830_l827_l822_l852_DUPLICATE_8f88_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l827_c7_7637_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l839_l835_l830_l827_l822_l852_DUPLICATE_8f88_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l839_l835_l830_l827_l822_l852_DUPLICATE_8f88_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l839_l835_l830_l827_l822_l852_DUPLICATE_8f88_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l839_c7_ca4a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l839_l835_l830_l827_l822_l852_DUPLICATE_8f88_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l852_c7_29bd_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l839_l835_l830_l827_l822_l852_DUPLICATE_8f88_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d048_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l847_c30_71b7_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l844_c3_1e8d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l844_c3_1e8d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l844_c3_1e8d_left;
     BIN_OP_OR_uxn_opcodes_h_l844_c3_1e8d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l844_c3_1e8d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l844_c3_1e8d_return_output := BIN_OP_OR_uxn_opcodes_h_l844_c3_1e8d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l843_c7_d048] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d048_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d048_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d048_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d048_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d048_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d048_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d048_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d048_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l857_c7_31b4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_31b4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_31b4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_31b4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_31b4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_31b4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_31b4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_31b4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_31b4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l822_c1_135e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l822_c1_135e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l822_c1_135e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l822_c1_135e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l822_c1_135e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l822_c1_135e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l822_c1_135e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l822_c1_135e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l822_c1_135e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l852_c7_29bd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_29bd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_29bd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_29bd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_29bd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_29bd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_29bd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_29bd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_29bd_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l855_c21_7e30] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l855_c21_7e30_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l855_c31_1553_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l857_c7_31b4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_31b4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_31b4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_31b4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_31b4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_31b4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_31b4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_31b4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_31b4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l852_c7_29bd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_29bd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_29bd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_29bd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_29bd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_29bd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_29bd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_29bd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_29bd_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l836_c3_2daa] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l836_c3_2daa_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l836_c3_2daa_left;
     BIN_OP_OR_uxn_opcodes_h_l836_c3_2daa_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l836_c3_2daa_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l836_c3_2daa_return_output := BIN_OP_OR_uxn_opcodes_h_l836_c3_2daa_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l832_l841_DUPLICATE_8955 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l832_l841_DUPLICATE_8955_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l832_l841_DUPLICATE_8955_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l832_l841_DUPLICATE_8955_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l832_l841_DUPLICATE_8955_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l836_c3_2daa_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l845_c11_771f_right := VAR_BIN_OP_OR_uxn_opcodes_h_l844_c3_1e8d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l843_c7_d048_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l844_c3_1e8d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l852_c7_29bd_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l855_c21_7e30_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l839_c7_ca4a_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l832_l841_DUPLICATE_8955_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l832_l841_DUPLICATE_8955_return_output;
     VAR_printf_uxn_opcodes_h_l823_c3_831d_uxn_opcodes_h_l823_c3_831d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l822_c1_135e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_29bd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_31b4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d048_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_29bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_29bd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_31b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l839_c7_ca4a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_d048_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d048_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_29bd_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l843_c7_d048] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d048_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d048_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d048_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d048_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d048_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d048_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d048_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d048_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l845_c11_771f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l845_c11_771f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l845_c11_771f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l845_c11_771f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l845_c11_771f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l845_c11_771f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l845_c11_771f_return_output;

     -- n16_MUX[uxn_opcodes_h_l843_c7_d048] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l843_c7_d048_cond <= VAR_n16_MUX_uxn_opcodes_h_l843_c7_d048_cond;
     n16_MUX_uxn_opcodes_h_l843_c7_d048_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l843_c7_d048_iftrue;
     n16_MUX_uxn_opcodes_h_l843_c7_d048_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l843_c7_d048_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l843_c7_d048_return_output := n16_MUX_uxn_opcodes_h_l843_c7_d048_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l852_c7_29bd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_29bd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_29bd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_29bd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_29bd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_29bd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_29bd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_29bd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_29bd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l839_c7_ca4a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l839_c7_ca4a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l839_c7_ca4a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l839_c7_ca4a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l839_c7_ca4a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l839_c7_ca4a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l839_c7_ca4a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l852_c7_29bd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l852_c7_29bd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l852_c7_29bd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l852_c7_29bd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l852_c7_29bd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l852_c7_29bd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l852_c7_29bd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l852_c7_29bd_return_output := result_u8_value_MUX_uxn_opcodes_h_l852_c7_29bd_return_output;

     -- t16_MUX[uxn_opcodes_h_l835_c7_8df1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l835_c7_8df1_cond <= VAR_t16_MUX_uxn_opcodes_h_l835_c7_8df1_cond;
     t16_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue;
     t16_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l835_c7_8df1_return_output := t16_MUX_uxn_opcodes_h_l835_c7_8df1_return_output;

     -- printf_uxn_opcodes_h_l823_c3_831d[uxn_opcodes_h_l823_c3_831d] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l823_c3_831d_uxn_opcodes_h_l823_c3_831d_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l823_c3_831d_uxn_opcodes_h_l823_c3_831d_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l852_c7_29bd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_29bd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_29bd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_29bd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_29bd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_29bd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_29bd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_29bd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_29bd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l843_c7_d048] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d048_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d048_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d048_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d048_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d048_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d048_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d048_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d048_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l845_c3_a0cc := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l845_c11_771f_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l839_c7_ca4a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l843_c7_d048_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d048_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_29bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_ca4a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_d048_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d048_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_29bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_ca4a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_d048_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_d048_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l852_c7_29bd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l835_c7_8df1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_d048_iftrue := VAR_tmp16_uxn_opcodes_h_l845_c3_a0cc;
     -- n16_MUX[uxn_opcodes_h_l839_c7_ca4a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l839_c7_ca4a_cond <= VAR_n16_MUX_uxn_opcodes_h_l839_c7_ca4a_cond;
     n16_MUX_uxn_opcodes_h_l839_c7_ca4a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l839_c7_ca4a_iftrue;
     n16_MUX_uxn_opcodes_h_l839_c7_ca4a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l839_c7_ca4a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output := n16_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l835_c7_8df1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_8df1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_8df1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_8df1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_8df1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l843_c7_d048] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l843_c7_d048_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_d048_cond;
     tmp16_MUX_uxn_opcodes_h_l843_c7_d048_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_d048_iftrue;
     tmp16_MUX_uxn_opcodes_h_l843_c7_d048_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_d048_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_d048_return_output := tmp16_MUX_uxn_opcodes_h_l843_c7_d048_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l843_c7_d048] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d048_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d048_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d048_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d048_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d048_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d048_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d048_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d048_return_output;

     -- t16_MUX[uxn_opcodes_h_l830_c7_e21f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l830_c7_e21f_cond <= VAR_t16_MUX_uxn_opcodes_h_l830_c7_e21f_cond;
     t16_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue;
     t16_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l830_c7_e21f_return_output := t16_MUX_uxn_opcodes_h_l830_c7_e21f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l839_c7_ca4a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_ca4a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_ca4a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_ca4a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_ca4a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_ca4a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_ca4a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l839_c7_ca4a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_ca4a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_ca4a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_ca4a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_ca4a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_ca4a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_ca4a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l850_c21_26da] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l850_c21_26da_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l845_c3_a0cc);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l843_c7_d048] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d048_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d048_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d048_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d048_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d048_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d048_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d048_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d048_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_d048_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l850_c21_26da_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_ca4a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_d048_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_ca4a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_d048_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_8df1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l827_c7_7637_iffalse := VAR_t16_MUX_uxn_opcodes_h_l830_c7_e21f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l839_c7_ca4a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_d048_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l839_c7_ca4a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_ca4a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_ca4a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_ca4a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_ca4a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_ca4a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_ca4a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output;

     -- n16_MUX[uxn_opcodes_h_l835_c7_8df1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l835_c7_8df1_cond <= VAR_n16_MUX_uxn_opcodes_h_l835_c7_8df1_cond;
     n16_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue;
     n16_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l835_c7_8df1_return_output := n16_MUX_uxn_opcodes_h_l835_c7_8df1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l835_c7_8df1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_8df1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_8df1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_8df1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_8df1_return_output;

     -- t16_MUX[uxn_opcodes_h_l827_c7_7637] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l827_c7_7637_cond <= VAR_t16_MUX_uxn_opcodes_h_l827_c7_7637_cond;
     t16_MUX_uxn_opcodes_h_l827_c7_7637_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l827_c7_7637_iftrue;
     t16_MUX_uxn_opcodes_h_l827_c7_7637_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l827_c7_7637_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l827_c7_7637_return_output := t16_MUX_uxn_opcodes_h_l827_c7_7637_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l835_c7_8df1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_8df1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_8df1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_8df1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_8df1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l843_c7_d048] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l843_c7_d048_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_d048_cond;
     result_u8_value_MUX_uxn_opcodes_h_l843_c7_d048_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_d048_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l843_c7_d048_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_d048_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_d048_return_output := result_u8_value_MUX_uxn_opcodes_h_l843_c7_d048_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l839_c7_ca4a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_ca4a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_ca4a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_ca4a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_ca4a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_ca4a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_ca4a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l830_c7_e21f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_e21f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_e21f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_e21f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_e21f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l839_c7_ca4a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l839_c7_ca4a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l839_c7_ca4a_cond;
     tmp16_MUX_uxn_opcodes_h_l839_c7_ca4a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l839_c7_ca4a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l839_c7_ca4a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l839_c7_ca4a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output := tmp16_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l835_c7_8df1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_8df1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_7637_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_e21f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_8df1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l839_c7_ca4a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l843_c7_d048_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l822_c2_43db_iffalse := VAR_t16_MUX_uxn_opcodes_h_l827_c7_7637_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l827_c7_7637] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_7637_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_7637_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_7637_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_7637_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_7637_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_7637_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_7637_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_7637_return_output;

     -- t16_MUX[uxn_opcodes_h_l822_c2_43db] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l822_c2_43db_cond <= VAR_t16_MUX_uxn_opcodes_h_l822_c2_43db_cond;
     t16_MUX_uxn_opcodes_h_l822_c2_43db_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l822_c2_43db_iftrue;
     t16_MUX_uxn_opcodes_h_l822_c2_43db_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l822_c2_43db_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l822_c2_43db_return_output := t16_MUX_uxn_opcodes_h_l822_c2_43db_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l830_c7_e21f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_e21f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_e21f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_e21f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_e21f_return_output;

     -- n16_MUX[uxn_opcodes_h_l830_c7_e21f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l830_c7_e21f_cond <= VAR_n16_MUX_uxn_opcodes_h_l830_c7_e21f_cond;
     n16_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue;
     n16_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l830_c7_e21f_return_output := n16_MUX_uxn_opcodes_h_l830_c7_e21f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l830_c7_e21f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_e21f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_e21f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_e21f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_e21f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l835_c7_8df1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_8df1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_8df1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_8df1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_8df1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l839_c7_ca4a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l839_c7_ca4a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l839_c7_ca4a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l839_c7_ca4a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l839_c7_ca4a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l839_c7_ca4a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l839_c7_ca4a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output := result_u8_value_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l835_c7_8df1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_8df1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_8df1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_8df1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_8df1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l835_c7_8df1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l835_c7_8df1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_8df1_cond;
     tmp16_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_8df1_return_output := tmp16_MUX_uxn_opcodes_h_l835_c7_8df1_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l827_c7_7637_iffalse := VAR_n16_MUX_uxn_opcodes_h_l830_c7_e21f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_8df1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_7637_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_e21f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_8df1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c2_43db_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_7637_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_7637_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_e21f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l839_c7_ca4a_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l822_c2_43db_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_8df1_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l830_c7_e21f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_e21f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_e21f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_e21f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_e21f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l830_c7_e21f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l830_c7_e21f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l830_c7_e21f_cond;
     tmp16_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l830_c7_e21f_return_output := tmp16_MUX_uxn_opcodes_h_l830_c7_e21f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l822_c2_43db] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c2_43db_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c2_43db_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c2_43db_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c2_43db_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c2_43db_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c2_43db_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c2_43db_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c2_43db_return_output;

     -- n16_MUX[uxn_opcodes_h_l827_c7_7637] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l827_c7_7637_cond <= VAR_n16_MUX_uxn_opcodes_h_l827_c7_7637_cond;
     n16_MUX_uxn_opcodes_h_l827_c7_7637_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l827_c7_7637_iftrue;
     n16_MUX_uxn_opcodes_h_l827_c7_7637_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l827_c7_7637_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l827_c7_7637_return_output := n16_MUX_uxn_opcodes_h_l827_c7_7637_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l827_c7_7637] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_7637_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_7637_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_7637_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_7637_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_7637_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_7637_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_7637_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_7637_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l830_c7_e21f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_e21f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_e21f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_e21f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_e21f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l835_c7_8df1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l835_c7_8df1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_8df1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_8df1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_8df1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_8df1_return_output := result_u8_value_MUX_uxn_opcodes_h_l835_c7_8df1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l827_c7_7637] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_7637_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_7637_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_7637_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_7637_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_7637_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_7637_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_7637_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_7637_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l822_c2_43db_iffalse := VAR_n16_MUX_uxn_opcodes_h_l827_c7_7637_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_7637_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_e21f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l822_c2_43db_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_7637_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_7637_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_e21f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c2_43db_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_7637_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_8df1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l827_c7_7637_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l830_c7_e21f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l827_c7_7637] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_7637_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_7637_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_7637_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_7637_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_7637_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_7637_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_7637_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_7637_return_output;

     -- n16_MUX[uxn_opcodes_h_l822_c2_43db] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l822_c2_43db_cond <= VAR_n16_MUX_uxn_opcodes_h_l822_c2_43db_cond;
     n16_MUX_uxn_opcodes_h_l822_c2_43db_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l822_c2_43db_iftrue;
     n16_MUX_uxn_opcodes_h_l822_c2_43db_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l822_c2_43db_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l822_c2_43db_return_output := n16_MUX_uxn_opcodes_h_l822_c2_43db_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l827_c7_7637] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l827_c7_7637_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l827_c7_7637_cond;
     tmp16_MUX_uxn_opcodes_h_l827_c7_7637_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l827_c7_7637_iftrue;
     tmp16_MUX_uxn_opcodes_h_l827_c7_7637_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l827_c7_7637_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l827_c7_7637_return_output := tmp16_MUX_uxn_opcodes_h_l827_c7_7637_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l827_c7_7637] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_7637_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_7637_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_7637_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_7637_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_7637_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_7637_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_7637_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_7637_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l830_c7_e21f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l830_c7_e21f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c7_e21f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c7_e21f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c7_e21f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c7_e21f_return_output := result_u8_value_MUX_uxn_opcodes_h_l830_c7_e21f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l822_c2_43db] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l822_c2_43db_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l822_c2_43db_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l822_c2_43db_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l822_c2_43db_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l822_c2_43db_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l822_c2_43db_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l822_c2_43db_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l822_c2_43db_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l822_c2_43db] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c2_43db_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c2_43db_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c2_43db_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c2_43db_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c2_43db_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c2_43db_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c2_43db_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c2_43db_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l822_c2_43db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c2_43db_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_7637_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c2_43db_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_7637_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l827_c7_7637_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l830_c7_e21f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l822_c2_43db_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l827_c7_7637_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l827_c7_7637] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l827_c7_7637_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l827_c7_7637_cond;
     result_u8_value_MUX_uxn_opcodes_h_l827_c7_7637_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l827_c7_7637_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l827_c7_7637_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l827_c7_7637_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l827_c7_7637_return_output := result_u8_value_MUX_uxn_opcodes_h_l827_c7_7637_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l822_c2_43db] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l822_c2_43db_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l822_c2_43db_cond;
     tmp16_MUX_uxn_opcodes_h_l822_c2_43db_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l822_c2_43db_iftrue;
     tmp16_MUX_uxn_opcodes_h_l822_c2_43db_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l822_c2_43db_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l822_c2_43db_return_output := tmp16_MUX_uxn_opcodes_h_l822_c2_43db_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l822_c2_43db] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l822_c2_43db_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c2_43db_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l822_c2_43db_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c2_43db_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l822_c2_43db_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c2_43db_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c2_43db_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l822_c2_43db_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l822_c2_43db] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l822_c2_43db_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c2_43db_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l822_c2_43db_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c2_43db_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l822_c2_43db_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c2_43db_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c2_43db_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l822_c2_43db_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l822_c2_43db_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l827_c7_7637_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l822_c2_43db_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l822_c2_43db] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l822_c2_43db_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l822_c2_43db_cond;
     result_u8_value_MUX_uxn_opcodes_h_l822_c2_43db_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l822_c2_43db_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l822_c2_43db_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l822_c2_43db_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l822_c2_43db_return_output := result_u8_value_MUX_uxn_opcodes_h_l822_c2_43db_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l862_l818_DUPLICATE_5377 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l862_l818_DUPLICATE_5377_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c551(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c2_43db_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c2_43db_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c2_43db_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l822_c2_43db_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c2_43db_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l822_c2_43db_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l862_l818_DUPLICATE_5377_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l862_l818_DUPLICATE_5377_return_output;
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
