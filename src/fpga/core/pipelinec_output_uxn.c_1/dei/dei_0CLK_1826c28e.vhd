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
-- Submodules: 59
entity dei_0CLK_1826c28e is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end dei_0CLK_1826c28e;
architecture arch of dei_0CLK_1826c28e is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal has_written_to_t : unsigned(0 downto 0) := to_unsigned(0, 1);
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal device_in_result : device_in_result_t := device_in_result_t_NULL;
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_has_written_to_t : unsigned(0 downto 0);
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_device_in_result : device_in_result_t;
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l392_c6_a49a]
signal BIN_OP_EQ_uxn_opcodes_h_l392_c6_a49a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l392_c6_a49a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l392_c6_a49a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l392_c1_c03e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_c03e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_c03e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_c03e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_c03e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l400_c7_065a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_065a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_065a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_065a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_065a_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l392_c2_ad21]
signal has_written_to_t_MUX_uxn_opcodes_h_l392_c2_ad21_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l392_c2_ad21_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l392_c2_ad21]
signal t8_MUX_uxn_opcodes_h_l392_c2_ad21_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l392_c2_ad21_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l392_c2_ad21]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_ad21_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_ad21_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l392_c2_ad21]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_ad21_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_ad21_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l392_c2_ad21]
signal result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_ad21_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_ad21_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l392_c2_ad21]
signal result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_ad21_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_ad21_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l392_c2_ad21]
signal result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_ad21_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_ad21_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l392_c2_ad21]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_ad21_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_ad21_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l392_c2_ad21]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_ad21_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_ad21_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l392_c2_ad21]
signal result_u8_value_MUX_uxn_opcodes_h_l392_c2_ad21_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l392_c2_ad21_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l392_c2_ad21]
signal device_in_result_MUX_uxn_opcodes_h_l392_c2_ad21_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l392_c2_ad21_return_output : device_in_result_t;

-- printf_uxn_opcodes_h_l393_c3_451c[uxn_opcodes_h_l393_c3_451c]
signal printf_uxn_opcodes_h_l393_c3_451c_uxn_opcodes_h_l393_c3_451c_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l400_c11_fa89]
signal BIN_OP_EQ_uxn_opcodes_h_l400_c11_fa89_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l400_c11_fa89_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l400_c11_fa89_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l403_c7_cf25]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_cf25_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_cf25_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l400_c7_065a]
signal has_written_to_t_MUX_uxn_opcodes_h_l400_c7_065a_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l400_c7_065a_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l400_c7_065a_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l400_c7_065a_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l400_c7_065a]
signal t8_MUX_uxn_opcodes_h_l400_c7_065a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l400_c7_065a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l400_c7_065a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l400_c7_065a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l400_c7_065a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_065a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_065a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_065a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_065a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l400_c7_065a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_065a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_065a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_065a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_065a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l400_c7_065a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_065a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_065a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_065a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_065a_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l400_c7_065a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_065a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_065a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_065a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_065a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l400_c7_065a]
signal result_u8_value_MUX_uxn_opcodes_h_l400_c7_065a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l400_c7_065a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l400_c7_065a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l400_c7_065a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l400_c7_065a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_065a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_065a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_065a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_065a_return_output : signed(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l400_c7_065a]
signal result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_065a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_065a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_065a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_065a_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l400_c7_065a]
signal device_in_result_MUX_uxn_opcodes_h_l400_c7_065a_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l400_c7_065a_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l400_c7_065a_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l400_c7_065a_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l403_c11_0dc0]
signal BIN_OP_EQ_uxn_opcodes_h_l403_c11_0dc0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l403_c11_0dc0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l403_c11_0dc0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l408_c1_7a22]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_7a22_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_7a22_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_7a22_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_7a22_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l403_c7_cf25]
signal has_written_to_t_MUX_uxn_opcodes_h_l403_c7_cf25_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l403_c7_cf25_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l403_c7_cf25]
signal t8_MUX_uxn_opcodes_h_l403_c7_cf25_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l403_c7_cf25_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l403_c7_cf25]
signal result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_cf25_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_cf25_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l403_c7_cf25]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_cf25_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_cf25_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l403_c7_cf25]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_cf25_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_cf25_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l403_c7_cf25]
signal result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_cf25_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_cf25_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l403_c7_cf25]
signal result_u8_value_MUX_uxn_opcodes_h_l403_c7_cf25_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l403_c7_cf25_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l403_c7_cf25]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_cf25_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_cf25_return_output : signed(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l403_c7_cf25]
signal result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_cf25_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_cf25_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l403_c7_cf25]
signal device_in_result_MUX_uxn_opcodes_h_l403_c7_cf25_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l403_c7_cf25_return_output : device_in_result_t;

-- sp_relative_shift[uxn_opcodes_h_l406_c30_ddfa]
signal sp_relative_shift_uxn_opcodes_h_l406_c30_ddfa_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l406_c30_ddfa_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l406_c30_ddfa_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l406_c30_ddfa_return_output : signed(3 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l410_c8_fd95]
signal UNARY_OP_NOT_uxn_opcodes_h_l410_c8_fd95_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l410_c8_fd95_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l410_c1_80e2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_80e2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_80e2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_80e2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_80e2_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l410_c3_a741]
signal has_written_to_t_MUX_uxn_opcodes_h_l410_c3_a741_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l410_c3_a741_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l410_c3_a741_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l410_c3_a741_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l410_c3_a741]
signal result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_a741_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_a741_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_a741_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_a741_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l410_c3_a741]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_a741_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_a741_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_a741_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_a741_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l410_c3_a741]
signal result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_a741_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_a741_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_a741_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_a741_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l410_c3_a741]
signal result_u8_value_MUX_uxn_opcodes_h_l410_c3_a741_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l410_c3_a741_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l410_c3_a741_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l410_c3_a741_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l410_c3_a741]
signal result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_a741_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_a741_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_a741_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_a741_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l410_c3_a741]
signal device_in_result_MUX_uxn_opcodes_h_l410_c3_a741_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l410_c3_a741_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l410_c3_a741_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l410_c3_a741_return_output : device_in_result_t;

-- BIN_OP_MINUS[uxn_opcodes_h_l411_c37_97f9]
signal BIN_OP_MINUS_uxn_opcodes_h_l411_c37_97f9_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l411_c37_97f9_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l411_c37_97f9_return_output : unsigned(7 downto 0);

-- device_in[uxn_opcodes_h_l411_c23_0d28]
signal device_in_uxn_opcodes_h_l411_c23_0d28_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_in_uxn_opcodes_h_l411_c23_0d28_device_address : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l411_c23_0d28_phase : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l411_c23_0d28_previous_device_ram_read : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l411_c23_0d28_return_output : device_in_result_t;

-- UNARY_OP_NOT[uxn_opcodes_h_l414_c9_36d0]
signal UNARY_OP_NOT_uxn_opcodes_h_l414_c9_36d0_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l414_c9_36d0_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l414_c4_8f3a]
signal has_written_to_t_MUX_uxn_opcodes_h_l414_c4_8f3a_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l414_c4_8f3a_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l414_c4_8f3a_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l414_c4_8f3a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l414_c4_8f3a]
signal result_u8_value_MUX_uxn_opcodes_h_l414_c4_8f3a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l414_c4_8f3a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l414_c4_8f3a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l414_c4_8f3a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l414_c4_8f3a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_8f3a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_8f3a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_8f3a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_8f3a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l414_c4_8f3a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_8f3a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_8f3a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_8f3a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_8f3a_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l414_c4_8f3a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_8f3a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_8f3a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_8f3a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_8f3a_return_output : unsigned(0 downto 0);

function CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6( ref_toks_0 : device_in_result_t;
 ref_toks_1 : unsigned) return device_in_result_t is
 
  variable base : device_in_result_t; 
  variable return_output : device_in_result_t;
begin
      base := ref_toks_0;
      base.is_dei_done := ref_toks_1;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_f08e( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.device_ram_address := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_device_ram_write := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.u8_value := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l392_c6_a49a
BIN_OP_EQ_uxn_opcodes_h_l392_c6_a49a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l392_c6_a49a_left,
BIN_OP_EQ_uxn_opcodes_h_l392_c6_a49a_right,
BIN_OP_EQ_uxn_opcodes_h_l392_c6_a49a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_c03e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_c03e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_c03e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_c03e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_c03e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_c03e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_065a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_065a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_065a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_065a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_065a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_065a_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l392_c2_ad21
has_written_to_t_MUX_uxn_opcodes_h_l392_c2_ad21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l392_c2_ad21_cond,
has_written_to_t_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l392_c2_ad21_return_output);

-- t8_MUX_uxn_opcodes_h_l392_c2_ad21
t8_MUX_uxn_opcodes_h_l392_c2_ad21 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l392_c2_ad21_cond,
t8_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue,
t8_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse,
t8_MUX_uxn_opcodes_h_l392_c2_ad21_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_ad21
result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_ad21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_ad21_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_ad21_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_ad21
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_ad21 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_ad21_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_ad21_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_ad21
result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_ad21 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_ad21_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_ad21_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_ad21
result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_ad21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_ad21_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_ad21_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_ad21
result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_ad21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_ad21_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_ad21_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_ad21
result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_ad21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_ad21_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_ad21_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_ad21
result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_ad21 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_ad21_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_ad21_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l392_c2_ad21
result_u8_value_MUX_uxn_opcodes_h_l392_c2_ad21 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l392_c2_ad21_cond,
result_u8_value_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l392_c2_ad21_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l392_c2_ad21
device_in_result_MUX_uxn_opcodes_h_l392_c2_ad21 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l392_c2_ad21_cond,
device_in_result_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue,
device_in_result_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse,
device_in_result_MUX_uxn_opcodes_h_l392_c2_ad21_return_output);

-- printf_uxn_opcodes_h_l393_c3_451c_uxn_opcodes_h_l393_c3_451c
printf_uxn_opcodes_h_l393_c3_451c_uxn_opcodes_h_l393_c3_451c : entity work.printf_uxn_opcodes_h_l393_c3_451c_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l393_c3_451c_uxn_opcodes_h_l393_c3_451c_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l400_c11_fa89
BIN_OP_EQ_uxn_opcodes_h_l400_c11_fa89 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l400_c11_fa89_left,
BIN_OP_EQ_uxn_opcodes_h_l400_c11_fa89_right,
BIN_OP_EQ_uxn_opcodes_h_l400_c11_fa89_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_cf25
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_cf25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_cf25_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_cf25_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l400_c7_065a
has_written_to_t_MUX_uxn_opcodes_h_l400_c7_065a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l400_c7_065a_cond,
has_written_to_t_MUX_uxn_opcodes_h_l400_c7_065a_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l400_c7_065a_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l400_c7_065a_return_output);

-- t8_MUX_uxn_opcodes_h_l400_c7_065a
t8_MUX_uxn_opcodes_h_l400_c7_065a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l400_c7_065a_cond,
t8_MUX_uxn_opcodes_h_l400_c7_065a_iftrue,
t8_MUX_uxn_opcodes_h_l400_c7_065a_iffalse,
t8_MUX_uxn_opcodes_h_l400_c7_065a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_065a
result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_065a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_065a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_065a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_065a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_065a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_065a
result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_065a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_065a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_065a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_065a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_065a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_065a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_065a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_065a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_065a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_065a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_065a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_065a
result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_065a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_065a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_065a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_065a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_065a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l400_c7_065a
result_u8_value_MUX_uxn_opcodes_h_l400_c7_065a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l400_c7_065a_cond,
result_u8_value_MUX_uxn_opcodes_h_l400_c7_065a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l400_c7_065a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l400_c7_065a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_065a
result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_065a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_065a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_065a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_065a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_065a_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_065a
result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_065a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_065a_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_065a_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_065a_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_065a_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l400_c7_065a
device_in_result_MUX_uxn_opcodes_h_l400_c7_065a : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l400_c7_065a_cond,
device_in_result_MUX_uxn_opcodes_h_l400_c7_065a_iftrue,
device_in_result_MUX_uxn_opcodes_h_l400_c7_065a_iffalse,
device_in_result_MUX_uxn_opcodes_h_l400_c7_065a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l403_c11_0dc0
BIN_OP_EQ_uxn_opcodes_h_l403_c11_0dc0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l403_c11_0dc0_left,
BIN_OP_EQ_uxn_opcodes_h_l403_c11_0dc0_right,
BIN_OP_EQ_uxn_opcodes_h_l403_c11_0dc0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_7a22
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_7a22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_7a22_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_7a22_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_7a22_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_7a22_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l403_c7_cf25
has_written_to_t_MUX_uxn_opcodes_h_l403_c7_cf25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l403_c7_cf25_cond,
has_written_to_t_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l403_c7_cf25_return_output);

-- t8_MUX_uxn_opcodes_h_l403_c7_cf25
t8_MUX_uxn_opcodes_h_l403_c7_cf25 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l403_c7_cf25_cond,
t8_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue,
t8_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse,
t8_MUX_uxn_opcodes_h_l403_c7_cf25_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_cf25
result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_cf25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_cf25_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_cf25_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_cf25
result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_cf25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_cf25_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_cf25_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_cf25
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_cf25 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_cf25_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_cf25_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_cf25
result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_cf25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_cf25_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_cf25_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l403_c7_cf25
result_u8_value_MUX_uxn_opcodes_h_l403_c7_cf25 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l403_c7_cf25_cond,
result_u8_value_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l403_c7_cf25_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_cf25
result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_cf25 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_cf25_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_cf25_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_cf25
result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_cf25 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_cf25_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_cf25_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l403_c7_cf25
device_in_result_MUX_uxn_opcodes_h_l403_c7_cf25 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l403_c7_cf25_cond,
device_in_result_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue,
device_in_result_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse,
device_in_result_MUX_uxn_opcodes_h_l403_c7_cf25_return_output);

-- sp_relative_shift_uxn_opcodes_h_l406_c30_ddfa
sp_relative_shift_uxn_opcodes_h_l406_c30_ddfa : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l406_c30_ddfa_ins,
sp_relative_shift_uxn_opcodes_h_l406_c30_ddfa_x,
sp_relative_shift_uxn_opcodes_h_l406_c30_ddfa_y,
sp_relative_shift_uxn_opcodes_h_l406_c30_ddfa_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l410_c8_fd95
UNARY_OP_NOT_uxn_opcodes_h_l410_c8_fd95 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l410_c8_fd95_expr,
UNARY_OP_NOT_uxn_opcodes_h_l410_c8_fd95_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_80e2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_80e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_80e2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_80e2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_80e2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_80e2_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l410_c3_a741
has_written_to_t_MUX_uxn_opcodes_h_l410_c3_a741 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l410_c3_a741_cond,
has_written_to_t_MUX_uxn_opcodes_h_l410_c3_a741_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l410_c3_a741_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l410_c3_a741_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_a741
result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_a741 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_a741_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_a741_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_a741_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_a741_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_a741
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_a741 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_a741_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_a741_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_a741_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_a741_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_a741
result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_a741 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_a741_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_a741_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_a741_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_a741_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l410_c3_a741
result_u8_value_MUX_uxn_opcodes_h_l410_c3_a741 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l410_c3_a741_cond,
result_u8_value_MUX_uxn_opcodes_h_l410_c3_a741_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l410_c3_a741_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l410_c3_a741_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_a741
result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_a741 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_a741_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_a741_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_a741_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_a741_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l410_c3_a741
device_in_result_MUX_uxn_opcodes_h_l410_c3_a741 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l410_c3_a741_cond,
device_in_result_MUX_uxn_opcodes_h_l410_c3_a741_iftrue,
device_in_result_MUX_uxn_opcodes_h_l410_c3_a741_iffalse,
device_in_result_MUX_uxn_opcodes_h_l410_c3_a741_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l411_c37_97f9
BIN_OP_MINUS_uxn_opcodes_h_l411_c37_97f9 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l411_c37_97f9_left,
BIN_OP_MINUS_uxn_opcodes_h_l411_c37_97f9_right,
BIN_OP_MINUS_uxn_opcodes_h_l411_c37_97f9_return_output);

-- device_in_uxn_opcodes_h_l411_c23_0d28
device_in_uxn_opcodes_h_l411_c23_0d28 : entity work.device_in_0CLK_b9b05a79 port map (
clk,
device_in_uxn_opcodes_h_l411_c23_0d28_CLOCK_ENABLE,
device_in_uxn_opcodes_h_l411_c23_0d28_device_address,
device_in_uxn_opcodes_h_l411_c23_0d28_phase,
device_in_uxn_opcodes_h_l411_c23_0d28_previous_device_ram_read,
device_in_uxn_opcodes_h_l411_c23_0d28_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l414_c9_36d0
UNARY_OP_NOT_uxn_opcodes_h_l414_c9_36d0 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l414_c9_36d0_expr,
UNARY_OP_NOT_uxn_opcodes_h_l414_c9_36d0_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l414_c4_8f3a
has_written_to_t_MUX_uxn_opcodes_h_l414_c4_8f3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l414_c4_8f3a_cond,
has_written_to_t_MUX_uxn_opcodes_h_l414_c4_8f3a_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l414_c4_8f3a_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l414_c4_8f3a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l414_c4_8f3a
result_u8_value_MUX_uxn_opcodes_h_l414_c4_8f3a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l414_c4_8f3a_cond,
result_u8_value_MUX_uxn_opcodes_h_l414_c4_8f3a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l414_c4_8f3a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l414_c4_8f3a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_8f3a
result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_8f3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_8f3a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_8f3a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_8f3a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_8f3a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_8f3a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_8f3a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_8f3a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_8f3a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_8f3a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_8f3a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_8f3a
result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_8f3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_8f3a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_8f3a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_8f3a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_8f3a_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_device_ram_read,
 -- Registers
 has_written_to_t,
 t8,
 device_in_result,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l392_c6_a49a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_c03e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_065a_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l392_c2_ad21_return_output,
 t8_MUX_uxn_opcodes_h_l392_c2_ad21_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_ad21_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_ad21_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_ad21_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_ad21_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_ad21_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_ad21_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_ad21_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l392_c2_ad21_return_output,
 device_in_result_MUX_uxn_opcodes_h_l392_c2_ad21_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l400_c11_fa89_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_cf25_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l400_c7_065a_return_output,
 t8_MUX_uxn_opcodes_h_l400_c7_065a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_065a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_065a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_065a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_065a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l400_c7_065a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_065a_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_065a_return_output,
 device_in_result_MUX_uxn_opcodes_h_l400_c7_065a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l403_c11_0dc0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_7a22_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l403_c7_cf25_return_output,
 t8_MUX_uxn_opcodes_h_l403_c7_cf25_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_cf25_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_cf25_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_cf25_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_cf25_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l403_c7_cf25_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_cf25_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_cf25_return_output,
 device_in_result_MUX_uxn_opcodes_h_l403_c7_cf25_return_output,
 sp_relative_shift_uxn_opcodes_h_l406_c30_ddfa_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l410_c8_fd95_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_80e2_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l410_c3_a741_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_a741_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_a741_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_a741_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l410_c3_a741_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_a741_return_output,
 device_in_result_MUX_uxn_opcodes_h_l410_c3_a741_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l411_c37_97f9_return_output,
 device_in_uxn_opcodes_h_l411_c23_0d28_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l414_c9_36d0_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l414_c4_8f3a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l414_c4_8f3a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_8f3a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_8f3a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_8f3a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_a49a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_a49a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_a49a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_c03e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_c03e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_c03e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_c03e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_065a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_065a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_065a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_065a_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l400_c7_065a_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l392_c2_ad21_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l392_c2_ad21_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l400_c7_065a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l392_c2_ad21_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l392_c2_ad21_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_065a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_ad21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_ad21_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l395_c3_0e68 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_065a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_ad21_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_ad21_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_065a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_ad21_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_ad21_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_065a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_ad21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_ad21_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_065a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_ad21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_ad21_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l392_c2_ad21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_ad21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_ad21_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_065a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_ad21_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_ad21_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_065a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c2_ad21_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c2_ad21_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue : device_in_result_t;
 variable VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l392_c2_ad21_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l400_c7_065a_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l392_c2_ad21_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l392_c2_ad21_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l393_c3_451c_uxn_opcodes_h_l393_c3_451c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_fa89_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_fa89_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_fa89_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_cf25_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_cf25_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l400_c7_065a_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l400_c7_065a_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l403_c7_cf25_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l400_c7_065a_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l400_c7_065a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l400_c7_065a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l403_c7_cf25_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l400_c7_065a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_065a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_065a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_cf25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_065a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_065a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_065a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_cf25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_065a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_065a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l401_c3_7cb3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_065a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_cf25_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_065a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_065a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_065a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_cf25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_065a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_065a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_065a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l403_c7_cf25_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_065a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_065a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_065a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_cf25_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_065a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_065a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_065a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_cf25_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_065a_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l400_c7_065a_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l400_c7_065a_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l403_c7_cf25_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l400_c7_065a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_0dc0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_0dc0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_0dc0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_7a22_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_7a22_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_7a22_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_7a22_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l410_c3_a741_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l403_c7_cf25_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l403_c7_cf25_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_a741_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_cf25_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_cf25_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_a741_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_cf25_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_a741_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_cf25_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l410_c3_a741_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l403_c7_cf25_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_cf25_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_a741_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_cf25_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l410_c3_a741_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l403_c7_cf25_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l406_c30_ddfa_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l406_c30_ddfa_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l406_c30_ddfa_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l406_c30_ddfa_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l410_c8_5604_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_fd95_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_fd95_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_80e2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_80e2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_80e2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_80e2_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l410_c3_a741_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l410_c3_a741_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l414_c4_8f3a_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l410_c3_a741_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_a741_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_a741_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_8f3a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_a741_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_a741_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_a741_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_8f3a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_a741_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_a741_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_a741_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_8f3a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_a741_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l410_c3_a741_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l410_c3_a741_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l414_c4_8f3a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l410_c3_a741_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_a741_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_a741_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_a741_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l410_c3_a741_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l410_c3_a741_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l410_c3_a741_cond : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l411_c23_0d28_device_address : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l411_c23_0d28_phase : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l411_c23_0d28_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l411_c37_97f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l411_c37_97f9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l411_c37_97f9_return_output : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l411_c23_0d28_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l411_c23_0d28_return_output : device_in_result_t;
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l412_c32_77d8_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l414_c9_36d0_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l414_c9_36d0_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l414_c4_8f3a_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l414_c4_8f3a_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l414_c4_8f3a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l414_c4_8f3a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l414_c4_8f3a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l414_c4_8f3a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_8f3a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_8f3a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_8f3a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_8f3a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l416_c5_0204 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_8f3a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_8f3a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_8f3a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_8f3a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_8f3a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l417_c23_3a53_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l400_l392_DUPLICATE_93c0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l410_l400_l403_l392_DUPLICATE_dc51_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l410_l400_l403_l392_DUPLICATE_b6a7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l400_l403_l392_DUPLICATE_19e1_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l410_l403_l400_l392_l414_DUPLICATE_035d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l410_l400_l414_l403_DUPLICATE_a32e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l410_l414_l403_DUPLICATE_a208_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f08e_uxn_opcodes_h_l386_l426_DUPLICATE_b302_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_has_written_to_t : unsigned(0 downto 0);
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_device_in_result : device_in_result_t;
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_has_written_to_t := has_written_to_t;
  REG_VAR_t8 := t8;
  REG_VAR_device_in_result := device_in_result;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_8f3a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_a49a_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l395_c3_0e68 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l395_c3_0e68;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_8f3a_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_0dc0_right := to_unsigned(2, 2);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l414_c4_8f3a_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l416_c5_0204 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_8f3a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l416_c5_0204;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l406_c30_ddfa_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l401_c3_7cb3 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_065a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l401_c3_7cb3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_fa89_right := to_unsigned(1, 1);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_8f3a_iffalse := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_7a22_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l411_c37_97f9_right := to_unsigned(3, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_80e2_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_c03e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_065a_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l406_c30_ddfa_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));

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
     VAR_previous_device_ram_read := previous_device_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_065a_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_c03e_iftrue := VAR_CLOCK_ENABLE;
     VAR_device_in_result_MUX_uxn_opcodes_h_l400_c7_065a_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l410_c3_a741_iffalse := device_in_result;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l414_c9_36d0_expr := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l400_c7_065a_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l410_c3_a741_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l414_c4_8f3a_iffalse := has_written_to_t;
     VAR_sp_relative_shift_uxn_opcodes_h_l406_c30_ddfa_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_a49a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_fa89_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_0dc0_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l411_c37_97f9_left := VAR_phase;
     VAR_device_in_uxn_opcodes_h_l411_c23_0d28_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue := VAR_previous_stack_read;
     VAR_device_in_uxn_opcodes_h_l411_c23_0d28_device_address := t8;
     VAR_t8_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l400_c7_065a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l392_c6_a49a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l392_c6_a49a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_a49a_left;
     BIN_OP_EQ_uxn_opcodes_h_l392_c6_a49a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_a49a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_a49a_return_output := BIN_OP_EQ_uxn_opcodes_h_l392_c6_a49a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l400_c11_fa89] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l400_c11_fa89_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_fa89_left;
     BIN_OP_EQ_uxn_opcodes_h_l400_c11_fa89_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_fa89_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_fa89_return_output := BIN_OP_EQ_uxn_opcodes_h_l400_c11_fa89_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l400_l403_l392_DUPLICATE_19e1 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l400_l403_l392_DUPLICATE_19e1_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l400_l392_DUPLICATE_93c0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l400_l392_DUPLICATE_93c0_return_output := result.is_sp_shift;

     -- UNARY_OP_NOT[uxn_opcodes_h_l414_c9_36d0] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l414_c9_36d0_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l414_c9_36d0_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l414_c9_36d0_return_output := UNARY_OP_NOT_uxn_opcodes_h_l414_c9_36d0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l403_c11_0dc0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l403_c11_0dc0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_0dc0_left;
     BIN_OP_EQ_uxn_opcodes_h_l403_c11_0dc0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_0dc0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_0dc0_return_output := BIN_OP_EQ_uxn_opcodes_h_l403_c11_0dc0_return_output;

     -- device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6[uxn_opcodes_h_l392_c2_ad21] LATENCY=0
     VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l392_c2_ad21_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6(
     device_in_result,
     to_unsigned(0, 1));

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l410_l400_l403_l392_DUPLICATE_dc51 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l410_l400_l403_l392_DUPLICATE_dc51_return_output := result.device_ram_address;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l410_l403_l400_l392_l414_DUPLICATE_035d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l410_l403_l400_l392_l414_DUPLICATE_035d_return_output := result.u8_value;

     -- result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l392_c2_ad21] LATENCY=0
     VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l392_c2_ad21_return_output := result.is_device_ram_write;

     -- BIN_OP_MINUS[uxn_opcodes_h_l411_c37_97f9] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l411_c37_97f9_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l411_c37_97f9_left;
     BIN_OP_MINUS_uxn_opcodes_h_l411_c37_97f9_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l411_c37_97f9_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l411_c37_97f9_return_output := BIN_OP_MINUS_uxn_opcodes_h_l411_c37_97f9_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l406_c30_ddfa] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l406_c30_ddfa_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l406_c30_ddfa_ins;
     sp_relative_shift_uxn_opcodes_h_l406_c30_ddfa_x <= VAR_sp_relative_shift_uxn_opcodes_h_l406_c30_ddfa_x;
     sp_relative_shift_uxn_opcodes_h_l406_c30_ddfa_y <= VAR_sp_relative_shift_uxn_opcodes_h_l406_c30_ddfa_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l406_c30_ddfa_return_output := sp_relative_shift_uxn_opcodes_h_l406_c30_ddfa_return_output;

     -- CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d[uxn_opcodes_h_l410_c8_5604] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l410_c8_5604_return_output := device_in_result.is_dei_done;

     -- CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d[uxn_opcodes_h_l417_c23_3a53] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l417_c23_3a53_return_output := device_in_result.dei_value;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l410_l414_l403_DUPLICATE_a208 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l410_l414_l403_DUPLICATE_a208_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l410_l400_l403_l392_DUPLICATE_b6a7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l410_l400_l403_l392_DUPLICATE_b6a7_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l410_l400_l414_l403_DUPLICATE_a32e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l410_l400_l414_l403_DUPLICATE_a32e_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_065a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_a49a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_c03e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_a49a_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l392_c2_ad21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_a49a_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l392_c2_ad21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_a49a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_ad21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_a49a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_ad21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_a49a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_ad21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_a49a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_ad21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_a49a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_ad21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_a49a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_ad21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_a49a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_ad21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_a49a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c2_ad21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_a49a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l392_c2_ad21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_a49a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_cf25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_fa89_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l400_c7_065a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_fa89_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l400_c7_065a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_fa89_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_065a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_fa89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_065a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_fa89_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_065a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_fa89_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_065a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_fa89_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_065a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_fa89_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_065a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_fa89_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_065a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_fa89_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l400_c7_065a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_fa89_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_7a22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_0dc0_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l403_c7_cf25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_0dc0_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l403_c7_cf25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_0dc0_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_cf25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_0dc0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_cf25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_0dc0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_cf25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_0dc0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_cf25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_0dc0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_cf25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_0dc0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_cf25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_0dc0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l403_c7_cf25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_0dc0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l403_c7_cf25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_0dc0_return_output;
     VAR_device_in_uxn_opcodes_h_l411_c23_0d28_phase := VAR_BIN_OP_MINUS_uxn_opcodes_h_l411_c37_97f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l400_l403_l392_DUPLICATE_19e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_065a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l400_l403_l392_DUPLICATE_19e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l400_l403_l392_DUPLICATE_19e1_return_output;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_fd95_expr := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l410_c8_5604_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_065a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l410_l400_l414_l403_DUPLICATE_a32e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l410_l400_l414_l403_DUPLICATE_a32e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_a741_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l410_l400_l414_l403_DUPLICATE_a32e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_8f3a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l410_l400_l414_l403_DUPLICATE_a32e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l400_l392_DUPLICATE_93c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_065a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l400_l392_DUPLICATE_93c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l410_l400_l403_l392_DUPLICATE_b6a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_065a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l410_l400_l403_l392_DUPLICATE_b6a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l410_l400_l403_l392_DUPLICATE_b6a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_a741_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l410_l400_l403_l392_DUPLICATE_b6a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l410_l414_l403_DUPLICATE_a208_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_a741_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l410_l414_l403_DUPLICATE_a208_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_8f3a_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l410_l414_l403_DUPLICATE_a208_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l414_c4_8f3a_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l417_c23_3a53_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l410_l400_l403_l392_DUPLICATE_dc51_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_065a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l410_l400_l403_l392_DUPLICATE_dc51_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l410_l400_l403_l392_DUPLICATE_dc51_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_a741_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l410_l400_l403_l392_DUPLICATE_dc51_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l410_l403_l400_l392_l414_DUPLICATE_035d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_065a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l410_l403_l400_l392_l414_DUPLICATE_035d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l410_l403_l400_l392_l414_DUPLICATE_035d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l410_c3_a741_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l410_l403_l400_l392_l414_DUPLICATE_035d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l414_c4_8f3a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l410_l403_l400_l392_l414_DUPLICATE_035d_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l414_c4_8f3a_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l414_c9_36d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_8f3a_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l414_c9_36d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_8f3a_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l414_c9_36d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_8f3a_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l414_c9_36d0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l414_c4_8f3a_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l414_c9_36d0_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue := VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l392_c2_ad21_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse := VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l392_c2_ad21_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l406_c30_ddfa_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l414_c4_8f3a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l414_c4_8f3a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l414_c4_8f3a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l414_c4_8f3a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l414_c4_8f3a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l414_c4_8f3a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l414_c4_8f3a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l414_c4_8f3a_return_output := result_u8_value_MUX_uxn_opcodes_h_l414_c4_8f3a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l414_c4_8f3a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_8f3a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_8f3a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_8f3a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_8f3a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_8f3a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_8f3a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_8f3a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_8f3a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l400_c7_065a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_065a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_065a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_065a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_065a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_065a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_065a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_065a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_065a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l403_c7_cf25] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_cf25_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_cf25_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_cf25_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_cf25_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l410_c8_fd95] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l410_c8_fd95_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_fd95_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_fd95_return_output := UNARY_OP_NOT_uxn_opcodes_h_l410_c8_fd95_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l414_c4_8f3a] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l414_c4_8f3a_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l414_c4_8f3a_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l414_c4_8f3a_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l414_c4_8f3a_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l414_c4_8f3a_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l414_c4_8f3a_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l414_c4_8f3a_return_output := has_written_to_t_MUX_uxn_opcodes_h_l414_c4_8f3a_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l392_c2_ad21] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_ad21_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_ad21_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_ad21_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_ad21_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l392_c1_c03e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_c03e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_c03e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_c03e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_c03e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_c03e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_c03e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_c03e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_c03e_return_output;

     -- t8_MUX[uxn_opcodes_h_l403_c7_cf25] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l403_c7_cf25_cond <= VAR_t8_MUX_uxn_opcodes_h_l403_c7_cf25_cond;
     t8_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue;
     t8_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l403_c7_cf25_return_output := t8_MUX_uxn_opcodes_h_l403_c7_cf25_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l403_c7_cf25] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_cf25_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_cf25_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_cf25_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_cf25_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l414_c4_8f3a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_8f3a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_8f3a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_8f3a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_8f3a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_8f3a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_8f3a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_8f3a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_8f3a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l414_c4_8f3a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_8f3a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_8f3a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_8f3a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_8f3a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_8f3a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_8f3a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_8f3a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_8f3a_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_065a_return_output;
     VAR_printf_uxn_opcodes_h_l393_c3_451c_uxn_opcodes_h_l393_c3_451c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_c03e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_80e2_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_fd95_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l410_c3_a741_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_fd95_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l410_c3_a741_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_fd95_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_a741_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_fd95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_a741_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_fd95_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_a741_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_fd95_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_a741_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_fd95_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l410_c3_a741_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_fd95_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l410_c3_a741_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l414_c4_8f3a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_a741_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_8f3a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_065a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_cf25_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_a741_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_8f3a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_065a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_cf25_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_a741_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_8f3a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l410_c3_a741_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l414_c4_8f3a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l400_c7_065a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l403_c7_cf25_return_output;
     -- t8_MUX[uxn_opcodes_h_l400_c7_065a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l400_c7_065a_cond <= VAR_t8_MUX_uxn_opcodes_h_l400_c7_065a_cond;
     t8_MUX_uxn_opcodes_h_l400_c7_065a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l400_c7_065a_iftrue;
     t8_MUX_uxn_opcodes_h_l400_c7_065a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l400_c7_065a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l400_c7_065a_return_output := t8_MUX_uxn_opcodes_h_l400_c7_065a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l403_c7_cf25] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_cf25_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_cf25_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_cf25_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_cf25_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l410_c3_a741] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l410_c3_a741_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l410_c3_a741_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l410_c3_a741_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l410_c3_a741_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l410_c3_a741_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l410_c3_a741_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l410_c3_a741_return_output := has_written_to_t_MUX_uxn_opcodes_h_l410_c3_a741_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l410_c3_a741] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l410_c3_a741_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l410_c3_a741_cond;
     result_u8_value_MUX_uxn_opcodes_h_l410_c3_a741_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l410_c3_a741_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l410_c3_a741_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l410_c3_a741_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l410_c3_a741_return_output := result_u8_value_MUX_uxn_opcodes_h_l410_c3_a741_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l410_c3_a741] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_a741_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_a741_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_a741_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_a741_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_a741_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_a741_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_a741_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_a741_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l400_c7_065a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_065a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_065a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_065a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_065a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_065a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_065a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_065a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_065a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l410_c3_a741] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_a741_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_a741_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_a741_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_a741_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_a741_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_a741_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_a741_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_a741_return_output;

     -- printf_uxn_opcodes_h_l393_c3_451c[uxn_opcodes_h_l393_c3_451c] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l393_c3_451c_uxn_opcodes_h_l393_c3_451c_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l393_c3_451c_uxn_opcodes_h_l393_c3_451c_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l410_c3_a741] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_a741_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_a741_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_a741_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_a741_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_a741_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_a741_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_a741_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_a741_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l400_c7_065a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_065a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_065a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_065a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_065a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_065a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_065a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_065a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_065a_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_7a22_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_cf25_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l410_c3_a741_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_a741_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_065a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_a741_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_065a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_a741_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l410_c3_a741_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse := VAR_t8_MUX_uxn_opcodes_h_l400_c7_065a_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l392_c2_ad21] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_ad21_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_ad21_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_ad21_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_ad21_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l403_c7_cf25] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_cf25_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_cf25_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_cf25_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_cf25_return_output;

     -- t8_MUX[uxn_opcodes_h_l392_c2_ad21] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l392_c2_ad21_cond <= VAR_t8_MUX_uxn_opcodes_h_l392_c2_ad21_cond;
     t8_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue;
     t8_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l392_c2_ad21_return_output := t8_MUX_uxn_opcodes_h_l392_c2_ad21_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l392_c2_ad21] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_ad21_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_ad21_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_ad21_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_ad21_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l408_c1_7a22] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_7a22_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_7a22_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_7a22_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_7a22_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_7a22_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_7a22_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_7a22_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_7a22_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l403_c7_cf25] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_cf25_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_cf25_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_cf25_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_cf25_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l403_c7_cf25] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l403_c7_cf25_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l403_c7_cf25_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l403_c7_cf25_return_output := has_written_to_t_MUX_uxn_opcodes_h_l403_c7_cf25_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l403_c7_cf25] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_cf25_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_cf25_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_cf25_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_cf25_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l403_c7_cf25] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l403_c7_cf25_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l403_c7_cf25_cond;
     result_u8_value_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l403_c7_cf25_return_output := result_u8_value_MUX_uxn_opcodes_h_l403_c7_cf25_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_80e2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_7a22_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l400_c7_065a_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l403_c7_cf25_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_065a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_cf25_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_065a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_cf25_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_065a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_cf25_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_065a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l403_c7_cf25_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l392_c2_ad21_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l400_c7_065a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l400_c7_065a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_065a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l400_c7_065a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_065a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l400_c7_065a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_065a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_065a_return_output := result_u8_value_MUX_uxn_opcodes_h_l400_c7_065a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l410_c1_80e2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_80e2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_80e2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_80e2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_80e2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_80e2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_80e2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_80e2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_80e2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l400_c7_065a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_065a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_065a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_065a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_065a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_065a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_065a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_065a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_065a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l400_c7_065a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_065a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_065a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_065a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_065a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_065a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_065a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_065a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_065a_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l400_c7_065a] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l400_c7_065a_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l400_c7_065a_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l400_c7_065a_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l400_c7_065a_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l400_c7_065a_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l400_c7_065a_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l400_c7_065a_return_output := has_written_to_t_MUX_uxn_opcodes_h_l400_c7_065a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l400_c7_065a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_065a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_065a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_065a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_065a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_065a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_065a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_065a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_065a_return_output;

     -- Submodule level 5
     VAR_device_in_uxn_opcodes_h_l411_c23_0d28_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_80e2_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l400_c7_065a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_065a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_065a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_065a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_065a_return_output;
     -- has_written_to_t_MUX[uxn_opcodes_h_l392_c2_ad21] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l392_c2_ad21_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l392_c2_ad21_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l392_c2_ad21_return_output := has_written_to_t_MUX_uxn_opcodes_h_l392_c2_ad21_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l392_c2_ad21] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l392_c2_ad21_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c2_ad21_cond;
     result_u8_value_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c2_ad21_return_output := result_u8_value_MUX_uxn_opcodes_h_l392_c2_ad21_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l392_c2_ad21] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_ad21_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_ad21_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_ad21_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_ad21_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l392_c2_ad21] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_ad21_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_ad21_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_ad21_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_ad21_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l392_c2_ad21] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_ad21_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_ad21_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_ad21_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_ad21_return_output;

     -- device_in[uxn_opcodes_h_l411_c23_0d28] LATENCY=0
     -- Clock enable
     device_in_uxn_opcodes_h_l411_c23_0d28_CLOCK_ENABLE <= VAR_device_in_uxn_opcodes_h_l411_c23_0d28_CLOCK_ENABLE;
     -- Inputs
     device_in_uxn_opcodes_h_l411_c23_0d28_device_address <= VAR_device_in_uxn_opcodes_h_l411_c23_0d28_device_address;
     device_in_uxn_opcodes_h_l411_c23_0d28_phase <= VAR_device_in_uxn_opcodes_h_l411_c23_0d28_phase;
     device_in_uxn_opcodes_h_l411_c23_0d28_previous_device_ram_read <= VAR_device_in_uxn_opcodes_h_l411_c23_0d28_previous_device_ram_read;
     -- Outputs
     VAR_device_in_uxn_opcodes_h_l411_c23_0d28_return_output := device_in_uxn_opcodes_h_l411_c23_0d28_return_output;

     -- Submodule level 6
     VAR_device_in_result_MUX_uxn_opcodes_h_l410_c3_a741_iftrue := VAR_device_in_uxn_opcodes_h_l411_c23_0d28_return_output;
     REG_VAR_has_written_to_t := VAR_has_written_to_t_MUX_uxn_opcodes_h_l392_c2_ad21_return_output;
     -- device_in_result_MUX[uxn_opcodes_h_l410_c3_a741] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l410_c3_a741_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l410_c3_a741_cond;
     device_in_result_MUX_uxn_opcodes_h_l410_c3_a741_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l410_c3_a741_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l410_c3_a741_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l410_c3_a741_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l410_c3_a741_return_output := device_in_result_MUX_uxn_opcodes_h_l410_c3_a741_return_output;

     -- CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d[uxn_opcodes_h_l412_c32_77d8] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l412_c32_77d8_return_output := VAR_device_in_uxn_opcodes_h_l411_c23_0d28_return_output.device_ram_address;

     -- Submodule level 7
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_a741_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l412_c32_77d8_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l410_c3_a741_return_output;
     -- device_in_result_MUX[uxn_opcodes_h_l403_c7_cf25] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l403_c7_cf25_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l403_c7_cf25_cond;
     device_in_result_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l403_c7_cf25_return_output := device_in_result_MUX_uxn_opcodes_h_l403_c7_cf25_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l410_c3_a741] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_a741_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_a741_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_a741_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_a741_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_a741_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_a741_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_a741_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_a741_return_output;

     -- Submodule level 8
     VAR_device_in_result_MUX_uxn_opcodes_h_l400_c7_065a_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l403_c7_cf25_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_a741_return_output;
     -- device_in_result_MUX[uxn_opcodes_h_l400_c7_065a] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l400_c7_065a_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l400_c7_065a_cond;
     device_in_result_MUX_uxn_opcodes_h_l400_c7_065a_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l400_c7_065a_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l400_c7_065a_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l400_c7_065a_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l400_c7_065a_return_output := device_in_result_MUX_uxn_opcodes_h_l400_c7_065a_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l403_c7_cf25] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_cf25_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_cf25_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_cf25_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_cf25_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_cf25_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_cf25_return_output;

     -- Submodule level 9
     VAR_device_in_result_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l400_c7_065a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_065a_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_cf25_return_output;
     -- device_in_result_MUX[uxn_opcodes_h_l392_c2_ad21] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l392_c2_ad21_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l392_c2_ad21_cond;
     device_in_result_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l392_c2_ad21_return_output := device_in_result_MUX_uxn_opcodes_h_l392_c2_ad21_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l400_c7_065a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_065a_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_065a_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_065a_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_065a_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_065a_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_065a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_065a_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_065a_return_output;

     -- Submodule level 10
     REG_VAR_device_in_result := VAR_device_in_result_MUX_uxn_opcodes_h_l392_c2_ad21_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_065a_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l392_c2_ad21] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_ad21_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_ad21_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_ad21_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_ad21_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_ad21_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_ad21_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_f08e_uxn_opcodes_h_l386_l426_DUPLICATE_b302 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f08e_uxn_opcodes_h_l386_l426_DUPLICATE_b302_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_f08e(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_ad21_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_ad21_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_ad21_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_ad21_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_ad21_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_ad21_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_ad21_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c2_ad21_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f08e_uxn_opcodes_h_l386_l426_DUPLICATE_b302_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f08e_uxn_opcodes_h_l386_l426_DUPLICATE_b302_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_has_written_to_t <= REG_VAR_has_written_to_t;
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_device_in_result <= REG_VAR_device_in_result;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     has_written_to_t <= REG_COMB_has_written_to_t;
     t8 <= REG_COMB_t8;
     device_in_result <= REG_COMB_device_in_result;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
