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
-- BIN_OP_EQ[uxn_opcodes_h_l435_c6_2625]
signal BIN_OP_EQ_uxn_opcodes_h_l435_c6_2625_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l435_c6_2625_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l435_c6_2625_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l435_c1_9f1f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9f1f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9f1f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9f1f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9f1f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l447_c7_4f41]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_4f41_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_4f41_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l435_c2_9db2]
signal has_written_to_t_MUX_uxn_opcodes_h_l435_c2_9db2_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l435_c2_9db2_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l435_c2_9db2]
signal device_in_result_MUX_uxn_opcodes_h_l435_c2_9db2_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l435_c2_9db2_return_output : device_in_result_t;

-- is_second_dei_done_MUX[uxn_opcodes_h_l435_c2_9db2]
signal is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l435_c2_9db2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_9db2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_9db2_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l435_c2_9db2]
signal result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_9db2_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_9db2_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l435_c2_9db2]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_9db2_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_9db2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l435_c2_9db2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_9db2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_9db2_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l435_c2_9db2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_9db2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_9db2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l435_c2_9db2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_9db2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_9db2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l435_c2_9db2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_9db2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_9db2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l435_c2_9db2]
signal result_u8_value_MUX_uxn_opcodes_h_l435_c2_9db2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l435_c2_9db2_return_output : unsigned(7 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l435_c2_9db2]
signal dei_param_MUX_uxn_opcodes_h_l435_c2_9db2_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l435_c2_9db2_return_output : unsigned(7 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l435_c2_9db2]
signal has_written_to_n_MUX_uxn_opcodes_h_l435_c2_9db2_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l435_c2_9db2_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l435_c2_9db2]
signal is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l435_c2_9db2]
signal current_dei_phase_MUX_uxn_opcodes_h_l435_c2_9db2_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l435_c2_9db2_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l435_c2_9db2]
signal t8_MUX_uxn_opcodes_h_l435_c2_9db2_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l435_c2_9db2_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l436_c3_9c0b[uxn_opcodes_h_l436_c3_9c0b]
signal printf_uxn_opcodes_h_l436_c3_9c0b_uxn_opcodes_h_l436_c3_9c0b_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l447_c11_9568]
signal BIN_OP_EQ_uxn_opcodes_h_l447_c11_9568_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l447_c11_9568_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l447_c11_9568_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l450_c7_89c8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_89c8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_89c8_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l447_c7_4f41]
signal has_written_to_t_MUX_uxn_opcodes_h_l447_c7_4f41_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l447_c7_4f41_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l447_c7_4f41]
signal device_in_result_MUX_uxn_opcodes_h_l447_c7_4f41_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l447_c7_4f41_return_output : device_in_result_t;

-- is_second_dei_done_MUX[uxn_opcodes_h_l447_c7_4f41]
signal is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l447_c7_4f41]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_4f41_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_4f41_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l447_c7_4f41]
signal result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_4f41_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_4f41_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l447_c7_4f41]
signal result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_4f41_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_4f41_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l447_c7_4f41]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_4f41_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_4f41_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l447_c7_4f41]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_4f41_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_4f41_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l447_c7_4f41]
signal result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_4f41_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_4f41_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l447_c7_4f41]
signal result_u8_value_MUX_uxn_opcodes_h_l447_c7_4f41_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l447_c7_4f41_return_output : unsigned(7 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l447_c7_4f41]
signal dei_param_MUX_uxn_opcodes_h_l447_c7_4f41_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l447_c7_4f41_return_output : unsigned(7 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l447_c7_4f41]
signal has_written_to_n_MUX_uxn_opcodes_h_l447_c7_4f41_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l447_c7_4f41_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l447_c7_4f41]
signal is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l447_c7_4f41]
signal current_dei_phase_MUX_uxn_opcodes_h_l447_c7_4f41_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l447_c7_4f41_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l447_c7_4f41]
signal t8_MUX_uxn_opcodes_h_l447_c7_4f41_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l447_c7_4f41_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l450_c11_4f88]
signal BIN_OP_EQ_uxn_opcodes_h_l450_c11_4f88_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l450_c11_4f88_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l450_c11_4f88_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l455_c1_8d32]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_8d32_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_8d32_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_8d32_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_8d32_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l450_c7_89c8]
signal has_written_to_t_MUX_uxn_opcodes_h_l450_c7_89c8_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l450_c7_89c8_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l450_c7_89c8]
signal device_in_result_MUX_uxn_opcodes_h_l450_c7_89c8_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l450_c7_89c8_return_output : device_in_result_t;

-- is_second_dei_done_MUX[uxn_opcodes_h_l450_c7_89c8]
signal is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l450_c7_89c8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_89c8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_89c8_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l450_c7_89c8]
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_89c8_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_89c8_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l450_c7_89c8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_89c8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_89c8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l450_c7_89c8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_89c8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_89c8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l450_c7_89c8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_89c8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_89c8_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l450_c7_89c8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_89c8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_89c8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l450_c7_89c8]
signal result_u8_value_MUX_uxn_opcodes_h_l450_c7_89c8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l450_c7_89c8_return_output : unsigned(7 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l450_c7_89c8]
signal dei_param_MUX_uxn_opcodes_h_l450_c7_89c8_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l450_c7_89c8_return_output : unsigned(7 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l450_c7_89c8]
signal has_written_to_n_MUX_uxn_opcodes_h_l450_c7_89c8_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l450_c7_89c8_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l450_c7_89c8]
signal is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l450_c7_89c8]
signal current_dei_phase_MUX_uxn_opcodes_h_l450_c7_89c8_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l450_c7_89c8_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l450_c7_89c8]
signal t8_MUX_uxn_opcodes_h_l450_c7_89c8_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l450_c7_89c8_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l453_c30_45e0]
signal sp_relative_shift_uxn_opcodes_h_l453_c30_45e0_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l453_c30_45e0_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l453_c30_45e0_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l453_c30_45e0_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l457_c35_a641]
signal BIN_OP_PLUS_uxn_opcodes_h_l457_c35_a641_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l457_c35_a641_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l457_c35_a641_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l457_c15_db59]
signal MUX_uxn_opcodes_h_l457_c15_db59_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l457_c15_db59_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l457_c15_db59_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l457_c15_db59_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l458_c49_313d]
signal UNARY_OP_NOT_uxn_opcodes_h_l458_c49_313d_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l458_c49_313d_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l458_c29_8688]
signal BIN_OP_AND_uxn_opcodes_h_l458_c29_8688_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l458_c29_8688_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l458_c29_8688_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l458_c8_1e4d]
signal BIN_OP_OR_uxn_opcodes_h_l458_c8_1e4d_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l458_c8_1e4d_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l458_c8_1e4d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l458_c1_d0fc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_d0fc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_d0fc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_d0fc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_d0fc_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l458_c3_647f]
signal has_written_to_t_MUX_uxn_opcodes_h_l458_c3_647f_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l458_c3_647f_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l458_c3_647f_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l458_c3_647f_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l458_c3_647f]
signal device_in_result_MUX_uxn_opcodes_h_l458_c3_647f_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l458_c3_647f_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l458_c3_647f_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l458_c3_647f_return_output : device_in_result_t;

-- is_second_dei_done_MUX[uxn_opcodes_h_l458_c3_647f]
signal is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_647f_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_647f_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_647f_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_647f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l458_c3_647f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_647f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_647f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_647f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_647f_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l458_c3_647f]
signal result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_647f_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_647f_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_647f_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_647f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l458_c3_647f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_647f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_647f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_647f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_647f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l458_c3_647f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_647f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_647f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_647f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_647f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l458_c3_647f]
signal result_u8_value_MUX_uxn_opcodes_h_l458_c3_647f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l458_c3_647f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l458_c3_647f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l458_c3_647f_return_output : unsigned(7 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l458_c3_647f]
signal has_written_to_n_MUX_uxn_opcodes_h_l458_c3_647f_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l458_c3_647f_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l458_c3_647f_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l458_c3_647f_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l458_c3_647f]
signal is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_647f_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_647f_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_647f_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_647f_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l458_c3_647f]
signal current_dei_phase_MUX_uxn_opcodes_h_l458_c3_647f_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l458_c3_647f_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l458_c3_647f_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l458_c3_647f_return_output : unsigned(7 downto 0);

-- device_in[uxn_opcodes_h_l459_c23_7f94]
signal device_in_uxn_opcodes_h_l459_c23_7f94_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_in_uxn_opcodes_h_l459_c23_7f94_device_address : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l459_c23_7f94_phase : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l459_c23_7f94_previous_device_ram_read : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l459_c23_7f94_return_output : device_in_result_t;

-- BIN_OP_PLUS[uxn_opcodes_h_l462_c4_9124]
signal BIN_OP_PLUS_uxn_opcodes_h_l462_c4_9124_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l462_c4_9124_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l462_c4_9124_return_output : unsigned(8 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l463_c9_9f7e]
signal BIN_OP_AND_uxn_opcodes_h_l463_c9_9f7e_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l463_c9_9f7e_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l463_c9_9f7e_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l463_c4_7289]
signal is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_7289_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_7289_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_7289_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_7289_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l463_c4_7289]
signal is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_7289_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_7289_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_7289_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_7289_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l465_c11_3ff8]
signal is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_3ff8_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_3ff8_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_3ff8_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_3ff8_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l469_c13_b492]
signal UNARY_OP_NOT_uxn_opcodes_h_l469_c13_b492_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l469_c13_b492_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l469_c8_8aa3]
signal has_written_to_t_MUX_uxn_opcodes_h_l469_c8_8aa3_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l469_c8_8aa3_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l469_c8_8aa3_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l469_c8_8aa3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l469_c8_8aa3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_8aa3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_8aa3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_8aa3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_8aa3_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l469_c8_8aa3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_8aa3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_8aa3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_8aa3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_8aa3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l469_c8_8aa3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_8aa3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_8aa3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_8aa3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_8aa3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l469_c8_8aa3]
signal result_u8_value_MUX_uxn_opcodes_h_l469_c8_8aa3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l469_c8_8aa3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l469_c8_8aa3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l469_c8_8aa3_return_output : unsigned(7 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l469_c8_8aa3]
signal has_written_to_n_MUX_uxn_opcodes_h_l469_c8_8aa3_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l469_c8_8aa3_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l469_c8_8aa3_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l469_c8_8aa3_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l469_c8_8aa3]
signal current_dei_phase_MUX_uxn_opcodes_h_l469_c8_8aa3_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l469_c8_8aa3_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l469_c8_8aa3_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l469_c8_8aa3_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l476_c13_e0f5]
signal UNARY_OP_NOT_uxn_opcodes_h_l476_c13_e0f5_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l476_c13_e0f5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l476_c8_f909]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_f909_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_f909_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_f909_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_f909_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l476_c8_f909]
signal result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_f909_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_f909_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_f909_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_f909_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l476_c8_f909]
signal result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_f909_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_f909_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_f909_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_f909_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l476_c8_f909]
signal result_u8_value_MUX_uxn_opcodes_h_l476_c8_f909_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l476_c8_f909_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l476_c8_f909_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l476_c8_f909_return_output : unsigned(7 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l476_c8_f909]
signal has_written_to_n_MUX_uxn_opcodes_h_l476_c8_f909_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l476_c8_f909_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l476_c8_f909_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l476_c8_f909_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_8dc9
signal UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_8dc9_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_8dc9_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_f010( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.device_ram_address := ref_toks_2;
      base.is_device_ram_write := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_sp_shift := ref_toks_7;
      base.u8_value := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l435_c6_2625
BIN_OP_EQ_uxn_opcodes_h_l435_c6_2625 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l435_c6_2625_left,
BIN_OP_EQ_uxn_opcodes_h_l435_c6_2625_right,
BIN_OP_EQ_uxn_opcodes_h_l435_c6_2625_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9f1f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9f1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9f1f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9f1f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9f1f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9f1f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_4f41
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_4f41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_4f41_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_4f41_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l435_c2_9db2
has_written_to_t_MUX_uxn_opcodes_h_l435_c2_9db2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l435_c2_9db2_cond,
has_written_to_t_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l435_c2_9db2_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l435_c2_9db2
device_in_result_MUX_uxn_opcodes_h_l435_c2_9db2 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l435_c2_9db2_cond,
device_in_result_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue,
device_in_result_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse,
device_in_result_MUX_uxn_opcodes_h_l435_c2_9db2_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2
is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_9db2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_9db2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_9db2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_9db2_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_9db2
result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_9db2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_9db2_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_9db2_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_9db2
result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_9db2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_9db2_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_9db2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_9db2
result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_9db2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_9db2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_9db2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_9db2
result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_9db2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_9db2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_9db2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_9db2
result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_9db2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_9db2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_9db2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_9db2
result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_9db2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_9db2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_9db2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l435_c2_9db2
result_u8_value_MUX_uxn_opcodes_h_l435_c2_9db2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l435_c2_9db2_cond,
result_u8_value_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l435_c2_9db2_return_output);

-- dei_param_MUX_uxn_opcodes_h_l435_c2_9db2
dei_param_MUX_uxn_opcodes_h_l435_c2_9db2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l435_c2_9db2_cond,
dei_param_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue,
dei_param_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse,
dei_param_MUX_uxn_opcodes_h_l435_c2_9db2_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l435_c2_9db2
has_written_to_n_MUX_uxn_opcodes_h_l435_c2_9db2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l435_c2_9db2_cond,
has_written_to_n_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l435_c2_9db2_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2
is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l435_c2_9db2
current_dei_phase_MUX_uxn_opcodes_h_l435_c2_9db2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l435_c2_9db2_cond,
current_dei_phase_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l435_c2_9db2_return_output);

-- t8_MUX_uxn_opcodes_h_l435_c2_9db2
t8_MUX_uxn_opcodes_h_l435_c2_9db2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l435_c2_9db2_cond,
t8_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue,
t8_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse,
t8_MUX_uxn_opcodes_h_l435_c2_9db2_return_output);

-- printf_uxn_opcodes_h_l436_c3_9c0b_uxn_opcodes_h_l436_c3_9c0b
printf_uxn_opcodes_h_l436_c3_9c0b_uxn_opcodes_h_l436_c3_9c0b : entity work.printf_uxn_opcodes_h_l436_c3_9c0b_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l436_c3_9c0b_uxn_opcodes_h_l436_c3_9c0b_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l447_c11_9568
BIN_OP_EQ_uxn_opcodes_h_l447_c11_9568 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l447_c11_9568_left,
BIN_OP_EQ_uxn_opcodes_h_l447_c11_9568_right,
BIN_OP_EQ_uxn_opcodes_h_l447_c11_9568_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_89c8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_89c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_89c8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_89c8_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l447_c7_4f41
has_written_to_t_MUX_uxn_opcodes_h_l447_c7_4f41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l447_c7_4f41_cond,
has_written_to_t_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l447_c7_4f41_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l447_c7_4f41
device_in_result_MUX_uxn_opcodes_h_l447_c7_4f41 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l447_c7_4f41_cond,
device_in_result_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue,
device_in_result_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse,
device_in_result_MUX_uxn_opcodes_h_l447_c7_4f41_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41
is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_4f41
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_4f41 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_4f41_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_4f41_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_4f41
result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_4f41 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_4f41_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_4f41_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_4f41
result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_4f41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_4f41_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_4f41_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_4f41
result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_4f41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_4f41_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_4f41_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_4f41
result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_4f41 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_4f41_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_4f41_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_4f41
result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_4f41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_4f41_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_4f41_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l447_c7_4f41
result_u8_value_MUX_uxn_opcodes_h_l447_c7_4f41 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l447_c7_4f41_cond,
result_u8_value_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l447_c7_4f41_return_output);

-- dei_param_MUX_uxn_opcodes_h_l447_c7_4f41
dei_param_MUX_uxn_opcodes_h_l447_c7_4f41 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l447_c7_4f41_cond,
dei_param_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue,
dei_param_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse,
dei_param_MUX_uxn_opcodes_h_l447_c7_4f41_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l447_c7_4f41
has_written_to_n_MUX_uxn_opcodes_h_l447_c7_4f41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l447_c7_4f41_cond,
has_written_to_n_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l447_c7_4f41_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41
is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l447_c7_4f41
current_dei_phase_MUX_uxn_opcodes_h_l447_c7_4f41 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l447_c7_4f41_cond,
current_dei_phase_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l447_c7_4f41_return_output);

-- t8_MUX_uxn_opcodes_h_l447_c7_4f41
t8_MUX_uxn_opcodes_h_l447_c7_4f41 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l447_c7_4f41_cond,
t8_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue,
t8_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse,
t8_MUX_uxn_opcodes_h_l447_c7_4f41_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l450_c11_4f88
BIN_OP_EQ_uxn_opcodes_h_l450_c11_4f88 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l450_c11_4f88_left,
BIN_OP_EQ_uxn_opcodes_h_l450_c11_4f88_right,
BIN_OP_EQ_uxn_opcodes_h_l450_c11_4f88_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_8d32
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_8d32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_8d32_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_8d32_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_8d32_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_8d32_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l450_c7_89c8
has_written_to_t_MUX_uxn_opcodes_h_l450_c7_89c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l450_c7_89c8_cond,
has_written_to_t_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l450_c7_89c8_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l450_c7_89c8
device_in_result_MUX_uxn_opcodes_h_l450_c7_89c8 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l450_c7_89c8_cond,
device_in_result_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue,
device_in_result_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse,
device_in_result_MUX_uxn_opcodes_h_l450_c7_89c8_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8
is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_89c8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_89c8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_89c8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_89c8_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_89c8
result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_89c8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_89c8_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_89c8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_89c8
result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_89c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_89c8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_89c8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_89c8
result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_89c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_89c8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_89c8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_89c8
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_89c8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_89c8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_89c8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_89c8
result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_89c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_89c8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_89c8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l450_c7_89c8
result_u8_value_MUX_uxn_opcodes_h_l450_c7_89c8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l450_c7_89c8_cond,
result_u8_value_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l450_c7_89c8_return_output);

-- dei_param_MUX_uxn_opcodes_h_l450_c7_89c8
dei_param_MUX_uxn_opcodes_h_l450_c7_89c8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l450_c7_89c8_cond,
dei_param_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue,
dei_param_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse,
dei_param_MUX_uxn_opcodes_h_l450_c7_89c8_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l450_c7_89c8
has_written_to_n_MUX_uxn_opcodes_h_l450_c7_89c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l450_c7_89c8_cond,
has_written_to_n_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l450_c7_89c8_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8
is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l450_c7_89c8
current_dei_phase_MUX_uxn_opcodes_h_l450_c7_89c8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l450_c7_89c8_cond,
current_dei_phase_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l450_c7_89c8_return_output);

-- t8_MUX_uxn_opcodes_h_l450_c7_89c8
t8_MUX_uxn_opcodes_h_l450_c7_89c8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l450_c7_89c8_cond,
t8_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue,
t8_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse,
t8_MUX_uxn_opcodes_h_l450_c7_89c8_return_output);

-- sp_relative_shift_uxn_opcodes_h_l453_c30_45e0
sp_relative_shift_uxn_opcodes_h_l453_c30_45e0 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l453_c30_45e0_ins,
sp_relative_shift_uxn_opcodes_h_l453_c30_45e0_x,
sp_relative_shift_uxn_opcodes_h_l453_c30_45e0_y,
sp_relative_shift_uxn_opcodes_h_l453_c30_45e0_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l457_c35_a641
BIN_OP_PLUS_uxn_opcodes_h_l457_c35_a641 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l457_c35_a641_left,
BIN_OP_PLUS_uxn_opcodes_h_l457_c35_a641_right,
BIN_OP_PLUS_uxn_opcodes_h_l457_c35_a641_return_output);

-- MUX_uxn_opcodes_h_l457_c15_db59
MUX_uxn_opcodes_h_l457_c15_db59 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l457_c15_db59_cond,
MUX_uxn_opcodes_h_l457_c15_db59_iftrue,
MUX_uxn_opcodes_h_l457_c15_db59_iffalse,
MUX_uxn_opcodes_h_l457_c15_db59_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l458_c49_313d
UNARY_OP_NOT_uxn_opcodes_h_l458_c49_313d : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l458_c49_313d_expr,
UNARY_OP_NOT_uxn_opcodes_h_l458_c49_313d_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l458_c29_8688
BIN_OP_AND_uxn_opcodes_h_l458_c29_8688 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l458_c29_8688_left,
BIN_OP_AND_uxn_opcodes_h_l458_c29_8688_right,
BIN_OP_AND_uxn_opcodes_h_l458_c29_8688_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l458_c8_1e4d
BIN_OP_OR_uxn_opcodes_h_l458_c8_1e4d : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l458_c8_1e4d_left,
BIN_OP_OR_uxn_opcodes_h_l458_c8_1e4d_right,
BIN_OP_OR_uxn_opcodes_h_l458_c8_1e4d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_d0fc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_d0fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_d0fc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_d0fc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_d0fc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_d0fc_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l458_c3_647f
has_written_to_t_MUX_uxn_opcodes_h_l458_c3_647f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l458_c3_647f_cond,
has_written_to_t_MUX_uxn_opcodes_h_l458_c3_647f_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l458_c3_647f_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l458_c3_647f_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l458_c3_647f
device_in_result_MUX_uxn_opcodes_h_l458_c3_647f : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l458_c3_647f_cond,
device_in_result_MUX_uxn_opcodes_h_l458_c3_647f_iftrue,
device_in_result_MUX_uxn_opcodes_h_l458_c3_647f_iffalse,
device_in_result_MUX_uxn_opcodes_h_l458_c3_647f_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_647f
is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_647f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_647f_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_647f_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_647f_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_647f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_647f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_647f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_647f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_647f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_647f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_647f_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_647f
result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_647f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_647f_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_647f_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_647f_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_647f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_647f
result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_647f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_647f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_647f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_647f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_647f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_647f
result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_647f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_647f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_647f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_647f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_647f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l458_c3_647f
result_u8_value_MUX_uxn_opcodes_h_l458_c3_647f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l458_c3_647f_cond,
result_u8_value_MUX_uxn_opcodes_h_l458_c3_647f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l458_c3_647f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l458_c3_647f_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l458_c3_647f
has_written_to_n_MUX_uxn_opcodes_h_l458_c3_647f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l458_c3_647f_cond,
has_written_to_n_MUX_uxn_opcodes_h_l458_c3_647f_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l458_c3_647f_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l458_c3_647f_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_647f
is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_647f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_647f_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_647f_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_647f_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_647f_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l458_c3_647f
current_dei_phase_MUX_uxn_opcodes_h_l458_c3_647f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l458_c3_647f_cond,
current_dei_phase_MUX_uxn_opcodes_h_l458_c3_647f_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l458_c3_647f_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l458_c3_647f_return_output);

-- device_in_uxn_opcodes_h_l459_c23_7f94
device_in_uxn_opcodes_h_l459_c23_7f94 : entity work.device_in_0CLK_b9b05a79 port map (
clk,
device_in_uxn_opcodes_h_l459_c23_7f94_CLOCK_ENABLE,
device_in_uxn_opcodes_h_l459_c23_7f94_device_address,
device_in_uxn_opcodes_h_l459_c23_7f94_phase,
device_in_uxn_opcodes_h_l459_c23_7f94_previous_device_ram_read,
device_in_uxn_opcodes_h_l459_c23_7f94_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l462_c4_9124
BIN_OP_PLUS_uxn_opcodes_h_l462_c4_9124 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l462_c4_9124_left,
BIN_OP_PLUS_uxn_opcodes_h_l462_c4_9124_right,
BIN_OP_PLUS_uxn_opcodes_h_l462_c4_9124_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l463_c9_9f7e
BIN_OP_AND_uxn_opcodes_h_l463_c9_9f7e : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l463_c9_9f7e_left,
BIN_OP_AND_uxn_opcodes_h_l463_c9_9f7e_right,
BIN_OP_AND_uxn_opcodes_h_l463_c9_9f7e_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_7289
is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_7289 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_7289_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_7289_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_7289_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_7289_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_7289
is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_7289 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_7289_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_7289_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_7289_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_7289_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_3ff8
is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_3ff8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_3ff8_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_3ff8_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_3ff8_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_3ff8_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l469_c13_b492
UNARY_OP_NOT_uxn_opcodes_h_l469_c13_b492 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l469_c13_b492_expr,
UNARY_OP_NOT_uxn_opcodes_h_l469_c13_b492_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l469_c8_8aa3
has_written_to_t_MUX_uxn_opcodes_h_l469_c8_8aa3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l469_c8_8aa3_cond,
has_written_to_t_MUX_uxn_opcodes_h_l469_c8_8aa3_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l469_c8_8aa3_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l469_c8_8aa3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_8aa3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_8aa3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_8aa3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_8aa3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_8aa3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_8aa3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_8aa3
result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_8aa3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_8aa3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_8aa3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_8aa3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_8aa3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_8aa3
result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_8aa3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_8aa3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_8aa3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_8aa3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_8aa3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l469_c8_8aa3
result_u8_value_MUX_uxn_opcodes_h_l469_c8_8aa3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l469_c8_8aa3_cond,
result_u8_value_MUX_uxn_opcodes_h_l469_c8_8aa3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l469_c8_8aa3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l469_c8_8aa3_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l469_c8_8aa3
has_written_to_n_MUX_uxn_opcodes_h_l469_c8_8aa3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l469_c8_8aa3_cond,
has_written_to_n_MUX_uxn_opcodes_h_l469_c8_8aa3_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l469_c8_8aa3_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l469_c8_8aa3_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l469_c8_8aa3
current_dei_phase_MUX_uxn_opcodes_h_l469_c8_8aa3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l469_c8_8aa3_cond,
current_dei_phase_MUX_uxn_opcodes_h_l469_c8_8aa3_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l469_c8_8aa3_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l469_c8_8aa3_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l476_c13_e0f5
UNARY_OP_NOT_uxn_opcodes_h_l476_c13_e0f5 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l476_c13_e0f5_expr,
UNARY_OP_NOT_uxn_opcodes_h_l476_c13_e0f5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_f909
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_f909 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_f909_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_f909_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_f909_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_f909_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_f909
result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_f909 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_f909_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_f909_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_f909_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_f909_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_f909
result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_f909 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_f909_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_f909_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_f909_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_f909_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l476_c8_f909
result_u8_value_MUX_uxn_opcodes_h_l476_c8_f909 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l476_c8_f909_cond,
result_u8_value_MUX_uxn_opcodes_h_l476_c8_f909_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l476_c8_f909_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l476_c8_f909_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l476_c8_f909
has_written_to_n_MUX_uxn_opcodes_h_l476_c8_f909 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l476_c8_f909_cond,
has_written_to_n_MUX_uxn_opcodes_h_l476_c8_f909_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l476_c8_f909_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l476_c8_f909_return_output);

-- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_8dc9
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_8dc9 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_8dc9_expr,
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_8dc9_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l435_c6_2625_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9f1f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_4f41_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l435_c2_9db2_return_output,
 device_in_result_MUX_uxn_opcodes_h_l435_c2_9db2_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_9db2_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_9db2_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_9db2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_9db2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_9db2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_9db2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_9db2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l435_c2_9db2_return_output,
 dei_param_MUX_uxn_opcodes_h_l435_c2_9db2_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l435_c2_9db2_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l435_c2_9db2_return_output,
 t8_MUX_uxn_opcodes_h_l435_c2_9db2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l447_c11_9568_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_89c8_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l447_c7_4f41_return_output,
 device_in_result_MUX_uxn_opcodes_h_l447_c7_4f41_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_4f41_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_4f41_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_4f41_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_4f41_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_4f41_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_4f41_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l447_c7_4f41_return_output,
 dei_param_MUX_uxn_opcodes_h_l447_c7_4f41_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l447_c7_4f41_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l447_c7_4f41_return_output,
 t8_MUX_uxn_opcodes_h_l447_c7_4f41_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l450_c11_4f88_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_8d32_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l450_c7_89c8_return_output,
 device_in_result_MUX_uxn_opcodes_h_l450_c7_89c8_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_89c8_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_89c8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_89c8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_89c8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_89c8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_89c8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l450_c7_89c8_return_output,
 dei_param_MUX_uxn_opcodes_h_l450_c7_89c8_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l450_c7_89c8_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l450_c7_89c8_return_output,
 t8_MUX_uxn_opcodes_h_l450_c7_89c8_return_output,
 sp_relative_shift_uxn_opcodes_h_l453_c30_45e0_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l457_c35_a641_return_output,
 MUX_uxn_opcodes_h_l457_c15_db59_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l458_c49_313d_return_output,
 BIN_OP_AND_uxn_opcodes_h_l458_c29_8688_return_output,
 BIN_OP_OR_uxn_opcodes_h_l458_c8_1e4d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_d0fc_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l458_c3_647f_return_output,
 device_in_result_MUX_uxn_opcodes_h_l458_c3_647f_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_647f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_647f_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_647f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_647f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_647f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l458_c3_647f_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l458_c3_647f_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_647f_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l458_c3_647f_return_output,
 device_in_uxn_opcodes_h_l459_c23_7f94_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l462_c4_9124_return_output,
 BIN_OP_AND_uxn_opcodes_h_l463_c9_9f7e_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_7289_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_7289_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_3ff8_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l469_c13_b492_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l469_c8_8aa3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_8aa3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_8aa3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_8aa3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l469_c8_8aa3_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l469_c8_8aa3_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l469_c8_8aa3_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l476_c13_e0f5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_f909_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_f909_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_f909_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l476_c8_f909_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l476_c8_f909_return_output,
 UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_8dc9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_2625_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_2625_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_2625_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9f1f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9f1f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9f1f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9f1f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_4f41_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_4f41_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l447_c7_4f41_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c2_9db2_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c2_9db2_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue : device_in_result_t;
 variable VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l435_c2_9db2_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l447_c7_4f41_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l435_c2_9db2_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l435_c2_9db2_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l442_c3_9a3e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_4f41_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_9db2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_9db2_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_4f41_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_9db2_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_9db2_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l435_c2_9db2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_9db2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_9db2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_4f41_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_9db2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_9db2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_4f41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_9db2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_9db2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_4f41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_9db2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_9db2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_4f41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_9db2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_9db2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l447_c7_4f41_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l435_c2_9db2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l435_c2_9db2_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l447_c7_4f41_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l435_c2_9db2_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l435_c2_9db2_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l447_c7_4f41_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l435_c2_9db2_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l435_c2_9db2_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l441_c3_e960 : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l447_c7_4f41_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l435_c2_9db2_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l435_c2_9db2_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l447_c7_4f41_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l435_c2_9db2_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l435_c2_9db2_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l436_c3_9c0b_uxn_opcodes_h_l436_c3_9c0b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_9568_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_9568_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_9568_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_89c8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_89c8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_89c8_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l447_c7_4f41_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_89c8_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l447_c7_4f41_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l448_c3_f2c1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_89c8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_4f41_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_89c8_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_4f41_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_89c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_4f41_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_89c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_4f41_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_89c8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_4f41_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_89c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_4f41_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c7_89c8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l447_c7_4f41_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l450_c7_89c8_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l447_c7_4f41_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c7_89c8_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l447_c7_4f41_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c7_89c8_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l447_c7_4f41_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c7_89c8_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l447_c7_4f41_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_4f88_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_4f88_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_4f88_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_8d32_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_8d32_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_8d32_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_8d32_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l458_c3_647f_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_89c8_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l458_c3_647f_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_89c8_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_647f_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_647f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_89c8_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_647f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_89c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_647f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_89c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_89c8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_89c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_647f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_89c8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l458_c3_647f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c7_89c8_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l450_c7_89c8_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l458_c3_647f_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c7_89c8_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_647f_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l458_c3_647f_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c7_89c8_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c7_89c8_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l453_c30_45e0_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l453_c30_45e0_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l453_c30_45e0_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l453_c30_45e0_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l457_c15_db59_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l457_c15_db59_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l457_c15_db59_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l457_c35_a641_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l457_c35_a641_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l457_c35_a641_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l457_c15_db59_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_1e4d_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l458_c29_8688_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l458_c49_313d_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l458_c49_313d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l458_c29_8688_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l458_c29_8688_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_1e4d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_1e4d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_d0fc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_d0fc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_d0fc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_d0fc_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l458_c3_647f_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l458_c3_647f_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l469_c8_8aa3_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l458_c3_647f_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l458_c3_647f_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l458_c3_647f_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l458_c3_647f_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_647f_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_7289_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_647f_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_647f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_647f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_647f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_8aa3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_647f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_647f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_647f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_647f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_647f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_647f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_8aa3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_647f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_647f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_647f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_8aa3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_647f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l458_c3_647f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l458_c3_647f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l469_c8_8aa3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l458_c3_647f_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l458_c3_647f_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l458_c3_647f_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l469_c8_8aa3_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l458_c3_647f_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_647f_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_7289_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_647f_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_647f_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l458_c3_647f_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l462_c4_c4ce : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l458_c3_647f_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l469_c8_8aa3_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l458_c3_647f_cond : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l459_c23_7f94_device_address : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l459_c23_7f94_phase : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l459_c23_7f94_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l459_c23_7f94_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l459_c23_7f94_return_output : device_in_result_t;
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l460_c32_0c32_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l462_c4_9124_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l462_c4_9124_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l462_c4_9124_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l463_c9_9f7e_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l463_c9_9f7e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l463_c9_9f7e_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_7289_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_7289_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_3ff8_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_7289_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_7289_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_7289_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_7289_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_3ff8_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_3ff8_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_3ff8_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l469_c13_b492_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l469_c13_b492_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l469_c8_8aa3_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l469_c8_8aa3_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l469_c8_8aa3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_8aa3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l472_c4_02eb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_8aa3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_f909_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_8aa3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_8aa3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_8aa3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_f909_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_8aa3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_8aa3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_8aa3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_f909_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_8aa3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l469_c8_8aa3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l469_c8_8aa3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_f909_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l469_c8_8aa3_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l469_c8_8aa3_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l469_c8_8aa3_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_f909_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l469_c8_8aa3_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l469_c8_8aa3_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l470_c4_fd63 : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l469_c8_8aa3_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l469_c8_8aa3_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_e0f5_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_e0f5_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_f909_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l477_c4_0151 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_f909_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_f909_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_f909_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_f909_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_f909_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_f909_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_f909_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_f909_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_f909_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_f909_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_f909_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_f909_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_f909_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_f909_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l450_l435_l458_l447_DUPLICATE_a016_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l450_l435_l447_DUPLICATE_be0c_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l450_l476_l435_l447_DUPLICATE_3870_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l435_l447_DUPLICATE_3452_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l458_l450_l447_l435_l476_DUPLICATE_f127_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l458_l450_l447_l476_l469_DUPLICATE_a6f0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l450_l476_l458_DUPLICATE_a8c6_return_output : unsigned(3 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_8dc9_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_8dc9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l465_l463_DUPLICATE_7bfc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l478_l473_DUPLICATE_444a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f010_uxn_opcodes_h_l487_l429_DUPLICATE_ca3a_return_output : opcode_result_t;
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
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_7289_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l477_c4_0151 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_f909_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l477_c4_0151;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue := to_unsigned(0, 1);
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue := to_unsigned(0, 1);
     VAR_current_dei_phase_uxn_opcodes_h_l441_c3_e960 := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l441_c3_e960;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_8aa3_iftrue := to_unsigned(1, 1);
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_f909_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_9568_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_647f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l472_c4_02eb := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_8aa3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l472_c4_02eb;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l453_c30_45e0_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_f909_iffalse := to_unsigned(1, 1);
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_3ff8_iftrue := to_unsigned(1, 1);
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_d0fc_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9f1f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_4f88_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue := to_unsigned(0, 1);
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_2625_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_f909_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_8d32_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue := to_unsigned(1, 1);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l469_c8_8aa3_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l457_c35_a641_right := to_unsigned(1, 1);
     VAR_current_dei_phase_uxn_opcodes_h_l470_c4_fd63 := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l469_c8_8aa3_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l470_c4_fd63;
     VAR_sp_relative_shift_uxn_opcodes_h_l453_c30_45e0_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l442_c3_9a3e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l442_c3_9a3e;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l462_c4_9124_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l448_c3_f2c1 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l448_c3_f2c1;

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9f1f_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l462_c4_9124_left := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l469_c8_8aa3_iffalse := current_dei_phase;
     VAR_device_in_uxn_opcodes_h_l459_c23_7f94_phase := current_dei_phase;
     VAR_dei_param_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue := dei_param;
     VAR_dei_param_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue := dei_param;
     VAR_dei_param_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue := dei_param;
     VAR_device_in_result_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l458_c3_647f_iffalse := device_in_result;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_e0f5_expr := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l458_c3_647f_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l469_c8_8aa3_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_f909_iffalse := has_written_to_n;
     VAR_BIN_OP_AND_uxn_opcodes_h_l458_c29_8688_left := has_written_to_t;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l469_c13_b492_expr := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l458_c3_647f_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l469_c8_8aa3_iffalse := has_written_to_t;
     VAR_sp_relative_shift_uxn_opcodes_h_l453_c30_45e0_ins := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l457_c15_db59_cond := is_first_dei_done;
     VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_8dc9_expr := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_647f_iffalse := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_7289_iffalse := is_first_dei_done;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l458_c49_313d_expr := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_647f_iffalse := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_7289_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_3ff8_iffalse := is_second_dei_done;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_2625_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_9568_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_4f88_left := VAR_phase;
     VAR_device_in_uxn_opcodes_h_l459_c23_7f94_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l457_c35_a641_left := t8;
     VAR_MUX_uxn_opcodes_h_l457_c15_db59_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse := t8;
     -- sp_relative_shift[uxn_opcodes_h_l453_c30_45e0] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l453_c30_45e0_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l453_c30_45e0_ins;
     sp_relative_shift_uxn_opcodes_h_l453_c30_45e0_x <= VAR_sp_relative_shift_uxn_opcodes_h_l453_c30_45e0_x;
     sp_relative_shift_uxn_opcodes_h_l453_c30_45e0_y <= VAR_sp_relative_shift_uxn_opcodes_h_l453_c30_45e0_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l453_c30_45e0_return_output := sp_relative_shift_uxn_opcodes_h_l453_c30_45e0_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l450_l476_l458_DUPLICATE_a8c6 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l450_l476_l458_DUPLICATE_a8c6_return_output := result.stack_address_sp_offset;

     -- BIN_OP_PLUS[uxn_opcodes_h_l462_c4_9124] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l462_c4_9124_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l462_c4_9124_left;
     BIN_OP_PLUS_uxn_opcodes_h_l462_c4_9124_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l462_c4_9124_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l462_c4_9124_return_output := BIN_OP_PLUS_uxn_opcodes_h_l462_c4_9124_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l450_l435_l447_DUPLICATE_be0c LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l450_l435_l447_DUPLICATE_be0c_return_output := result.sp_relative_shift;

     -- UNARY_OP_NOT[uxn_opcodes_h_l469_c13_b492] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l469_c13_b492_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l469_c13_b492_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l469_c13_b492_return_output := UNARY_OP_NOT_uxn_opcodes_h_l469_c13_b492_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l435_c6_2625] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l435_c6_2625_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_2625_left;
     BIN_OP_EQ_uxn_opcodes_h_l435_c6_2625_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_2625_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_2625_return_output := BIN_OP_EQ_uxn_opcodes_h_l435_c6_2625_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l457_c35_a641] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l457_c35_a641_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l457_c35_a641_left;
     BIN_OP_PLUS_uxn_opcodes_h_l457_c35_a641_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l457_c35_a641_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l457_c35_a641_return_output := BIN_OP_PLUS_uxn_opcodes_h_l457_c35_a641_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l458_c49_313d] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l458_c49_313d_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l458_c49_313d_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l458_c49_313d_return_output := UNARY_OP_NOT_uxn_opcodes_h_l458_c49_313d_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l476_c13_e0f5] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l476_c13_e0f5_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_e0f5_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_e0f5_return_output := UNARY_OP_NOT_uxn_opcodes_h_l476_c13_e0f5_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l450_l435_l458_l447_DUPLICATE_a016 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l450_l435_l458_l447_DUPLICATE_a016_return_output := result.device_ram_address;

     -- BIN_OP_EQ[uxn_opcodes_h_l450_c11_4f88] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l450_c11_4f88_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_4f88_left;
     BIN_OP_EQ_uxn_opcodes_h_l450_c11_4f88_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_4f88_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_4f88_return_output := BIN_OP_EQ_uxn_opcodes_h_l450_c11_4f88_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l450_l476_l435_l447_DUPLICATE_3870 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l450_l476_l435_l447_DUPLICATE_3870_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l478_l473_DUPLICATE_444a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l478_l473_DUPLICATE_444a_return_output := device_in_result.dei_value;

     -- device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6[uxn_opcodes_h_l435_c2_9db2] LATENCY=0
     VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l435_c2_9db2_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6(
     device_in_result,
     to_unsigned(0, 1));

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l458_l450_l447_l476_l469_DUPLICATE_a6f0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l458_l450_l447_l476_l469_DUPLICATE_a6f0_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l435_l447_DUPLICATE_3452 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l435_l447_DUPLICATE_3452_return_output := result.is_sp_shift;

     -- result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l435_c2_9db2] LATENCY=0
     VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l435_c2_9db2_return_output := result.is_device_ram_write;

     -- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_8dc9 LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_8dc9_expr <= VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_8dc9_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_8dc9_return_output := UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_8dc9_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l458_l450_l447_l435_l476_DUPLICATE_f127 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l458_l450_l447_l435_l476_DUPLICATE_f127_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l447_c11_9568] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l447_c11_9568_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_9568_left;
     BIN_OP_EQ_uxn_opcodes_h_l447_c11_9568_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_9568_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_9568_return_output := BIN_OP_EQ_uxn_opcodes_h_l447_c11_9568_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_4f41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_2625_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9f1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_2625_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l435_c2_9db2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_2625_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l435_c2_9db2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_2625_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l435_c2_9db2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_2625_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l435_c2_9db2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_2625_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c2_9db2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_2625_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_2625_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_2625_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_9db2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_2625_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_9db2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_2625_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_9db2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_2625_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_9db2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_2625_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_9db2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_2625_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_9db2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_2625_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_9db2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_2625_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l435_c2_9db2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_2625_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l435_c2_9db2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_2625_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_89c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_9568_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l447_c7_4f41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_9568_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l447_c7_4f41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_9568_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l447_c7_4f41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_9568_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l447_c7_4f41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_9568_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l447_c7_4f41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_9568_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_9568_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_9568_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_4f41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_9568_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_4f41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_9568_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_4f41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_9568_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_4f41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_9568_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_4f41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_9568_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_4f41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_9568_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l447_c7_4f41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_9568_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l447_c7_4f41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_9568_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_8d32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_4f88_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c7_89c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_4f88_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l450_c7_89c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_4f88_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_89c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_4f88_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c7_89c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_4f88_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_89c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_4f88_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_4f88_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_4f88_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_89c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_4f88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_89c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_4f88_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_89c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_4f88_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_89c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_4f88_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_89c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_4f88_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_89c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_4f88_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c7_89c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_4f88_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l450_c7_89c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_4f88_return_output;
     VAR_MUX_uxn_opcodes_h_l457_c15_db59_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l457_c35_a641_return_output, 8);
     VAR_current_dei_phase_uxn_opcodes_h_l462_c4_c4ce := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l462_c4_9124_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l450_l435_l447_DUPLICATE_be0c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l450_l435_l447_DUPLICATE_be0c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l450_l435_l447_DUPLICATE_be0c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l458_l450_l447_l476_l469_DUPLICATE_a6f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l458_l450_l447_l476_l469_DUPLICATE_a6f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_647f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l458_l450_l447_l476_l469_DUPLICATE_a6f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_8aa3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l458_l450_l447_l476_l469_DUPLICATE_a6f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_f909_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l458_l450_l447_l476_l469_DUPLICATE_a6f0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l435_l447_DUPLICATE_3452_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l435_l447_DUPLICATE_3452_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l450_l476_l435_l447_DUPLICATE_3870_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l450_l476_l435_l447_DUPLICATE_3870_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l450_l476_l435_l447_DUPLICATE_3870_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_f909_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l450_l476_l435_l447_DUPLICATE_3870_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l450_l476_l458_DUPLICATE_a8c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_647f_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l450_l476_l458_DUPLICATE_a8c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_f909_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l450_l476_l458_DUPLICATE_a8c6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l469_c8_8aa3_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l478_l473_DUPLICATE_444a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_f909_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l478_l473_DUPLICATE_444a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l450_l435_l458_l447_DUPLICATE_a016_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l450_l435_l458_l447_DUPLICATE_a016_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l450_l435_l458_l447_DUPLICATE_a016_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_647f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l450_l435_l458_l447_DUPLICATE_a016_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l458_l450_l447_l435_l476_DUPLICATE_f127_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l458_l450_l447_l435_l476_DUPLICATE_f127_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l458_l450_l447_l435_l476_DUPLICATE_f127_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l458_c3_647f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l458_l450_l447_l435_l476_DUPLICATE_f127_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_f909_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l458_l450_l447_l435_l476_DUPLICATE_f127_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l458_c29_8688_right := VAR_UNARY_OP_NOT_uxn_opcodes_h_l458_c49_313d_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l469_c8_8aa3_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l469_c13_b492_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l469_c8_8aa3_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l469_c13_b492_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l469_c8_8aa3_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l469_c13_b492_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_8aa3_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l469_c13_b492_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_8aa3_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l469_c13_b492_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_8aa3_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l469_c13_b492_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l469_c8_8aa3_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l469_c13_b492_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_f909_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_e0f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_f909_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_e0f5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_f909_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_e0f5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_f909_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_e0f5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_f909_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_e0f5_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l463_c9_9f7e_left := VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_8dc9_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_1e4d_left := VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_8dc9_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue := VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l435_c2_9db2_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse := VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l435_c2_9db2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l453_c30_45e0_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l458_c3_647f_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l462_c4_c4ce;
     -- result_u8_value_MUX[uxn_opcodes_h_l476_c8_f909] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l476_c8_f909_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_f909_cond;
     result_u8_value_MUX_uxn_opcodes_h_l476_c8_f909_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_f909_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l476_c8_f909_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_f909_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_f909_return_output := result_u8_value_MUX_uxn_opcodes_h_l476_c8_f909_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l469_c8_8aa3] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l469_c8_8aa3_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l469_c8_8aa3_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l469_c8_8aa3_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l469_c8_8aa3_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l469_c8_8aa3_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l469_c8_8aa3_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l469_c8_8aa3_return_output := current_dei_phase_MUX_uxn_opcodes_h_l469_c8_8aa3_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l435_c2_9db2] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_9db2_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_9db2_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_9db2_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_9db2_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l469_c8_8aa3] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l469_c8_8aa3_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l469_c8_8aa3_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l469_c8_8aa3_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l469_c8_8aa3_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l469_c8_8aa3_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l469_c8_8aa3_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l469_c8_8aa3_return_output := has_written_to_t_MUX_uxn_opcodes_h_l469_c8_8aa3_return_output;

     -- t8_MUX[uxn_opcodes_h_l450_c7_89c8] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l450_c7_89c8_cond <= VAR_t8_MUX_uxn_opcodes_h_l450_c7_89c8_cond;
     t8_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue;
     t8_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l450_c7_89c8_return_output := t8_MUX_uxn_opcodes_h_l450_c7_89c8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l476_c8_f909] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_f909_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_f909_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_f909_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_f909_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_f909_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_f909_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_f909_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_f909_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l450_c7_89c8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_89c8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_89c8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_89c8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_89c8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l435_c1_9f1f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9f1f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9f1f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9f1f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9f1f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9f1f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9f1f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9f1f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9f1f_return_output;

     -- MUX[uxn_opcodes_h_l457_c15_db59] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l457_c15_db59_cond <= VAR_MUX_uxn_opcodes_h_l457_c15_db59_cond;
     MUX_uxn_opcodes_h_l457_c15_db59_iftrue <= VAR_MUX_uxn_opcodes_h_l457_c15_db59_iftrue;
     MUX_uxn_opcodes_h_l457_c15_db59_iffalse <= VAR_MUX_uxn_opcodes_h_l457_c15_db59_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l457_c15_db59_return_output := MUX_uxn_opcodes_h_l457_c15_db59_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l476_c8_f909] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l476_c8_f909_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_f909_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l476_c8_f909_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_f909_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l476_c8_f909_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_f909_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_f909_return_output := has_written_to_n_MUX_uxn_opcodes_h_l476_c8_f909_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l447_c7_4f41] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_4f41_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_4f41_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_4f41_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_4f41_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l458_c29_8688] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l458_c29_8688_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l458_c29_8688_left;
     BIN_OP_AND_uxn_opcodes_h_l458_c29_8688_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l458_c29_8688_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l458_c29_8688_return_output := BIN_OP_AND_uxn_opcodes_h_l458_c29_8688_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l476_c8_f909] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_f909_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_f909_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_f909_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_f909_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_f909_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_f909_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_f909_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_f909_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l476_c8_f909] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_f909_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_f909_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_f909_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_f909_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_f909_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_f909_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_f909_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_f909_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l450_c7_89c8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_89c8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_89c8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_89c8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_89c8_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_1e4d_right := VAR_BIN_OP_AND_uxn_opcodes_h_l458_c29_8688_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_4f41_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse := VAR_MUX_uxn_opcodes_h_l457_c15_db59_return_output;
     VAR_device_in_uxn_opcodes_h_l459_c23_7f94_device_address := VAR_MUX_uxn_opcodes_h_l457_c15_db59_return_output;
     VAR_printf_uxn_opcodes_h_l436_c3_9c0b_uxn_opcodes_h_l436_c3_9c0b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_9f1f_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l458_c3_647f_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l469_c8_8aa3_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l469_c8_8aa3_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_f909_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l458_c3_647f_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l469_c8_8aa3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_8aa3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_f909_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_89c8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_8aa3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_f909_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_89c8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_8aa3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_f909_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l469_c8_8aa3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_f909_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse := VAR_t8_MUX_uxn_opcodes_h_l450_c7_89c8_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l458_c8_1e4d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l458_c8_1e4d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_1e4d_left;
     BIN_OP_OR_uxn_opcodes_h_l458_c8_1e4d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_1e4d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_1e4d_return_output := BIN_OP_OR_uxn_opcodes_h_l458_c8_1e4d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l469_c8_8aa3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_8aa3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_8aa3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_8aa3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_8aa3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_8aa3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_8aa3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_8aa3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_8aa3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l450_c7_89c8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_89c8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_89c8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_89c8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_89c8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l469_c8_8aa3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_8aa3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_8aa3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_8aa3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_8aa3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_8aa3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_8aa3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_8aa3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_8aa3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l469_c8_8aa3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l469_c8_8aa3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l469_c8_8aa3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l469_c8_8aa3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l469_c8_8aa3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l469_c8_8aa3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l469_c8_8aa3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l469_c8_8aa3_return_output := result_u8_value_MUX_uxn_opcodes_h_l469_c8_8aa3_return_output;

     -- t8_MUX[uxn_opcodes_h_l447_c7_4f41] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l447_c7_4f41_cond <= VAR_t8_MUX_uxn_opcodes_h_l447_c7_4f41_cond;
     t8_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue;
     t8_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l447_c7_4f41_return_output := t8_MUX_uxn_opcodes_h_l447_c7_4f41_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l447_c7_4f41] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_4f41_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_4f41_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_4f41_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_4f41_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l447_c7_4f41] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_4f41_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_4f41_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_4f41_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_4f41_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l469_c8_8aa3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_8aa3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_8aa3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_8aa3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_8aa3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_8aa3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_8aa3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_8aa3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_8aa3_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l450_c7_89c8] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l450_c7_89c8_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l450_c7_89c8_cond;
     dei_param_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue;
     dei_param_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l450_c7_89c8_return_output := dei_param_MUX_uxn_opcodes_h_l450_c7_89c8_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l469_c8_8aa3] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l469_c8_8aa3_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l469_c8_8aa3_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l469_c8_8aa3_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l469_c8_8aa3_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l469_c8_8aa3_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l469_c8_8aa3_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l469_c8_8aa3_return_output := has_written_to_n_MUX_uxn_opcodes_h_l469_c8_8aa3_return_output;

     -- printf_uxn_opcodes_h_l436_c3_9c0b[uxn_opcodes_h_l436_c3_9c0b] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l436_c3_9c0b_uxn_opcodes_h_l436_c3_9c0b_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l436_c3_9c0b_uxn_opcodes_h_l436_c3_9c0b_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_d0fc_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_1e4d_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l458_c3_647f_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_1e4d_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l458_c3_647f_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_1e4d_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l458_c3_647f_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_1e4d_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l458_c3_647f_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_1e4d_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_647f_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_1e4d_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_647f_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_1e4d_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_647f_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_1e4d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_647f_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_1e4d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_647f_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_1e4d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_647f_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_1e4d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l458_c3_647f_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_1e4d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_8d32_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_89c8_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse := VAR_dei_param_MUX_uxn_opcodes_h_l450_c7_89c8_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l458_c3_647f_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l469_c8_8aa3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_647f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_8aa3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_4f41_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_647f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_8aa3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_4f41_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_647f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_8aa3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l458_c3_647f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l469_c8_8aa3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse := VAR_t8_MUX_uxn_opcodes_h_l447_c7_4f41_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l458_c3_647f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_647f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_647f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_647f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_647f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_647f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_647f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_647f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_647f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l458_c3_647f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_647f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_647f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_647f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_647f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_647f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_647f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_647f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_647f_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l447_c7_4f41] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l447_c7_4f41_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l447_c7_4f41_cond;
     dei_param_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue;
     dei_param_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l447_c7_4f41_return_output := dei_param_MUX_uxn_opcodes_h_l447_c7_4f41_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l458_c3_647f] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l458_c3_647f_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l458_c3_647f_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l458_c3_647f_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l458_c3_647f_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l458_c3_647f_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l458_c3_647f_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l458_c3_647f_return_output := has_written_to_n_MUX_uxn_opcodes_h_l458_c3_647f_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l458_c3_647f] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l458_c3_647f_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l458_c3_647f_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l458_c3_647f_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l458_c3_647f_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l458_c3_647f_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l458_c3_647f_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l458_c3_647f_return_output := current_dei_phase_MUX_uxn_opcodes_h_l458_c3_647f_return_output;

     -- t8_MUX[uxn_opcodes_h_l435_c2_9db2] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l435_c2_9db2_cond <= VAR_t8_MUX_uxn_opcodes_h_l435_c2_9db2_cond;
     t8_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue;
     t8_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l435_c2_9db2_return_output := t8_MUX_uxn_opcodes_h_l435_c2_9db2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l458_c3_647f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l458_c3_647f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l458_c3_647f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l458_c3_647f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l458_c3_647f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l458_c3_647f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l458_c3_647f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l458_c3_647f_return_output := result_u8_value_MUX_uxn_opcodes_h_l458_c3_647f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l455_c1_8d32] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_8d32_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_8d32_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_8d32_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_8d32_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_8d32_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_8d32_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_8d32_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_8d32_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l435_c2_9db2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_9db2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_9db2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_9db2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_9db2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l458_c3_647f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_647f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_647f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_647f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_647f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_647f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_647f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_647f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_647f_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l458_c3_647f] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l458_c3_647f_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l458_c3_647f_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l458_c3_647f_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l458_c3_647f_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l458_c3_647f_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l458_c3_647f_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l458_c3_647f_return_output := has_written_to_t_MUX_uxn_opcodes_h_l458_c3_647f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l435_c2_9db2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_9db2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_9db2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_9db2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_9db2_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_d0fc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_8d32_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l458_c3_647f_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse := VAR_dei_param_MUX_uxn_opcodes_h_l447_c7_4f41_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l458_c3_647f_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l458_c3_647f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_647f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_647f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_647f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l458_c3_647f_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l435_c2_9db2_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l450_c7_89c8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_89c8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_89c8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_89c8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_89c8_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l450_c7_89c8] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l450_c7_89c8_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_89c8_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_89c8_return_output := has_written_to_t_MUX_uxn_opcodes_h_l450_c7_89c8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l450_c7_89c8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_89c8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_89c8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_89c8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_89c8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l450_c7_89c8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_89c8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_89c8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_89c8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_89c8_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l450_c7_89c8] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l450_c7_89c8_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c7_89c8_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c7_89c8_return_output := current_dei_phase_MUX_uxn_opcodes_h_l450_c7_89c8_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l435_c2_9db2] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l435_c2_9db2_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l435_c2_9db2_cond;
     dei_param_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue;
     dei_param_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l435_c2_9db2_return_output := dei_param_MUX_uxn_opcodes_h_l435_c2_9db2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l450_c7_89c8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l450_c7_89c8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c7_89c8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c7_89c8_return_output := result_u8_value_MUX_uxn_opcodes_h_l450_c7_89c8_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l450_c7_89c8] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l450_c7_89c8_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c7_89c8_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c7_89c8_return_output := has_written_to_n_MUX_uxn_opcodes_h_l450_c7_89c8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l458_c1_d0fc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_d0fc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_d0fc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_d0fc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_d0fc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_d0fc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_d0fc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_d0fc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_d0fc_return_output;

     -- Submodule level 5
     VAR_device_in_uxn_opcodes_h_l459_c23_7f94_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_d0fc_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c7_89c8_return_output;
     REG_VAR_dei_param := VAR_dei_param_MUX_uxn_opcodes_h_l435_c2_9db2_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c7_89c8_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_89c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_89c8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_89c8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_89c8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c7_89c8_return_output;
     -- has_written_to_t_MUX[uxn_opcodes_h_l447_c7_4f41] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l447_c7_4f41_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l447_c7_4f41_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l447_c7_4f41_return_output := has_written_to_t_MUX_uxn_opcodes_h_l447_c7_4f41_return_output;

     -- device_in[uxn_opcodes_h_l459_c23_7f94] LATENCY=0
     -- Clock enable
     device_in_uxn_opcodes_h_l459_c23_7f94_CLOCK_ENABLE <= VAR_device_in_uxn_opcodes_h_l459_c23_7f94_CLOCK_ENABLE;
     -- Inputs
     device_in_uxn_opcodes_h_l459_c23_7f94_device_address <= VAR_device_in_uxn_opcodes_h_l459_c23_7f94_device_address;
     device_in_uxn_opcodes_h_l459_c23_7f94_phase <= VAR_device_in_uxn_opcodes_h_l459_c23_7f94_phase;
     device_in_uxn_opcodes_h_l459_c23_7f94_previous_device_ram_read <= VAR_device_in_uxn_opcodes_h_l459_c23_7f94_previous_device_ram_read;
     -- Outputs
     VAR_device_in_uxn_opcodes_h_l459_c23_7f94_return_output := device_in_uxn_opcodes_h_l459_c23_7f94_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l447_c7_4f41] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l447_c7_4f41_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l447_c7_4f41_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l447_c7_4f41_return_output := current_dei_phase_MUX_uxn_opcodes_h_l447_c7_4f41_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l447_c7_4f41] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l447_c7_4f41_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l447_c7_4f41_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l447_c7_4f41_return_output := has_written_to_n_MUX_uxn_opcodes_h_l447_c7_4f41_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l447_c7_4f41] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_4f41_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_4f41_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_4f41_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_4f41_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l447_c7_4f41] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_4f41_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_4f41_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_4f41_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_4f41_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l447_c7_4f41] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_4f41_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_4f41_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_4f41_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_4f41_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l447_c7_4f41] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l447_c7_4f41_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l447_c7_4f41_cond;
     result_u8_value_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l447_c7_4f41_return_output := result_u8_value_MUX_uxn_opcodes_h_l447_c7_4f41_return_output;

     -- Submodule level 6
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l447_c7_4f41_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l458_c3_647f_iftrue := VAR_device_in_uxn_opcodes_h_l459_c23_7f94_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l447_c7_4f41_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l447_c7_4f41_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_4f41_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_4f41_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_4f41_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l447_c7_4f41_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l435_c2_9db2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_9db2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_9db2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_9db2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_9db2_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l435_c2_9db2] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l435_c2_9db2_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l435_c2_9db2_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l435_c2_9db2_return_output := has_written_to_n_MUX_uxn_opcodes_h_l435_c2_9db2_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l435_c2_9db2] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l435_c2_9db2_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l435_c2_9db2_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l435_c2_9db2_return_output := current_dei_phase_MUX_uxn_opcodes_h_l435_c2_9db2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l435_c2_9db2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l435_c2_9db2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l435_c2_9db2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l435_c2_9db2_return_output := result_u8_value_MUX_uxn_opcodes_h_l435_c2_9db2_return_output;

     -- CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d[uxn_opcodes_h_l460_c32_0c32] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l460_c32_0c32_return_output := VAR_device_in_uxn_opcodes_h_l459_c23_7f94_return_output.device_ram_address;

     -- has_written_to_t_MUX[uxn_opcodes_h_l435_c2_9db2] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l435_c2_9db2_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c2_9db2_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c2_9db2_return_output := has_written_to_t_MUX_uxn_opcodes_h_l435_c2_9db2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l435_c2_9db2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_9db2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_9db2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_9db2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_9db2_return_output;

     -- CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l465_l463_DUPLICATE_7bfc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l465_l463_DUPLICATE_7bfc_return_output := VAR_device_in_uxn_opcodes_h_l459_c23_7f94_return_output.is_dei_done;

     -- device_in_result_MUX[uxn_opcodes_h_l458_c3_647f] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l458_c3_647f_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l458_c3_647f_cond;
     device_in_result_MUX_uxn_opcodes_h_l458_c3_647f_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l458_c3_647f_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l458_c3_647f_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l458_c3_647f_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l458_c3_647f_return_output := device_in_result_MUX_uxn_opcodes_h_l458_c3_647f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l435_c2_9db2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_9db2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_9db2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_9db2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_9db2_return_output;

     -- Submodule level 7
     VAR_BIN_OP_AND_uxn_opcodes_h_l463_c9_9f7e_right := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l465_l463_DUPLICATE_7bfc_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_3ff8_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l465_l463_DUPLICATE_7bfc_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_647f_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l460_c32_0c32_return_output;
     REG_VAR_current_dei_phase := VAR_current_dei_phase_MUX_uxn_opcodes_h_l435_c2_9db2_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l458_c3_647f_return_output;
     REG_VAR_has_written_to_n := VAR_has_written_to_n_MUX_uxn_opcodes_h_l435_c2_9db2_return_output;
     REG_VAR_has_written_to_t := VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c2_9db2_return_output;
     -- is_second_dei_done_MUX[uxn_opcodes_h_l465_c11_3ff8] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_3ff8_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_3ff8_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_3ff8_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_3ff8_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_3ff8_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_3ff8_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_3ff8_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_3ff8_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l463_c9_9f7e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l463_c9_9f7e_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l463_c9_9f7e_left;
     BIN_OP_AND_uxn_opcodes_h_l463_c9_9f7e_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l463_c9_9f7e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l463_c9_9f7e_return_output := BIN_OP_AND_uxn_opcodes_h_l463_c9_9f7e_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l458_c3_647f] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_647f_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_647f_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_647f_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_647f_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_647f_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_647f_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_647f_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_647f_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l450_c7_89c8] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l450_c7_89c8_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_89c8_cond;
     device_in_result_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_89c8_return_output := device_in_result_MUX_uxn_opcodes_h_l450_c7_89c8_return_output;

     -- Submodule level 8
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_7289_cond := VAR_BIN_OP_AND_uxn_opcodes_h_l463_c9_9f7e_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_7289_cond := VAR_BIN_OP_AND_uxn_opcodes_h_l463_c9_9f7e_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_89c8_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_7289_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_3ff8_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_647f_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l450_c7_89c8] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_89c8_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_89c8_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_89c8_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_89c8_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l463_c4_7289] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_7289_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_7289_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_7289_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_7289_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_7289_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_7289_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_7289_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_7289_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l463_c4_7289] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_7289_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_7289_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_7289_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_7289_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_7289_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_7289_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_7289_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_7289_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l447_c7_4f41] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l447_c7_4f41_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l447_c7_4f41_cond;
     device_in_result_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l447_c7_4f41_return_output := device_in_result_MUX_uxn_opcodes_h_l447_c7_4f41_return_output;

     -- Submodule level 9
     VAR_device_in_result_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l447_c7_4f41_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_647f_iftrue := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_7289_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_647f_iftrue := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_7289_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_89c8_return_output;
     -- is_first_dei_done_MUX[uxn_opcodes_h_l458_c3_647f] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_647f_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_647f_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_647f_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_647f_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_647f_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_647f_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_647f_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_647f_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l458_c3_647f] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_647f_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_647f_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_647f_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_647f_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_647f_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_647f_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_647f_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_647f_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l435_c2_9db2] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l435_c2_9db2_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l435_c2_9db2_cond;
     device_in_result_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l435_c2_9db2_return_output := device_in_result_MUX_uxn_opcodes_h_l435_c2_9db2_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l447_c7_4f41] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_4f41_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_4f41_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_4f41_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_4f41_return_output;

     -- Submodule level 10
     REG_VAR_device_in_result := VAR_device_in_result_MUX_uxn_opcodes_h_l435_c2_9db2_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_647f_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_647f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_4f41_return_output;
     -- is_second_dei_done_MUX[uxn_opcodes_h_l450_c7_89c8] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l435_c2_9db2] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_9db2_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_9db2_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_9db2_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_9db2_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l450_c7_89c8] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8_return_output;

     -- Submodule level 11
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_89c8_return_output;
     -- is_second_dei_done_MUX[uxn_opcodes_h_l447_c7_4f41] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l447_c7_4f41] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41_return_output;

     -- CONST_REF_RD_opcode_result_t_opcode_result_t_f010_uxn_opcodes_h_l487_l429_DUPLICATE_ca3a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f010_uxn_opcodes_h_l487_l429_DUPLICATE_ca3a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_f010(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_9db2_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_9db2_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_9db2_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_9db2_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_9db2_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_9db2_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_9db2_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l435_c2_9db2_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f010_uxn_opcodes_h_l487_l429_DUPLICATE_ca3a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f010_uxn_opcodes_h_l487_l429_DUPLICATE_ca3a_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_4f41_return_output;
     -- is_second_dei_done_MUX[uxn_opcodes_h_l435_c2_9db2] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l435_c2_9db2] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2_return_output;

     -- Submodule level 13
     REG_VAR_is_first_dei_done := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2_return_output;
     REG_VAR_is_second_dei_done := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_9db2_return_output;
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
