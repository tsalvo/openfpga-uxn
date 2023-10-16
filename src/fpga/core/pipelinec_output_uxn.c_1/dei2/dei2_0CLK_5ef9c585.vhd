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
-- Submodules: 95
entity dei2_0CLK_5ef9c585 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end dei2_0CLK_5ef9c585;
architecture arch of dei2_0CLK_5ef9c585 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal current_dei_phase : unsigned(7 downto 0) := to_unsigned(0, 8);
signal dei_param : unsigned(7 downto 0) := to_unsigned(0, 8);
signal is_first_dei_done : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_second_dei_done : unsigned(0 downto 0) := to_unsigned(0, 1);
signal has_written_to_t : unsigned(0 downto 0) := to_unsigned(0, 1);
signal has_written_to_n : unsigned(0 downto 0) := to_unsigned(0, 1);
signal device_in_result : device_in_result_t := device_in_result_t_NULL;
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_current_dei_phase : unsigned(7 downto 0);
signal REG_COMB_dei_param : unsigned(7 downto 0);
signal REG_COMB_is_first_dei_done : unsigned(0 downto 0);
signal REG_COMB_is_second_dei_done : unsigned(0 downto 0);
signal REG_COMB_has_written_to_t : unsigned(0 downto 0);
signal REG_COMB_has_written_to_n : unsigned(0 downto 0);
signal REG_COMB_device_in_result : device_in_result_t;
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l462_c6_5367]
signal BIN_OP_EQ_uxn_opcodes_h_l462_c6_5367_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l462_c6_5367_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l462_c6_5367_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l462_c1_f383]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_f383_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_f383_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_f383_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_f383_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l474_c7_1b47]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_1b47_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_1b47_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l462_c2_f796]
signal has_written_to_t_MUX_uxn_opcodes_h_l462_c2_f796_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l462_c2_f796_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l462_c2_f796_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l462_c2_f796_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l462_c2_f796]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_f796_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_f796_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_f796_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_f796_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l462_c2_f796]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_f796_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_f796_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_f796_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_f796_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l462_c2_f796]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_f796_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_f796_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_f796_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_f796_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l462_c2_f796]
signal result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_f796_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_f796_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_f796_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_f796_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l462_c2_f796]
signal result_u8_value_MUX_uxn_opcodes_h_l462_c2_f796_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l462_c2_f796_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l462_c2_f796_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l462_c2_f796_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l462_c2_f796]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_f796_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_f796_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_f796_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_f796_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l462_c2_f796]
signal result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_f796_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_f796_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_f796_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_f796_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l462_c2_f796]
signal result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_f796_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_f796_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_f796_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_f796_return_output : unsigned(7 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l462_c2_f796]
signal is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_f796_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_f796_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_f796_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_f796_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l462_c2_f796]
signal t8_MUX_uxn_opcodes_h_l462_c2_f796_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l462_c2_f796_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l462_c2_f796_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l462_c2_f796_return_output : unsigned(7 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l462_c2_f796]
signal current_dei_phase_MUX_uxn_opcodes_h_l462_c2_f796_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l462_c2_f796_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l462_c2_f796_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l462_c2_f796_return_output : unsigned(7 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l462_c2_f796]
signal is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_f796_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_f796_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_f796_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_f796_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l462_c2_f796]
signal device_in_result_MUX_uxn_opcodes_h_l462_c2_f796_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l462_c2_f796_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l462_c2_f796_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l462_c2_f796_return_output : device_in_result_t;

-- dei_param_MUX[uxn_opcodes_h_l462_c2_f796]
signal dei_param_MUX_uxn_opcodes_h_l462_c2_f796_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l462_c2_f796_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l462_c2_f796_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l462_c2_f796_return_output : unsigned(7 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l462_c2_f796]
signal has_written_to_n_MUX_uxn_opcodes_h_l462_c2_f796_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l462_c2_f796_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l462_c2_f796_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l462_c2_f796_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l463_c3_8f24[uxn_opcodes_h_l463_c3_8f24]
signal printf_uxn_opcodes_h_l463_c3_8f24_uxn_opcodes_h_l463_c3_8f24_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l474_c11_4fa7]
signal BIN_OP_EQ_uxn_opcodes_h_l474_c11_4fa7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l474_c11_4fa7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l474_c11_4fa7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l477_c7_6dcd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_6dcd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l474_c7_1b47]
signal has_written_to_t_MUX_uxn_opcodes_h_l474_c7_1b47_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l474_c7_1b47_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l474_c7_1b47]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_1b47_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_1b47_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l474_c7_1b47]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_1b47_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_1b47_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l474_c7_1b47]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_1b47_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_1b47_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l474_c7_1b47]
signal result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_1b47_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_1b47_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l474_c7_1b47]
signal result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_1b47_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_1b47_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l474_c7_1b47]
signal result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_1b47_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_1b47_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l474_c7_1b47]
signal result_u8_value_MUX_uxn_opcodes_h_l474_c7_1b47_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l474_c7_1b47_return_output : unsigned(7 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l474_c7_1b47]
signal is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l474_c7_1b47]
signal t8_MUX_uxn_opcodes_h_l474_c7_1b47_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l474_c7_1b47_return_output : unsigned(7 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l474_c7_1b47]
signal current_dei_phase_MUX_uxn_opcodes_h_l474_c7_1b47_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l474_c7_1b47_return_output : unsigned(7 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l474_c7_1b47]
signal is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l474_c7_1b47]
signal device_in_result_MUX_uxn_opcodes_h_l474_c7_1b47_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l474_c7_1b47_return_output : device_in_result_t;

-- dei_param_MUX[uxn_opcodes_h_l474_c7_1b47]
signal dei_param_MUX_uxn_opcodes_h_l474_c7_1b47_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l474_c7_1b47_return_output : unsigned(7 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l474_c7_1b47]
signal has_written_to_n_MUX_uxn_opcodes_h_l474_c7_1b47_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l474_c7_1b47_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l477_c11_8b76]
signal BIN_OP_EQ_uxn_opcodes_h_l477_c11_8b76_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l477_c11_8b76_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l477_c11_8b76_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l482_c1_e15d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_e15d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_e15d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_e15d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_e15d_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l477_c7_6dcd]
signal has_written_to_t_MUX_uxn_opcodes_h_l477_c7_6dcd_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l477_c7_6dcd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_6dcd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l477_c7_6dcd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_6dcd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l477_c7_6dcd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_6dcd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l477_c7_6dcd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_6dcd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l477_c7_6dcd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_6dcd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l477_c7_6dcd]
signal result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_6dcd_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l477_c7_6dcd]
signal result_u8_value_MUX_uxn_opcodes_h_l477_c7_6dcd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output : unsigned(7 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l477_c7_6dcd]
signal is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l477_c7_6dcd]
signal t8_MUX_uxn_opcodes_h_l477_c7_6dcd_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output : unsigned(7 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l477_c7_6dcd]
signal current_dei_phase_MUX_uxn_opcodes_h_l477_c7_6dcd_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output : unsigned(7 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l477_c7_6dcd]
signal is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l477_c7_6dcd]
signal device_in_result_MUX_uxn_opcodes_h_l477_c7_6dcd_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output : device_in_result_t;

-- dei_param_MUX[uxn_opcodes_h_l477_c7_6dcd]
signal dei_param_MUX_uxn_opcodes_h_l477_c7_6dcd_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output : unsigned(7 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l477_c7_6dcd]
signal has_written_to_n_MUX_uxn_opcodes_h_l477_c7_6dcd_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l480_c30_2004]
signal sp_relative_shift_uxn_opcodes_h_l480_c30_2004_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l480_c30_2004_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l480_c30_2004_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l480_c30_2004_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l484_c35_db2f]
signal BIN_OP_PLUS_uxn_opcodes_h_l484_c35_db2f_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l484_c35_db2f_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l484_c35_db2f_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l484_c15_4f9a]
signal MUX_uxn_opcodes_h_l484_c15_4f9a_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l484_c15_4f9a_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l484_c15_4f9a_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l484_c15_4f9a_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l485_c49_3015]
signal UNARY_OP_NOT_uxn_opcodes_h_l485_c49_3015_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l485_c49_3015_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l485_c29_041d]
signal BIN_OP_AND_uxn_opcodes_h_l485_c29_041d_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l485_c29_041d_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l485_c29_041d_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l485_c8_901d]
signal BIN_OP_OR_uxn_opcodes_h_l485_c8_901d_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l485_c8_901d_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l485_c8_901d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l485_c1_abbb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_abbb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_abbb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_abbb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_abbb_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l485_c3_6e5e]
signal has_written_to_t_MUX_uxn_opcodes_h_l485_c3_6e5e_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l485_c3_6e5e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_6e5e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l485_c3_6e5e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_6e5e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l485_c3_6e5e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_6e5e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l485_c3_6e5e]
signal result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_6e5e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l485_c3_6e5e]
signal result_u8_value_MUX_uxn_opcodes_h_l485_c3_6e5e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output : unsigned(7 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l485_c3_6e5e]
signal is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l485_c3_6e5e]
signal current_dei_phase_MUX_uxn_opcodes_h_l485_c3_6e5e_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output : unsigned(7 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l485_c3_6e5e]
signal is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l485_c3_6e5e]
signal device_in_result_MUX_uxn_opcodes_h_l485_c3_6e5e_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output : device_in_result_t;

-- has_written_to_n_MUX[uxn_opcodes_h_l485_c3_6e5e]
signal has_written_to_n_MUX_uxn_opcodes_h_l485_c3_6e5e_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output : unsigned(0 downto 0);

-- device_in[uxn_opcodes_h_l486_c23_2cb7]
signal device_in_uxn_opcodes_h_l486_c23_2cb7_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_in_uxn_opcodes_h_l486_c23_2cb7_device_address : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l486_c23_2cb7_phase : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l486_c23_2cb7_previous_device_ram_read : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l486_c23_2cb7_return_output : device_in_result_t;

-- BIN_OP_PLUS[uxn_opcodes_h_l489_c4_f407]
signal BIN_OP_PLUS_uxn_opcodes_h_l489_c4_f407_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l489_c4_f407_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l489_c4_f407_return_output : unsigned(8 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l490_c9_745f]
signal BIN_OP_AND_uxn_opcodes_h_l490_c9_745f_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l490_c9_745f_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l490_c9_745f_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l490_c4_895e]
signal is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_895e_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_895e_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_895e_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_895e_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l490_c4_895e]
signal is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_895e_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_895e_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_895e_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_895e_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l492_c11_a925]
signal is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_a925_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_a925_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_a925_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_a925_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l496_c13_0daa]
signal UNARY_OP_NOT_uxn_opcodes_h_l496_c13_0daa_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l496_c13_0daa_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l496_c8_c0d7]
signal has_written_to_t_MUX_uxn_opcodes_h_l496_c8_c0d7_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l496_c8_c0d7_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l496_c8_c0d7_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l496_c8_c0d7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l496_c8_c0d7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_c0d7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_c0d7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_c0d7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_c0d7_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l496_c8_c0d7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_c0d7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_c0d7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_c0d7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_c0d7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l496_c8_c0d7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_c0d7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_c0d7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_c0d7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_c0d7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l496_c8_c0d7]
signal result_u8_value_MUX_uxn_opcodes_h_l496_c8_c0d7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l496_c8_c0d7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l496_c8_c0d7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l496_c8_c0d7_return_output : unsigned(7 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l496_c8_c0d7]
signal current_dei_phase_MUX_uxn_opcodes_h_l496_c8_c0d7_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l496_c8_c0d7_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l496_c8_c0d7_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l496_c8_c0d7_return_output : unsigned(7 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l496_c8_c0d7]
signal has_written_to_n_MUX_uxn_opcodes_h_l496_c8_c0d7_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l496_c8_c0d7_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l496_c8_c0d7_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l496_c8_c0d7_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l503_c13_1175]
signal UNARY_OP_NOT_uxn_opcodes_h_l503_c13_1175_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l503_c13_1175_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l503_c8_0c9b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_0c9b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_0c9b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_0c9b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_0c9b_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l503_c8_0c9b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_0c9b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_0c9b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_0c9b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_0c9b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l503_c8_0c9b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_0c9b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_0c9b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_0c9b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_0c9b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l503_c8_0c9b]
signal result_u8_value_MUX_uxn_opcodes_h_l503_c8_0c9b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l503_c8_0c9b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l503_c8_0c9b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l503_c8_0c9b_return_output : unsigned(7 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l503_c8_0c9b]
signal has_written_to_n_MUX_uxn_opcodes_h_l503_c8_0c9b_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l503_c8_0c9b_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l503_c8_0c9b_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l503_c8_0c9b_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l485_DUPLICATE_0e63
signal UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l485_DUPLICATE_0e63_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l485_DUPLICATE_0e63_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_67ee( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_device_ram_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_stack_write := ref_toks_7;
      base.device_ram_address := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l462_c6_5367
BIN_OP_EQ_uxn_opcodes_h_l462_c6_5367 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l462_c6_5367_left,
BIN_OP_EQ_uxn_opcodes_h_l462_c6_5367_right,
BIN_OP_EQ_uxn_opcodes_h_l462_c6_5367_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_f383
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_f383 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_f383_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_f383_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_f383_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_f383_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_1b47
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_1b47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_1b47_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_1b47_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l462_c2_f796
has_written_to_t_MUX_uxn_opcodes_h_l462_c2_f796 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l462_c2_f796_cond,
has_written_to_t_MUX_uxn_opcodes_h_l462_c2_f796_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l462_c2_f796_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l462_c2_f796_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_f796
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_f796 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_f796_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_f796_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_f796_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_f796_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_f796
result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_f796 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_f796_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_f796_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_f796_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_f796_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_f796
result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_f796 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_f796_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_f796_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_f796_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_f796_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_f796
result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_f796 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_f796_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_f796_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_f796_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_f796_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l462_c2_f796
result_u8_value_MUX_uxn_opcodes_h_l462_c2_f796 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l462_c2_f796_cond,
result_u8_value_MUX_uxn_opcodes_h_l462_c2_f796_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l462_c2_f796_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l462_c2_f796_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_f796
result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_f796 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_f796_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_f796_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_f796_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_f796_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_f796
result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_f796 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_f796_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_f796_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_f796_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_f796_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_f796
result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_f796 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_f796_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_f796_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_f796_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_f796_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_f796
is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_f796 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_f796_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_f796_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_f796_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_f796_return_output);

-- t8_MUX_uxn_opcodes_h_l462_c2_f796
t8_MUX_uxn_opcodes_h_l462_c2_f796 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l462_c2_f796_cond,
t8_MUX_uxn_opcodes_h_l462_c2_f796_iftrue,
t8_MUX_uxn_opcodes_h_l462_c2_f796_iffalse,
t8_MUX_uxn_opcodes_h_l462_c2_f796_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l462_c2_f796
current_dei_phase_MUX_uxn_opcodes_h_l462_c2_f796 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l462_c2_f796_cond,
current_dei_phase_MUX_uxn_opcodes_h_l462_c2_f796_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l462_c2_f796_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l462_c2_f796_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_f796
is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_f796 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_f796_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_f796_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_f796_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_f796_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l462_c2_f796
device_in_result_MUX_uxn_opcodes_h_l462_c2_f796 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l462_c2_f796_cond,
device_in_result_MUX_uxn_opcodes_h_l462_c2_f796_iftrue,
device_in_result_MUX_uxn_opcodes_h_l462_c2_f796_iffalse,
device_in_result_MUX_uxn_opcodes_h_l462_c2_f796_return_output);

-- dei_param_MUX_uxn_opcodes_h_l462_c2_f796
dei_param_MUX_uxn_opcodes_h_l462_c2_f796 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l462_c2_f796_cond,
dei_param_MUX_uxn_opcodes_h_l462_c2_f796_iftrue,
dei_param_MUX_uxn_opcodes_h_l462_c2_f796_iffalse,
dei_param_MUX_uxn_opcodes_h_l462_c2_f796_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l462_c2_f796
has_written_to_n_MUX_uxn_opcodes_h_l462_c2_f796 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l462_c2_f796_cond,
has_written_to_n_MUX_uxn_opcodes_h_l462_c2_f796_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l462_c2_f796_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l462_c2_f796_return_output);

-- printf_uxn_opcodes_h_l463_c3_8f24_uxn_opcodes_h_l463_c3_8f24
printf_uxn_opcodes_h_l463_c3_8f24_uxn_opcodes_h_l463_c3_8f24 : entity work.printf_uxn_opcodes_h_l463_c3_8f24_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l463_c3_8f24_uxn_opcodes_h_l463_c3_8f24_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l474_c11_4fa7
BIN_OP_EQ_uxn_opcodes_h_l474_c11_4fa7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l474_c11_4fa7_left,
BIN_OP_EQ_uxn_opcodes_h_l474_c11_4fa7_right,
BIN_OP_EQ_uxn_opcodes_h_l474_c11_4fa7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_6dcd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_6dcd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_6dcd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l474_c7_1b47
has_written_to_t_MUX_uxn_opcodes_h_l474_c7_1b47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l474_c7_1b47_cond,
has_written_to_t_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l474_c7_1b47_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_1b47
result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_1b47 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_1b47_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_1b47_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_1b47
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_1b47 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_1b47_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_1b47_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_1b47
result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_1b47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_1b47_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_1b47_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_1b47
result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_1b47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_1b47_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_1b47_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_1b47
result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_1b47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_1b47_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_1b47_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_1b47
result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_1b47 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_1b47_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_1b47_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l474_c7_1b47
result_u8_value_MUX_uxn_opcodes_h_l474_c7_1b47 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l474_c7_1b47_cond,
result_u8_value_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l474_c7_1b47_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47
is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47_return_output);

-- t8_MUX_uxn_opcodes_h_l474_c7_1b47
t8_MUX_uxn_opcodes_h_l474_c7_1b47 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l474_c7_1b47_cond,
t8_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue,
t8_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse,
t8_MUX_uxn_opcodes_h_l474_c7_1b47_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l474_c7_1b47
current_dei_phase_MUX_uxn_opcodes_h_l474_c7_1b47 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l474_c7_1b47_cond,
current_dei_phase_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l474_c7_1b47_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47
is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l474_c7_1b47
device_in_result_MUX_uxn_opcodes_h_l474_c7_1b47 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l474_c7_1b47_cond,
device_in_result_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue,
device_in_result_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse,
device_in_result_MUX_uxn_opcodes_h_l474_c7_1b47_return_output);

-- dei_param_MUX_uxn_opcodes_h_l474_c7_1b47
dei_param_MUX_uxn_opcodes_h_l474_c7_1b47 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l474_c7_1b47_cond,
dei_param_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue,
dei_param_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse,
dei_param_MUX_uxn_opcodes_h_l474_c7_1b47_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l474_c7_1b47
has_written_to_n_MUX_uxn_opcodes_h_l474_c7_1b47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l474_c7_1b47_cond,
has_written_to_n_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l474_c7_1b47_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l477_c11_8b76
BIN_OP_EQ_uxn_opcodes_h_l477_c11_8b76 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l477_c11_8b76_left,
BIN_OP_EQ_uxn_opcodes_h_l477_c11_8b76_right,
BIN_OP_EQ_uxn_opcodes_h_l477_c11_8b76_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_e15d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_e15d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_e15d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_e15d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_e15d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_e15d_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l477_c7_6dcd
has_written_to_t_MUX_uxn_opcodes_h_l477_c7_6dcd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l477_c7_6dcd_cond,
has_written_to_t_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_6dcd
result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_6dcd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_6dcd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_6dcd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_6dcd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_6dcd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_6dcd
result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_6dcd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_6dcd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_6dcd
result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_6dcd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_6dcd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_6dcd
result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_6dcd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_6dcd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_6dcd
result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_6dcd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_6dcd_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l477_c7_6dcd
result_u8_value_MUX_uxn_opcodes_h_l477_c7_6dcd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l477_c7_6dcd_cond,
result_u8_value_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd
is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output);

-- t8_MUX_uxn_opcodes_h_l477_c7_6dcd
t8_MUX_uxn_opcodes_h_l477_c7_6dcd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l477_c7_6dcd_cond,
t8_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue,
t8_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse,
t8_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l477_c7_6dcd
current_dei_phase_MUX_uxn_opcodes_h_l477_c7_6dcd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l477_c7_6dcd_cond,
current_dei_phase_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd
is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l477_c7_6dcd
device_in_result_MUX_uxn_opcodes_h_l477_c7_6dcd : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l477_c7_6dcd_cond,
device_in_result_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue,
device_in_result_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse,
device_in_result_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output);

-- dei_param_MUX_uxn_opcodes_h_l477_c7_6dcd
dei_param_MUX_uxn_opcodes_h_l477_c7_6dcd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l477_c7_6dcd_cond,
dei_param_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue,
dei_param_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse,
dei_param_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l477_c7_6dcd
has_written_to_n_MUX_uxn_opcodes_h_l477_c7_6dcd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l477_c7_6dcd_cond,
has_written_to_n_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output);

-- sp_relative_shift_uxn_opcodes_h_l480_c30_2004
sp_relative_shift_uxn_opcodes_h_l480_c30_2004 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l480_c30_2004_ins,
sp_relative_shift_uxn_opcodes_h_l480_c30_2004_x,
sp_relative_shift_uxn_opcodes_h_l480_c30_2004_y,
sp_relative_shift_uxn_opcodes_h_l480_c30_2004_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l484_c35_db2f
BIN_OP_PLUS_uxn_opcodes_h_l484_c35_db2f : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l484_c35_db2f_left,
BIN_OP_PLUS_uxn_opcodes_h_l484_c35_db2f_right,
BIN_OP_PLUS_uxn_opcodes_h_l484_c35_db2f_return_output);

-- MUX_uxn_opcodes_h_l484_c15_4f9a
MUX_uxn_opcodes_h_l484_c15_4f9a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l484_c15_4f9a_cond,
MUX_uxn_opcodes_h_l484_c15_4f9a_iftrue,
MUX_uxn_opcodes_h_l484_c15_4f9a_iffalse,
MUX_uxn_opcodes_h_l484_c15_4f9a_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l485_c49_3015
UNARY_OP_NOT_uxn_opcodes_h_l485_c49_3015 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l485_c49_3015_expr,
UNARY_OP_NOT_uxn_opcodes_h_l485_c49_3015_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l485_c29_041d
BIN_OP_AND_uxn_opcodes_h_l485_c29_041d : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l485_c29_041d_left,
BIN_OP_AND_uxn_opcodes_h_l485_c29_041d_right,
BIN_OP_AND_uxn_opcodes_h_l485_c29_041d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l485_c8_901d
BIN_OP_OR_uxn_opcodes_h_l485_c8_901d : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l485_c8_901d_left,
BIN_OP_OR_uxn_opcodes_h_l485_c8_901d_right,
BIN_OP_OR_uxn_opcodes_h_l485_c8_901d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_abbb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_abbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_abbb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_abbb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_abbb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_abbb_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l485_c3_6e5e
has_written_to_t_MUX_uxn_opcodes_h_l485_c3_6e5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l485_c3_6e5e_cond,
has_written_to_t_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_6e5e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_6e5e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_6e5e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_6e5e
result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_6e5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_6e5e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_6e5e
result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_6e5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_6e5e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_6e5e
result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_6e5e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_6e5e_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l485_c3_6e5e
result_u8_value_MUX_uxn_opcodes_h_l485_c3_6e5e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l485_c3_6e5e_cond,
result_u8_value_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e
is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l485_c3_6e5e
current_dei_phase_MUX_uxn_opcodes_h_l485_c3_6e5e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l485_c3_6e5e_cond,
current_dei_phase_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e
is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l485_c3_6e5e
device_in_result_MUX_uxn_opcodes_h_l485_c3_6e5e : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l485_c3_6e5e_cond,
device_in_result_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue,
device_in_result_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse,
device_in_result_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l485_c3_6e5e
has_written_to_n_MUX_uxn_opcodes_h_l485_c3_6e5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l485_c3_6e5e_cond,
has_written_to_n_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output);

-- device_in_uxn_opcodes_h_l486_c23_2cb7
device_in_uxn_opcodes_h_l486_c23_2cb7 : entity work.device_in_0CLK_5af1a430 port map (
clk,
device_in_uxn_opcodes_h_l486_c23_2cb7_CLOCK_ENABLE,
device_in_uxn_opcodes_h_l486_c23_2cb7_device_address,
device_in_uxn_opcodes_h_l486_c23_2cb7_phase,
device_in_uxn_opcodes_h_l486_c23_2cb7_previous_device_ram_read,
device_in_uxn_opcodes_h_l486_c23_2cb7_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l489_c4_f407
BIN_OP_PLUS_uxn_opcodes_h_l489_c4_f407 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l489_c4_f407_left,
BIN_OP_PLUS_uxn_opcodes_h_l489_c4_f407_right,
BIN_OP_PLUS_uxn_opcodes_h_l489_c4_f407_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l490_c9_745f
BIN_OP_AND_uxn_opcodes_h_l490_c9_745f : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l490_c9_745f_left,
BIN_OP_AND_uxn_opcodes_h_l490_c9_745f_right,
BIN_OP_AND_uxn_opcodes_h_l490_c9_745f_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_895e
is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_895e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_895e_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_895e_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_895e_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_895e_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_895e
is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_895e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_895e_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_895e_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_895e_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_895e_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_a925
is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_a925 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_a925_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_a925_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_a925_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_a925_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l496_c13_0daa
UNARY_OP_NOT_uxn_opcodes_h_l496_c13_0daa : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l496_c13_0daa_expr,
UNARY_OP_NOT_uxn_opcodes_h_l496_c13_0daa_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l496_c8_c0d7
has_written_to_t_MUX_uxn_opcodes_h_l496_c8_c0d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l496_c8_c0d7_cond,
has_written_to_t_MUX_uxn_opcodes_h_l496_c8_c0d7_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l496_c8_c0d7_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l496_c8_c0d7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_c0d7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_c0d7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_c0d7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_c0d7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_c0d7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_c0d7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_c0d7
result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_c0d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_c0d7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_c0d7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_c0d7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_c0d7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_c0d7
result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_c0d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_c0d7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_c0d7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_c0d7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_c0d7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l496_c8_c0d7
result_u8_value_MUX_uxn_opcodes_h_l496_c8_c0d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l496_c8_c0d7_cond,
result_u8_value_MUX_uxn_opcodes_h_l496_c8_c0d7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l496_c8_c0d7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l496_c8_c0d7_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l496_c8_c0d7
current_dei_phase_MUX_uxn_opcodes_h_l496_c8_c0d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l496_c8_c0d7_cond,
current_dei_phase_MUX_uxn_opcodes_h_l496_c8_c0d7_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l496_c8_c0d7_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l496_c8_c0d7_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l496_c8_c0d7
has_written_to_n_MUX_uxn_opcodes_h_l496_c8_c0d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l496_c8_c0d7_cond,
has_written_to_n_MUX_uxn_opcodes_h_l496_c8_c0d7_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l496_c8_c0d7_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l496_c8_c0d7_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l503_c13_1175
UNARY_OP_NOT_uxn_opcodes_h_l503_c13_1175 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l503_c13_1175_expr,
UNARY_OP_NOT_uxn_opcodes_h_l503_c13_1175_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_0c9b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_0c9b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_0c9b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_0c9b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_0c9b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_0c9b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_0c9b
result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_0c9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_0c9b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_0c9b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_0c9b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_0c9b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_0c9b
result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_0c9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_0c9b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_0c9b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_0c9b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_0c9b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l503_c8_0c9b
result_u8_value_MUX_uxn_opcodes_h_l503_c8_0c9b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l503_c8_0c9b_cond,
result_u8_value_MUX_uxn_opcodes_h_l503_c8_0c9b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l503_c8_0c9b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l503_c8_0c9b_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l503_c8_0c9b
has_written_to_n_MUX_uxn_opcodes_h_l503_c8_0c9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l503_c8_0c9b_cond,
has_written_to_n_MUX_uxn_opcodes_h_l503_c8_0c9b_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l503_c8_0c9b_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l503_c8_0c9b_return_output);

-- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l485_DUPLICATE_0e63
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l485_DUPLICATE_0e63 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l485_DUPLICATE_0e63_expr,
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l485_DUPLICATE_0e63_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_device_ram_read,
 -- Registers
 t8,
 current_dei_phase,
 dei_param,
 is_first_dei_done,
 is_second_dei_done,
 has_written_to_t,
 has_written_to_n,
 device_in_result,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l462_c6_5367_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_f383_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_1b47_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l462_c2_f796_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_f796_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_f796_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_f796_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_f796_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l462_c2_f796_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_f796_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_f796_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_f796_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_f796_return_output,
 t8_MUX_uxn_opcodes_h_l462_c2_f796_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l462_c2_f796_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_f796_return_output,
 device_in_result_MUX_uxn_opcodes_h_l462_c2_f796_return_output,
 dei_param_MUX_uxn_opcodes_h_l462_c2_f796_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l462_c2_f796_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l474_c11_4fa7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l474_c7_1b47_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_1b47_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_1b47_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_1b47_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_1b47_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_1b47_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_1b47_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l474_c7_1b47_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47_return_output,
 t8_MUX_uxn_opcodes_h_l474_c7_1b47_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l474_c7_1b47_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47_return_output,
 device_in_result_MUX_uxn_opcodes_h_l474_c7_1b47_return_output,
 dei_param_MUX_uxn_opcodes_h_l474_c7_1b47_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l474_c7_1b47_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l477_c11_8b76_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_e15d_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output,
 t8_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output,
 device_in_result_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output,
 dei_param_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output,
 sp_relative_shift_uxn_opcodes_h_l480_c30_2004_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l484_c35_db2f_return_output,
 MUX_uxn_opcodes_h_l484_c15_4f9a_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l485_c49_3015_return_output,
 BIN_OP_AND_uxn_opcodes_h_l485_c29_041d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l485_c8_901d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_abbb_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output,
 device_in_result_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output,
 device_in_uxn_opcodes_h_l486_c23_2cb7_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l489_c4_f407_return_output,
 BIN_OP_AND_uxn_opcodes_h_l490_c9_745f_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_895e_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_895e_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_a925_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l496_c13_0daa_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l496_c8_c0d7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_c0d7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_c0d7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_c0d7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l496_c8_c0d7_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l496_c8_c0d7_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l496_c8_c0d7_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l503_c13_1175_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_0c9b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_0c9b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_0c9b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l503_c8_0c9b_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l503_c8_0c9b_return_output,
 UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l485_DUPLICATE_0e63_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_5367_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_5367_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_5367_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_f383_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_f383_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_f383_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_f383_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_1b47_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_1b47_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l462_c2_f796_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l462_c2_f796_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l474_c7_1b47_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l462_c2_f796_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l462_c2_f796_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_f796_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l469_c3_910b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_f796_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_1b47_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_f796_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_f796_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_f796_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_f796_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_1b47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_f796_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_f796_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_f796_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_f796_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l462_c2_f796_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_f796_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_f796_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_f796_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_f796_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_1b47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_f796_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_f796_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l462_c2_f796_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l462_c2_f796_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l474_c7_1b47_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l462_c2_f796_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l462_c2_f796_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_f796_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_f796_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_1b47_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_f796_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_f796_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_f796_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_f796_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_1b47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_f796_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_f796_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_f796_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_f796_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_1b47_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_f796_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_f796_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_f796_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_f796_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_f796_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_f796_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l462_c2_f796_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l462_c2_f796_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l474_c7_1b47_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l462_c2_f796_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l462_c2_f796_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l462_c2_f796_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l468_c3_5ffd : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l462_c2_f796_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l474_c7_1b47_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l462_c2_f796_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l462_c2_f796_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_f796_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_f796_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_f796_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_f796_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l462_c2_f796_iftrue : device_in_result_t;
 variable VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l462_c2_f796_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l462_c2_f796_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l474_c7_1b47_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l462_c2_f796_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l462_c2_f796_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l462_c2_f796_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l462_c2_f796_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l474_c7_1b47_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l462_c2_f796_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l462_c2_f796_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l462_c2_f796_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l462_c2_f796_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l474_c7_1b47_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l462_c2_f796_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l462_c2_f796_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l463_c3_8f24_uxn_opcodes_h_l463_c3_8f24_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_4fa7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_4fa7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_4fa7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_6dcd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l474_c7_1b47_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_1b47_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l475_c3_4488 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_1b47_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_1b47_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_1b47_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_1b47_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_1b47_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l474_c7_1b47_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l474_c7_1b47_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l474_c7_1b47_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l474_c7_1b47_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l474_c7_1b47_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l474_c7_1b47_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_8b76_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_8b76_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_8b76_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_e15d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_e15d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_e15d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_e15d_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_6dcd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_6dcd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_6dcd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_6dcd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_6dcd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_6dcd_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_6dcd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c7_6dcd_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l477_c7_6dcd_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_6dcd_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_6dcd_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_6dcd_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_6dcd_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l480_c30_2004_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l480_c30_2004_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l480_c30_2004_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l480_c30_2004_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l484_c15_4f9a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l484_c15_4f9a_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l484_c15_4f9a_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l484_c35_db2f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l484_c35_db2f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l484_c35_db2f_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l484_c15_4f9a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l485_c8_901d_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l485_c29_041d_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l485_c49_3015_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l485_c49_3015_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l485_c29_041d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l485_c29_041d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l485_c8_901d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l485_c8_901d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_abbb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_abbb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_abbb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_abbb_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l496_c8_c0d7_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l485_c3_6e5e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_c0d7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_6e5e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_c0d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_6e5e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_c0d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_6e5e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_6e5e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l496_c8_c0d7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l485_c3_6e5e_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_895e_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l489_c4_35da : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l496_c8_c0d7_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l485_c3_6e5e_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_895e_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l485_c3_6e5e_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l496_c8_c0d7_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l485_c3_6e5e_cond : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l486_c23_2cb7_device_address : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l486_c23_2cb7_phase : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l486_c23_2cb7_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l486_c23_2cb7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l486_c23_2cb7_return_output : device_in_result_t;
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l487_c32_ce9b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l489_c4_f407_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l489_c4_f407_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l489_c4_f407_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l490_c9_745f_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l490_c9_745f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l490_c9_745f_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_895e_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_895e_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_a925_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_895e_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_895e_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_895e_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_895e_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_a925_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_a925_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_a925_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l496_c13_0daa_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l496_c13_0daa_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l496_c8_c0d7_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l496_c8_c0d7_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l496_c8_c0d7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_c0d7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l499_c4_98aa : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_c0d7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_0c9b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_c0d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_c0d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_c0d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_0c9b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_c0d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_c0d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_c0d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_0c9b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_c0d7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l496_c8_c0d7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l496_c8_c0d7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c8_0c9b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l496_c8_c0d7_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l496_c8_c0d7_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l497_c4_dcad : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l496_c8_c0d7_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l496_c8_c0d7_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l496_c8_c0d7_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l496_c8_c0d7_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l503_c8_0c9b_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l496_c8_c0d7_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l503_c13_1175_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l503_c13_1175_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_0c9b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l504_c4_5d51 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_0c9b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_0c9b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_0c9b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_0c9b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_0c9b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_0c9b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_0c9b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_0c9b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c8_0c9b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c8_0c9b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c8_0c9b_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l503_c8_0c9b_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l503_c8_0c9b_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l503_c8_0c9b_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l474_l462_DUPLICATE_c2f5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l503_l462_l477_l474_l485_DUPLICATE_4a44_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l474_l462_l477_DUPLICATE_e7ab_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l474_l462_l477_l503_DUPLICATE_9516_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l474_l462_l485_l477_DUPLICATE_b7f0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l503_l477_l474_l485_l496_DUPLICATE_210e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l503_l485_l477_DUPLICATE_b198_return_output : unsigned(3 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l485_DUPLICATE_0e63_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l485_DUPLICATE_0e63_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l490_l492_DUPLICATE_1db6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l505_l500_DUPLICATE_fd11_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_67ee_uxn_opcodes_h_l456_l514_DUPLICATE_629c_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_current_dei_phase : unsigned(7 downto 0);
variable REG_VAR_dei_param : unsigned(7 downto 0);
variable REG_VAR_is_first_dei_done : unsigned(0 downto 0);
variable REG_VAR_is_second_dei_done : unsigned(0 downto 0);
variable REG_VAR_has_written_to_t : unsigned(0 downto 0);
variable REG_VAR_has_written_to_n : unsigned(0 downto 0);
variable REG_VAR_device_in_result : device_in_result_t;
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_current_dei_phase := current_dei_phase;
  REG_VAR_dei_param := dei_param;
  REG_VAR_is_first_dei_done := is_first_dei_done;
  REG_VAR_is_second_dei_done := is_second_dei_done;
  REG_VAR_has_written_to_t := has_written_to_t;
  REG_VAR_has_written_to_n := has_written_to_n;
  REG_VAR_device_in_result := device_in_result;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_a925_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l480_c30_2004_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l462_c2_f796_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_f796_iftrue := to_unsigned(0, 1);
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l503_c8_0c9b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_5367_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_e15d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l504_c4_5d51 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_0c9b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l504_c4_5d51;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_abbb_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_f383_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l499_c4_98aa := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_c0d7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l499_c4_98aa;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse := to_unsigned(0, 1);
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_f796_iftrue := to_unsigned(0, 1);
     VAR_current_dei_phase_uxn_opcodes_h_l497_c4_dcad := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l496_c8_c0d7_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l497_c4_dcad;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l469_c3_910b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_f796_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l469_c3_910b;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_0c9b_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l489_c4_f407_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_c0d7_iftrue := to_unsigned(1, 1);
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_f796_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_8b76_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l484_c35_db2f_right := to_unsigned(1, 1);
     VAR_current_dei_phase_uxn_opcodes_h_l468_c3_5ffd := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l462_c2_f796_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l468_c3_5ffd;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_f796_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_4fa7_right := to_unsigned(1, 1);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l462_c2_f796_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue := to_unsigned(1, 1);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l496_c8_c0d7_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l480_c30_2004_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l475_c3_4488 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l475_c3_4488;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_895e_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_0c9b_iffalse := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_f383_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l489_c4_f407_left := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l496_c8_c0d7_iffalse := current_dei_phase;
     VAR_device_in_uxn_opcodes_h_l486_c23_2cb7_phase := current_dei_phase;
     VAR_dei_param_MUX_uxn_opcodes_h_l462_c2_f796_iftrue := dei_param;
     VAR_dei_param_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue := dei_param;
     VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue := dei_param;
     VAR_device_in_result_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse := device_in_result;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l503_c13_1175_expr := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l496_c8_c0d7_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l503_c8_0c9b_iffalse := has_written_to_n;
     VAR_BIN_OP_AND_uxn_opcodes_h_l485_c29_041d_left := has_written_to_t;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l496_c13_0daa_expr := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l496_c8_c0d7_iffalse := has_written_to_t;
     VAR_sp_relative_shift_uxn_opcodes_h_l480_c30_2004_ins := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l484_c15_4f9a_cond := is_first_dei_done;
     VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l485_DUPLICATE_0e63_expr := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_895e_iffalse := is_first_dei_done;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l485_c49_3015_expr := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_895e_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_a925_iffalse := is_second_dei_done;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_5367_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_4fa7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_8b76_left := VAR_phase;
     VAR_device_in_uxn_opcodes_h_l486_c23_2cb7_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l484_c35_db2f_left := t8;
     VAR_MUX_uxn_opcodes_h_l484_c15_4f9a_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l462_c2_f796_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l474_l462_DUPLICATE_c2f5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l474_l462_DUPLICATE_c2f5_return_output := result.is_sp_shift;

     -- sp_relative_shift[uxn_opcodes_h_l480_c30_2004] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l480_c30_2004_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l480_c30_2004_ins;
     sp_relative_shift_uxn_opcodes_h_l480_c30_2004_x <= VAR_sp_relative_shift_uxn_opcodes_h_l480_c30_2004_x;
     sp_relative_shift_uxn_opcodes_h_l480_c30_2004_y <= VAR_sp_relative_shift_uxn_opcodes_h_l480_c30_2004_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l480_c30_2004_return_output := sp_relative_shift_uxn_opcodes_h_l480_c30_2004_return_output;

     -- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l485_DUPLICATE_0e63 LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l485_DUPLICATE_0e63_expr <= VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l485_DUPLICATE_0e63_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l485_DUPLICATE_0e63_return_output := UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l485_DUPLICATE_0e63_return_output;

     -- device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6[uxn_opcodes_h_l462_c2_f796] LATENCY=0
     VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l462_c2_f796_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6(
     device_in_result,
     to_unsigned(0, 1));

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l474_l462_l485_l477_DUPLICATE_b7f0 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l474_l462_l485_l477_DUPLICATE_b7f0_return_output := result.device_ram_address;

     -- UNARY_OP_NOT[uxn_opcodes_h_l496_c13_0daa] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l496_c13_0daa_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l496_c13_0daa_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l496_c13_0daa_return_output := UNARY_OP_NOT_uxn_opcodes_h_l496_c13_0daa_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l474_l462_l477_l503_DUPLICATE_9516 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l474_l462_l477_l503_DUPLICATE_9516_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l503_l485_l477_DUPLICATE_b198 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l503_l485_l477_DUPLICATE_b198_return_output := result.stack_address_sp_offset;

     -- BIN_OP_PLUS[uxn_opcodes_h_l489_c4_f407] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l489_c4_f407_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l489_c4_f407_left;
     BIN_OP_PLUS_uxn_opcodes_h_l489_c4_f407_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l489_c4_f407_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l489_c4_f407_return_output := BIN_OP_PLUS_uxn_opcodes_h_l489_c4_f407_return_output;

     -- CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l505_l500_DUPLICATE_fd11 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l505_l500_DUPLICATE_fd11_return_output := device_in_result.dei_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l462_c6_5367] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l462_c6_5367_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_5367_left;
     BIN_OP_EQ_uxn_opcodes_h_l462_c6_5367_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_5367_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_5367_return_output := BIN_OP_EQ_uxn_opcodes_h_l462_c6_5367_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l474_c11_4fa7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l474_c11_4fa7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_4fa7_left;
     BIN_OP_EQ_uxn_opcodes_h_l474_c11_4fa7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_4fa7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_4fa7_return_output := BIN_OP_EQ_uxn_opcodes_h_l474_c11_4fa7_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l503_c13_1175] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l503_c13_1175_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l503_c13_1175_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l503_c13_1175_return_output := UNARY_OP_NOT_uxn_opcodes_h_l503_c13_1175_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l484_c35_db2f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l484_c35_db2f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l484_c35_db2f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l484_c35_db2f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l484_c35_db2f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l484_c35_db2f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l484_c35_db2f_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l503_l462_l477_l474_l485_DUPLICATE_4a44 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l503_l462_l477_l474_l485_DUPLICATE_4a44_return_output := result.u8_value;

     -- UNARY_OP_NOT[uxn_opcodes_h_l485_c49_3015] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l485_c49_3015_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l485_c49_3015_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l485_c49_3015_return_output := UNARY_OP_NOT_uxn_opcodes_h_l485_c49_3015_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l474_l462_l477_DUPLICATE_e7ab LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l474_l462_l477_DUPLICATE_e7ab_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l477_c11_8b76] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l477_c11_8b76_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_8b76_left;
     BIN_OP_EQ_uxn_opcodes_h_l477_c11_8b76_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_8b76_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_8b76_return_output := BIN_OP_EQ_uxn_opcodes_h_l477_c11_8b76_return_output;

     -- result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l462_c2_f796] LATENCY=0
     VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l462_c2_f796_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l503_l477_l474_l485_l496_DUPLICATE_210e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l503_l477_l474_l485_l496_DUPLICATE_210e_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_1b47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_5367_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_f383_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_5367_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l462_c2_f796_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_5367_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l462_c2_f796_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_5367_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l462_c2_f796_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_5367_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l462_c2_f796_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_5367_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l462_c2_f796_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_5367_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_f796_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_5367_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_f796_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_5367_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_f796_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_5367_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_f796_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_5367_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_f796_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_5367_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_f796_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_5367_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_f796_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_5367_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_f796_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_5367_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_f796_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_5367_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l462_c2_f796_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_5367_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l462_c2_f796_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_5367_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_6dcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_4fa7_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l474_c7_1b47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_4fa7_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l474_c7_1b47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_4fa7_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l474_c7_1b47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_4fa7_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l474_c7_1b47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_4fa7_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l474_c7_1b47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_4fa7_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_4fa7_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_4fa7_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_1b47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_4fa7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_1b47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_4fa7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_1b47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_4fa7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_1b47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_4fa7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_1b47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_4fa7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_1b47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_4fa7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l474_c7_1b47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_4fa7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l474_c7_1b47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_4fa7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_e15d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_8b76_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_6dcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_8b76_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_6dcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_8b76_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_6dcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_8b76_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_6dcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_8b76_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_6dcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_8b76_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_8b76_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_8b76_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_6dcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_8b76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_6dcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_8b76_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_6dcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_8b76_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_6dcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_8b76_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_6dcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_8b76_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_6dcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_8b76_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c7_6dcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_8b76_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l477_c7_6dcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_8b76_return_output;
     VAR_MUX_uxn_opcodes_h_l484_c15_4f9a_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l484_c35_db2f_return_output, 8);
     VAR_current_dei_phase_uxn_opcodes_h_l489_c4_35da := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l489_c4_f407_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_f796_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l474_l462_l477_DUPLICATE_e7ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l474_l462_l477_DUPLICATE_e7ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l474_l462_l477_DUPLICATE_e7ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l503_l477_l474_l485_l496_DUPLICATE_210e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l503_l477_l474_l485_l496_DUPLICATE_210e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l503_l477_l474_l485_l496_DUPLICATE_210e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_c0d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l503_l477_l474_l485_l496_DUPLICATE_210e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_0c9b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l503_l477_l474_l485_l496_DUPLICATE_210e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_f796_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l474_l462_DUPLICATE_c2f5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l474_l462_DUPLICATE_c2f5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_f796_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l474_l462_l477_l503_DUPLICATE_9516_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l474_l462_l477_l503_DUPLICATE_9516_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l474_l462_l477_l503_DUPLICATE_9516_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_0c9b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l474_l462_l477_l503_DUPLICATE_9516_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l503_l485_l477_DUPLICATE_b198_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l503_l485_l477_DUPLICATE_b198_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_0c9b_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l503_l485_l477_DUPLICATE_b198_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l496_c8_c0d7_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l505_l500_DUPLICATE_fd11_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c8_0c9b_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l505_l500_DUPLICATE_fd11_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_f796_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l474_l462_l485_l477_DUPLICATE_b7f0_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l474_l462_l485_l477_DUPLICATE_b7f0_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l474_l462_l485_l477_DUPLICATE_b7f0_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l474_l462_l485_l477_DUPLICATE_b7f0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l462_c2_f796_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l503_l462_l477_l474_l485_DUPLICATE_4a44_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l503_l462_l477_l474_l485_DUPLICATE_4a44_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l503_l462_l477_l474_l485_DUPLICATE_4a44_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l503_l462_l477_l474_l485_DUPLICATE_4a44_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c8_0c9b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l503_l462_l477_l474_l485_DUPLICATE_4a44_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l485_c29_041d_right := VAR_UNARY_OP_NOT_uxn_opcodes_h_l485_c49_3015_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l496_c8_c0d7_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l496_c13_0daa_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l496_c8_c0d7_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l496_c13_0daa_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l496_c8_c0d7_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l496_c13_0daa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_c0d7_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l496_c13_0daa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_c0d7_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l496_c13_0daa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_c0d7_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l496_c13_0daa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l496_c8_c0d7_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l496_c13_0daa_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l503_c8_0c9b_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l503_c13_1175_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_0c9b_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l503_c13_1175_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_0c9b_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l503_c13_1175_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_0c9b_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l503_c13_1175_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c8_0c9b_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l503_c13_1175_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l490_c9_745f_left := VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l485_DUPLICATE_0e63_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l485_c8_901d_left := VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l485_DUPLICATE_0e63_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l462_c2_f796_iftrue := VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l462_c2_f796_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_f796_iffalse := VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l462_c2_f796_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l480_c30_2004_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l489_c4_35da;
     -- result_u8_value_MUX[uxn_opcodes_h_l503_c8_0c9b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l503_c8_0c9b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c8_0c9b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l503_c8_0c9b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c8_0c9b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l503_c8_0c9b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c8_0c9b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c8_0c9b_return_output := result_u8_value_MUX_uxn_opcodes_h_l503_c8_0c9b_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l496_c8_c0d7] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l496_c8_c0d7_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l496_c8_c0d7_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l496_c8_c0d7_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l496_c8_c0d7_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l496_c8_c0d7_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l496_c8_c0d7_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l496_c8_c0d7_return_output := current_dei_phase_MUX_uxn_opcodes_h_l496_c8_c0d7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l474_c7_1b47] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_1b47_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_1b47_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_1b47_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_1b47_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l503_c8_0c9b] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l503_c8_0c9b_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l503_c8_0c9b_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l503_c8_0c9b_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l503_c8_0c9b_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l503_c8_0c9b_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l503_c8_0c9b_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l503_c8_0c9b_return_output := has_written_to_n_MUX_uxn_opcodes_h_l503_c8_0c9b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l503_c8_0c9b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_0c9b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_0c9b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_0c9b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_0c9b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_0c9b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_0c9b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_0c9b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_0c9b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l477_c7_6dcd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_6dcd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_6dcd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l462_c1_f383] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_f383_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_f383_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_f383_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_f383_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_f383_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_f383_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_f383_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_f383_return_output;

     -- t8_MUX[uxn_opcodes_h_l477_c7_6dcd] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l477_c7_6dcd_cond <= VAR_t8_MUX_uxn_opcodes_h_l477_c7_6dcd_cond;
     t8_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue;
     t8_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output := t8_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l462_c2_f796] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_f796_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_f796_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_f796_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_f796_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_f796_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_f796_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_f796_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_f796_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l477_c7_6dcd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_6dcd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_6dcd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l503_c8_0c9b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_0c9b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_0c9b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_0c9b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_0c9b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_0c9b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_0c9b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_0c9b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_0c9b_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l496_c8_c0d7] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l496_c8_c0d7_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l496_c8_c0d7_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l496_c8_c0d7_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l496_c8_c0d7_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l496_c8_c0d7_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l496_c8_c0d7_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l496_c8_c0d7_return_output := has_written_to_t_MUX_uxn_opcodes_h_l496_c8_c0d7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l503_c8_0c9b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_0c9b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_0c9b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_0c9b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_0c9b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_0c9b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_0c9b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_0c9b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_0c9b_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l485_c29_041d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l485_c29_041d_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l485_c29_041d_left;
     BIN_OP_AND_uxn_opcodes_h_l485_c29_041d_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l485_c29_041d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l485_c29_041d_return_output := BIN_OP_AND_uxn_opcodes_h_l485_c29_041d_return_output;

     -- MUX[uxn_opcodes_h_l484_c15_4f9a] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l484_c15_4f9a_cond <= VAR_MUX_uxn_opcodes_h_l484_c15_4f9a_cond;
     MUX_uxn_opcodes_h_l484_c15_4f9a_iftrue <= VAR_MUX_uxn_opcodes_h_l484_c15_4f9a_iftrue;
     MUX_uxn_opcodes_h_l484_c15_4f9a_iffalse <= VAR_MUX_uxn_opcodes_h_l484_c15_4f9a_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l484_c15_4f9a_return_output := MUX_uxn_opcodes_h_l484_c15_4f9a_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_opcodes_h_l485_c8_901d_right := VAR_BIN_OP_AND_uxn_opcodes_h_l485_c29_041d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_1b47_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse := VAR_MUX_uxn_opcodes_h_l484_c15_4f9a_return_output;
     VAR_device_in_uxn_opcodes_h_l486_c23_2cb7_device_address := VAR_MUX_uxn_opcodes_h_l484_c15_4f9a_return_output;
     VAR_printf_uxn_opcodes_h_l463_c3_8f24_uxn_opcodes_h_l463_c3_8f24_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_f383_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l496_c8_c0d7_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l496_c8_c0d7_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l503_c8_0c9b_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l496_c8_c0d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_c0d7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_0c9b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_c0d7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_0c9b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_c0d7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_0c9b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l496_c8_c0d7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c8_0c9b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse := VAR_t8_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output;
     -- printf_uxn_opcodes_h_l463_c3_8f24[uxn_opcodes_h_l463_c3_8f24] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l463_c3_8f24_uxn_opcodes_h_l463_c3_8f24_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l463_c3_8f24_uxn_opcodes_h_l463_c3_8f24_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l474_c7_1b47] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_1b47_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_1b47_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_1b47_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_1b47_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l496_c8_c0d7] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l496_c8_c0d7_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l496_c8_c0d7_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l496_c8_c0d7_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l496_c8_c0d7_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l496_c8_c0d7_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l496_c8_c0d7_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l496_c8_c0d7_return_output := has_written_to_n_MUX_uxn_opcodes_h_l496_c8_c0d7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l496_c8_c0d7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l496_c8_c0d7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l496_c8_c0d7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l496_c8_c0d7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l496_c8_c0d7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l496_c8_c0d7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l496_c8_c0d7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l496_c8_c0d7_return_output := result_u8_value_MUX_uxn_opcodes_h_l496_c8_c0d7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l496_c8_c0d7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_c0d7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_c0d7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_c0d7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_c0d7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_c0d7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_c0d7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_c0d7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_c0d7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l496_c8_c0d7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_c0d7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_c0d7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_c0d7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_c0d7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_c0d7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_c0d7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_c0d7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_c0d7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l496_c8_c0d7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_c0d7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_c0d7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_c0d7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_c0d7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_c0d7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_c0d7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_c0d7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_c0d7_return_output;

     -- t8_MUX[uxn_opcodes_h_l474_c7_1b47] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l474_c7_1b47_cond <= VAR_t8_MUX_uxn_opcodes_h_l474_c7_1b47_cond;
     t8_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue;
     t8_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l474_c7_1b47_return_output := t8_MUX_uxn_opcodes_h_l474_c7_1b47_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l485_c8_901d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l485_c8_901d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l485_c8_901d_left;
     BIN_OP_OR_uxn_opcodes_h_l485_c8_901d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l485_c8_901d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l485_c8_901d_return_output := BIN_OP_OR_uxn_opcodes_h_l485_c8_901d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l477_c7_6dcd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_6dcd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_6dcd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l474_c7_1b47] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_1b47_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_1b47_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_1b47_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_1b47_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l477_c7_6dcd] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l477_c7_6dcd_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_6dcd_cond;
     dei_param_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue;
     dei_param_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output := dei_param_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output;

     -- Submodule level 3
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_abbb_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l485_c8_901d_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l485_c3_6e5e_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l485_c8_901d_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l485_c3_6e5e_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l485_c8_901d_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l485_c3_6e5e_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l485_c8_901d_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l485_c3_6e5e_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l485_c8_901d_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l485_c8_901d_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l485_c8_901d_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_6e5e_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l485_c8_901d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_6e5e_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l485_c8_901d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_6e5e_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l485_c8_901d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_6e5e_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l485_c8_901d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l485_c3_6e5e_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l485_c8_901d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_e15d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse := VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l496_c8_c0d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_c0d7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_f796_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_1b47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_c0d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_f796_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_1b47_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_c0d7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l496_c8_c0d7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l462_c2_f796_iffalse := VAR_t8_MUX_uxn_opcodes_h_l474_c7_1b47_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l485_c3_6e5e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l485_c3_6e5e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l485_c3_6e5e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output := result_u8_value_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l462_c2_f796] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_f796_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_f796_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_f796_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_f796_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_f796_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_f796_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_f796_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_f796_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l474_c7_1b47] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l474_c7_1b47_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l474_c7_1b47_cond;
     dei_param_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue;
     dei_param_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l474_c7_1b47_return_output := dei_param_MUX_uxn_opcodes_h_l474_c7_1b47_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l485_c3_6e5e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_6e5e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_6e5e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l485_c3_6e5e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_6e5e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_6e5e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l462_c2_f796] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_f796_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_f796_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_f796_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_f796_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_f796_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_f796_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_f796_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_f796_return_output;

     -- t8_MUX[uxn_opcodes_h_l462_c2_f796] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l462_c2_f796_cond <= VAR_t8_MUX_uxn_opcodes_h_l462_c2_f796_cond;
     t8_MUX_uxn_opcodes_h_l462_c2_f796_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l462_c2_f796_iftrue;
     t8_MUX_uxn_opcodes_h_l462_c2_f796_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l462_c2_f796_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l462_c2_f796_return_output := t8_MUX_uxn_opcodes_h_l462_c2_f796_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l485_c3_6e5e] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l485_c3_6e5e_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l485_c3_6e5e_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output := has_written_to_t_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l485_c3_6e5e] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l485_c3_6e5e_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l485_c3_6e5e_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output := has_written_to_n_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l485_c3_6e5e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_6e5e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_6e5e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l485_c3_6e5e] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l485_c3_6e5e_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l485_c3_6e5e_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output := current_dei_phase_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l482_c1_e15d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_e15d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_e15d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_e15d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_e15d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_e15d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_e15d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_e15d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_e15d_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_abbb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_e15d_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l462_c2_f796_iffalse := VAR_dei_param_MUX_uxn_opcodes_h_l474_c7_1b47_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l462_c2_f796_return_output;
     -- dei_param_MUX[uxn_opcodes_h_l462_c2_f796] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l462_c2_f796_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l462_c2_f796_cond;
     dei_param_MUX_uxn_opcodes_h_l462_c2_f796_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l462_c2_f796_iftrue;
     dei_param_MUX_uxn_opcodes_h_l462_c2_f796_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l462_c2_f796_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l462_c2_f796_return_output := dei_param_MUX_uxn_opcodes_h_l462_c2_f796_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l485_c1_abbb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_abbb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_abbb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_abbb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_abbb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_abbb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_abbb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_abbb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_abbb_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l477_c7_6dcd] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l477_c7_6dcd_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_6dcd_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output := current_dei_phase_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l477_c7_6dcd] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l477_c7_6dcd_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_6dcd_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output := has_written_to_t_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l477_c7_6dcd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_6dcd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_6dcd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l477_c7_6dcd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l477_c7_6dcd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c7_6dcd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output := result_u8_value_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l477_c7_6dcd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_6dcd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_6dcd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l477_c7_6dcd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_6dcd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_6dcd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l477_c7_6dcd] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l477_c7_6dcd_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_6dcd_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output := has_written_to_n_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output;

     -- Submodule level 5
     VAR_device_in_uxn_opcodes_h_l486_c23_2cb7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_abbb_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output;
     REG_VAR_dei_param := VAR_dei_param_MUX_uxn_opcodes_h_l462_c2_f796_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l474_c7_1b47] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_1b47_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_1b47_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_1b47_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_1b47_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l474_c7_1b47] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_1b47_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_1b47_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_1b47_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_1b47_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l474_c7_1b47] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l474_c7_1b47_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l474_c7_1b47_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l474_c7_1b47_return_output := current_dei_phase_MUX_uxn_opcodes_h_l474_c7_1b47_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l474_c7_1b47] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l474_c7_1b47_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l474_c7_1b47_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l474_c7_1b47_return_output := has_written_to_t_MUX_uxn_opcodes_h_l474_c7_1b47_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l474_c7_1b47] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l474_c7_1b47_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l474_c7_1b47_cond;
     result_u8_value_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l474_c7_1b47_return_output := result_u8_value_MUX_uxn_opcodes_h_l474_c7_1b47_return_output;

     -- device_in[uxn_opcodes_h_l486_c23_2cb7] LATENCY=0
     -- Clock enable
     device_in_uxn_opcodes_h_l486_c23_2cb7_CLOCK_ENABLE <= VAR_device_in_uxn_opcodes_h_l486_c23_2cb7_CLOCK_ENABLE;
     -- Inputs
     device_in_uxn_opcodes_h_l486_c23_2cb7_device_address <= VAR_device_in_uxn_opcodes_h_l486_c23_2cb7_device_address;
     device_in_uxn_opcodes_h_l486_c23_2cb7_phase <= VAR_device_in_uxn_opcodes_h_l486_c23_2cb7_phase;
     device_in_uxn_opcodes_h_l486_c23_2cb7_previous_device_ram_read <= VAR_device_in_uxn_opcodes_h_l486_c23_2cb7_previous_device_ram_read;
     -- Outputs
     VAR_device_in_uxn_opcodes_h_l486_c23_2cb7_return_output := device_in_uxn_opcodes_h_l486_c23_2cb7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l474_c7_1b47] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_1b47_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_1b47_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_1b47_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_1b47_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l474_c7_1b47] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l474_c7_1b47_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l474_c7_1b47_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l474_c7_1b47_return_output := has_written_to_n_MUX_uxn_opcodes_h_l474_c7_1b47_return_output;

     -- Submodule level 6
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l462_c2_f796_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l474_c7_1b47_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue := VAR_device_in_uxn_opcodes_h_l486_c23_2cb7_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l462_c2_f796_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l474_c7_1b47_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l462_c2_f796_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l474_c7_1b47_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_f796_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_1b47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_f796_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_1b47_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_f796_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_1b47_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l462_c2_f796_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l474_c7_1b47_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l462_c2_f796] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_f796_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_f796_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_f796_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_f796_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_f796_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_f796_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_f796_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_f796_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l462_c2_f796] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l462_c2_f796_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l462_c2_f796_cond;
     result_u8_value_MUX_uxn_opcodes_h_l462_c2_f796_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l462_c2_f796_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l462_c2_f796_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l462_c2_f796_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l462_c2_f796_return_output := result_u8_value_MUX_uxn_opcodes_h_l462_c2_f796_return_output;

     -- CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l490_l492_DUPLICATE_1db6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l490_l492_DUPLICATE_1db6_return_output := VAR_device_in_uxn_opcodes_h_l486_c23_2cb7_return_output.is_dei_done;

     -- current_dei_phase_MUX[uxn_opcodes_h_l462_c2_f796] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l462_c2_f796_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l462_c2_f796_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l462_c2_f796_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l462_c2_f796_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l462_c2_f796_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l462_c2_f796_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l462_c2_f796_return_output := current_dei_phase_MUX_uxn_opcodes_h_l462_c2_f796_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l462_c2_f796] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_f796_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_f796_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_f796_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_f796_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_f796_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_f796_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_f796_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_f796_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l485_c3_6e5e] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l485_c3_6e5e_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l485_c3_6e5e_cond;
     device_in_result_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output := device_in_result_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l462_c2_f796] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l462_c2_f796_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l462_c2_f796_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l462_c2_f796_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l462_c2_f796_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l462_c2_f796_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l462_c2_f796_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l462_c2_f796_return_output := has_written_to_n_MUX_uxn_opcodes_h_l462_c2_f796_return_output;

     -- CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d[uxn_opcodes_h_l487_c32_ce9b] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l487_c32_ce9b_return_output := VAR_device_in_uxn_opcodes_h_l486_c23_2cb7_return_output.device_ram_address;

     -- has_written_to_t_MUX[uxn_opcodes_h_l462_c2_f796] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l462_c2_f796_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l462_c2_f796_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l462_c2_f796_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l462_c2_f796_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l462_c2_f796_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l462_c2_f796_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l462_c2_f796_return_output := has_written_to_t_MUX_uxn_opcodes_h_l462_c2_f796_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l462_c2_f796] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_f796_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_f796_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_f796_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_f796_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_f796_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_f796_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_f796_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_f796_return_output;

     -- Submodule level 7
     VAR_BIN_OP_AND_uxn_opcodes_h_l490_c9_745f_right := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l490_l492_DUPLICATE_1db6_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_a925_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l490_l492_DUPLICATE_1db6_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l487_c32_ce9b_return_output;
     REG_VAR_current_dei_phase := VAR_current_dei_phase_MUX_uxn_opcodes_h_l462_c2_f796_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output;
     REG_VAR_has_written_to_n := VAR_has_written_to_n_MUX_uxn_opcodes_h_l462_c2_f796_return_output;
     REG_VAR_has_written_to_t := VAR_has_written_to_t_MUX_uxn_opcodes_h_l462_c2_f796_return_output;
     -- device_in_result_MUX[uxn_opcodes_h_l477_c7_6dcd] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l477_c7_6dcd_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_6dcd_cond;
     device_in_result_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output := device_in_result_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l485_c3_6e5e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_6e5e_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_6e5e_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l492_c11_a925] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_a925_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_a925_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_a925_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_a925_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_a925_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_a925_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_a925_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_a925_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l490_c9_745f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l490_c9_745f_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l490_c9_745f_left;
     BIN_OP_AND_uxn_opcodes_h_l490_c9_745f_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l490_c9_745f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l490_c9_745f_return_output := BIN_OP_AND_uxn_opcodes_h_l490_c9_745f_return_output;

     -- Submodule level 8
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_895e_cond := VAR_BIN_OP_AND_uxn_opcodes_h_l490_c9_745f_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_895e_cond := VAR_BIN_OP_AND_uxn_opcodes_h_l490_c9_745f_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_895e_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_a925_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output;
     -- is_second_dei_done_MUX[uxn_opcodes_h_l490_c4_895e] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_895e_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_895e_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_895e_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_895e_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_895e_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_895e_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_895e_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_895e_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l474_c7_1b47] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l474_c7_1b47_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l474_c7_1b47_cond;
     device_in_result_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l474_c7_1b47_return_output := device_in_result_MUX_uxn_opcodes_h_l474_c7_1b47_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l490_c4_895e] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_895e_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_895e_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_895e_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_895e_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_895e_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_895e_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_895e_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_895e_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l477_c7_6dcd] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_6dcd_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_6dcd_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output;

     -- Submodule level 9
     VAR_device_in_result_MUX_uxn_opcodes_h_l462_c2_f796_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l474_c7_1b47_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_895e_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_895e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output;
     -- is_second_dei_done_MUX[uxn_opcodes_h_l485_c3_6e5e] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l485_c3_6e5e] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l474_c7_1b47] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_1b47_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_1b47_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_1b47_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_1b47_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l462_c2_f796] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l462_c2_f796_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l462_c2_f796_cond;
     device_in_result_MUX_uxn_opcodes_h_l462_c2_f796_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l462_c2_f796_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l462_c2_f796_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l462_c2_f796_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l462_c2_f796_return_output := device_in_result_MUX_uxn_opcodes_h_l462_c2_f796_return_output;

     -- Submodule level 10
     REG_VAR_device_in_result := VAR_device_in_result_MUX_uxn_opcodes_h_l462_c2_f796_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_6e5e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_f796_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_1b47_return_output;
     -- is_first_dei_done_MUX[uxn_opcodes_h_l477_c7_6dcd] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l462_c2_f796] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_f796_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_f796_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_f796_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_f796_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_f796_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_f796_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_f796_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_f796_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l477_c7_6dcd] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output;

     -- Submodule level 11
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_6dcd_return_output;
     -- is_first_dei_done_MUX[uxn_opcodes_h_l474_c7_1b47] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47_return_output;

     -- CONST_REF_RD_opcode_result_t_opcode_result_t_67ee_uxn_opcodes_h_l456_l514_DUPLICATE_629c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_67ee_uxn_opcodes_h_l456_l514_DUPLICATE_629c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_67ee(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_f796_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_f796_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_f796_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_f796_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l462_c2_f796_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_f796_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_f796_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_f796_return_output);

     -- is_second_dei_done_MUX[uxn_opcodes_h_l474_c7_1b47] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47_return_output;

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_67ee_uxn_opcodes_h_l456_l514_DUPLICATE_629c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_67ee_uxn_opcodes_h_l456_l514_DUPLICATE_629c_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_f796_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_f796_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_1b47_return_output;
     -- is_first_dei_done_MUX[uxn_opcodes_h_l462_c2_f796] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_f796_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_f796_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_f796_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_f796_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_f796_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_f796_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_f796_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_f796_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l462_c2_f796] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_f796_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_f796_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_f796_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_f796_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_f796_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_f796_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_f796_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_f796_return_output;

     -- Submodule level 13
     REG_VAR_is_first_dei_done := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_f796_return_output;
     REG_VAR_is_second_dei_done := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_f796_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_current_dei_phase <= REG_VAR_current_dei_phase;
REG_COMB_dei_param <= REG_VAR_dei_param;
REG_COMB_is_first_dei_done <= REG_VAR_is_first_dei_done;
REG_COMB_is_second_dei_done <= REG_VAR_is_second_dei_done;
REG_COMB_has_written_to_t <= REG_VAR_has_written_to_t;
REG_COMB_has_written_to_n <= REG_VAR_has_written_to_n;
REG_COMB_device_in_result <= REG_VAR_device_in_result;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     current_dei_phase <= REG_COMB_current_dei_phase;
     dei_param <= REG_COMB_dei_param;
     is_first_dei_done <= REG_COMB_is_first_dei_done;
     is_second_dei_done <= REG_COMB_is_second_dei_done;
     has_written_to_t <= REG_COMB_has_written_to_t;
     has_written_to_n <= REG_COMB_has_written_to_n;
     device_in_result <= REG_COMB_device_in_result;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
