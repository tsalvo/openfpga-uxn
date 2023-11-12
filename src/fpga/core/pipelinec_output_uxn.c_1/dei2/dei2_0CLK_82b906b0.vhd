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
entity dei2_0CLK_82b906b0 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end dei2_0CLK_82b906b0;
architecture arch of dei2_0CLK_82b906b0 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l435_c6_b33c]
signal BIN_OP_EQ_uxn_opcodes_h_l435_c6_b33c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l435_c6_b33c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l435_c6_b33c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l435_c1_9aca]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9aca_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9aca_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9aca_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9aca_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l447_c7_322b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_322b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_322b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_322b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_322b_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l435_c2_a423]
signal is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_a423_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_a423_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_a423_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_a423_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l435_c2_a423]
signal t8_MUX_uxn_opcodes_h_l435_c2_a423_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l435_c2_a423_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l435_c2_a423_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l435_c2_a423_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l435_c2_a423]
signal device_in_result_MUX_uxn_opcodes_h_l435_c2_a423_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l435_c2_a423_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l435_c2_a423_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l435_c2_a423_return_output : device_in_result_t;

-- has_written_to_n_MUX[uxn_opcodes_h_l435_c2_a423]
signal has_written_to_n_MUX_uxn_opcodes_h_l435_c2_a423_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l435_c2_a423_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l435_c2_a423_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l435_c2_a423_return_output : unsigned(0 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l435_c2_a423]
signal dei_param_MUX_uxn_opcodes_h_l435_c2_a423_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l435_c2_a423_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l435_c2_a423_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l435_c2_a423_return_output : unsigned(7 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l435_c2_a423]
signal has_written_to_t_MUX_uxn_opcodes_h_l435_c2_a423_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l435_c2_a423_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l435_c2_a423_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l435_c2_a423_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l435_c2_a423]
signal current_dei_phase_MUX_uxn_opcodes_h_l435_c2_a423_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l435_c2_a423_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l435_c2_a423_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l435_c2_a423_return_output : unsigned(7 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l435_c2_a423]
signal is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_a423_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_a423_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_a423_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_a423_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l435_c2_a423]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_a423_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_a423_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_a423_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_a423_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l435_c2_a423]
signal result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_a423_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_a423_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_a423_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_a423_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l435_c2_a423]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_a423_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_a423_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_a423_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_a423_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l435_c2_a423]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_a423_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_a423_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_a423_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_a423_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l435_c2_a423]
signal result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_a423_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_a423_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_a423_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_a423_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l435_c2_a423]
signal result_u8_value_MUX_uxn_opcodes_h_l435_c2_a423_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l435_c2_a423_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l435_c2_a423_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l435_c2_a423_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l435_c2_a423]
signal result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_a423_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_a423_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_a423_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_a423_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l435_c2_a423]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_a423_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_a423_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_a423_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_a423_return_output : signed(3 downto 0);

-- printf_uxn_opcodes_h_l436_c3_98fb[uxn_opcodes_h_l436_c3_98fb]
signal printf_uxn_opcodes_h_l436_c3_98fb_uxn_opcodes_h_l436_c3_98fb_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l447_c11_3aa0]
signal BIN_OP_EQ_uxn_opcodes_h_l447_c11_3aa0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l447_c11_3aa0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l447_c11_3aa0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l450_c7_d62e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_d62e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_d62e_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l447_c7_322b]
signal is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_322b_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_322b_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_322b_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_322b_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l447_c7_322b]
signal t8_MUX_uxn_opcodes_h_l447_c7_322b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l447_c7_322b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l447_c7_322b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l447_c7_322b_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l447_c7_322b]
signal device_in_result_MUX_uxn_opcodes_h_l447_c7_322b_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l447_c7_322b_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l447_c7_322b_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l447_c7_322b_return_output : device_in_result_t;

-- has_written_to_n_MUX[uxn_opcodes_h_l447_c7_322b]
signal has_written_to_n_MUX_uxn_opcodes_h_l447_c7_322b_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l447_c7_322b_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l447_c7_322b_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l447_c7_322b_return_output : unsigned(0 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l447_c7_322b]
signal dei_param_MUX_uxn_opcodes_h_l447_c7_322b_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l447_c7_322b_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l447_c7_322b_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l447_c7_322b_return_output : unsigned(7 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l447_c7_322b]
signal has_written_to_t_MUX_uxn_opcodes_h_l447_c7_322b_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l447_c7_322b_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l447_c7_322b_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l447_c7_322b_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l447_c7_322b]
signal current_dei_phase_MUX_uxn_opcodes_h_l447_c7_322b_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l447_c7_322b_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l447_c7_322b_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l447_c7_322b_return_output : unsigned(7 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l447_c7_322b]
signal is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_322b_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_322b_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_322b_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_322b_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l447_c7_322b]
signal result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_322b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_322b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_322b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_322b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l447_c7_322b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_322b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_322b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_322b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_322b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l447_c7_322b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_322b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_322b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_322b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_322b_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l447_c7_322b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_322b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_322b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_322b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_322b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l447_c7_322b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_322b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_322b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_322b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_322b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l447_c7_322b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_322b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_322b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_322b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_322b_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l447_c7_322b]
signal result_u8_value_MUX_uxn_opcodes_h_l447_c7_322b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l447_c7_322b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l447_c7_322b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l447_c7_322b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l450_c11_78d8]
signal BIN_OP_EQ_uxn_opcodes_h_l450_c11_78d8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l450_c11_78d8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l450_c11_78d8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l455_c1_b32f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_b32f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_b32f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_b32f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_b32f_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l450_c7_d62e]
signal is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l450_c7_d62e]
signal t8_MUX_uxn_opcodes_h_l450_c7_d62e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l450_c7_d62e_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l450_c7_d62e]
signal device_in_result_MUX_uxn_opcodes_h_l450_c7_d62e_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l450_c7_d62e_return_output : device_in_result_t;

-- has_written_to_n_MUX[uxn_opcodes_h_l450_c7_d62e]
signal has_written_to_n_MUX_uxn_opcodes_h_l450_c7_d62e_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l450_c7_d62e_return_output : unsigned(0 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l450_c7_d62e]
signal dei_param_MUX_uxn_opcodes_h_l450_c7_d62e_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l450_c7_d62e_return_output : unsigned(7 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l450_c7_d62e]
signal has_written_to_t_MUX_uxn_opcodes_h_l450_c7_d62e_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l450_c7_d62e_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l450_c7_d62e]
signal current_dei_phase_MUX_uxn_opcodes_h_l450_c7_d62e_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l450_c7_d62e_return_output : unsigned(7 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l450_c7_d62e]
signal is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l450_c7_d62e]
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_d62e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_d62e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l450_c7_d62e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_d62e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_d62e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l450_c7_d62e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_d62e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_d62e_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l450_c7_d62e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_d62e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_d62e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l450_c7_d62e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_d62e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_d62e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l450_c7_d62e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_d62e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_d62e_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l450_c7_d62e]
signal result_u8_value_MUX_uxn_opcodes_h_l450_c7_d62e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l450_c7_d62e_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l453_c30_da3c]
signal sp_relative_shift_uxn_opcodes_h_l453_c30_da3c_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l453_c30_da3c_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l453_c30_da3c_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l453_c30_da3c_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l457_c35_0a66]
signal BIN_OP_PLUS_uxn_opcodes_h_l457_c35_0a66_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l457_c35_0a66_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l457_c35_0a66_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l457_c15_673b]
signal MUX_uxn_opcodes_h_l457_c15_673b_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l457_c15_673b_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l457_c15_673b_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l457_c15_673b_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l458_c49_28c4]
signal UNARY_OP_NOT_uxn_opcodes_h_l458_c49_28c4_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l458_c49_28c4_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l458_c29_e96c]
signal BIN_OP_AND_uxn_opcodes_h_l458_c29_e96c_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l458_c29_e96c_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l458_c29_e96c_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l458_c8_e9cd]
signal BIN_OP_OR_uxn_opcodes_h_l458_c8_e9cd_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l458_c8_e9cd_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l458_c8_e9cd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l458_c1_3914]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_3914_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_3914_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_3914_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_3914_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l458_c3_0b95]
signal is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l458_c3_0b95]
signal device_in_result_MUX_uxn_opcodes_h_l458_c3_0b95_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l458_c3_0b95_return_output : device_in_result_t;

-- has_written_to_n_MUX[uxn_opcodes_h_l458_c3_0b95]
signal has_written_to_n_MUX_uxn_opcodes_h_l458_c3_0b95_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l458_c3_0b95_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l458_c3_0b95]
signal has_written_to_t_MUX_uxn_opcodes_h_l458_c3_0b95_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l458_c3_0b95_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l458_c3_0b95]
signal current_dei_phase_MUX_uxn_opcodes_h_l458_c3_0b95_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l458_c3_0b95_return_output : unsigned(7 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l458_c3_0b95]
signal is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l458_c3_0b95]
signal result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_0b95_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_0b95_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l458_c3_0b95]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_0b95_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_0b95_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l458_c3_0b95]
signal result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_0b95_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_0b95_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l458_c3_0b95]
signal result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_0b95_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_0b95_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l458_c3_0b95]
signal result_u8_value_MUX_uxn_opcodes_h_l458_c3_0b95_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l458_c3_0b95_return_output : unsigned(7 downto 0);

-- device_in[uxn_opcodes_h_l459_c23_c334]
signal device_in_uxn_opcodes_h_l459_c23_c334_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_in_uxn_opcodes_h_l459_c23_c334_device_address : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l459_c23_c334_phase : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l459_c23_c334_previous_device_ram_read : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l459_c23_c334_return_output : device_in_result_t;

-- BIN_OP_PLUS[uxn_opcodes_h_l462_c4_6a57]
signal BIN_OP_PLUS_uxn_opcodes_h_l462_c4_6a57_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l462_c4_6a57_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l462_c4_6a57_return_output : unsigned(8 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l463_c9_8176]
signal BIN_OP_AND_uxn_opcodes_h_l463_c9_8176_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l463_c9_8176_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l463_c9_8176_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l463_c4_712b]
signal is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_712b_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_712b_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_712b_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_712b_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l463_c4_712b]
signal is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_712b_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_712b_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_712b_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_712b_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l465_c11_08e6]
signal is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_08e6_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_08e6_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_08e6_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_08e6_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l469_c13_0955]
signal UNARY_OP_NOT_uxn_opcodes_h_l469_c13_0955_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l469_c13_0955_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l469_c8_dabe]
signal has_written_to_n_MUX_uxn_opcodes_h_l469_c8_dabe_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l469_c8_dabe_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l469_c8_dabe_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l469_c8_dabe_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l469_c8_dabe]
signal has_written_to_t_MUX_uxn_opcodes_h_l469_c8_dabe_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l469_c8_dabe_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l469_c8_dabe_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l469_c8_dabe_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l469_c8_dabe]
signal current_dei_phase_MUX_uxn_opcodes_h_l469_c8_dabe_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l469_c8_dabe_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l469_c8_dabe_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l469_c8_dabe_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l469_c8_dabe]
signal result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_dabe_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_dabe_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_dabe_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_dabe_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l469_c8_dabe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_dabe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_dabe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_dabe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_dabe_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l469_c8_dabe]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_dabe_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_dabe_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_dabe_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_dabe_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l469_c8_dabe]
signal result_u8_value_MUX_uxn_opcodes_h_l469_c8_dabe_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l469_c8_dabe_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l469_c8_dabe_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l469_c8_dabe_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l476_c13_b8b1]
signal UNARY_OP_NOT_uxn_opcodes_h_l476_c13_b8b1_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l476_c13_b8b1_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l476_c8_6f09]
signal has_written_to_n_MUX_uxn_opcodes_h_l476_c8_6f09_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l476_c8_6f09_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l476_c8_6f09_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l476_c8_6f09_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l476_c8_6f09]
signal result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_6f09_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_6f09_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_6f09_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_6f09_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l476_c8_6f09]
signal result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_6f09_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_6f09_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_6f09_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_6f09_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l476_c8_6f09]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_6f09_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_6f09_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_6f09_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_6f09_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l476_c8_6f09]
signal result_u8_value_MUX_uxn_opcodes_h_l476_c8_6f09_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l476_c8_6f09_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l476_c8_6f09_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l476_c8_6f09_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_fe0a
signal UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_fe0a_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_fe0a_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_e671( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_device_ram_write := ref_toks_1;
      base.device_ram_address := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.u8_value := ref_toks_6;
      base.is_opc_done := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l435_c6_b33c
BIN_OP_EQ_uxn_opcodes_h_l435_c6_b33c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l435_c6_b33c_left,
BIN_OP_EQ_uxn_opcodes_h_l435_c6_b33c_right,
BIN_OP_EQ_uxn_opcodes_h_l435_c6_b33c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9aca
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9aca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9aca_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9aca_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9aca_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9aca_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_322b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_322b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_322b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_322b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_322b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_322b_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_a423
is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_a423 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_a423_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_a423_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_a423_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_a423_return_output);

-- t8_MUX_uxn_opcodes_h_l435_c2_a423
t8_MUX_uxn_opcodes_h_l435_c2_a423 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l435_c2_a423_cond,
t8_MUX_uxn_opcodes_h_l435_c2_a423_iftrue,
t8_MUX_uxn_opcodes_h_l435_c2_a423_iffalse,
t8_MUX_uxn_opcodes_h_l435_c2_a423_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l435_c2_a423
device_in_result_MUX_uxn_opcodes_h_l435_c2_a423 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l435_c2_a423_cond,
device_in_result_MUX_uxn_opcodes_h_l435_c2_a423_iftrue,
device_in_result_MUX_uxn_opcodes_h_l435_c2_a423_iffalse,
device_in_result_MUX_uxn_opcodes_h_l435_c2_a423_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l435_c2_a423
has_written_to_n_MUX_uxn_opcodes_h_l435_c2_a423 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l435_c2_a423_cond,
has_written_to_n_MUX_uxn_opcodes_h_l435_c2_a423_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l435_c2_a423_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l435_c2_a423_return_output);

-- dei_param_MUX_uxn_opcodes_h_l435_c2_a423
dei_param_MUX_uxn_opcodes_h_l435_c2_a423 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l435_c2_a423_cond,
dei_param_MUX_uxn_opcodes_h_l435_c2_a423_iftrue,
dei_param_MUX_uxn_opcodes_h_l435_c2_a423_iffalse,
dei_param_MUX_uxn_opcodes_h_l435_c2_a423_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l435_c2_a423
has_written_to_t_MUX_uxn_opcodes_h_l435_c2_a423 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l435_c2_a423_cond,
has_written_to_t_MUX_uxn_opcodes_h_l435_c2_a423_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l435_c2_a423_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l435_c2_a423_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l435_c2_a423
current_dei_phase_MUX_uxn_opcodes_h_l435_c2_a423 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l435_c2_a423_cond,
current_dei_phase_MUX_uxn_opcodes_h_l435_c2_a423_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l435_c2_a423_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l435_c2_a423_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_a423
is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_a423 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_a423_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_a423_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_a423_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_a423_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_a423
result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_a423 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_a423_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_a423_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_a423_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_a423_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_a423
result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_a423 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_a423_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_a423_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_a423_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_a423_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_a423
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_a423 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_a423_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_a423_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_a423_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_a423_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_a423
result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_a423 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_a423_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_a423_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_a423_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_a423_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_a423
result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_a423 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_a423_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_a423_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_a423_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_a423_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l435_c2_a423
result_u8_value_MUX_uxn_opcodes_h_l435_c2_a423 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l435_c2_a423_cond,
result_u8_value_MUX_uxn_opcodes_h_l435_c2_a423_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l435_c2_a423_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l435_c2_a423_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_a423
result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_a423 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_a423_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_a423_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_a423_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_a423_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_a423
result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_a423 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_a423_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_a423_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_a423_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_a423_return_output);

-- printf_uxn_opcodes_h_l436_c3_98fb_uxn_opcodes_h_l436_c3_98fb
printf_uxn_opcodes_h_l436_c3_98fb_uxn_opcodes_h_l436_c3_98fb : entity work.printf_uxn_opcodes_h_l436_c3_98fb_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l436_c3_98fb_uxn_opcodes_h_l436_c3_98fb_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l447_c11_3aa0
BIN_OP_EQ_uxn_opcodes_h_l447_c11_3aa0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l447_c11_3aa0_left,
BIN_OP_EQ_uxn_opcodes_h_l447_c11_3aa0_right,
BIN_OP_EQ_uxn_opcodes_h_l447_c11_3aa0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_d62e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_d62e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_d62e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_d62e_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_322b
is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_322b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_322b_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_322b_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_322b_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_322b_return_output);

-- t8_MUX_uxn_opcodes_h_l447_c7_322b
t8_MUX_uxn_opcodes_h_l447_c7_322b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l447_c7_322b_cond,
t8_MUX_uxn_opcodes_h_l447_c7_322b_iftrue,
t8_MUX_uxn_opcodes_h_l447_c7_322b_iffalse,
t8_MUX_uxn_opcodes_h_l447_c7_322b_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l447_c7_322b
device_in_result_MUX_uxn_opcodes_h_l447_c7_322b : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l447_c7_322b_cond,
device_in_result_MUX_uxn_opcodes_h_l447_c7_322b_iftrue,
device_in_result_MUX_uxn_opcodes_h_l447_c7_322b_iffalse,
device_in_result_MUX_uxn_opcodes_h_l447_c7_322b_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l447_c7_322b
has_written_to_n_MUX_uxn_opcodes_h_l447_c7_322b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l447_c7_322b_cond,
has_written_to_n_MUX_uxn_opcodes_h_l447_c7_322b_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l447_c7_322b_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l447_c7_322b_return_output);

-- dei_param_MUX_uxn_opcodes_h_l447_c7_322b
dei_param_MUX_uxn_opcodes_h_l447_c7_322b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l447_c7_322b_cond,
dei_param_MUX_uxn_opcodes_h_l447_c7_322b_iftrue,
dei_param_MUX_uxn_opcodes_h_l447_c7_322b_iffalse,
dei_param_MUX_uxn_opcodes_h_l447_c7_322b_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l447_c7_322b
has_written_to_t_MUX_uxn_opcodes_h_l447_c7_322b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l447_c7_322b_cond,
has_written_to_t_MUX_uxn_opcodes_h_l447_c7_322b_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l447_c7_322b_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l447_c7_322b_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l447_c7_322b
current_dei_phase_MUX_uxn_opcodes_h_l447_c7_322b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l447_c7_322b_cond,
current_dei_phase_MUX_uxn_opcodes_h_l447_c7_322b_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l447_c7_322b_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l447_c7_322b_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_322b
is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_322b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_322b_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_322b_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_322b_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_322b_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_322b
result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_322b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_322b_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_322b_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_322b_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_322b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_322b
result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_322b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_322b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_322b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_322b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_322b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_322b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_322b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_322b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_322b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_322b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_322b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_322b
result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_322b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_322b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_322b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_322b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_322b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_322b
result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_322b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_322b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_322b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_322b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_322b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_322b
result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_322b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_322b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_322b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_322b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_322b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l447_c7_322b
result_u8_value_MUX_uxn_opcodes_h_l447_c7_322b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l447_c7_322b_cond,
result_u8_value_MUX_uxn_opcodes_h_l447_c7_322b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l447_c7_322b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l447_c7_322b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l450_c11_78d8
BIN_OP_EQ_uxn_opcodes_h_l450_c11_78d8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l450_c11_78d8_left,
BIN_OP_EQ_uxn_opcodes_h_l450_c11_78d8_right,
BIN_OP_EQ_uxn_opcodes_h_l450_c11_78d8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_b32f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_b32f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_b32f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_b32f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_b32f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_b32f_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e
is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e_return_output);

-- t8_MUX_uxn_opcodes_h_l450_c7_d62e
t8_MUX_uxn_opcodes_h_l450_c7_d62e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l450_c7_d62e_cond,
t8_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue,
t8_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse,
t8_MUX_uxn_opcodes_h_l450_c7_d62e_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l450_c7_d62e
device_in_result_MUX_uxn_opcodes_h_l450_c7_d62e : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l450_c7_d62e_cond,
device_in_result_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue,
device_in_result_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse,
device_in_result_MUX_uxn_opcodes_h_l450_c7_d62e_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l450_c7_d62e
has_written_to_n_MUX_uxn_opcodes_h_l450_c7_d62e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l450_c7_d62e_cond,
has_written_to_n_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l450_c7_d62e_return_output);

-- dei_param_MUX_uxn_opcodes_h_l450_c7_d62e
dei_param_MUX_uxn_opcodes_h_l450_c7_d62e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l450_c7_d62e_cond,
dei_param_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue,
dei_param_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse,
dei_param_MUX_uxn_opcodes_h_l450_c7_d62e_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l450_c7_d62e
has_written_to_t_MUX_uxn_opcodes_h_l450_c7_d62e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l450_c7_d62e_cond,
has_written_to_t_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l450_c7_d62e_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l450_c7_d62e
current_dei_phase_MUX_uxn_opcodes_h_l450_c7_d62e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l450_c7_d62e_cond,
current_dei_phase_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l450_c7_d62e_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e
is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_d62e
result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_d62e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_d62e_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_d62e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_d62e
result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_d62e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_d62e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_d62e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_d62e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_d62e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_d62e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_d62e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_d62e
result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_d62e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_d62e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_d62e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_d62e
result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_d62e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_d62e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_d62e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_d62e
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_d62e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_d62e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_d62e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l450_c7_d62e
result_u8_value_MUX_uxn_opcodes_h_l450_c7_d62e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l450_c7_d62e_cond,
result_u8_value_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l450_c7_d62e_return_output);

-- sp_relative_shift_uxn_opcodes_h_l453_c30_da3c
sp_relative_shift_uxn_opcodes_h_l453_c30_da3c : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l453_c30_da3c_ins,
sp_relative_shift_uxn_opcodes_h_l453_c30_da3c_x,
sp_relative_shift_uxn_opcodes_h_l453_c30_da3c_y,
sp_relative_shift_uxn_opcodes_h_l453_c30_da3c_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l457_c35_0a66
BIN_OP_PLUS_uxn_opcodes_h_l457_c35_0a66 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l457_c35_0a66_left,
BIN_OP_PLUS_uxn_opcodes_h_l457_c35_0a66_right,
BIN_OP_PLUS_uxn_opcodes_h_l457_c35_0a66_return_output);

-- MUX_uxn_opcodes_h_l457_c15_673b
MUX_uxn_opcodes_h_l457_c15_673b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l457_c15_673b_cond,
MUX_uxn_opcodes_h_l457_c15_673b_iftrue,
MUX_uxn_opcodes_h_l457_c15_673b_iffalse,
MUX_uxn_opcodes_h_l457_c15_673b_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l458_c49_28c4
UNARY_OP_NOT_uxn_opcodes_h_l458_c49_28c4 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l458_c49_28c4_expr,
UNARY_OP_NOT_uxn_opcodes_h_l458_c49_28c4_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l458_c29_e96c
BIN_OP_AND_uxn_opcodes_h_l458_c29_e96c : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l458_c29_e96c_left,
BIN_OP_AND_uxn_opcodes_h_l458_c29_e96c_right,
BIN_OP_AND_uxn_opcodes_h_l458_c29_e96c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l458_c8_e9cd
BIN_OP_OR_uxn_opcodes_h_l458_c8_e9cd : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l458_c8_e9cd_left,
BIN_OP_OR_uxn_opcodes_h_l458_c8_e9cd_right,
BIN_OP_OR_uxn_opcodes_h_l458_c8_e9cd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_3914
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_3914 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_3914_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_3914_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_3914_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_3914_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95
is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l458_c3_0b95
device_in_result_MUX_uxn_opcodes_h_l458_c3_0b95 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l458_c3_0b95_cond,
device_in_result_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue,
device_in_result_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse,
device_in_result_MUX_uxn_opcodes_h_l458_c3_0b95_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l458_c3_0b95
has_written_to_n_MUX_uxn_opcodes_h_l458_c3_0b95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l458_c3_0b95_cond,
has_written_to_n_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l458_c3_0b95_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l458_c3_0b95
has_written_to_t_MUX_uxn_opcodes_h_l458_c3_0b95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l458_c3_0b95_cond,
has_written_to_t_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l458_c3_0b95_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l458_c3_0b95
current_dei_phase_MUX_uxn_opcodes_h_l458_c3_0b95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l458_c3_0b95_cond,
current_dei_phase_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l458_c3_0b95_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95
is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_0b95
result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_0b95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_0b95_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_0b95_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_0b95
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_0b95 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_0b95_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_0b95_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_0b95
result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_0b95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_0b95_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_0b95_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_0b95
result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_0b95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_0b95_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_0b95_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l458_c3_0b95
result_u8_value_MUX_uxn_opcodes_h_l458_c3_0b95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l458_c3_0b95_cond,
result_u8_value_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l458_c3_0b95_return_output);

-- device_in_uxn_opcodes_h_l459_c23_c334
device_in_uxn_opcodes_h_l459_c23_c334 : entity work.device_in_0CLK_b9b05a79 port map (
clk,
device_in_uxn_opcodes_h_l459_c23_c334_CLOCK_ENABLE,
device_in_uxn_opcodes_h_l459_c23_c334_device_address,
device_in_uxn_opcodes_h_l459_c23_c334_phase,
device_in_uxn_opcodes_h_l459_c23_c334_previous_device_ram_read,
device_in_uxn_opcodes_h_l459_c23_c334_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l462_c4_6a57
BIN_OP_PLUS_uxn_opcodes_h_l462_c4_6a57 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l462_c4_6a57_left,
BIN_OP_PLUS_uxn_opcodes_h_l462_c4_6a57_right,
BIN_OP_PLUS_uxn_opcodes_h_l462_c4_6a57_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l463_c9_8176
BIN_OP_AND_uxn_opcodes_h_l463_c9_8176 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l463_c9_8176_left,
BIN_OP_AND_uxn_opcodes_h_l463_c9_8176_right,
BIN_OP_AND_uxn_opcodes_h_l463_c9_8176_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_712b
is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_712b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_712b_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_712b_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_712b_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_712b_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_712b
is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_712b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_712b_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_712b_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_712b_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_712b_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_08e6
is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_08e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_08e6_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_08e6_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_08e6_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_08e6_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l469_c13_0955
UNARY_OP_NOT_uxn_opcodes_h_l469_c13_0955 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l469_c13_0955_expr,
UNARY_OP_NOT_uxn_opcodes_h_l469_c13_0955_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l469_c8_dabe
has_written_to_n_MUX_uxn_opcodes_h_l469_c8_dabe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l469_c8_dabe_cond,
has_written_to_n_MUX_uxn_opcodes_h_l469_c8_dabe_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l469_c8_dabe_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l469_c8_dabe_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l469_c8_dabe
has_written_to_t_MUX_uxn_opcodes_h_l469_c8_dabe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l469_c8_dabe_cond,
has_written_to_t_MUX_uxn_opcodes_h_l469_c8_dabe_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l469_c8_dabe_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l469_c8_dabe_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l469_c8_dabe
current_dei_phase_MUX_uxn_opcodes_h_l469_c8_dabe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l469_c8_dabe_cond,
current_dei_phase_MUX_uxn_opcodes_h_l469_c8_dabe_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l469_c8_dabe_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l469_c8_dabe_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_dabe
result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_dabe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_dabe_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_dabe_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_dabe_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_dabe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_dabe
result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_dabe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_dabe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_dabe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_dabe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_dabe_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_dabe
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_dabe : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_dabe_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_dabe_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_dabe_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_dabe_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l469_c8_dabe
result_u8_value_MUX_uxn_opcodes_h_l469_c8_dabe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l469_c8_dabe_cond,
result_u8_value_MUX_uxn_opcodes_h_l469_c8_dabe_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l469_c8_dabe_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l469_c8_dabe_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l476_c13_b8b1
UNARY_OP_NOT_uxn_opcodes_h_l476_c13_b8b1 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l476_c13_b8b1_expr,
UNARY_OP_NOT_uxn_opcodes_h_l476_c13_b8b1_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l476_c8_6f09
has_written_to_n_MUX_uxn_opcodes_h_l476_c8_6f09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l476_c8_6f09_cond,
has_written_to_n_MUX_uxn_opcodes_h_l476_c8_6f09_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l476_c8_6f09_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l476_c8_6f09_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_6f09
result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_6f09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_6f09_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_6f09_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_6f09_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_6f09_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_6f09
result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_6f09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_6f09_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_6f09_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_6f09_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_6f09_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_6f09
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_6f09 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_6f09_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_6f09_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_6f09_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_6f09_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l476_c8_6f09
result_u8_value_MUX_uxn_opcodes_h_l476_c8_6f09 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l476_c8_6f09_cond,
result_u8_value_MUX_uxn_opcodes_h_l476_c8_6f09_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l476_c8_6f09_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l476_c8_6f09_return_output);

-- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_fe0a
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_fe0a : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_fe0a_expr,
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_fe0a_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l435_c6_b33c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9aca_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_322b_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_a423_return_output,
 t8_MUX_uxn_opcodes_h_l435_c2_a423_return_output,
 device_in_result_MUX_uxn_opcodes_h_l435_c2_a423_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l435_c2_a423_return_output,
 dei_param_MUX_uxn_opcodes_h_l435_c2_a423_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l435_c2_a423_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l435_c2_a423_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_a423_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_a423_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_a423_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_a423_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_a423_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_a423_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l435_c2_a423_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_a423_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_a423_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l447_c11_3aa0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_d62e_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_322b_return_output,
 t8_MUX_uxn_opcodes_h_l447_c7_322b_return_output,
 device_in_result_MUX_uxn_opcodes_h_l447_c7_322b_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l447_c7_322b_return_output,
 dei_param_MUX_uxn_opcodes_h_l447_c7_322b_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l447_c7_322b_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l447_c7_322b_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_322b_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_322b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_322b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_322b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_322b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_322b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_322b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l447_c7_322b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l450_c11_78d8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_b32f_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e_return_output,
 t8_MUX_uxn_opcodes_h_l450_c7_d62e_return_output,
 device_in_result_MUX_uxn_opcodes_h_l450_c7_d62e_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l450_c7_d62e_return_output,
 dei_param_MUX_uxn_opcodes_h_l450_c7_d62e_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l450_c7_d62e_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l450_c7_d62e_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_d62e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_d62e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_d62e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_d62e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_d62e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_d62e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l450_c7_d62e_return_output,
 sp_relative_shift_uxn_opcodes_h_l453_c30_da3c_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l457_c35_0a66_return_output,
 MUX_uxn_opcodes_h_l457_c15_673b_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l458_c49_28c4_return_output,
 BIN_OP_AND_uxn_opcodes_h_l458_c29_e96c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l458_c8_e9cd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_3914_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95_return_output,
 device_in_result_MUX_uxn_opcodes_h_l458_c3_0b95_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l458_c3_0b95_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l458_c3_0b95_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l458_c3_0b95_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_0b95_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_0b95_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_0b95_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_0b95_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l458_c3_0b95_return_output,
 device_in_uxn_opcodes_h_l459_c23_c334_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l462_c4_6a57_return_output,
 BIN_OP_AND_uxn_opcodes_h_l463_c9_8176_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_712b_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_712b_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_08e6_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l469_c13_0955_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l469_c8_dabe_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l469_c8_dabe_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l469_c8_dabe_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_dabe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_dabe_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_dabe_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l469_c8_dabe_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l476_c13_b8b1_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l476_c8_6f09_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_6f09_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_6f09_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_6f09_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l476_c8_6f09_return_output,
 UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_fe0a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_b33c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_b33c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_b33c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9aca_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9aca_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9aca_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9aca_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_322b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_322b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_322b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_322b_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_a423_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_a423_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_322b_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_a423_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_a423_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l435_c2_a423_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l435_c2_a423_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l447_c7_322b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l435_c2_a423_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l435_c2_a423_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l435_c2_a423_iftrue : device_in_result_t;
 variable VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l435_c2_a423_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l435_c2_a423_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l447_c7_322b_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l435_c2_a423_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l435_c2_a423_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l435_c2_a423_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l435_c2_a423_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l447_c7_322b_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l435_c2_a423_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l435_c2_a423_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l435_c2_a423_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l435_c2_a423_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l447_c7_322b_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l435_c2_a423_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l435_c2_a423_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c2_a423_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c2_a423_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l447_c7_322b_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c2_a423_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c2_a423_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l435_c2_a423_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l441_c3_fb42 : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l435_c2_a423_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l447_c7_322b_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l435_c2_a423_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l435_c2_a423_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_a423_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_a423_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_322b_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_a423_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_a423_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_a423_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_a423_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l435_c2_a423_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_a423_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_a423_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_a423_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_a423_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_322b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_a423_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_a423_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_a423_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l442_c3_331d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_a423_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_322b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_a423_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_a423_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_a423_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_a423_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_322b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_a423_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_a423_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_a423_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_a423_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_322b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_a423_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_a423_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l435_c2_a423_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l435_c2_a423_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l447_c7_322b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l435_c2_a423_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l435_c2_a423_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_a423_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_a423_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_322b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_a423_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_a423_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_a423_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_a423_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_322b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_a423_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_a423_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l436_c3_98fb_uxn_opcodes_h_l436_c3_98fb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_3aa0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_3aa0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_3aa0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_d62e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_d62e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_322b_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_322b_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_322b_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l447_c7_322b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l447_c7_322b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c7_d62e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l447_c7_322b_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l447_c7_322b_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l447_c7_322b_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_d62e_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l447_c7_322b_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l447_c7_322b_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l447_c7_322b_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c7_d62e_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l447_c7_322b_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l447_c7_322b_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l447_c7_322b_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l450_c7_d62e_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l447_c7_322b_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l447_c7_322b_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l447_c7_322b_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_d62e_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l447_c7_322b_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l447_c7_322b_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l447_c7_322b_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c7_d62e_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l447_c7_322b_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_322b_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_322b_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_322b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_322b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_322b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_d62e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_322b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_322b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_322b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_d62e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_322b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_322b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l448_c3_4458 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_322b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_d62e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_322b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_322b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_322b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_d62e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_322b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_322b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_322b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_d62e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_322b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_322b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_322b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_d62e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_322b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l447_c7_322b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l447_c7_322b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c7_d62e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l447_c7_322b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_78d8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_78d8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_78d8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_b32f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_b32f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_b32f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_b32f_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c7_d62e_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l458_c3_0b95_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_d62e_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l458_c3_0b95_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c7_d62e_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l450_c7_d62e_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l458_c3_0b95_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_d62e_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l458_c3_0b95_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c7_d62e_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_0b95_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_d62e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_0b95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_d62e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_0b95_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_d62e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_d62e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_0b95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_d62e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_d62e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l458_c3_0b95_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c7_d62e_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l453_c30_da3c_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l453_c30_da3c_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l453_c30_da3c_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l453_c30_da3c_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l457_c15_673b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l457_c15_673b_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l457_c15_673b_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l457_c35_0a66_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l457_c35_0a66_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l457_c35_0a66_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l457_c15_673b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_e9cd_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l458_c29_e96c_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l458_c49_28c4_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l458_c49_28c4_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l458_c29_e96c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l458_c29_e96c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_e9cd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_e9cd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_3914_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_3914_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_3914_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_3914_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_712b_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l458_c3_0b95_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l469_c8_dabe_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l458_c3_0b95_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l469_c8_dabe_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l458_c3_0b95_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l462_c4_457e : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l469_c8_dabe_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l458_c3_0b95_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_712b_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_0b95_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_dabe_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_0b95_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_dabe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_0b95_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_dabe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_0b95_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l469_c8_dabe_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l458_c3_0b95_cond : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l459_c23_c334_device_address : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l459_c23_c334_phase : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l459_c23_c334_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l459_c23_c334_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l459_c23_c334_return_output : device_in_result_t;
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l460_c32_6484_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l462_c4_6a57_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l462_c4_6a57_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l462_c4_6a57_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l463_c9_8176_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l463_c9_8176_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l463_c9_8176_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_712b_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_712b_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_712b_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_712b_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_712b_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_08e6_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_712b_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_08e6_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_08e6_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_08e6_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l469_c13_0955_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l469_c13_0955_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l469_c8_dabe_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l469_c8_dabe_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_6f09_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l469_c8_dabe_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l469_c8_dabe_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l469_c8_dabe_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l469_c8_dabe_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l469_c8_dabe_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l470_c4_06cd : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l469_c8_dabe_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l469_c8_dabe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_dabe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_dabe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_6f09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_dabe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_dabe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_dabe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_6f09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_dabe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_dabe_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l472_c4_dc8d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_dabe_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_6f09_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_dabe_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l469_c8_dabe_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l469_c8_dabe_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_6f09_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l469_c8_dabe_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_b8b1_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_b8b1_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_6f09_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_6f09_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_6f09_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_6f09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_6f09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_6f09_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_6f09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_6f09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_6f09_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_6f09_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l477_c4_7730 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_6f09_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_6f09_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_6f09_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_6f09_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_6f09_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l458_l447_l450_l435_DUPLICATE_3023_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l447_l435_DUPLICATE_6584_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l447_l450_l476_l435_DUPLICATE_97ad_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l447_l435_l476_l458_l450_DUPLICATE_cd6d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l447_l450_l435_DUPLICATE_6a56_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l447_l476_l469_l458_l450_DUPLICATE_3e94_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l458_l450_l476_DUPLICATE_4ca0_return_output : unsigned(3 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_fe0a_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_fe0a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l465_l463_DUPLICATE_e776_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l473_l478_DUPLICATE_3fb5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e671_uxn_opcodes_h_l487_l429_DUPLICATE_a9a7_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_a423_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l442_c3_331d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_a423_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l442_c3_331d;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l469_c8_dabe_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l462_c4_6a57_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9aca_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_322b_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_6f09_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l457_c35_0a66_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse := to_unsigned(0, 1);
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_712b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_b33c_right := to_unsigned(0, 1);
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_a423_iftrue := to_unsigned(0, 1);
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_a423_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_a423_iftrue := to_unsigned(0, 1);
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_6f09_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l453_c30_da3c_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l435_c2_a423_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l472_c4_dc8d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_dabe_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l472_c4_dc8d;
     VAR_current_dei_phase_uxn_opcodes_h_l470_c4_06cd := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l469_c8_dabe_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l470_c4_06cd;
     VAR_sp_relative_shift_uxn_opcodes_h_l453_c30_da3c_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_6f09_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_78d8_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_3914_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l477_c4_7730 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_6f09_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l477_c4_7730;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_3aa0_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l448_c3_4458 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_322b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l448_c3_4458;
     VAR_current_dei_phase_uxn_opcodes_h_l441_c3_fb42 := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l435_c2_a423_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l441_c3_fb42;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_08e6_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_b32f_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_dabe_iftrue := to_unsigned(1, 1);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c2_a423_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_322b_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9aca_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l462_c4_6a57_left := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l447_c7_322b_iftrue := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l469_c8_dabe_iffalse := current_dei_phase;
     VAR_device_in_uxn_opcodes_h_l459_c23_c334_phase := current_dei_phase;
     VAR_dei_param_MUX_uxn_opcodes_h_l435_c2_a423_iftrue := dei_param;
     VAR_dei_param_MUX_uxn_opcodes_h_l447_c7_322b_iftrue := dei_param;
     VAR_dei_param_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue := dei_param;
     VAR_device_in_result_MUX_uxn_opcodes_h_l447_c7_322b_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse := device_in_result;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_b8b1_expr := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l447_c7_322b_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l469_c8_dabe_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_6f09_iffalse := has_written_to_n;
     VAR_BIN_OP_AND_uxn_opcodes_h_l458_c29_e96c_left := has_written_to_t;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l469_c13_0955_expr := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l447_c7_322b_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l469_c8_dabe_iffalse := has_written_to_t;
     VAR_sp_relative_shift_uxn_opcodes_h_l453_c30_da3c_ins := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l457_c15_673b_cond := is_first_dei_done;
     VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_fe0a_expr := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_322b_iftrue := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_712b_iffalse := is_first_dei_done;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l458_c49_28c4_expr := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_322b_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_712b_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_08e6_iffalse := is_second_dei_done;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_b33c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_3aa0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_78d8_left := VAR_phase;
     VAR_device_in_uxn_opcodes_h_l459_c23_c334_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l457_c35_0a66_left := t8;
     VAR_MUX_uxn_opcodes_h_l457_c15_673b_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l435_c2_a423_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l447_c7_322b_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse := t8;
     -- UNARY_OP_NOT[uxn_opcodes_h_l458_c49_28c4] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l458_c49_28c4_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l458_c49_28c4_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l458_c49_28c4_return_output := UNARY_OP_NOT_uxn_opcodes_h_l458_c49_28c4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l447_l476_l469_l458_l450_DUPLICATE_3e94 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l447_l476_l469_l458_l450_DUPLICATE_3e94_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l435_c6_b33c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l435_c6_b33c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_b33c_left;
     BIN_OP_EQ_uxn_opcodes_h_l435_c6_b33c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_b33c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_b33c_return_output := BIN_OP_EQ_uxn_opcodes_h_l435_c6_b33c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l450_c11_78d8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l450_c11_78d8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_78d8_left;
     BIN_OP_EQ_uxn_opcodes_h_l450_c11_78d8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_78d8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_78d8_return_output := BIN_OP_EQ_uxn_opcodes_h_l450_c11_78d8_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l458_l447_l450_l435_DUPLICATE_3023 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l458_l447_l450_l435_DUPLICATE_3023_return_output := result.device_ram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l447_l435_DUPLICATE_6584 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l447_l435_DUPLICATE_6584_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l458_l450_l476_DUPLICATE_4ca0 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l458_l450_l476_DUPLICATE_4ca0_return_output := result.stack_address_sp_offset;

     -- UNARY_OP_NOT[uxn_opcodes_h_l469_c13_0955] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l469_c13_0955_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l469_c13_0955_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l469_c13_0955_return_output := UNARY_OP_NOT_uxn_opcodes_h_l469_c13_0955_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l447_l435_l476_l458_l450_DUPLICATE_cd6d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l447_l435_l476_l458_l450_DUPLICATE_cd6d_return_output := result.u8_value;

     -- result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l435_c2_a423] LATENCY=0
     VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l435_c2_a423_return_output := result.is_device_ram_write;

     -- device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6[uxn_opcodes_h_l435_c2_a423] LATENCY=0
     VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l435_c2_a423_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6(
     device_in_result,
     to_unsigned(0, 1));

     -- BIN_OP_PLUS[uxn_opcodes_h_l457_c35_0a66] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l457_c35_0a66_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l457_c35_0a66_left;
     BIN_OP_PLUS_uxn_opcodes_h_l457_c35_0a66_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l457_c35_0a66_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l457_c35_0a66_return_output := BIN_OP_PLUS_uxn_opcodes_h_l457_c35_0a66_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l462_c4_6a57] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l462_c4_6a57_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l462_c4_6a57_left;
     BIN_OP_PLUS_uxn_opcodes_h_l462_c4_6a57_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l462_c4_6a57_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l462_c4_6a57_return_output := BIN_OP_PLUS_uxn_opcodes_h_l462_c4_6a57_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l447_l450_l476_l435_DUPLICATE_97ad LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l447_l450_l476_l435_DUPLICATE_97ad_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l447_c11_3aa0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l447_c11_3aa0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_3aa0_left;
     BIN_OP_EQ_uxn_opcodes_h_l447_c11_3aa0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_3aa0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_3aa0_return_output := BIN_OP_EQ_uxn_opcodes_h_l447_c11_3aa0_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l447_l450_l435_DUPLICATE_6a56 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l447_l450_l435_DUPLICATE_6a56_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l473_l478_DUPLICATE_3fb5 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l473_l478_DUPLICATE_3fb5_return_output := device_in_result.dei_value;

     -- UNARY_OP_NOT[uxn_opcodes_h_l476_c13_b8b1] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l476_c13_b8b1_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_b8b1_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_b8b1_return_output := UNARY_OP_NOT_uxn_opcodes_h_l476_c13_b8b1_return_output;

     -- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_fe0a LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_fe0a_expr <= VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_fe0a_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_fe0a_return_output := UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_fe0a_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l453_c30_da3c] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l453_c30_da3c_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l453_c30_da3c_ins;
     sp_relative_shift_uxn_opcodes_h_l453_c30_da3c_x <= VAR_sp_relative_shift_uxn_opcodes_h_l453_c30_da3c_x;
     sp_relative_shift_uxn_opcodes_h_l453_c30_da3c_y <= VAR_sp_relative_shift_uxn_opcodes_h_l453_c30_da3c_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l453_c30_da3c_return_output := sp_relative_shift_uxn_opcodes_h_l453_c30_da3c_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_322b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_b33c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9aca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_b33c_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l435_c2_a423_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_b33c_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l435_c2_a423_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_b33c_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l435_c2_a423_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_b33c_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l435_c2_a423_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_b33c_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c2_a423_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_b33c_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_a423_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_b33c_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_a423_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_b33c_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_a423_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_b33c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_a423_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_b33c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_a423_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_b33c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_a423_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_b33c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_a423_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_b33c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_a423_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_b33c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_a423_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_b33c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l435_c2_a423_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_b33c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l435_c2_a423_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_b33c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_d62e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_3aa0_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l447_c7_322b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_3aa0_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l447_c7_322b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_3aa0_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l447_c7_322b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_3aa0_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l447_c7_322b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_3aa0_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l447_c7_322b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_3aa0_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_322b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_3aa0_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_322b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_3aa0_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_322b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_3aa0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_322b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_3aa0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_322b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_3aa0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_322b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_3aa0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_322b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_3aa0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_322b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_3aa0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l447_c7_322b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_3aa0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l447_c7_322b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_3aa0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_b32f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_78d8_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c7_d62e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_78d8_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l450_c7_d62e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_78d8_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_d62e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_78d8_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c7_d62e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_78d8_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_d62e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_78d8_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_78d8_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_78d8_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_d62e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_78d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_d62e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_78d8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_d62e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_78d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_d62e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_78d8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_d62e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_78d8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_d62e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_78d8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c7_d62e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_78d8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l450_c7_d62e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_78d8_return_output;
     VAR_MUX_uxn_opcodes_h_l457_c15_673b_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l457_c35_0a66_return_output, 8);
     VAR_current_dei_phase_uxn_opcodes_h_l462_c4_457e := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l462_c4_6a57_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_a423_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l447_l450_l435_DUPLICATE_6a56_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_322b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l447_l450_l435_DUPLICATE_6a56_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l447_l450_l435_DUPLICATE_6a56_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_322b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l447_l476_l469_l458_l450_DUPLICATE_3e94_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l447_l476_l469_l458_l450_DUPLICATE_3e94_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l447_l476_l469_l458_l450_DUPLICATE_3e94_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_dabe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l447_l476_l469_l458_l450_DUPLICATE_3e94_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_6f09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l447_l476_l469_l458_l450_DUPLICATE_3e94_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_a423_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l447_l435_DUPLICATE_6584_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_322b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l447_l435_DUPLICATE_6584_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_a423_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l447_l450_l476_l435_DUPLICATE_97ad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_322b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l447_l450_l476_l435_DUPLICATE_97ad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l447_l450_l476_l435_DUPLICATE_97ad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_6f09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l447_l450_l476_l435_DUPLICATE_97ad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l458_l450_l476_DUPLICATE_4ca0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l458_l450_l476_DUPLICATE_4ca0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_6f09_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l458_l450_l476_DUPLICATE_4ca0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l469_c8_dabe_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l473_l478_DUPLICATE_3fb5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_6f09_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l473_l478_DUPLICATE_3fb5_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_a423_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l458_l447_l450_l435_DUPLICATE_3023_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_322b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l458_l447_l450_l435_DUPLICATE_3023_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l458_l447_l450_l435_DUPLICATE_3023_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l458_l447_l450_l435_DUPLICATE_3023_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l435_c2_a423_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l447_l435_l476_l458_l450_DUPLICATE_cd6d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l447_c7_322b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l447_l435_l476_l458_l450_DUPLICATE_cd6d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l447_l435_l476_l458_l450_DUPLICATE_cd6d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l447_l435_l476_l458_l450_DUPLICATE_cd6d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_6f09_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l447_l435_l476_l458_l450_DUPLICATE_cd6d_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l458_c29_e96c_right := VAR_UNARY_OP_NOT_uxn_opcodes_h_l458_c49_28c4_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l469_c8_dabe_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l469_c13_0955_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l469_c8_dabe_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l469_c13_0955_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l469_c8_dabe_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l469_c13_0955_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_dabe_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l469_c13_0955_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_dabe_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l469_c13_0955_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_dabe_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l469_c13_0955_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l469_c8_dabe_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l469_c13_0955_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_6f09_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_b8b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_6f09_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_b8b1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_6f09_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_b8b1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_6f09_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_b8b1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_6f09_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_b8b1_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l463_c9_8176_left := VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_fe0a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_e9cd_left := VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_fe0a_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l435_c2_a423_iftrue := VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l435_c2_a423_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_a423_iffalse := VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l435_c2_a423_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l453_c30_da3c_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l462_c4_457e;
     -- current_dei_phase_MUX[uxn_opcodes_h_l469_c8_dabe] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l469_c8_dabe_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l469_c8_dabe_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l469_c8_dabe_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l469_c8_dabe_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l469_c8_dabe_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l469_c8_dabe_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l469_c8_dabe_return_output := current_dei_phase_MUX_uxn_opcodes_h_l469_c8_dabe_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l435_c1_9aca] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9aca_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9aca_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9aca_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9aca_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9aca_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9aca_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9aca_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9aca_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l435_c2_a423] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_a423_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_a423_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_a423_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_a423_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_a423_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_a423_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_a423_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_a423_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l450_c7_d62e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_d62e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_d62e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_d62e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_d62e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l476_c8_6f09] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l476_c8_6f09_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_6f09_cond;
     result_u8_value_MUX_uxn_opcodes_h_l476_c8_6f09_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_6f09_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l476_c8_6f09_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_6f09_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_6f09_return_output := result_u8_value_MUX_uxn_opcodes_h_l476_c8_6f09_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l458_c29_e96c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l458_c29_e96c_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l458_c29_e96c_left;
     BIN_OP_AND_uxn_opcodes_h_l458_c29_e96c_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l458_c29_e96c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l458_c29_e96c_return_output := BIN_OP_AND_uxn_opcodes_h_l458_c29_e96c_return_output;

     -- t8_MUX[uxn_opcodes_h_l450_c7_d62e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l450_c7_d62e_cond <= VAR_t8_MUX_uxn_opcodes_h_l450_c7_d62e_cond;
     t8_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue;
     t8_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l450_c7_d62e_return_output := t8_MUX_uxn_opcodes_h_l450_c7_d62e_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l476_c8_6f09] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l476_c8_6f09_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_6f09_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l476_c8_6f09_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_6f09_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l476_c8_6f09_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_6f09_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_6f09_return_output := has_written_to_n_MUX_uxn_opcodes_h_l476_c8_6f09_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l447_c7_322b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_322b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_322b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_322b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_322b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_322b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_322b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_322b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_322b_return_output;

     -- MUX[uxn_opcodes_h_l457_c15_673b] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l457_c15_673b_cond <= VAR_MUX_uxn_opcodes_h_l457_c15_673b_cond;
     MUX_uxn_opcodes_h_l457_c15_673b_iftrue <= VAR_MUX_uxn_opcodes_h_l457_c15_673b_iftrue;
     MUX_uxn_opcodes_h_l457_c15_673b_iffalse <= VAR_MUX_uxn_opcodes_h_l457_c15_673b_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l457_c15_673b_return_output := MUX_uxn_opcodes_h_l457_c15_673b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l476_c8_6f09] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_6f09_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_6f09_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_6f09_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_6f09_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_6f09_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_6f09_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_6f09_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_6f09_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l450_c7_d62e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_d62e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_d62e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_d62e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_d62e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l476_c8_6f09] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_6f09_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_6f09_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_6f09_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_6f09_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_6f09_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_6f09_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_6f09_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_6f09_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l476_c8_6f09] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_6f09_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_6f09_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_6f09_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_6f09_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_6f09_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_6f09_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_6f09_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_6f09_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l469_c8_dabe] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l469_c8_dabe_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l469_c8_dabe_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l469_c8_dabe_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l469_c8_dabe_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l469_c8_dabe_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l469_c8_dabe_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l469_c8_dabe_return_output := has_written_to_t_MUX_uxn_opcodes_h_l469_c8_dabe_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_e9cd_right := VAR_BIN_OP_AND_uxn_opcodes_h_l458_c29_e96c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_322b_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse := VAR_MUX_uxn_opcodes_h_l457_c15_673b_return_output;
     VAR_device_in_uxn_opcodes_h_l459_c23_c334_device_address := VAR_MUX_uxn_opcodes_h_l457_c15_673b_return_output;
     VAR_printf_uxn_opcodes_h_l436_c3_98fb_uxn_opcodes_h_l436_c3_98fb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9aca_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l469_c8_dabe_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l469_c8_dabe_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_6f09_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l469_c8_dabe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_dabe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_6f09_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_322b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_d62e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_dabe_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_6f09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_322b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_d62e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_dabe_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_6f09_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l469_c8_dabe_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_6f09_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l447_c7_322b_iffalse := VAR_t8_MUX_uxn_opcodes_h_l450_c7_d62e_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l469_c8_dabe] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_dabe_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_dabe_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_dabe_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_dabe_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_dabe_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_dabe_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_dabe_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_dabe_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l450_c7_d62e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_d62e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_d62e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_d62e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_d62e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l447_c7_322b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_322b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_322b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_322b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_322b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_322b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_322b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_322b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_322b_return_output;

     -- t8_MUX[uxn_opcodes_h_l447_c7_322b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l447_c7_322b_cond <= VAR_t8_MUX_uxn_opcodes_h_l447_c7_322b_cond;
     t8_MUX_uxn_opcodes_h_l447_c7_322b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l447_c7_322b_iftrue;
     t8_MUX_uxn_opcodes_h_l447_c7_322b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l447_c7_322b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l447_c7_322b_return_output := t8_MUX_uxn_opcodes_h_l447_c7_322b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l469_c8_dabe] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l469_c8_dabe_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l469_c8_dabe_cond;
     result_u8_value_MUX_uxn_opcodes_h_l469_c8_dabe_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l469_c8_dabe_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l469_c8_dabe_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l469_c8_dabe_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l469_c8_dabe_return_output := result_u8_value_MUX_uxn_opcodes_h_l469_c8_dabe_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l450_c7_d62e] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l450_c7_d62e_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l450_c7_d62e_cond;
     dei_param_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue;
     dei_param_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l450_c7_d62e_return_output := dei_param_MUX_uxn_opcodes_h_l450_c7_d62e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l469_c8_dabe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_dabe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_dabe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_dabe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_dabe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_dabe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_dabe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_dabe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_dabe_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l469_c8_dabe] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l469_c8_dabe_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l469_c8_dabe_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l469_c8_dabe_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l469_c8_dabe_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l469_c8_dabe_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l469_c8_dabe_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l469_c8_dabe_return_output := has_written_to_n_MUX_uxn_opcodes_h_l469_c8_dabe_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l458_c8_e9cd] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l458_c8_e9cd_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_e9cd_left;
     BIN_OP_OR_uxn_opcodes_h_l458_c8_e9cd_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_e9cd_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_e9cd_return_output := BIN_OP_OR_uxn_opcodes_h_l458_c8_e9cd_return_output;

     -- printf_uxn_opcodes_h_l436_c3_98fb[uxn_opcodes_h_l436_c3_98fb] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l436_c3_98fb_uxn_opcodes_h_l436_c3_98fb_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l436_c3_98fb_uxn_opcodes_h_l436_c3_98fb_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l447_c7_322b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_322b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_322b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_322b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_322b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_322b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_322b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_322b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_322b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l469_c8_dabe] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_dabe_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_dabe_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_dabe_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_dabe_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_dabe_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_dabe_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_dabe_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_dabe_return_output;

     -- Submodule level 3
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_3914_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_e9cd_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l458_c3_0b95_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_e9cd_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l458_c3_0b95_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_e9cd_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l458_c3_0b95_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_e9cd_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l458_c3_0b95_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_e9cd_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_e9cd_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_e9cd_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_0b95_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_e9cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_0b95_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_e9cd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_0b95_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_e9cd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_0b95_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_e9cd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l458_c3_0b95_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_e9cd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_b32f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_d62e_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l447_c7_322b_iffalse := VAR_dei_param_MUX_uxn_opcodes_h_l450_c7_d62e_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l469_c8_dabe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_dabe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_a423_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_322b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_dabe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_a423_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_322b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_dabe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l469_c8_dabe_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l435_c2_a423_iffalse := VAR_t8_MUX_uxn_opcodes_h_l447_c7_322b_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l435_c2_a423] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_a423_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_a423_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_a423_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_a423_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_a423_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_a423_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_a423_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_a423_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l458_c3_0b95] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l458_c3_0b95_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l458_c3_0b95_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l458_c3_0b95_return_output := current_dei_phase_MUX_uxn_opcodes_h_l458_c3_0b95_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l458_c3_0b95] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_0b95_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_0b95_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_0b95_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_0b95_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l458_c3_0b95] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l458_c3_0b95_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l458_c3_0b95_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l458_c3_0b95_return_output := has_written_to_t_MUX_uxn_opcodes_h_l458_c3_0b95_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l458_c3_0b95] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_0b95_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_0b95_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_0b95_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_0b95_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l458_c3_0b95] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l458_c3_0b95_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l458_c3_0b95_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l458_c3_0b95_return_output := has_written_to_n_MUX_uxn_opcodes_h_l458_c3_0b95_return_output;

     -- t8_MUX[uxn_opcodes_h_l435_c2_a423] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l435_c2_a423_cond <= VAR_t8_MUX_uxn_opcodes_h_l435_c2_a423_cond;
     t8_MUX_uxn_opcodes_h_l435_c2_a423_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l435_c2_a423_iftrue;
     t8_MUX_uxn_opcodes_h_l435_c2_a423_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l435_c2_a423_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l435_c2_a423_return_output := t8_MUX_uxn_opcodes_h_l435_c2_a423_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l435_c2_a423] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_a423_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_a423_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_a423_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_a423_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_a423_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_a423_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_a423_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_a423_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l447_c7_322b] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l447_c7_322b_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l447_c7_322b_cond;
     dei_param_MUX_uxn_opcodes_h_l447_c7_322b_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l447_c7_322b_iftrue;
     dei_param_MUX_uxn_opcodes_h_l447_c7_322b_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l447_c7_322b_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l447_c7_322b_return_output := dei_param_MUX_uxn_opcodes_h_l447_c7_322b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l455_c1_b32f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_b32f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_b32f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_b32f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_b32f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_b32f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_b32f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_b32f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_b32f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l458_c3_0b95] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l458_c3_0b95_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l458_c3_0b95_cond;
     result_u8_value_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l458_c3_0b95_return_output := result_u8_value_MUX_uxn_opcodes_h_l458_c3_0b95_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l458_c3_0b95] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_0b95_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_0b95_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_0b95_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_0b95_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_3914_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_b32f_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l458_c3_0b95_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l435_c2_a423_iffalse := VAR_dei_param_MUX_uxn_opcodes_h_l447_c7_322b_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l458_c3_0b95_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l458_c3_0b95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_0b95_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_0b95_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_0b95_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l458_c3_0b95_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l435_c2_a423_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l450_c7_d62e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l450_c7_d62e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c7_d62e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c7_d62e_return_output := result_u8_value_MUX_uxn_opcodes_h_l450_c7_d62e_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l450_c7_d62e] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l450_c7_d62e_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c7_d62e_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c7_d62e_return_output := has_written_to_n_MUX_uxn_opcodes_h_l450_c7_d62e_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l450_c7_d62e] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l450_c7_d62e_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_d62e_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_d62e_return_output := has_written_to_t_MUX_uxn_opcodes_h_l450_c7_d62e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l450_c7_d62e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_d62e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_d62e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_d62e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_d62e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l458_c1_3914] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_3914_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_3914_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_3914_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_3914_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_3914_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_3914_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_3914_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_3914_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l450_c7_d62e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_d62e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_d62e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_d62e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_d62e_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l450_c7_d62e] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l450_c7_d62e_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c7_d62e_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c7_d62e_return_output := current_dei_phase_MUX_uxn_opcodes_h_l450_c7_d62e_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l435_c2_a423] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l435_c2_a423_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l435_c2_a423_cond;
     dei_param_MUX_uxn_opcodes_h_l435_c2_a423_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l435_c2_a423_iftrue;
     dei_param_MUX_uxn_opcodes_h_l435_c2_a423_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l435_c2_a423_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l435_c2_a423_return_output := dei_param_MUX_uxn_opcodes_h_l435_c2_a423_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l450_c7_d62e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_d62e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_d62e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_d62e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_d62e_return_output;

     -- Submodule level 5
     VAR_device_in_uxn_opcodes_h_l459_c23_c334_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_3914_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l447_c7_322b_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c7_d62e_return_output;
     REG_VAR_dei_param := VAR_dei_param_MUX_uxn_opcodes_h_l435_c2_a423_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l447_c7_322b_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c7_d62e_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l447_c7_322b_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_d62e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_322b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_d62e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_322b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_d62e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_322b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_d62e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l447_c7_322b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c7_d62e_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l447_c7_322b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_322b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_322b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_322b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_322b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_322b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_322b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_322b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_322b_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l447_c7_322b] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l447_c7_322b_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l447_c7_322b_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l447_c7_322b_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l447_c7_322b_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l447_c7_322b_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l447_c7_322b_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l447_c7_322b_return_output := current_dei_phase_MUX_uxn_opcodes_h_l447_c7_322b_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l447_c7_322b] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l447_c7_322b_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l447_c7_322b_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l447_c7_322b_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l447_c7_322b_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l447_c7_322b_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l447_c7_322b_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l447_c7_322b_return_output := has_written_to_t_MUX_uxn_opcodes_h_l447_c7_322b_return_output;

     -- device_in[uxn_opcodes_h_l459_c23_c334] LATENCY=0
     -- Clock enable
     device_in_uxn_opcodes_h_l459_c23_c334_CLOCK_ENABLE <= VAR_device_in_uxn_opcodes_h_l459_c23_c334_CLOCK_ENABLE;
     -- Inputs
     device_in_uxn_opcodes_h_l459_c23_c334_device_address <= VAR_device_in_uxn_opcodes_h_l459_c23_c334_device_address;
     device_in_uxn_opcodes_h_l459_c23_c334_phase <= VAR_device_in_uxn_opcodes_h_l459_c23_c334_phase;
     device_in_uxn_opcodes_h_l459_c23_c334_previous_device_ram_read <= VAR_device_in_uxn_opcodes_h_l459_c23_c334_previous_device_ram_read;
     -- Outputs
     VAR_device_in_uxn_opcodes_h_l459_c23_c334_return_output := device_in_uxn_opcodes_h_l459_c23_c334_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l447_c7_322b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_322b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_322b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_322b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_322b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_322b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_322b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_322b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_322b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l447_c7_322b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l447_c7_322b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l447_c7_322b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l447_c7_322b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l447_c7_322b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l447_c7_322b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l447_c7_322b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l447_c7_322b_return_output := result_u8_value_MUX_uxn_opcodes_h_l447_c7_322b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l447_c7_322b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_322b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_322b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_322b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_322b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_322b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_322b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_322b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_322b_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l447_c7_322b] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l447_c7_322b_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l447_c7_322b_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l447_c7_322b_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l447_c7_322b_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l447_c7_322b_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l447_c7_322b_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l447_c7_322b_return_output := has_written_to_n_MUX_uxn_opcodes_h_l447_c7_322b_return_output;

     -- Submodule level 6
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l435_c2_a423_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l447_c7_322b_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue := VAR_device_in_uxn_opcodes_h_l459_c23_c334_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l435_c2_a423_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l447_c7_322b_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c2_a423_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l447_c7_322b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_a423_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_322b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_a423_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_322b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_a423_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_322b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l435_c2_a423_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l447_c7_322b_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l435_c2_a423] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_a423_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_a423_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_a423_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_a423_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_a423_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_a423_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_a423_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_a423_return_output;

     -- CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d[uxn_opcodes_h_l460_c32_6484] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l460_c32_6484_return_output := VAR_device_in_uxn_opcodes_h_l459_c23_c334_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l465_l463_DUPLICATE_e776 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l465_l463_DUPLICATE_e776_return_output := VAR_device_in_uxn_opcodes_h_l459_c23_c334_return_output.is_dei_done;

     -- device_in_result_MUX[uxn_opcodes_h_l458_c3_0b95] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l458_c3_0b95_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l458_c3_0b95_cond;
     device_in_result_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l458_c3_0b95_return_output := device_in_result_MUX_uxn_opcodes_h_l458_c3_0b95_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l435_c2_a423] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l435_c2_a423_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l435_c2_a423_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l435_c2_a423_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l435_c2_a423_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l435_c2_a423_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l435_c2_a423_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l435_c2_a423_return_output := has_written_to_n_MUX_uxn_opcodes_h_l435_c2_a423_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l435_c2_a423] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l435_c2_a423_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l435_c2_a423_cond;
     result_u8_value_MUX_uxn_opcodes_h_l435_c2_a423_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l435_c2_a423_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l435_c2_a423_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l435_c2_a423_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l435_c2_a423_return_output := result_u8_value_MUX_uxn_opcodes_h_l435_c2_a423_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l435_c2_a423] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_a423_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_a423_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_a423_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_a423_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_a423_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_a423_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_a423_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_a423_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l435_c2_a423] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_a423_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_a423_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_a423_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_a423_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_a423_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_a423_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_a423_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_a423_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l435_c2_a423] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l435_c2_a423_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c2_a423_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l435_c2_a423_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c2_a423_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l435_c2_a423_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c2_a423_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c2_a423_return_output := has_written_to_t_MUX_uxn_opcodes_h_l435_c2_a423_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l435_c2_a423] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l435_c2_a423_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l435_c2_a423_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l435_c2_a423_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l435_c2_a423_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l435_c2_a423_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l435_c2_a423_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l435_c2_a423_return_output := current_dei_phase_MUX_uxn_opcodes_h_l435_c2_a423_return_output;

     -- Submodule level 7
     VAR_BIN_OP_AND_uxn_opcodes_h_l463_c9_8176_right := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l465_l463_DUPLICATE_e776_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_08e6_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l465_l463_DUPLICATE_e776_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l460_c32_6484_return_output;
     REG_VAR_current_dei_phase := VAR_current_dei_phase_MUX_uxn_opcodes_h_l435_c2_a423_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l458_c3_0b95_return_output;
     REG_VAR_has_written_to_n := VAR_has_written_to_n_MUX_uxn_opcodes_h_l435_c2_a423_return_output;
     REG_VAR_has_written_to_t := VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c2_a423_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l458_c3_0b95] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_0b95_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_0b95_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_0b95_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_0b95_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l450_c7_d62e] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l450_c7_d62e_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_d62e_cond;
     device_in_result_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_d62e_return_output := device_in_result_MUX_uxn_opcodes_h_l450_c7_d62e_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l465_c11_08e6] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_08e6_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_08e6_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_08e6_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_08e6_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_08e6_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_08e6_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_08e6_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_08e6_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l463_c9_8176] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l463_c9_8176_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l463_c9_8176_left;
     BIN_OP_AND_uxn_opcodes_h_l463_c9_8176_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l463_c9_8176_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l463_c9_8176_return_output := BIN_OP_AND_uxn_opcodes_h_l463_c9_8176_return_output;

     -- Submodule level 8
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_712b_cond := VAR_BIN_OP_AND_uxn_opcodes_h_l463_c9_8176_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_712b_cond := VAR_BIN_OP_AND_uxn_opcodes_h_l463_c9_8176_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l447_c7_322b_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_d62e_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_712b_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_08e6_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_0b95_return_output;
     -- device_in_result_MUX[uxn_opcodes_h_l447_c7_322b] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l447_c7_322b_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l447_c7_322b_cond;
     device_in_result_MUX_uxn_opcodes_h_l447_c7_322b_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l447_c7_322b_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l447_c7_322b_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l447_c7_322b_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l447_c7_322b_return_output := device_in_result_MUX_uxn_opcodes_h_l447_c7_322b_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l463_c4_712b] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_712b_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_712b_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_712b_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_712b_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_712b_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_712b_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_712b_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_712b_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l450_c7_d62e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_d62e_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_d62e_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_d62e_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_d62e_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l463_c4_712b] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_712b_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_712b_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_712b_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_712b_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_712b_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_712b_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_712b_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_712b_return_output;

     -- Submodule level 9
     VAR_device_in_result_MUX_uxn_opcodes_h_l435_c2_a423_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l447_c7_322b_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_712b_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_712b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_322b_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_d62e_return_output;
     -- is_second_dei_done_MUX[uxn_opcodes_h_l458_c3_0b95] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l458_c3_0b95] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l435_c2_a423] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l435_c2_a423_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l435_c2_a423_cond;
     device_in_result_MUX_uxn_opcodes_h_l435_c2_a423_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l435_c2_a423_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l435_c2_a423_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l435_c2_a423_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l435_c2_a423_return_output := device_in_result_MUX_uxn_opcodes_h_l435_c2_a423_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l447_c7_322b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_322b_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_322b_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_322b_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_322b_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_322b_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_322b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_322b_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_322b_return_output;

     -- Submodule level 10
     REG_VAR_device_in_result := VAR_device_in_result_MUX_uxn_opcodes_h_l435_c2_a423_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_0b95_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_a423_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_322b_return_output;
     -- is_first_dei_done_MUX[uxn_opcodes_h_l450_c7_d62e] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l450_c7_d62e] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l435_c2_a423] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_a423_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_a423_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_a423_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_a423_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_a423_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_a423_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_a423_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_a423_return_output;

     -- Submodule level 11
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_322b_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_322b_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_d62e_return_output;
     -- is_first_dei_done_MUX[uxn_opcodes_h_l447_c7_322b] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_322b_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_322b_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_322b_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_322b_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_322b_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_322b_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_322b_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_322b_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l447_c7_322b] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_322b_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_322b_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_322b_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_322b_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_322b_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_322b_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_322b_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_322b_return_output;

     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e671_uxn_opcodes_h_l487_l429_DUPLICATE_a9a7 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e671_uxn_opcodes_h_l487_l429_DUPLICATE_a9a7_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e671(
     result,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_a423_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_a423_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_a423_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_a423_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_a423_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l435_c2_a423_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_a423_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_a423_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e671_uxn_opcodes_h_l487_l429_DUPLICATE_a9a7_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e671_uxn_opcodes_h_l487_l429_DUPLICATE_a9a7_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_a423_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_322b_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_a423_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_322b_return_output;
     -- is_first_dei_done_MUX[uxn_opcodes_h_l435_c2_a423] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_a423_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_a423_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_a423_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_a423_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_a423_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_a423_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_a423_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_a423_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l435_c2_a423] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_a423_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_a423_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_a423_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_a423_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_a423_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_a423_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_a423_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_a423_return_output;

     -- Submodule level 13
     REG_VAR_is_first_dei_done := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_a423_return_output;
     REG_VAR_is_second_dei_done := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_a423_return_output;
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
