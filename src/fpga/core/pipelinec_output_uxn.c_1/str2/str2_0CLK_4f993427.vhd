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
-- Submodules: 68
entity str2_0CLK_4f993427 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end str2_0CLK_4f993427;
architecture arch of str2_0CLK_4f993427 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1637_c6_a949]
signal BIN_OP_EQ_uxn_opcodes_h_l1637_c6_a949_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1637_c6_a949_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1637_c6_a949_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1637_c1_9a14]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_9a14_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_9a14_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_9a14_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_9a14_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1637_c2_6745]
signal n16_MUX_uxn_opcodes_h_l1637_c2_6745_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1637_c2_6745_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1637_c2_6745]
signal t8_MUX_uxn_opcodes_h_l1637_c2_6745_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1637_c2_6745_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1637_c2_6745]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6745_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6745_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1637_c2_6745]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6745_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6745_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1637_c2_6745]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6745_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6745_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1637_c2_6745]
signal result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6745_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6745_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1637_c2_6745]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6745_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6745_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1637_c2_6745]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6745_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6745_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1637_c2_6745]
signal result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6745_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6745_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1638_c3_23b7[uxn_opcodes_h_l1638_c3_23b7]
signal printf_uxn_opcodes_h_l1638_c3_23b7_uxn_opcodes_h_l1638_c3_23b7_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1642_c11_8edc]
signal BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8edc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8edc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8edc_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1642_c7_4d5f]
signal n16_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1642_c7_4d5f]
signal t8_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1642_c7_4d5f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1642_c7_4d5f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1642_c7_4d5f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1642_c7_4d5f]
signal result_u16_value_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1642_c7_4d5f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1642_c7_4d5f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1642_c7_4d5f]
signal result_u8_value_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1645_c11_06ee]
signal BIN_OP_EQ_uxn_opcodes_h_l1645_c11_06ee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1645_c11_06ee_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1645_c11_06ee_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1645_c7_9a2b]
signal n16_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1645_c7_9a2b]
signal t8_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1645_c7_9a2b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1645_c7_9a2b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1645_c7_9a2b]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1645_c7_9a2b]
signal result_u16_value_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1645_c7_9a2b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1645_c7_9a2b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1645_c7_9a2b]
signal result_u8_value_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1649_c11_4fee]
signal BIN_OP_EQ_uxn_opcodes_h_l1649_c11_4fee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1649_c11_4fee_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1649_c11_4fee_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1649_c7_f457]
signal n16_MUX_uxn_opcodes_h_l1649_c7_f457_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1649_c7_f457_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1649_c7_f457_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1649_c7_f457_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1649_c7_f457]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_f457_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_f457_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_f457_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_f457_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1649_c7_f457]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_f457_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_f457_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_f457_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_f457_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1649_c7_f457]
signal result_u16_value_MUX_uxn_opcodes_h_l1649_c7_f457_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1649_c7_f457_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1649_c7_f457_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1649_c7_f457_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1649_c7_f457]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_f457_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_f457_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_f457_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_f457_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1649_c7_f457]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_f457_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_f457_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_f457_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_f457_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1649_c7_f457]
signal result_u8_value_MUX_uxn_opcodes_h_l1649_c7_f457_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1649_c7_f457_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1649_c7_f457_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1649_c7_f457_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1651_c3_3120]
signal CONST_SL_8_uxn_opcodes_h_l1651_c3_3120_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1651_c3_3120_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1653_c11_cd5b]
signal BIN_OP_EQ_uxn_opcodes_h_l1653_c11_cd5b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1653_c11_cd5b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1653_c11_cd5b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1653_c7_9398]
signal n16_MUX_uxn_opcodes_h_l1653_c7_9398_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1653_c7_9398_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1653_c7_9398_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1653_c7_9398_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1653_c7_9398]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_9398_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_9398_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_9398_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_9398_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1653_c7_9398]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_9398_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_9398_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_9398_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_9398_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1653_c7_9398]
signal result_u16_value_MUX_uxn_opcodes_h_l1653_c7_9398_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1653_c7_9398_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1653_c7_9398_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1653_c7_9398_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1653_c7_9398]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_9398_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_9398_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_9398_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_9398_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1653_c7_9398]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_9398_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_9398_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_9398_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_9398_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1653_c7_9398]
signal result_u8_value_MUX_uxn_opcodes_h_l1653_c7_9398_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1653_c7_9398_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1653_c7_9398_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1653_c7_9398_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1654_c3_6599]
signal BIN_OP_OR_uxn_opcodes_h_l1654_c3_6599_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1654_c3_6599_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1654_c3_6599_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1656_c30_900c]
signal sp_relative_shift_uxn_opcodes_h_l1656_c30_900c_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1656_c30_900c_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1656_c30_900c_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1656_c30_900c_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1659_c31_64e1]
signal CONST_SR_8_uxn_opcodes_h_l1659_c31_64e1_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1659_c31_64e1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1661_c11_7f39]
signal BIN_OP_EQ_uxn_opcodes_h_l1661_c11_7f39_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1661_c11_7f39_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1661_c11_7f39_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1661_c7_808e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_808e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_808e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_808e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_808e_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1661_c7_808e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_808e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_808e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_808e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_808e_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1661_c7_808e]
signal result_u16_value_MUX_uxn_opcodes_h_l1661_c7_808e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1661_c7_808e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1661_c7_808e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1661_c7_808e_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1661_c7_808e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_808e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_808e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_808e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_808e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1661_c7_808e]
signal result_u8_value_MUX_uxn_opcodes_h_l1661_c7_808e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1661_c7_808e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1661_c7_808e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1661_c7_808e_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1663_c22_9cbd]
signal BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_9cbd_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_9cbd_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_9cbd_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1666_c11_df63]
signal BIN_OP_EQ_uxn_opcodes_h_l1666_c11_df63_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1666_c11_df63_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1666_c11_df63_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1666_c7_b946]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_b946_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_b946_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_b946_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_b946_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1666_c7_b946]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_b946_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_b946_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_b946_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_b946_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1663_l1658_DUPLICATE_9745
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1663_l1658_DUPLICATE_9745_left : signed(16 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1663_l1658_DUPLICATE_9745_right : signed(7 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1663_l1658_DUPLICATE_9745_return_output : signed(17 downto 0);

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

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_ed17( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.u16_value := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.u8_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1637_c6_a949
BIN_OP_EQ_uxn_opcodes_h_l1637_c6_a949 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1637_c6_a949_left,
BIN_OP_EQ_uxn_opcodes_h_l1637_c6_a949_right,
BIN_OP_EQ_uxn_opcodes_h_l1637_c6_a949_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_9a14
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_9a14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_9a14_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_9a14_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_9a14_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_9a14_return_output);

-- n16_MUX_uxn_opcodes_h_l1637_c2_6745
n16_MUX_uxn_opcodes_h_l1637_c2_6745 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1637_c2_6745_cond,
n16_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue,
n16_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse,
n16_MUX_uxn_opcodes_h_l1637_c2_6745_return_output);

-- t8_MUX_uxn_opcodes_h_l1637_c2_6745
t8_MUX_uxn_opcodes_h_l1637_c2_6745 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1637_c2_6745_cond,
t8_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue,
t8_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse,
t8_MUX_uxn_opcodes_h_l1637_c2_6745_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6745
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6745 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6745_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6745_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6745
result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6745 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6745_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6745_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6745
result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6745 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6745_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6745_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6745
result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6745 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6745_cond,
result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6745_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6745
result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6745 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6745_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6745_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6745
result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6745 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6745_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6745_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6745
result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6745 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6745_cond,
result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6745_return_output);

-- printf_uxn_opcodes_h_l1638_c3_23b7_uxn_opcodes_h_l1638_c3_23b7
printf_uxn_opcodes_h_l1638_c3_23b7_uxn_opcodes_h_l1638_c3_23b7 : entity work.printf_uxn_opcodes_h_l1638_c3_23b7_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1638_c3_23b7_uxn_opcodes_h_l1638_c3_23b7_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8edc
BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8edc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8edc_left,
BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8edc_right,
BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8edc_return_output);

-- n16_MUX_uxn_opcodes_h_l1642_c7_4d5f
n16_MUX_uxn_opcodes_h_l1642_c7_4d5f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond,
n16_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue,
n16_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse,
n16_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output);

-- t8_MUX_uxn_opcodes_h_l1642_c7_4d5f
t8_MUX_uxn_opcodes_h_l1642_c7_4d5f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond,
t8_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue,
t8_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse,
t8_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_4d5f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_4d5f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f
result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_4d5f
result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_4d5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1642_c7_4d5f
result_u16_value_MUX_uxn_opcodes_h_l1642_c7_4d5f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond,
result_u16_value_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_4d5f
result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_4d5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1642_c7_4d5f
result_u8_value_MUX_uxn_opcodes_h_l1642_c7_4d5f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1645_c11_06ee
BIN_OP_EQ_uxn_opcodes_h_l1645_c11_06ee : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1645_c11_06ee_left,
BIN_OP_EQ_uxn_opcodes_h_l1645_c11_06ee_right,
BIN_OP_EQ_uxn_opcodes_h_l1645_c11_06ee_return_output);

-- n16_MUX_uxn_opcodes_h_l1645_c7_9a2b
n16_MUX_uxn_opcodes_h_l1645_c7_9a2b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond,
n16_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue,
n16_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse,
n16_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output);

-- t8_MUX_uxn_opcodes_h_l1645_c7_9a2b
t8_MUX_uxn_opcodes_h_l1645_c7_9a2b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond,
t8_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue,
t8_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse,
t8_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_9a2b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_9a2b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b
result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_9a2b
result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_9a2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1645_c7_9a2b
result_u16_value_MUX_uxn_opcodes_h_l1645_c7_9a2b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond,
result_u16_value_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_9a2b
result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_9a2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1645_c7_9a2b
result_u8_value_MUX_uxn_opcodes_h_l1645_c7_9a2b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1649_c11_4fee
BIN_OP_EQ_uxn_opcodes_h_l1649_c11_4fee : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1649_c11_4fee_left,
BIN_OP_EQ_uxn_opcodes_h_l1649_c11_4fee_right,
BIN_OP_EQ_uxn_opcodes_h_l1649_c11_4fee_return_output);

-- n16_MUX_uxn_opcodes_h_l1649_c7_f457
n16_MUX_uxn_opcodes_h_l1649_c7_f457 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1649_c7_f457_cond,
n16_MUX_uxn_opcodes_h_l1649_c7_f457_iftrue,
n16_MUX_uxn_opcodes_h_l1649_c7_f457_iffalse,
n16_MUX_uxn_opcodes_h_l1649_c7_f457_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_f457
result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_f457 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_f457_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_f457_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_f457_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_f457_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_f457
result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_f457 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_f457_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_f457_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_f457_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_f457_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1649_c7_f457
result_u16_value_MUX_uxn_opcodes_h_l1649_c7_f457 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1649_c7_f457_cond,
result_u16_value_MUX_uxn_opcodes_h_l1649_c7_f457_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1649_c7_f457_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1649_c7_f457_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_f457
result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_f457 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_f457_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_f457_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_f457_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_f457_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_f457
result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_f457 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_f457_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_f457_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_f457_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_f457_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1649_c7_f457
result_u8_value_MUX_uxn_opcodes_h_l1649_c7_f457 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1649_c7_f457_cond,
result_u8_value_MUX_uxn_opcodes_h_l1649_c7_f457_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1649_c7_f457_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1649_c7_f457_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1651_c3_3120
CONST_SL_8_uxn_opcodes_h_l1651_c3_3120 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1651_c3_3120_x,
CONST_SL_8_uxn_opcodes_h_l1651_c3_3120_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1653_c11_cd5b
BIN_OP_EQ_uxn_opcodes_h_l1653_c11_cd5b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1653_c11_cd5b_left,
BIN_OP_EQ_uxn_opcodes_h_l1653_c11_cd5b_right,
BIN_OP_EQ_uxn_opcodes_h_l1653_c11_cd5b_return_output);

-- n16_MUX_uxn_opcodes_h_l1653_c7_9398
n16_MUX_uxn_opcodes_h_l1653_c7_9398 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1653_c7_9398_cond,
n16_MUX_uxn_opcodes_h_l1653_c7_9398_iftrue,
n16_MUX_uxn_opcodes_h_l1653_c7_9398_iffalse,
n16_MUX_uxn_opcodes_h_l1653_c7_9398_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_9398
result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_9398 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_9398_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_9398_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_9398_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_9398_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_9398
result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_9398 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_9398_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_9398_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_9398_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_9398_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1653_c7_9398
result_u16_value_MUX_uxn_opcodes_h_l1653_c7_9398 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1653_c7_9398_cond,
result_u16_value_MUX_uxn_opcodes_h_l1653_c7_9398_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1653_c7_9398_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1653_c7_9398_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_9398
result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_9398 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_9398_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_9398_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_9398_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_9398_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_9398
result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_9398 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_9398_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_9398_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_9398_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_9398_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1653_c7_9398
result_u8_value_MUX_uxn_opcodes_h_l1653_c7_9398 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1653_c7_9398_cond,
result_u8_value_MUX_uxn_opcodes_h_l1653_c7_9398_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1653_c7_9398_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1653_c7_9398_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1654_c3_6599
BIN_OP_OR_uxn_opcodes_h_l1654_c3_6599 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1654_c3_6599_left,
BIN_OP_OR_uxn_opcodes_h_l1654_c3_6599_right,
BIN_OP_OR_uxn_opcodes_h_l1654_c3_6599_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1656_c30_900c
sp_relative_shift_uxn_opcodes_h_l1656_c30_900c : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1656_c30_900c_ins,
sp_relative_shift_uxn_opcodes_h_l1656_c30_900c_x,
sp_relative_shift_uxn_opcodes_h_l1656_c30_900c_y,
sp_relative_shift_uxn_opcodes_h_l1656_c30_900c_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1659_c31_64e1
CONST_SR_8_uxn_opcodes_h_l1659_c31_64e1 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1659_c31_64e1_x,
CONST_SR_8_uxn_opcodes_h_l1659_c31_64e1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1661_c11_7f39
BIN_OP_EQ_uxn_opcodes_h_l1661_c11_7f39 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1661_c11_7f39_left,
BIN_OP_EQ_uxn_opcodes_h_l1661_c11_7f39_right,
BIN_OP_EQ_uxn_opcodes_h_l1661_c11_7f39_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_808e
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_808e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_808e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_808e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_808e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_808e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_808e
result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_808e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_808e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_808e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_808e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_808e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1661_c7_808e
result_u16_value_MUX_uxn_opcodes_h_l1661_c7_808e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1661_c7_808e_cond,
result_u16_value_MUX_uxn_opcodes_h_l1661_c7_808e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1661_c7_808e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1661_c7_808e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_808e
result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_808e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_808e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_808e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_808e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_808e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1661_c7_808e
result_u8_value_MUX_uxn_opcodes_h_l1661_c7_808e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1661_c7_808e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1661_c7_808e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1661_c7_808e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1661_c7_808e_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_9cbd
BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_9cbd : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_9cbd_left,
BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_9cbd_right,
BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_9cbd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1666_c11_df63
BIN_OP_EQ_uxn_opcodes_h_l1666_c11_df63 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1666_c11_df63_left,
BIN_OP_EQ_uxn_opcodes_h_l1666_c11_df63_right,
BIN_OP_EQ_uxn_opcodes_h_l1666_c11_df63_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_b946
result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_b946 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_b946_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_b946_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_b946_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_b946_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_b946
result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_b946 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_b946_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_b946_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_b946_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_b946_return_output);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1663_l1658_DUPLICATE_9745
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1663_l1658_DUPLICATE_9745 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1663_l1658_DUPLICATE_9745_left,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1663_l1658_DUPLICATE_9745_right,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1663_l1658_DUPLICATE_9745_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 -- Registers
 t8,
 n16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1637_c6_a949_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_9a14_return_output,
 n16_MUX_uxn_opcodes_h_l1637_c2_6745_return_output,
 t8_MUX_uxn_opcodes_h_l1637_c2_6745_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6745_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6745_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6745_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6745_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6745_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6745_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6745_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8edc_return_output,
 n16_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output,
 t8_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1645_c11_06ee_return_output,
 n16_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output,
 t8_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1649_c11_4fee_return_output,
 n16_MUX_uxn_opcodes_h_l1649_c7_f457_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_f457_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_f457_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1649_c7_f457_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_f457_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_f457_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1649_c7_f457_return_output,
 CONST_SL_8_uxn_opcodes_h_l1651_c3_3120_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1653_c11_cd5b_return_output,
 n16_MUX_uxn_opcodes_h_l1653_c7_9398_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_9398_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_9398_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1653_c7_9398_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_9398_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_9398_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1653_c7_9398_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1654_c3_6599_return_output,
 sp_relative_shift_uxn_opcodes_h_l1656_c30_900c_return_output,
 CONST_SR_8_uxn_opcodes_h_l1659_c31_64e1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1661_c11_7f39_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_808e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_808e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1661_c7_808e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_808e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1661_c7_808e_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_9cbd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1666_c11_df63_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_b946_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_b946_return_output,
 BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1663_l1658_DUPLICATE_9745_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_a949_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_a949_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_a949_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_9a14_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_9a14_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_9a14_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_9a14_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1637_c2_6745_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1637_c2_6745_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1637_c2_6745_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1637_c2_6745_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1639_c3_a1cb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6745_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6745_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6745_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6745_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6745_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6745_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6745_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6745_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6745_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6745_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6745_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6745_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6745_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6745_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1638_c3_23b7_uxn_opcodes_h_l1638_c3_23b7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8edc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8edc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8edc_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1643_c3_fbee : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_06ee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_06ee_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_06ee_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1649_c7_f457_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1647_c3_e1b6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1645_c7_9a2b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_f457_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_f457_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_f457_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_f457_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_f457_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_f457_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_4fee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_4fee_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_4fee_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1649_c7_f457_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1649_c7_f457_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1653_c7_9398_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1649_c7_f457_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_f457_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_f457_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_9398_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_f457_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_f457_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_f457_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_9398_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_f457_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_f457_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_f457_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_9398_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_f457_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_f457_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_f457_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_9398_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_f457_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_f457_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_f457_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_9398_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_f457_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_f457_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_f457_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_9398_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_f457_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1651_c3_3120_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1651_c3_3120_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_cd5b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_cd5b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_cd5b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1653_c7_9398_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1653_c7_9398_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1653_c7_9398_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_9398_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_9398_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_808e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_9398_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_9398_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_9398_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_808e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_9398_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_9398_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1658_c3_6d9b : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_9398_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_808e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_9398_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_9398_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_9398_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_9398_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_9398_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_9398_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_808e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_9398_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_9398_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_9398_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_808e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_9398_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1654_c3_6599_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1654_c3_6599_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1654_c3_6599_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1656_c30_900c_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1656_c30_900c_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1656_c30_900c_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1656_c30_900c_return_output : signed(3 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1659_c31_64e1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1659_c31_64e1_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1659_c21_5e2b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_7f39_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_7f39_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_7f39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_808e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_808e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_b946_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_808e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_808e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_808e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_b946_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_808e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_808e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1663_c3_b3a8 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_808e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_808e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_808e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_808e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_808e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_808e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_808e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_808e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_9cbd_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_9cbd_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_9cbd_return_output : signed(18 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1664_c21_c547_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_df63_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_df63_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_df63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_b946_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_b946_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_b946_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_b946_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_b946_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_b946_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1645_l1642_l1637_l1661_l1649_DUPLICATE_7eeb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1645_l1642_l1637_l1666_l1661_l1649_DUPLICATE_7978_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1645_l1642_l1637_l1661_l1649_DUPLICATE_2dc7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1645_l1642_l1637_l1653_l1649_DUPLICATE_a12c_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1645_l1642_l1637_l1661_l1649_DUPLICATE_c0bb_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1645_l1642_l1666_l1661_l1653_l1649_DUPLICATE_b11f_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1654_l1650_DUPLICATE_a538_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_acea_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1663_l1658_DUPLICATE_9745_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1663_l1658_DUPLICATE_9745_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1663_l1658_DUPLICATE_9745_return_output : signed(17 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ed17_uxn_opcodes_h_l1671_l1632_DUPLICATE_0d11_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_cd5b_right := to_unsigned(4, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_b946_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_a949_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1643_c3_fbee := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1643_c3_fbee;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_9cbd_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_808e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_4fee_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_9398_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1656_c30_900c_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_df63_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1639_c3_a1cb := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1639_c3_a1cb;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1647_c3_e1b6 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1647_c3_e1b6;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_b946_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_9a14_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_7f39_right := to_unsigned(5, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_9398_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_06ee_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8edc_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1656_c30_900c_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_9a14_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1656_c30_900c_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1654_c3_6599_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1653_c7_9398_iffalse := n16;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1663_l1658_DUPLICATE_9745_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_a949_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8edc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_06ee_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_4fee_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_cd5b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_7f39_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_df63_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1645_l1642_l1637_l1666_l1661_l1649_DUPLICATE_7978 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1645_l1642_l1637_l1666_l1661_l1649_DUPLICATE_7978_return_output := result.is_ram_write;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1664_c21_c547] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1664_c21_c547_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1661_c11_7f39] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1661_c11_7f39_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_7f39_left;
     BIN_OP_EQ_uxn_opcodes_h_l1661_c11_7f39_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_7f39_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_7f39_return_output := BIN_OP_EQ_uxn_opcodes_h_l1661_c11_7f39_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1645_c7_9a2b] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1645_c7_9a2b_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1649_c11_4fee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1649_c11_4fee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_4fee_left;
     BIN_OP_EQ_uxn_opcodes_h_l1649_c11_4fee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_4fee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_4fee_return_output := BIN_OP_EQ_uxn_opcodes_h_l1649_c11_4fee_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1645_c11_06ee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1645_c11_06ee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_06ee_left;
     BIN_OP_EQ_uxn_opcodes_h_l1645_c11_06ee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_06ee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_06ee_return_output := BIN_OP_EQ_uxn_opcodes_h_l1645_c11_06ee_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1645_l1642_l1666_l1661_l1653_l1649_DUPLICATE_b11f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1645_l1642_l1666_l1661_l1653_l1649_DUPLICATE_b11f_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1666_c11_df63] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1666_c11_df63_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_df63_left;
     BIN_OP_EQ_uxn_opcodes_h_l1666_c11_df63_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_df63_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_df63_return_output := BIN_OP_EQ_uxn_opcodes_h_l1666_c11_df63_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1653_c11_cd5b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1653_c11_cd5b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_cd5b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1653_c11_cd5b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_cd5b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_cd5b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1653_c11_cd5b_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1654_l1650_DUPLICATE_a538 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1654_l1650_DUPLICATE_a538_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1642_c11_8edc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8edc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8edc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8edc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8edc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8edc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8edc_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1645_l1642_l1637_l1661_l1649_DUPLICATE_2dc7 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1645_l1642_l1637_l1661_l1649_DUPLICATE_2dc7_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1645_l1642_l1637_l1661_l1649_DUPLICATE_7eeb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1645_l1642_l1637_l1661_l1649_DUPLICATE_7eeb_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1645_l1642_l1637_l1661_l1649_DUPLICATE_c0bb LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1645_l1642_l1637_l1661_l1649_DUPLICATE_c0bb_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1637_c6_a949] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1637_c6_a949_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_a949_left;
     BIN_OP_EQ_uxn_opcodes_h_l1637_c6_a949_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_a949_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_a949_return_output := BIN_OP_EQ_uxn_opcodes_h_l1637_c6_a949_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1645_l1642_l1637_l1653_l1649_DUPLICATE_a12c LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1645_l1642_l1637_l1653_l1649_DUPLICATE_a12c_return_output := result.sp_relative_shift;

     -- sp_relative_shift[uxn_opcodes_h_l1656_c30_900c] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1656_c30_900c_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1656_c30_900c_ins;
     sp_relative_shift_uxn_opcodes_h_l1656_c30_900c_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1656_c30_900c_x;
     sp_relative_shift_uxn_opcodes_h_l1656_c30_900c_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1656_c30_900c_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1656_c30_900c_return_output := sp_relative_shift_uxn_opcodes_h_l1656_c30_900c_return_output;

     -- CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_acea LATENCY=0
     VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_acea_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_9a14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_a949_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1637_c2_6745_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_a949_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6745_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_a949_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6745_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_a949_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6745_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_a949_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6745_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_a949_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6745_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_a949_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6745_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_a949_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6745_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_a949_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1637_c2_6745_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_a949_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8edc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8edc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8edc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8edc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8edc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8edc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8edc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8edc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8edc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_06ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_06ee_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_06ee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_06ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_06ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_06ee_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_06ee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_06ee_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_06ee_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1649_c7_f457_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_4fee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_f457_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_4fee_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_f457_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_4fee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_f457_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_4fee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_f457_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_4fee_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_f457_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_4fee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_f457_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_4fee_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1653_c7_9398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_cd5b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_9398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_cd5b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_9398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_cd5b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_9398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_cd5b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_9398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_cd5b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_9398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_cd5b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_9398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_cd5b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_808e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_7f39_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_808e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_7f39_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_808e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_7f39_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_808e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_7f39_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_808e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_7f39_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_b946_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_df63_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_b946_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_df63_return_output;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1663_l1658_DUPLICATE_9745_right := VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_acea_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1654_c3_6599_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1654_l1650_DUPLICATE_a538_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1651_c3_3120_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1654_l1650_DUPLICATE_a538_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_808e_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1664_c21_c547_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1645_l1642_l1637_l1653_l1649_DUPLICATE_a12c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1645_l1642_l1637_l1653_l1649_DUPLICATE_a12c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1645_l1642_l1637_l1653_l1649_DUPLICATE_a12c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_f457_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1645_l1642_l1637_l1653_l1649_DUPLICATE_a12c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_9398_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1645_l1642_l1637_l1653_l1649_DUPLICATE_a12c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1645_l1642_l1637_l1661_l1649_DUPLICATE_2dc7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1645_l1642_l1637_l1661_l1649_DUPLICATE_2dc7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1645_l1642_l1637_l1661_l1649_DUPLICATE_2dc7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_f457_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1645_l1642_l1637_l1661_l1649_DUPLICATE_2dc7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_808e_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1645_l1642_l1637_l1661_l1649_DUPLICATE_2dc7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1645_l1642_l1666_l1661_l1653_l1649_DUPLICATE_b11f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1645_l1642_l1666_l1661_l1653_l1649_DUPLICATE_b11f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_f457_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1645_l1642_l1666_l1661_l1653_l1649_DUPLICATE_b11f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_9398_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1645_l1642_l1666_l1661_l1653_l1649_DUPLICATE_b11f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_808e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1645_l1642_l1666_l1661_l1653_l1649_DUPLICATE_b11f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_b946_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1645_l1642_l1666_l1661_l1653_l1649_DUPLICATE_b11f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1645_l1642_l1637_l1666_l1661_l1649_DUPLICATE_7978_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1645_l1642_l1637_l1666_l1661_l1649_DUPLICATE_7978_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1645_l1642_l1637_l1666_l1661_l1649_DUPLICATE_7978_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_f457_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1645_l1642_l1637_l1666_l1661_l1649_DUPLICATE_7978_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_808e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1645_l1642_l1637_l1666_l1661_l1649_DUPLICATE_7978_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_b946_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1645_l1642_l1637_l1666_l1661_l1649_DUPLICATE_7978_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1645_l1642_l1637_l1661_l1649_DUPLICATE_7eeb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1645_l1642_l1637_l1661_l1649_DUPLICATE_7eeb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1645_l1642_l1637_l1661_l1649_DUPLICATE_7eeb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_f457_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1645_l1642_l1637_l1661_l1649_DUPLICATE_7eeb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_808e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1645_l1642_l1637_l1661_l1649_DUPLICATE_7eeb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1645_l1642_l1637_l1661_l1649_DUPLICATE_c0bb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1645_l1642_l1637_l1661_l1649_DUPLICATE_c0bb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1645_l1642_l1637_l1661_l1649_DUPLICATE_c0bb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_f457_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1645_l1642_l1637_l1661_l1649_DUPLICATE_c0bb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_808e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1645_l1642_l1637_l1661_l1649_DUPLICATE_c0bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1645_c7_9a2b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_9398_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1656_c30_900c_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1654_c3_6599] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1654_c3_6599_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1654_c3_6599_left;
     BIN_OP_OR_uxn_opcodes_h_l1654_c3_6599_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1654_c3_6599_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1654_c3_6599_return_output := BIN_OP_OR_uxn_opcodes_h_l1654_c3_6599_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1651_c3_3120] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1651_c3_3120_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1651_c3_3120_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1651_c3_3120_return_output := CONST_SL_8_uxn_opcodes_h_l1651_c3_3120_return_output;

     -- t8_MUX[uxn_opcodes_h_l1645_c7_9a2b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond <= VAR_t8_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond;
     t8_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue;
     t8_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output := t8_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output;

     -- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1663_l1658_DUPLICATE_9745 LATENCY=0
     -- Inputs
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1663_l1658_DUPLICATE_9745_left <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1663_l1658_DUPLICATE_9745_left;
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1663_l1658_DUPLICATE_9745_right <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1663_l1658_DUPLICATE_9745_right;
     -- Outputs
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1663_l1658_DUPLICATE_9745_return_output := BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1663_l1658_DUPLICATE_9745_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1637_c1_9a14] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_9a14_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_9a14_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_9a14_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_9a14_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_9a14_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_9a14_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_9a14_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_9a14_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1645_c7_9a2b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1653_c7_9398] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_9398_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_9398_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_9398_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_9398_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_9398_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_9398_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_9398_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_9398_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1666_c7_b946] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_b946_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_b946_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_b946_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_b946_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_b946_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_b946_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_b946_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_b946_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1661_c7_808e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1661_c7_808e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_808e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1661_c7_808e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_808e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1661_c7_808e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_808e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_808e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1661_c7_808e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1666_c7_b946] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_b946_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_b946_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_b946_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_b946_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_b946_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_b946_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_b946_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_b946_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1661_c7_808e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_808e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_808e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_808e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_808e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_808e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_808e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_808e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_808e_return_output;

     -- Submodule level 2
     VAR_CONST_SR_8_uxn_opcodes_h_l1659_c31_64e1_x := VAR_BIN_OP_OR_uxn_opcodes_h_l1654_c3_6599_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1653_c7_9398_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1654_c3_6599_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_9cbd_left := VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1663_l1658_DUPLICATE_9745_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1658_c3_6d9b := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1663_l1658_DUPLICATE_9745_return_output)),16);
     VAR_n16_MUX_uxn_opcodes_h_l1649_c7_f457_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1651_c3_3120_return_output;
     VAR_printf_uxn_opcodes_h_l1638_c3_23b7_uxn_opcodes_h_l1638_c3_23b7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_9a14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_808e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_b946_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_808e_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_b946_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_9398_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_808e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_f457_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_9398_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_9398_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_808e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_9398_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1658_c3_6d9b;
     -- printf_uxn_opcodes_h_l1638_c3_23b7[uxn_opcodes_h_l1638_c3_23b7] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1638_c3_23b7_uxn_opcodes_h_l1638_c3_23b7_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1638_c3_23b7_uxn_opcodes_h_l1638_c3_23b7_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- CONST_SR_8[uxn_opcodes_h_l1659_c31_64e1] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1659_c31_64e1_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1659_c31_64e1_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1659_c31_64e1_return_output := CONST_SR_8_uxn_opcodes_h_l1659_c31_64e1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1661_c7_808e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_808e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_808e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_808e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_808e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_808e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_808e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_808e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_808e_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1661_c7_808e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_808e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_808e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_808e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_808e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_808e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_808e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_808e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_808e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1653_c7_9398] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1653_c7_9398_cond <= VAR_n16_MUX_uxn_opcodes_h_l1653_c7_9398_cond;
     n16_MUX_uxn_opcodes_h_l1653_c7_9398_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1653_c7_9398_iftrue;
     n16_MUX_uxn_opcodes_h_l1653_c7_9398_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1653_c7_9398_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1653_c7_9398_return_output := n16_MUX_uxn_opcodes_h_l1653_c7_9398_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1663_c22_9cbd] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_9cbd_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_9cbd_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_9cbd_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_9cbd_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_9cbd_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_9cbd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1642_c7_4d5f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1649_c7_f457] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_f457_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_f457_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_f457_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_f457_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_f457_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_f457_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_f457_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_f457_return_output;

     -- t8_MUX[uxn_opcodes_h_l1642_c7_4d5f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond <= VAR_t8_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond;
     t8_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue;
     t8_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output := t8_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1653_c7_9398] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_9398_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_9398_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_9398_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_9398_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_9398_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_9398_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_9398_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_9398_return_output;

     -- Submodule level 3
     VAR_result_u16_value_uxn_opcodes_h_l1663_c3_b3a8 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_9cbd_return_output)),16);
     VAR_n16_MUX_uxn_opcodes_h_l1649_c7_f457_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1653_c7_9398_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_9398_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_808e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_9398_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_808e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_f457_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_9398_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_f457_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_808e_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1663_c3_b3a8;
     -- result_u16_value_MUX[uxn_opcodes_h_l1661_c7_808e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1661_c7_808e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_808e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1661_c7_808e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_808e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1661_c7_808e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_808e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_808e_return_output := result_u16_value_MUX_uxn_opcodes_h_l1661_c7_808e_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1653_c7_9398] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_9398_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_9398_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_9398_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_9398_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_9398_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_9398_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_9398_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_9398_return_output;

     -- t8_MUX[uxn_opcodes_h_l1637_c2_6745] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1637_c2_6745_cond <= VAR_t8_MUX_uxn_opcodes_h_l1637_c2_6745_cond;
     t8_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue;
     t8_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1637_c2_6745_return_output := t8_MUX_uxn_opcodes_h_l1637_c2_6745_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1637_c2_6745] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6745_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6745_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6745_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6745_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1653_c7_9398] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_9398_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_9398_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_9398_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_9398_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_9398_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_9398_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_9398_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_9398_return_output;

     -- n16_MUX[uxn_opcodes_h_l1649_c7_f457] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1649_c7_f457_cond <= VAR_n16_MUX_uxn_opcodes_h_l1649_c7_f457_cond;
     n16_MUX_uxn_opcodes_h_l1649_c7_f457_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1649_c7_f457_iftrue;
     n16_MUX_uxn_opcodes_h_l1649_c7_f457_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1649_c7_f457_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1649_c7_f457_return_output := n16_MUX_uxn_opcodes_h_l1649_c7_f457_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1645_c7_9a2b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1659_c21_5e2b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1659_c21_5e2b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1659_c31_64e1_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1649_c7_f457] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_f457_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_f457_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_f457_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_f457_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_f457_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_f457_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_f457_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_f457_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_9398_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1659_c21_5e2b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1649_c7_f457_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_f457_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_9398_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_f457_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_9398_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_f457_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_9398_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_808e_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1637_c2_6745_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1645_c7_9a2b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1649_c7_f457] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_f457_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_f457_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_f457_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_f457_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_f457_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_f457_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_f457_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_f457_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1649_c7_f457] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_f457_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_f457_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_f457_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_f457_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_f457_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_f457_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_f457_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_f457_return_output;

     -- n16_MUX[uxn_opcodes_h_l1645_c7_9a2b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond;
     n16_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue;
     n16_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output := n16_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1653_c7_9398] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1653_c7_9398_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_9398_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1653_c7_9398_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_9398_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1653_c7_9398_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_9398_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_9398_return_output := result_u16_value_MUX_uxn_opcodes_h_l1653_c7_9398_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1653_c7_9398] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1653_c7_9398_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_9398_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1653_c7_9398_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_9398_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1653_c7_9398_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_9398_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_9398_return_output := result_u8_value_MUX_uxn_opcodes_h_l1653_c7_9398_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1642_c7_4d5f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_f457_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_f457_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_f457_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_9398_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_f457_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_9398_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1645_c7_9a2b] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1642_c7_4d5f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1649_c7_f457] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1649_c7_f457_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_f457_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1649_c7_f457_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_f457_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1649_c7_f457_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_f457_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_f457_return_output := result_u8_value_MUX_uxn_opcodes_h_l1649_c7_f457_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1637_c2_6745] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6745_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6745_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6745_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6745_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1649_c7_f457] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1649_c7_f457_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_f457_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1649_c7_f457_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_f457_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1649_c7_f457_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_f457_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_f457_return_output := result_u16_value_MUX_uxn_opcodes_h_l1649_c7_f457_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1645_c7_9a2b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1642_c7_4d5f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond;
     n16_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue;
     n16_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output := n16_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_f457_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_f457_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1642_c7_4d5f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1645_c7_9a2b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output := result_u16_value_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1637_c2_6745] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1637_c2_6745_cond <= VAR_n16_MUX_uxn_opcodes_h_l1637_c2_6745_cond;
     n16_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue;
     n16_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1637_c2_6745_return_output := n16_MUX_uxn_opcodes_h_l1637_c2_6745_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1642_c7_4d5f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1645_c7_9a2b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_9a2b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_9a2b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_9a2b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1637_c2_6745] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6745_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6745_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6745_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6745_return_output;

     -- Submodule level 7
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1637_c2_6745_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_9a2b_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1637_c2_6745] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6745_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6745_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6745_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6745_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1637_c2_6745] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6745_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6745_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6745_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6745_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1642_c7_4d5f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1642_c7_4d5f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1642_c7_4d5f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1642_c7_4d5f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1642_c7_4d5f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output := result_u16_value_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output;

     -- Submodule level 8
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1642_c7_4d5f_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1637_c2_6745] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6745_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6745_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6745_return_output := result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6745_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1637_c2_6745] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6745_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6745_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6745_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6745_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6745_return_output := result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6745_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_ed17_uxn_opcodes_h_l1671_l1632_DUPLICATE_0d11 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ed17_uxn_opcodes_h_l1671_l1632_DUPLICATE_0d11_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_ed17(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6745_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6745_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6745_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6745_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6745_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6745_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6745_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ed17_uxn_opcodes_h_l1671_l1632_DUPLICATE_0d11_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ed17_uxn_opcodes_h_l1671_l1632_DUPLICATE_0d11_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
