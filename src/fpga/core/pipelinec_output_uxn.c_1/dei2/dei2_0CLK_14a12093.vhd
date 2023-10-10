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
-- Submodules: 103
entity dei2_0CLK_14a12093 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end dei2_0CLK_14a12093;
architecture arch of dei2_0CLK_14a12093 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l476_c6_7e56]
signal BIN_OP_EQ_uxn_opcodes_h_l476_c6_7e56_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l476_c6_7e56_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l476_c6_7e56_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l476_c1_abb2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l476_c1_abb2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l476_c1_abb2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l476_c1_abb2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l476_c1_abb2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l488_c7_4ea7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_4ea7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l476_c2_3272]
signal has_written_to_n_MUX_uxn_opcodes_h_l476_c2_3272_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l476_c2_3272_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l476_c2_3272_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l476_c2_3272_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l476_c2_3272]
signal current_dei_phase_MUX_uxn_opcodes_h_l476_c2_3272_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l476_c2_3272_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l476_c2_3272_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l476_c2_3272_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l476_c2_3272]
signal t8_MUX_uxn_opcodes_h_l476_c2_3272_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l476_c2_3272_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l476_c2_3272_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l476_c2_3272_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l476_c2_3272]
signal device_in_result_MUX_uxn_opcodes_h_l476_c2_3272_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l476_c2_3272_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l476_c2_3272_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l476_c2_3272_return_output : device_in_result_t;

-- is_second_dei_done_MUX[uxn_opcodes_h_l476_c2_3272]
signal is_second_dei_done_MUX_uxn_opcodes_h_l476_c2_3272_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l476_c2_3272_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l476_c2_3272_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l476_c2_3272_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l476_c2_3272]
signal is_first_dei_done_MUX_uxn_opcodes_h_l476_c2_3272_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l476_c2_3272_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l476_c2_3272_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l476_c2_3272_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l476_c2_3272]
signal result_is_stack_read_MUX_uxn_opcodes_h_l476_c2_3272_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l476_c2_3272_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l476_c2_3272_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l476_c2_3272_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l476_c2_3272]
signal result_stack_value_MUX_uxn_opcodes_h_l476_c2_3272_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l476_c2_3272_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l476_c2_3272_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l476_c2_3272_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l476_c2_3272]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l476_c2_3272_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l476_c2_3272_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l476_c2_3272_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l476_c2_3272_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l476_c2_3272]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l476_c2_3272_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l476_c2_3272_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l476_c2_3272_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l476_c2_3272_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l476_c2_3272]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l476_c2_3272_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l476_c2_3272_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l476_c2_3272_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l476_c2_3272_return_output : signed(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l476_c2_3272]
signal result_device_ram_address_MUX_uxn_opcodes_h_l476_c2_3272_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l476_c2_3272_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l476_c2_3272_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l476_c2_3272_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l476_c2_3272]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c2_3272_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c2_3272_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c2_3272_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c2_3272_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l476_c2_3272]
signal result_is_stack_write_MUX_uxn_opcodes_h_l476_c2_3272_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l476_c2_3272_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l476_c2_3272_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l476_c2_3272_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l476_c2_3272]
signal result_is_opc_done_MUX_uxn_opcodes_h_l476_c2_3272_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l476_c2_3272_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l476_c2_3272_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l476_c2_3272_return_output : unsigned(0 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l476_c2_3272]
signal dei_param_MUX_uxn_opcodes_h_l476_c2_3272_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l476_c2_3272_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l476_c2_3272_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l476_c2_3272_return_output : unsigned(7 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l476_c2_3272]
signal has_written_to_t_MUX_uxn_opcodes_h_l476_c2_3272_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l476_c2_3272_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l476_c2_3272_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l476_c2_3272_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l477_c3_6ce6[uxn_opcodes_h_l477_c3_6ce6]
signal printf_uxn_opcodes_h_l477_c3_6ce6_uxn_opcodes_h_l477_c3_6ce6_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l488_c11_0b02]
signal BIN_OP_EQ_uxn_opcodes_h_l488_c11_0b02_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l488_c11_0b02_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l488_c11_0b02_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l491_c7_e023]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_e023_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_e023_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_e023_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_e023_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l488_c7_4ea7]
signal has_written_to_n_MUX_uxn_opcodes_h_l488_c7_4ea7_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l488_c7_4ea7]
signal current_dei_phase_MUX_uxn_opcodes_h_l488_c7_4ea7_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l488_c7_4ea7]
signal t8_MUX_uxn_opcodes_h_l488_c7_4ea7_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l488_c7_4ea7]
signal device_in_result_MUX_uxn_opcodes_h_l488_c7_4ea7_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output : device_in_result_t;

-- is_second_dei_done_MUX[uxn_opcodes_h_l488_c7_4ea7]
signal is_second_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l488_c7_4ea7]
signal is_first_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l488_c7_4ea7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_4ea7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l488_c7_4ea7]
signal result_stack_value_MUX_uxn_opcodes_h_l488_c7_4ea7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l488_c7_4ea7]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_4ea7_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l488_c7_4ea7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l488_c7_4ea7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l488_c7_4ea7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c7_4ea7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output : signed(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l488_c7_4ea7]
signal result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_4ea7_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l488_c7_4ea7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c7_4ea7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l488_c7_4ea7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l488_c7_4ea7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l488_c7_4ea7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_4ea7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output : unsigned(0 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l488_c7_4ea7]
signal dei_param_MUX_uxn_opcodes_h_l488_c7_4ea7_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output : unsigned(7 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l488_c7_4ea7]
signal has_written_to_t_MUX_uxn_opcodes_h_l488_c7_4ea7_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l491_c11_f44a]
signal BIN_OP_EQ_uxn_opcodes_h_l491_c11_f44a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l491_c11_f44a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l491_c11_f44a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l497_c1_429d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c1_429d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c1_429d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c1_429d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c1_429d_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l491_c7_e023]
signal has_written_to_n_MUX_uxn_opcodes_h_l491_c7_e023_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l491_c7_e023_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l491_c7_e023_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l491_c7_e023_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l491_c7_e023]
signal current_dei_phase_MUX_uxn_opcodes_h_l491_c7_e023_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l491_c7_e023_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l491_c7_e023_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l491_c7_e023_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l491_c7_e023]
signal t8_MUX_uxn_opcodes_h_l491_c7_e023_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l491_c7_e023_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l491_c7_e023_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l491_c7_e023_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l491_c7_e023]
signal device_in_result_MUX_uxn_opcodes_h_l491_c7_e023_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l491_c7_e023_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l491_c7_e023_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l491_c7_e023_return_output : device_in_result_t;

-- is_second_dei_done_MUX[uxn_opcodes_h_l491_c7_e023]
signal is_second_dei_done_MUX_uxn_opcodes_h_l491_c7_e023_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l491_c7_e023_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l491_c7_e023_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l491_c7_e023_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l491_c7_e023]
signal is_first_dei_done_MUX_uxn_opcodes_h_l491_c7_e023_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l491_c7_e023_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l491_c7_e023_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l491_c7_e023_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l491_c7_e023]
signal result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_e023_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_e023_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_e023_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_e023_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l491_c7_e023]
signal result_stack_value_MUX_uxn_opcodes_h_l491_c7_e023_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l491_c7_e023_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l491_c7_e023_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l491_c7_e023_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l491_c7_e023]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_e023_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_e023_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_e023_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_e023_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l491_c7_e023]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_e023_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_e023_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_e023_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_e023_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l491_c7_e023]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_e023_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_e023_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_e023_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_e023_return_output : signed(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l491_c7_e023]
signal result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_e023_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_e023_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_e023_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_e023_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l491_c7_e023]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_e023_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_e023_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_e023_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_e023_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l491_c7_e023]
signal result_is_stack_write_MUX_uxn_opcodes_h_l491_c7_e023_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l491_c7_e023_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l491_c7_e023_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l491_c7_e023_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l491_c7_e023]
signal result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_e023_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_e023_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_e023_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_e023_return_output : unsigned(0 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l491_c7_e023]
signal dei_param_MUX_uxn_opcodes_h_l491_c7_e023_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l491_c7_e023_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l491_c7_e023_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l491_c7_e023_return_output : unsigned(7 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l491_c7_e023]
signal has_written_to_t_MUX_uxn_opcodes_h_l491_c7_e023_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l491_c7_e023_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l491_c7_e023_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l491_c7_e023_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l495_c32_44b1]
signal BIN_OP_AND_uxn_opcodes_h_l495_c32_44b1_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l495_c32_44b1_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l495_c32_44b1_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l495_c32_77d3]
signal BIN_OP_GT_uxn_opcodes_h_l495_c32_77d3_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l495_c32_77d3_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l495_c32_77d3_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l495_c32_c0a3]
signal MUX_uxn_opcodes_h_l495_c32_c0a3_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l495_c32_c0a3_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l495_c32_c0a3_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l495_c32_c0a3_return_output : signed(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l499_c35_54c8]
signal BIN_OP_PLUS_uxn_opcodes_h_l499_c35_54c8_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l499_c35_54c8_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l499_c35_54c8_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l499_c15_ac7a]
signal MUX_uxn_opcodes_h_l499_c15_ac7a_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l499_c15_ac7a_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l499_c15_ac7a_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l499_c15_ac7a_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l500_c49_6d3f]
signal UNARY_OP_NOT_uxn_opcodes_h_l500_c49_6d3f_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l500_c49_6d3f_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l500_c29_3cc7]
signal BIN_OP_AND_uxn_opcodes_h_l500_c29_3cc7_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l500_c29_3cc7_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l500_c29_3cc7_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l500_c8_abdc]
signal BIN_OP_OR_uxn_opcodes_h_l500_c8_abdc_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l500_c8_abdc_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l500_c8_abdc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l500_c1_9bd3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_9bd3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_9bd3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_9bd3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_9bd3_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l500_c3_03b7]
signal has_written_to_n_MUX_uxn_opcodes_h_l500_c3_03b7_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l500_c3_03b7_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l500_c3_03b7]
signal current_dei_phase_MUX_uxn_opcodes_h_l500_c3_03b7_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l500_c3_03b7_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l500_c3_03b7]
signal device_in_result_MUX_uxn_opcodes_h_l500_c3_03b7_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l500_c3_03b7_return_output : device_in_result_t;

-- is_second_dei_done_MUX[uxn_opcodes_h_l500_c3_03b7]
signal is_second_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l500_c3_03b7]
signal is_first_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l500_c3_03b7]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c3_03b7_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c3_03b7_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l500_c3_03b7]
signal result_device_ram_address_MUX_uxn_opcodes_h_l500_c3_03b7_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l500_c3_03b7_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l500_c3_03b7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l500_c3_03b7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l500_c3_03b7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l500_c3_03b7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c3_03b7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c3_03b7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l500_c3_03b7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c3_03b7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c3_03b7_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l500_c3_03b7]
signal result_stack_value_MUX_uxn_opcodes_h_l500_c3_03b7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l500_c3_03b7_return_output : unsigned(7 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l500_c3_03b7]
signal has_written_to_t_MUX_uxn_opcodes_h_l500_c3_03b7_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l500_c3_03b7_return_output : unsigned(0 downto 0);

-- device_in[uxn_opcodes_h_l501_c23_c417]
signal device_in_uxn_opcodes_h_l501_c23_c417_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_in_uxn_opcodes_h_l501_c23_c417_device_address : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l501_c23_c417_phase : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l501_c23_c417_previous_device_ram_read : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l501_c23_c417_return_output : device_in_result_t;

-- BIN_OP_PLUS[uxn_opcodes_h_l505_c4_5a18]
signal BIN_OP_PLUS_uxn_opcodes_h_l505_c4_5a18_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l505_c4_5a18_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l505_c4_5a18_return_output : unsigned(8 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l506_c9_d4ab]
signal BIN_OP_AND_uxn_opcodes_h_l506_c9_d4ab_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l506_c9_d4ab_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l506_c9_d4ab_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l506_c4_35eb]
signal is_second_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l506_c4_35eb]
signal is_first_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l508_c11_c6cf]
signal is_second_dei_done_MUX_uxn_opcodes_h_l508_c11_c6cf_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l508_c11_c6cf_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l508_c11_c6cf_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l508_c11_c6cf_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l512_c13_ec6b]
signal UNARY_OP_NOT_uxn_opcodes_h_l512_c13_ec6b_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l512_c13_ec6b_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l512_c8_8313]
signal has_written_to_n_MUX_uxn_opcodes_h_l512_c8_8313_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l512_c8_8313_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l512_c8_8313_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l512_c8_8313_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l512_c8_8313]
signal current_dei_phase_MUX_uxn_opcodes_h_l512_c8_8313_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l512_c8_8313_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l512_c8_8313_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l512_c8_8313_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l512_c8_8313]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c8_8313_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c8_8313_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c8_8313_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c8_8313_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l512_c8_8313]
signal result_is_stack_write_MUX_uxn_opcodes_h_l512_c8_8313_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l512_c8_8313_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l512_c8_8313_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l512_c8_8313_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l512_c8_8313]
signal result_is_opc_done_MUX_uxn_opcodes_h_l512_c8_8313_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l512_c8_8313_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l512_c8_8313_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l512_c8_8313_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l512_c8_8313]
signal result_stack_value_MUX_uxn_opcodes_h_l512_c8_8313_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l512_c8_8313_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l512_c8_8313_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l512_c8_8313_return_output : unsigned(7 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l512_c8_8313]
signal has_written_to_t_MUX_uxn_opcodes_h_l512_c8_8313_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l512_c8_8313_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l512_c8_8313_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l512_c8_8313_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l519_c13_b44c]
signal UNARY_OP_NOT_uxn_opcodes_h_l519_c13_b44c_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l519_c13_b44c_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l519_c8_71d4]
signal has_written_to_n_MUX_uxn_opcodes_h_l519_c8_71d4_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l519_c8_71d4_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l519_c8_71d4_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l519_c8_71d4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l519_c8_71d4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l519_c8_71d4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l519_c8_71d4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l519_c8_71d4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l519_c8_71d4_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l519_c8_71d4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l519_c8_71d4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l519_c8_71d4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l519_c8_71d4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l519_c8_71d4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l519_c8_71d4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l519_c8_71d4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l519_c8_71d4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l519_c8_71d4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l519_c8_71d4_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l519_c8_71d4]
signal result_stack_value_MUX_uxn_opcodes_h_l519_c8_71d4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l519_c8_71d4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l519_c8_71d4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l519_c8_71d4_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l500_l506_DUPLICATE_50b2
signal UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l500_l506_DUPLICATE_50b2_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l500_l506_DUPLICATE_50b2_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_7bb2( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_read := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.is_device_ram_read := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.device_ram_address := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_stack_write := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l476_c6_7e56
BIN_OP_EQ_uxn_opcodes_h_l476_c6_7e56 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l476_c6_7e56_left,
BIN_OP_EQ_uxn_opcodes_h_l476_c6_7e56_right,
BIN_OP_EQ_uxn_opcodes_h_l476_c6_7e56_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l476_c1_abb2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l476_c1_abb2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l476_c1_abb2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l476_c1_abb2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l476_c1_abb2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l476_c1_abb2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_4ea7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_4ea7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_4ea7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l476_c2_3272
has_written_to_n_MUX_uxn_opcodes_h_l476_c2_3272 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l476_c2_3272_cond,
has_written_to_n_MUX_uxn_opcodes_h_l476_c2_3272_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l476_c2_3272_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l476_c2_3272_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l476_c2_3272
current_dei_phase_MUX_uxn_opcodes_h_l476_c2_3272 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l476_c2_3272_cond,
current_dei_phase_MUX_uxn_opcodes_h_l476_c2_3272_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l476_c2_3272_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l476_c2_3272_return_output);

-- t8_MUX_uxn_opcodes_h_l476_c2_3272
t8_MUX_uxn_opcodes_h_l476_c2_3272 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l476_c2_3272_cond,
t8_MUX_uxn_opcodes_h_l476_c2_3272_iftrue,
t8_MUX_uxn_opcodes_h_l476_c2_3272_iffalse,
t8_MUX_uxn_opcodes_h_l476_c2_3272_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l476_c2_3272
device_in_result_MUX_uxn_opcodes_h_l476_c2_3272 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l476_c2_3272_cond,
device_in_result_MUX_uxn_opcodes_h_l476_c2_3272_iftrue,
device_in_result_MUX_uxn_opcodes_h_l476_c2_3272_iffalse,
device_in_result_MUX_uxn_opcodes_h_l476_c2_3272_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l476_c2_3272
is_second_dei_done_MUX_uxn_opcodes_h_l476_c2_3272 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l476_c2_3272_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l476_c2_3272_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l476_c2_3272_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l476_c2_3272_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l476_c2_3272
is_first_dei_done_MUX_uxn_opcodes_h_l476_c2_3272 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l476_c2_3272_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l476_c2_3272_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l476_c2_3272_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l476_c2_3272_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l476_c2_3272
result_is_stack_read_MUX_uxn_opcodes_h_l476_c2_3272 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l476_c2_3272_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l476_c2_3272_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l476_c2_3272_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l476_c2_3272_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l476_c2_3272
result_stack_value_MUX_uxn_opcodes_h_l476_c2_3272 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l476_c2_3272_cond,
result_stack_value_MUX_uxn_opcodes_h_l476_c2_3272_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l476_c2_3272_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l476_c2_3272_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l476_c2_3272
result_is_device_ram_read_MUX_uxn_opcodes_h_l476_c2_3272 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l476_c2_3272_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l476_c2_3272_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l476_c2_3272_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l476_c2_3272_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l476_c2_3272
result_is_sp_shift_MUX_uxn_opcodes_h_l476_c2_3272 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l476_c2_3272_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l476_c2_3272_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l476_c2_3272_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l476_c2_3272_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l476_c2_3272
result_sp_relative_shift_MUX_uxn_opcodes_h_l476_c2_3272 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l476_c2_3272_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l476_c2_3272_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l476_c2_3272_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l476_c2_3272_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l476_c2_3272
result_device_ram_address_MUX_uxn_opcodes_h_l476_c2_3272 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l476_c2_3272_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l476_c2_3272_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l476_c2_3272_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l476_c2_3272_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c2_3272
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c2_3272 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c2_3272_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c2_3272_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c2_3272_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c2_3272_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l476_c2_3272
result_is_stack_write_MUX_uxn_opcodes_h_l476_c2_3272 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l476_c2_3272_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l476_c2_3272_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l476_c2_3272_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l476_c2_3272_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l476_c2_3272
result_is_opc_done_MUX_uxn_opcodes_h_l476_c2_3272 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l476_c2_3272_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l476_c2_3272_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l476_c2_3272_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l476_c2_3272_return_output);

-- dei_param_MUX_uxn_opcodes_h_l476_c2_3272
dei_param_MUX_uxn_opcodes_h_l476_c2_3272 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l476_c2_3272_cond,
dei_param_MUX_uxn_opcodes_h_l476_c2_3272_iftrue,
dei_param_MUX_uxn_opcodes_h_l476_c2_3272_iffalse,
dei_param_MUX_uxn_opcodes_h_l476_c2_3272_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l476_c2_3272
has_written_to_t_MUX_uxn_opcodes_h_l476_c2_3272 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l476_c2_3272_cond,
has_written_to_t_MUX_uxn_opcodes_h_l476_c2_3272_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l476_c2_3272_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l476_c2_3272_return_output);

-- printf_uxn_opcodes_h_l477_c3_6ce6_uxn_opcodes_h_l477_c3_6ce6
printf_uxn_opcodes_h_l477_c3_6ce6_uxn_opcodes_h_l477_c3_6ce6 : entity work.printf_uxn_opcodes_h_l477_c3_6ce6_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l477_c3_6ce6_uxn_opcodes_h_l477_c3_6ce6_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l488_c11_0b02
BIN_OP_EQ_uxn_opcodes_h_l488_c11_0b02 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l488_c11_0b02_left,
BIN_OP_EQ_uxn_opcodes_h_l488_c11_0b02_right,
BIN_OP_EQ_uxn_opcodes_h_l488_c11_0b02_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_e023
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_e023 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_e023_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_e023_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_e023_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_e023_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l488_c7_4ea7
has_written_to_n_MUX_uxn_opcodes_h_l488_c7_4ea7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l488_c7_4ea7_cond,
has_written_to_n_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l488_c7_4ea7
current_dei_phase_MUX_uxn_opcodes_h_l488_c7_4ea7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l488_c7_4ea7_cond,
current_dei_phase_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output);

-- t8_MUX_uxn_opcodes_h_l488_c7_4ea7
t8_MUX_uxn_opcodes_h_l488_c7_4ea7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l488_c7_4ea7_cond,
t8_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue,
t8_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse,
t8_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l488_c7_4ea7
device_in_result_MUX_uxn_opcodes_h_l488_c7_4ea7 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l488_c7_4ea7_cond,
device_in_result_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue,
device_in_result_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse,
device_in_result_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7
is_second_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7
is_first_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_4ea7
result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_4ea7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_4ea7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l488_c7_4ea7
result_stack_value_MUX_uxn_opcodes_h_l488_c7_4ea7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l488_c7_4ea7_cond,
result_stack_value_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_4ea7
result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_4ea7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_4ea7_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l488_c7_4ea7
result_is_sp_shift_MUX_uxn_opcodes_h_l488_c7_4ea7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l488_c7_4ea7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c7_4ea7
result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c7_4ea7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c7_4ea7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_4ea7
result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_4ea7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_4ea7_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c7_4ea7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c7_4ea7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c7_4ea7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l488_c7_4ea7
result_is_stack_write_MUX_uxn_opcodes_h_l488_c7_4ea7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l488_c7_4ea7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_4ea7
result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_4ea7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_4ea7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output);

-- dei_param_MUX_uxn_opcodes_h_l488_c7_4ea7
dei_param_MUX_uxn_opcodes_h_l488_c7_4ea7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l488_c7_4ea7_cond,
dei_param_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue,
dei_param_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse,
dei_param_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l488_c7_4ea7
has_written_to_t_MUX_uxn_opcodes_h_l488_c7_4ea7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l488_c7_4ea7_cond,
has_written_to_t_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l491_c11_f44a
BIN_OP_EQ_uxn_opcodes_h_l491_c11_f44a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l491_c11_f44a_left,
BIN_OP_EQ_uxn_opcodes_h_l491_c11_f44a_right,
BIN_OP_EQ_uxn_opcodes_h_l491_c11_f44a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c1_429d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c1_429d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c1_429d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c1_429d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c1_429d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c1_429d_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l491_c7_e023
has_written_to_n_MUX_uxn_opcodes_h_l491_c7_e023 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l491_c7_e023_cond,
has_written_to_n_MUX_uxn_opcodes_h_l491_c7_e023_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l491_c7_e023_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l491_c7_e023_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l491_c7_e023
current_dei_phase_MUX_uxn_opcodes_h_l491_c7_e023 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l491_c7_e023_cond,
current_dei_phase_MUX_uxn_opcodes_h_l491_c7_e023_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l491_c7_e023_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l491_c7_e023_return_output);

-- t8_MUX_uxn_opcodes_h_l491_c7_e023
t8_MUX_uxn_opcodes_h_l491_c7_e023 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l491_c7_e023_cond,
t8_MUX_uxn_opcodes_h_l491_c7_e023_iftrue,
t8_MUX_uxn_opcodes_h_l491_c7_e023_iffalse,
t8_MUX_uxn_opcodes_h_l491_c7_e023_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l491_c7_e023
device_in_result_MUX_uxn_opcodes_h_l491_c7_e023 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l491_c7_e023_cond,
device_in_result_MUX_uxn_opcodes_h_l491_c7_e023_iftrue,
device_in_result_MUX_uxn_opcodes_h_l491_c7_e023_iffalse,
device_in_result_MUX_uxn_opcodes_h_l491_c7_e023_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l491_c7_e023
is_second_dei_done_MUX_uxn_opcodes_h_l491_c7_e023 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l491_c7_e023_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l491_c7_e023_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l491_c7_e023_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l491_c7_e023_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l491_c7_e023
is_first_dei_done_MUX_uxn_opcodes_h_l491_c7_e023 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l491_c7_e023_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l491_c7_e023_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l491_c7_e023_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l491_c7_e023_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_e023
result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_e023 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_e023_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_e023_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_e023_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_e023_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l491_c7_e023
result_stack_value_MUX_uxn_opcodes_h_l491_c7_e023 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l491_c7_e023_cond,
result_stack_value_MUX_uxn_opcodes_h_l491_c7_e023_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l491_c7_e023_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l491_c7_e023_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_e023
result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_e023 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_e023_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_e023_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_e023_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_e023_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_e023
result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_e023 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_e023_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_e023_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_e023_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_e023_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_e023
result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_e023 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_e023_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_e023_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_e023_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_e023_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_e023
result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_e023 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_e023_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_e023_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_e023_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_e023_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_e023
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_e023 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_e023_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_e023_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_e023_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_e023_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l491_c7_e023
result_is_stack_write_MUX_uxn_opcodes_h_l491_c7_e023 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l491_c7_e023_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l491_c7_e023_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l491_c7_e023_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l491_c7_e023_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_e023
result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_e023 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_e023_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_e023_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_e023_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_e023_return_output);

-- dei_param_MUX_uxn_opcodes_h_l491_c7_e023
dei_param_MUX_uxn_opcodes_h_l491_c7_e023 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l491_c7_e023_cond,
dei_param_MUX_uxn_opcodes_h_l491_c7_e023_iftrue,
dei_param_MUX_uxn_opcodes_h_l491_c7_e023_iffalse,
dei_param_MUX_uxn_opcodes_h_l491_c7_e023_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l491_c7_e023
has_written_to_t_MUX_uxn_opcodes_h_l491_c7_e023 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l491_c7_e023_cond,
has_written_to_t_MUX_uxn_opcodes_h_l491_c7_e023_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l491_c7_e023_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l491_c7_e023_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l495_c32_44b1
BIN_OP_AND_uxn_opcodes_h_l495_c32_44b1 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l495_c32_44b1_left,
BIN_OP_AND_uxn_opcodes_h_l495_c32_44b1_right,
BIN_OP_AND_uxn_opcodes_h_l495_c32_44b1_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l495_c32_77d3
BIN_OP_GT_uxn_opcodes_h_l495_c32_77d3 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l495_c32_77d3_left,
BIN_OP_GT_uxn_opcodes_h_l495_c32_77d3_right,
BIN_OP_GT_uxn_opcodes_h_l495_c32_77d3_return_output);

-- MUX_uxn_opcodes_h_l495_c32_c0a3
MUX_uxn_opcodes_h_l495_c32_c0a3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l495_c32_c0a3_cond,
MUX_uxn_opcodes_h_l495_c32_c0a3_iftrue,
MUX_uxn_opcodes_h_l495_c32_c0a3_iffalse,
MUX_uxn_opcodes_h_l495_c32_c0a3_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l499_c35_54c8
BIN_OP_PLUS_uxn_opcodes_h_l499_c35_54c8 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l499_c35_54c8_left,
BIN_OP_PLUS_uxn_opcodes_h_l499_c35_54c8_right,
BIN_OP_PLUS_uxn_opcodes_h_l499_c35_54c8_return_output);

-- MUX_uxn_opcodes_h_l499_c15_ac7a
MUX_uxn_opcodes_h_l499_c15_ac7a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l499_c15_ac7a_cond,
MUX_uxn_opcodes_h_l499_c15_ac7a_iftrue,
MUX_uxn_opcodes_h_l499_c15_ac7a_iffalse,
MUX_uxn_opcodes_h_l499_c15_ac7a_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l500_c49_6d3f
UNARY_OP_NOT_uxn_opcodes_h_l500_c49_6d3f : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l500_c49_6d3f_expr,
UNARY_OP_NOT_uxn_opcodes_h_l500_c49_6d3f_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l500_c29_3cc7
BIN_OP_AND_uxn_opcodes_h_l500_c29_3cc7 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l500_c29_3cc7_left,
BIN_OP_AND_uxn_opcodes_h_l500_c29_3cc7_right,
BIN_OP_AND_uxn_opcodes_h_l500_c29_3cc7_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l500_c8_abdc
BIN_OP_OR_uxn_opcodes_h_l500_c8_abdc : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l500_c8_abdc_left,
BIN_OP_OR_uxn_opcodes_h_l500_c8_abdc_right,
BIN_OP_OR_uxn_opcodes_h_l500_c8_abdc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_9bd3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_9bd3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_9bd3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_9bd3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_9bd3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_9bd3_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l500_c3_03b7
has_written_to_n_MUX_uxn_opcodes_h_l500_c3_03b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l500_c3_03b7_cond,
has_written_to_n_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l500_c3_03b7_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l500_c3_03b7
current_dei_phase_MUX_uxn_opcodes_h_l500_c3_03b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l500_c3_03b7_cond,
current_dei_phase_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l500_c3_03b7_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l500_c3_03b7
device_in_result_MUX_uxn_opcodes_h_l500_c3_03b7 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l500_c3_03b7_cond,
device_in_result_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue,
device_in_result_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse,
device_in_result_MUX_uxn_opcodes_h_l500_c3_03b7_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7
is_second_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7
is_first_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c3_03b7
result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c3_03b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c3_03b7_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c3_03b7_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l500_c3_03b7
result_device_ram_address_MUX_uxn_opcodes_h_l500_c3_03b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l500_c3_03b7_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l500_c3_03b7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l500_c3_03b7
result_is_stack_write_MUX_uxn_opcodes_h_l500_c3_03b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l500_c3_03b7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l500_c3_03b7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l500_c3_03b7
result_is_opc_done_MUX_uxn_opcodes_h_l500_c3_03b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l500_c3_03b7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l500_c3_03b7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c3_03b7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c3_03b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c3_03b7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c3_03b7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l500_c3_03b7
result_stack_value_MUX_uxn_opcodes_h_l500_c3_03b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l500_c3_03b7_cond,
result_stack_value_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l500_c3_03b7_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l500_c3_03b7
has_written_to_t_MUX_uxn_opcodes_h_l500_c3_03b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l500_c3_03b7_cond,
has_written_to_t_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l500_c3_03b7_return_output);

-- device_in_uxn_opcodes_h_l501_c23_c417
device_in_uxn_opcodes_h_l501_c23_c417 : entity work.device_in_0CLK_5af1a430 port map (
clk,
device_in_uxn_opcodes_h_l501_c23_c417_CLOCK_ENABLE,
device_in_uxn_opcodes_h_l501_c23_c417_device_address,
device_in_uxn_opcodes_h_l501_c23_c417_phase,
device_in_uxn_opcodes_h_l501_c23_c417_previous_device_ram_read,
device_in_uxn_opcodes_h_l501_c23_c417_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l505_c4_5a18
BIN_OP_PLUS_uxn_opcodes_h_l505_c4_5a18 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l505_c4_5a18_left,
BIN_OP_PLUS_uxn_opcodes_h_l505_c4_5a18_right,
BIN_OP_PLUS_uxn_opcodes_h_l505_c4_5a18_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l506_c9_d4ab
BIN_OP_AND_uxn_opcodes_h_l506_c9_d4ab : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l506_c9_d4ab_left,
BIN_OP_AND_uxn_opcodes_h_l506_c9_d4ab_right,
BIN_OP_AND_uxn_opcodes_h_l506_c9_d4ab_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb
is_second_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb
is_first_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l508_c11_c6cf
is_second_dei_done_MUX_uxn_opcodes_h_l508_c11_c6cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l508_c11_c6cf_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l508_c11_c6cf_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l508_c11_c6cf_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l508_c11_c6cf_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l512_c13_ec6b
UNARY_OP_NOT_uxn_opcodes_h_l512_c13_ec6b : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l512_c13_ec6b_expr,
UNARY_OP_NOT_uxn_opcodes_h_l512_c13_ec6b_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l512_c8_8313
has_written_to_n_MUX_uxn_opcodes_h_l512_c8_8313 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l512_c8_8313_cond,
has_written_to_n_MUX_uxn_opcodes_h_l512_c8_8313_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l512_c8_8313_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l512_c8_8313_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l512_c8_8313
current_dei_phase_MUX_uxn_opcodes_h_l512_c8_8313 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l512_c8_8313_cond,
current_dei_phase_MUX_uxn_opcodes_h_l512_c8_8313_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l512_c8_8313_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l512_c8_8313_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c8_8313
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c8_8313 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c8_8313_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c8_8313_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c8_8313_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c8_8313_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l512_c8_8313
result_is_stack_write_MUX_uxn_opcodes_h_l512_c8_8313 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l512_c8_8313_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l512_c8_8313_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l512_c8_8313_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l512_c8_8313_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l512_c8_8313
result_is_opc_done_MUX_uxn_opcodes_h_l512_c8_8313 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l512_c8_8313_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l512_c8_8313_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l512_c8_8313_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l512_c8_8313_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l512_c8_8313
result_stack_value_MUX_uxn_opcodes_h_l512_c8_8313 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l512_c8_8313_cond,
result_stack_value_MUX_uxn_opcodes_h_l512_c8_8313_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l512_c8_8313_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l512_c8_8313_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l512_c8_8313
has_written_to_t_MUX_uxn_opcodes_h_l512_c8_8313 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l512_c8_8313_cond,
has_written_to_t_MUX_uxn_opcodes_h_l512_c8_8313_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l512_c8_8313_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l512_c8_8313_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l519_c13_b44c
UNARY_OP_NOT_uxn_opcodes_h_l519_c13_b44c : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l519_c13_b44c_expr,
UNARY_OP_NOT_uxn_opcodes_h_l519_c13_b44c_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l519_c8_71d4
has_written_to_n_MUX_uxn_opcodes_h_l519_c8_71d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l519_c8_71d4_cond,
has_written_to_n_MUX_uxn_opcodes_h_l519_c8_71d4_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l519_c8_71d4_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l519_c8_71d4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l519_c8_71d4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l519_c8_71d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l519_c8_71d4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l519_c8_71d4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l519_c8_71d4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l519_c8_71d4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l519_c8_71d4
result_is_stack_write_MUX_uxn_opcodes_h_l519_c8_71d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l519_c8_71d4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l519_c8_71d4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l519_c8_71d4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l519_c8_71d4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l519_c8_71d4
result_is_opc_done_MUX_uxn_opcodes_h_l519_c8_71d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l519_c8_71d4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l519_c8_71d4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l519_c8_71d4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l519_c8_71d4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l519_c8_71d4
result_stack_value_MUX_uxn_opcodes_h_l519_c8_71d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l519_c8_71d4_cond,
result_stack_value_MUX_uxn_opcodes_h_l519_c8_71d4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l519_c8_71d4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l519_c8_71d4_return_output);

-- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l500_l506_DUPLICATE_50b2
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l500_l506_DUPLICATE_50b2 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l500_l506_DUPLICATE_50b2_expr,
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l500_l506_DUPLICATE_50b2_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l476_c6_7e56_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l476_c1_abb2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l476_c2_3272_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l476_c2_3272_return_output,
 t8_MUX_uxn_opcodes_h_l476_c2_3272_return_output,
 device_in_result_MUX_uxn_opcodes_h_l476_c2_3272_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l476_c2_3272_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l476_c2_3272_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l476_c2_3272_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l476_c2_3272_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l476_c2_3272_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l476_c2_3272_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l476_c2_3272_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l476_c2_3272_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c2_3272_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l476_c2_3272_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l476_c2_3272_return_output,
 dei_param_MUX_uxn_opcodes_h_l476_c2_3272_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l476_c2_3272_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l488_c11_0b02_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_e023_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output,
 t8_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output,
 device_in_result_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output,
 dei_param_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l491_c11_f44a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c1_429d_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l491_c7_e023_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l491_c7_e023_return_output,
 t8_MUX_uxn_opcodes_h_l491_c7_e023_return_output,
 device_in_result_MUX_uxn_opcodes_h_l491_c7_e023_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l491_c7_e023_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l491_c7_e023_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_e023_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l491_c7_e023_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_e023_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_e023_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_e023_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_e023_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_e023_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l491_c7_e023_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_e023_return_output,
 dei_param_MUX_uxn_opcodes_h_l491_c7_e023_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l491_c7_e023_return_output,
 BIN_OP_AND_uxn_opcodes_h_l495_c32_44b1_return_output,
 BIN_OP_GT_uxn_opcodes_h_l495_c32_77d3_return_output,
 MUX_uxn_opcodes_h_l495_c32_c0a3_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l499_c35_54c8_return_output,
 MUX_uxn_opcodes_h_l499_c15_ac7a_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l500_c49_6d3f_return_output,
 BIN_OP_AND_uxn_opcodes_h_l500_c29_3cc7_return_output,
 BIN_OP_OR_uxn_opcodes_h_l500_c8_abdc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_9bd3_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l500_c3_03b7_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l500_c3_03b7_return_output,
 device_in_result_MUX_uxn_opcodes_h_l500_c3_03b7_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c3_03b7_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l500_c3_03b7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l500_c3_03b7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l500_c3_03b7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c3_03b7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l500_c3_03b7_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l500_c3_03b7_return_output,
 device_in_uxn_opcodes_h_l501_c23_c417_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l505_c4_5a18_return_output,
 BIN_OP_AND_uxn_opcodes_h_l506_c9_d4ab_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l508_c11_c6cf_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l512_c13_ec6b_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l512_c8_8313_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l512_c8_8313_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c8_8313_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l512_c8_8313_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l512_c8_8313_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l512_c8_8313_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l512_c8_8313_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l519_c13_b44c_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l519_c8_71d4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l519_c8_71d4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l519_c8_71d4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l519_c8_71d4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l519_c8_71d4_return_output,
 UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l500_l506_DUPLICATE_50b2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l476_c6_7e56_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l476_c6_7e56_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l476_c6_7e56_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l476_c1_abb2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l476_c1_abb2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l476_c1_abb2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l476_c1_abb2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_4ea7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c2_3272_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c2_3272_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c2_3272_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c2_3272_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l476_c2_3272_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l482_c3_34fb : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l476_c2_3272_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l476_c2_3272_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l476_c2_3272_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l476_c2_3272_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l476_c2_3272_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l476_c2_3272_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l476_c2_3272_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l476_c2_3272_iftrue : device_in_result_t;
 variable VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l476_c2_3272_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l476_c2_3272_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l476_c2_3272_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l476_c2_3272_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l476_c2_3272_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l476_c2_3272_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l476_c2_3272_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l476_c2_3272_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l476_c2_3272_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l476_c2_3272_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l476_c2_3272_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l476_c2_3272_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l476_c2_3272_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l476_c2_3272_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l476_c2_3272_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l476_c2_3272_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l476_c2_3272_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l476_c2_3272_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l476_c2_3272_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l476_c2_3272_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l476_c2_3272_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l476_c2_3272_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l476_c2_3272_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l476_c2_3272_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l476_c2_3272_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l476_c2_3272_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l476_c2_3272_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l476_c2_3272_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l476_c2_3272_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l476_c2_3272_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l476_c2_3272_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l476_c2_3272_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l476_c2_3272_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l476_c2_3272_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l476_c2_3272_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l476_c2_3272_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c2_3272_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l484_c3_2857 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c2_3272_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c2_3272_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c2_3272_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c2_3272_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c2_3272_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c2_3272_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c2_3272_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c2_3272_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c2_3272_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c2_3272_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c2_3272_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l476_c2_3272_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l476_c2_3272_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l476_c2_3272_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l476_c2_3272_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l476_c2_3272_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l476_c2_3272_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l476_c2_3272_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l476_c2_3272_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l477_c3_6ce6_uxn_opcodes_h_l477_c3_6ce6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_0b02_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_0b02_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_0b02_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_e023_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_e023_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_e023_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_e023_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l491_c7_e023_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c7_4ea7_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l491_c7_e023_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c7_4ea7_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l491_c7_e023_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l488_c7_4ea7_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l491_c7_e023_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l488_c7_4ea7_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l491_c7_e023_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l491_c7_e023_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_e023_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_4ea7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l491_c7_e023_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l488_c7_4ea7_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_e023_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_4ea7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_e023_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l488_c7_4ea7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_e023_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c7_4ea7_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_e023_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_4ea7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l489_c3_247c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_e023_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c7_4ea7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l491_c7_e023_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c7_4ea7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_e023_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_4ea7_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l491_c7_e023_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l488_c7_4ea7_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l491_c7_e023_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c7_4ea7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_f44a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_f44a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_f44a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c1_429d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c1_429d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c1_429d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c1_429d_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l491_c7_e023_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l491_c7_e023_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l500_c3_03b7_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l491_c7_e023_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l491_c7_e023_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l491_c7_e023_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l500_c3_03b7_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l491_c7_e023_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l491_c7_e023_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l491_c7_e023_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l491_c7_e023_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l491_c7_e023_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l491_c7_e023_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l500_c3_03b7_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l491_c7_e023_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l491_c7_e023_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l491_c7_e023_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l491_c7_e023_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l491_c7_e023_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l491_c7_e023_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l491_c7_e023_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_e023_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_e023_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_e023_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l491_c7_e023_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l491_c7_e023_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l500_c3_03b7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l491_c7_e023_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_e023_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_e023_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c3_03b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_e023_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_e023_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_e023_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_e023_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_e023_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_e023_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_e023_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_e023_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_e023_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c3_03b7_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_e023_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_e023_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_e023_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c3_03b7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_e023_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l491_c7_e023_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l491_c7_e023_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l500_c3_03b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l491_c7_e023_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_e023_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_e023_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c3_03b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_e023_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l491_c7_e023_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l491_c7_e023_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l491_c7_e023_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l491_c7_e023_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l491_c7_e023_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l500_c3_03b7_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l491_c7_e023_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l495_c32_c0a3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l495_c32_c0a3_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l495_c32_c0a3_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l495_c32_44b1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l495_c32_44b1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l495_c32_44b1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l495_c32_77d3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l495_c32_77d3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l495_c32_77d3_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l495_c32_c0a3_return_output : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l499_c15_ac7a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l499_c15_ac7a_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l499_c15_ac7a_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l499_c35_54c8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l499_c35_54c8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l499_c35_54c8_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l499_c15_ac7a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l500_c8_abdc_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l500_c29_3cc7_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l500_c49_6d3f_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l500_c49_6d3f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l500_c29_3cc7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l500_c29_3cc7_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l500_c8_abdc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l500_c8_abdc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_9bd3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_9bd3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_9bd3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_9bd3_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l512_c8_8313_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l500_c3_03b7_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l505_c4_a08d : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l512_c8_8313_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l500_c3_03b7_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l500_c3_03b7_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c3_03b7_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c3_03b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l512_c8_8313_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l500_c3_03b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l512_c8_8313_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c3_03b7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c8_8313_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c3_03b7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l512_c8_8313_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l500_c3_03b7_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l512_c8_8313_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l500_c3_03b7_cond : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l501_c23_c417_device_address : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l501_c23_c417_phase : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l501_c23_c417_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l501_c23_c417_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l501_c23_c417_return_output : device_in_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l502_c32_d114_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l503_c32_e183_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l505_c4_5a18_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l505_c4_5a18_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l505_c4_5a18_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l506_c9_d4ab_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l506_c9_d4ab_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l506_c9_d4ab_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l508_c11_c6cf_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l508_c11_c6cf_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l508_c11_c6cf_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l508_c11_c6cf_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l512_c13_ec6b_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l512_c13_ec6b_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l512_c8_8313_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l512_c8_8313_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l519_c8_71d4_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l512_c8_8313_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l512_c8_8313_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l513_c4_144e : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l512_c8_8313_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l512_c8_8313_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c8_8313_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l515_c4_a80a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c8_8313_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l519_c8_71d4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c8_8313_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l512_c8_8313_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l512_c8_8313_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l519_c8_71d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l512_c8_8313_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l512_c8_8313_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l512_c8_8313_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l519_c8_71d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l512_c8_8313_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l512_c8_8313_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l512_c8_8313_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l519_c8_71d4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l512_c8_8313_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l512_c8_8313_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l512_c8_8313_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l512_c8_8313_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l519_c13_b44c_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l519_c13_b44c_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l519_c8_71d4_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l519_c8_71d4_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l519_c8_71d4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l519_c8_71d4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l521_c4_3db8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l519_c8_71d4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l519_c8_71d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l519_c8_71d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l519_c8_71d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l519_c8_71d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l519_c8_71d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l519_c8_71d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l519_c8_71d4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l519_c8_71d4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l519_c8_71d4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l519_c8_71d4_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l491_l519_l488_l476_l500_DUPLICATE_edaf_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l488_l500_l491_l476_DUPLICATE_c806_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l488_l476_DUPLICATE_bcd5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l488_l491_l476_DUPLICATE_5997_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l488_l500_l491_l476_DUPLICATE_6309_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l488_l491_l476_DUPLICATE_17d3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l488_l491_DUPLICATE_4321_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l491_l519_l488_l512_l500_DUPLICATE_b893_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l500_l491_l519_DUPLICATE_19c8_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l500_l506_DUPLICATE_50b2_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l500_l506_DUPLICATE_50b2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l506_l508_DUPLICATE_7c28_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l522_l516_DUPLICATE_ff74_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7bb2_uxn_opcodes_h_l470_l531_DUPLICATE_32b4_return_output : opcode_result_t;
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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c1_429d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l495_c32_44b1_right := to_unsigned(128, 8);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l505_c4_5a18_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l519_c8_71d4_iffalse := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l519_c8_71d4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_f44a_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l476_c6_7e56_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l519_c8_71d4_iffalse := to_unsigned(0, 1);
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l476_c2_3272_iftrue := to_unsigned(0, 1);
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l519_c8_71d4_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l484_c3_2857 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c2_3272_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l484_c3_2857;
     VAR_MUX_uxn_opcodes_h_l495_c32_c0a3_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_9bd3_iffalse := to_unsigned(0, 1);
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l508_c11_c6cf_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l499_c35_54c8_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l515_c4_a80a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c8_8313_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l515_c4_a80a;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l476_c1_abb2_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l495_c32_77d3_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_e023_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l489_c3_247c := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l489_c3_247c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_0b02_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l495_c32_c0a3_iffalse := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_e023_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l512_c8_8313_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l476_c2_3272_iftrue := to_unsigned(1, 1);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l476_c2_3272_iftrue := to_unsigned(0, 1);
     VAR_current_dei_phase_uxn_opcodes_h_l482_c3_34fb := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l476_c2_3272_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l482_c3_34fb;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l521_c4_3db8 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l519_c8_71d4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l521_c4_3db8;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_e023_iftrue := to_unsigned(0, 1);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l512_c8_8313_iftrue := to_unsigned(1, 1);
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c2_3272_iftrue := to_unsigned(0, 1);
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb_iftrue := to_unsigned(1, 1);
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l476_c2_3272_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c2_3272_iftrue := to_unsigned(0, 1);
     VAR_current_dei_phase_uxn_opcodes_h_l513_c4_144e := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l512_c8_8313_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l513_c4_144e;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_e023_iffalse := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l476_c1_abb2_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l505_c4_5a18_left := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l491_c7_e023_iftrue := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l512_c8_8313_iffalse := current_dei_phase;
     VAR_device_in_uxn_opcodes_h_l501_c23_c417_phase := current_dei_phase;
     VAR_dei_param_MUX_uxn_opcodes_h_l476_c2_3272_iftrue := dei_param;
     VAR_dei_param_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue := dei_param;
     VAR_dei_param_MUX_uxn_opcodes_h_l491_c7_e023_iftrue := dei_param;
     VAR_device_in_result_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l491_c7_e023_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse := device_in_result;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l519_c13_b44c_expr := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l491_c7_e023_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l512_c8_8313_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l519_c8_71d4_iffalse := has_written_to_n;
     VAR_BIN_OP_AND_uxn_opcodes_h_l500_c29_3cc7_left := has_written_to_t;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l512_c13_ec6b_expr := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l491_c7_e023_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l512_c8_8313_iffalse := has_written_to_t;
     VAR_BIN_OP_AND_uxn_opcodes_h_l495_c32_44b1_left := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l499_c15_ac7a_cond := is_first_dei_done;
     VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l500_l506_DUPLICATE_50b2_expr := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l491_c7_e023_iftrue := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb_iffalse := is_first_dei_done;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l500_c49_6d3f_expr := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l491_c7_e023_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l508_c11_c6cf_iffalse := is_second_dei_done;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l476_c6_7e56_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_0b02_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_f44a_left := VAR_phase;
     VAR_device_in_uxn_opcodes_h_l501_c23_c417_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l491_c7_e023_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l499_c35_54c8_left := t8;
     VAR_MUX_uxn_opcodes_h_l499_c15_ac7a_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l476_c2_3272_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l491_c7_e023_iffalse := t8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l488_l500_l491_l476_DUPLICATE_6309 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l488_l500_l491_l476_DUPLICATE_6309_return_output := result.device_ram_address;

     -- UNARY_OP_NOT[uxn_opcodes_h_l500_c49_6d3f] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l500_c49_6d3f_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l500_c49_6d3f_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l500_c49_6d3f_return_output := UNARY_OP_NOT_uxn_opcodes_h_l500_c49_6d3f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l488_l476_DUPLICATE_bcd5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l488_l476_DUPLICATE_bcd5_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l491_l519_l488_l476_l500_DUPLICATE_edaf LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l491_l519_l488_l476_l500_DUPLICATE_edaf_return_output := result.stack_value;

     -- BIN_OP_PLUS[uxn_opcodes_h_l505_c4_5a18] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l505_c4_5a18_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l505_c4_5a18_left;
     BIN_OP_PLUS_uxn_opcodes_h_l505_c4_5a18_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l505_c4_5a18_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l505_c4_5a18_return_output := BIN_OP_PLUS_uxn_opcodes_h_l505_c4_5a18_return_output;

     -- device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6[uxn_opcodes_h_l476_c2_3272] LATENCY=0
     VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l476_c2_3272_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6(
     device_in_result,
     to_unsigned(0, 1));

     -- BIN_OP_EQ[uxn_opcodes_h_l491_c11_f44a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l491_c11_f44a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_f44a_left;
     BIN_OP_EQ_uxn_opcodes_h_l491_c11_f44a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_f44a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_f44a_return_output := BIN_OP_EQ_uxn_opcodes_h_l491_c11_f44a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l476_c6_7e56] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l476_c6_7e56_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l476_c6_7e56_left;
     BIN_OP_EQ_uxn_opcodes_h_l476_c6_7e56_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l476_c6_7e56_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l476_c6_7e56_return_output := BIN_OP_EQ_uxn_opcodes_h_l476_c6_7e56_return_output;

     -- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l500_l506_DUPLICATE_50b2 LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l500_l506_DUPLICATE_50b2_expr <= VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l500_l506_DUPLICATE_50b2_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l500_l506_DUPLICATE_50b2_return_output := UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l500_l506_DUPLICATE_50b2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l488_l491_l476_DUPLICATE_17d3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l488_l491_l476_DUPLICATE_17d3_return_output := result.is_stack_write;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l488_l491_l476_DUPLICATE_5997 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l488_l491_l476_DUPLICATE_5997_return_output := result.sp_relative_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l495_c32_44b1] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l495_c32_44b1_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l495_c32_44b1_left;
     BIN_OP_AND_uxn_opcodes_h_l495_c32_44b1_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l495_c32_44b1_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l495_c32_44b1_return_output := BIN_OP_AND_uxn_opcodes_h_l495_c32_44b1_return_output;

     -- CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l522_l516_DUPLICATE_ff74 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l522_l516_DUPLICATE_ff74_return_output := device_in_result.dei_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l488_l491_DUPLICATE_4321 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l488_l491_DUPLICATE_4321_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l491_l519_l488_l512_l500_DUPLICATE_b893 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l491_l519_l488_l512_l500_DUPLICATE_b893_return_output := result.is_opc_done;

     -- UNARY_OP_NOT[uxn_opcodes_h_l512_c13_ec6b] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l512_c13_ec6b_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l512_c13_ec6b_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l512_c13_ec6b_return_output := UNARY_OP_NOT_uxn_opcodes_h_l512_c13_ec6b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l488_c11_0b02] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l488_c11_0b02_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_0b02_left;
     BIN_OP_EQ_uxn_opcodes_h_l488_c11_0b02_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_0b02_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_0b02_return_output := BIN_OP_EQ_uxn_opcodes_h_l488_c11_0b02_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l499_c35_54c8] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l499_c35_54c8_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l499_c35_54c8_left;
     BIN_OP_PLUS_uxn_opcodes_h_l499_c35_54c8_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l499_c35_54c8_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l499_c35_54c8_return_output := BIN_OP_PLUS_uxn_opcodes_h_l499_c35_54c8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l488_l500_l491_l476_DUPLICATE_c806 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l488_l500_l491_l476_DUPLICATE_c806_return_output := result.is_device_ram_read;

     -- UNARY_OP_NOT[uxn_opcodes_h_l519_c13_b44c] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l519_c13_b44c_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l519_c13_b44c_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l519_c13_b44c_return_output := UNARY_OP_NOT_uxn_opcodes_h_l519_c13_b44c_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l500_l491_l519_DUPLICATE_19c8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l500_l491_l519_DUPLICATE_19c8_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l495_c32_77d3_left := VAR_BIN_OP_AND_uxn_opcodes_h_l495_c32_44b1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_4ea7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l476_c6_7e56_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l476_c1_abb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l476_c6_7e56_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l476_c2_3272_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l476_c6_7e56_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l476_c2_3272_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l476_c6_7e56_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l476_c2_3272_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l476_c6_7e56_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c2_3272_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l476_c6_7e56_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l476_c2_3272_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l476_c6_7e56_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l476_c2_3272_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l476_c6_7e56_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l476_c2_3272_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l476_c6_7e56_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l476_c2_3272_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l476_c6_7e56_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l476_c2_3272_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l476_c6_7e56_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c2_3272_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l476_c6_7e56_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l476_c2_3272_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l476_c6_7e56_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l476_c2_3272_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l476_c6_7e56_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c2_3272_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l476_c6_7e56_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l476_c2_3272_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l476_c6_7e56_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c2_3272_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l476_c6_7e56_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l476_c2_3272_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l476_c6_7e56_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l476_c2_3272_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l476_c6_7e56_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_e023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_0b02_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c7_4ea7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_0b02_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l488_c7_4ea7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_0b02_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l488_c7_4ea7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_0b02_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c7_4ea7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_0b02_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c7_4ea7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_0b02_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_0b02_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_0b02_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_4ea7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_0b02_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_4ea7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_0b02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_4ea7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_0b02_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l488_c7_4ea7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_0b02_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_4ea7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_0b02_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c7_4ea7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_0b02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c7_4ea7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_0b02_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c7_4ea7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_0b02_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l488_c7_4ea7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_0b02_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l488_c7_4ea7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c11_0b02_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c1_429d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_f44a_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l491_c7_e023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_f44a_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l491_c7_e023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_f44a_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l491_c7_e023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_f44a_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l491_c7_e023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_f44a_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l491_c7_e023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_f44a_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l491_c7_e023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_f44a_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l491_c7_e023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_f44a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_e023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_f44a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_e023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_f44a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_e023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_f44a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_e023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_f44a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_e023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_f44a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l491_c7_e023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_f44a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_e023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_f44a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_e023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_f44a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l491_c7_e023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_f44a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l491_c7_e023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_f44a_return_output;
     VAR_MUX_uxn_opcodes_h_l499_c15_ac7a_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l499_c35_54c8_return_output, 8);
     VAR_current_dei_phase_uxn_opcodes_h_l505_c4_a08d := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l505_c4_5a18_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l476_c2_3272_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l488_l491_l476_DUPLICATE_5997_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l488_l491_l476_DUPLICATE_5997_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_e023_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l488_l491_l476_DUPLICATE_5997_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l476_c2_3272_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l488_l500_l491_l476_DUPLICATE_c806_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l488_l500_l491_l476_DUPLICATE_c806_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_e023_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l488_l500_l491_l476_DUPLICATE_c806_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l488_l500_l491_l476_DUPLICATE_c806_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l491_l519_l488_l512_l500_DUPLICATE_b893_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_e023_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l491_l519_l488_l512_l500_DUPLICATE_b893_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l491_l519_l488_l512_l500_DUPLICATE_b893_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l512_c8_8313_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l491_l519_l488_l512_l500_DUPLICATE_b893_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l519_c8_71d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l491_l519_l488_l512_l500_DUPLICATE_b893_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l476_c2_3272_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l488_l476_DUPLICATE_bcd5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l488_l476_DUPLICATE_bcd5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l488_l491_DUPLICATE_4321_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_e023_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l488_l491_DUPLICATE_4321_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c2_3272_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l488_l491_l476_DUPLICATE_17d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l488_l491_l476_DUPLICATE_17d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l491_c7_e023_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l488_l491_l476_DUPLICATE_17d3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l512_c8_8313_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l522_l516_DUPLICATE_ff74_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l519_c8_71d4_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l522_l516_DUPLICATE_ff74_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l476_c2_3272_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l488_l500_l491_l476_DUPLICATE_6309_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l488_l500_l491_l476_DUPLICATE_6309_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_e023_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l488_l500_l491_l476_DUPLICATE_6309_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l488_l500_l491_l476_DUPLICATE_6309_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_e023_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l500_l491_l519_DUPLICATE_19c8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l500_l491_l519_DUPLICATE_19c8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l519_c8_71d4_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l500_l491_l519_DUPLICATE_19c8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l476_c2_3272_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l491_l519_l488_l476_l500_DUPLICATE_edaf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l491_l519_l488_l476_l500_DUPLICATE_edaf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l491_c7_e023_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l491_l519_l488_l476_l500_DUPLICATE_edaf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l491_l519_l488_l476_l500_DUPLICATE_edaf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l519_c8_71d4_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l491_l519_l488_l476_l500_DUPLICATE_edaf_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l500_c29_3cc7_right := VAR_UNARY_OP_NOT_uxn_opcodes_h_l500_c49_6d3f_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l512_c8_8313_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l512_c13_ec6b_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l512_c8_8313_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l512_c13_ec6b_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l512_c8_8313_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l512_c13_ec6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l512_c8_8313_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l512_c13_ec6b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l512_c8_8313_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l512_c13_ec6b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c8_8313_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l512_c13_ec6b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l512_c8_8313_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l512_c13_ec6b_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l519_c8_71d4_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l519_c13_b44c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l519_c8_71d4_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l519_c13_b44c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l519_c8_71d4_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l519_c13_b44c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l519_c8_71d4_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l519_c13_b44c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l519_c8_71d4_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l519_c13_b44c_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l506_c9_d4ab_left := VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l500_l506_DUPLICATE_50b2_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l500_c8_abdc_left := VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l500_l506_DUPLICATE_50b2_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l476_c2_3272_iftrue := VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l476_c2_3272_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l505_c4_a08d;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l491_c7_e023] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_e023_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_e023_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_e023_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_e023_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_e023_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_e023_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_e023_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_e023_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l512_c8_8313] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l512_c8_8313_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l512_c8_8313_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l512_c8_8313_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l512_c8_8313_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l512_c8_8313_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l512_c8_8313_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l512_c8_8313_return_output := has_written_to_t_MUX_uxn_opcodes_h_l512_c8_8313_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l495_c32_77d3] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l495_c32_77d3_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l495_c32_77d3_left;
     BIN_OP_GT_uxn_opcodes_h_l495_c32_77d3_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l495_c32_77d3_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l495_c32_77d3_return_output := BIN_OP_GT_uxn_opcodes_h_l495_c32_77d3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l519_c8_71d4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l519_c8_71d4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l519_c8_71d4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l519_c8_71d4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l519_c8_71d4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l519_c8_71d4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l519_c8_71d4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l519_c8_71d4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l519_c8_71d4_return_output;

     -- t8_MUX[uxn_opcodes_h_l491_c7_e023] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l491_c7_e023_cond <= VAR_t8_MUX_uxn_opcodes_h_l491_c7_e023_cond;
     t8_MUX_uxn_opcodes_h_l491_c7_e023_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l491_c7_e023_iftrue;
     t8_MUX_uxn_opcodes_h_l491_c7_e023_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l491_c7_e023_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l491_c7_e023_return_output := t8_MUX_uxn_opcodes_h_l491_c7_e023_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l519_c8_71d4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l519_c8_71d4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l519_c8_71d4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l519_c8_71d4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l519_c8_71d4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l519_c8_71d4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l519_c8_71d4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l519_c8_71d4_return_output := result_stack_value_MUX_uxn_opcodes_h_l519_c8_71d4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l476_c1_abb2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l476_c1_abb2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l476_c1_abb2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l476_c1_abb2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l476_c1_abb2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l476_c1_abb2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l476_c1_abb2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l476_c1_abb2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l476_c1_abb2_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l519_c8_71d4] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l519_c8_71d4_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l519_c8_71d4_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l519_c8_71d4_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l519_c8_71d4_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l519_c8_71d4_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l519_c8_71d4_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l519_c8_71d4_return_output := has_written_to_n_MUX_uxn_opcodes_h_l519_c8_71d4_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l512_c8_8313] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l512_c8_8313_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l512_c8_8313_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l512_c8_8313_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l512_c8_8313_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l512_c8_8313_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l512_c8_8313_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l512_c8_8313_return_output := current_dei_phase_MUX_uxn_opcodes_h_l512_c8_8313_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l500_c29_3cc7] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l500_c29_3cc7_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l500_c29_3cc7_left;
     BIN_OP_AND_uxn_opcodes_h_l500_c29_3cc7_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l500_c29_3cc7_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l500_c29_3cc7_return_output := BIN_OP_AND_uxn_opcodes_h_l500_c29_3cc7_return_output;

     -- MUX[uxn_opcodes_h_l499_c15_ac7a] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l499_c15_ac7a_cond <= VAR_MUX_uxn_opcodes_h_l499_c15_ac7a_cond;
     MUX_uxn_opcodes_h_l499_c15_ac7a_iftrue <= VAR_MUX_uxn_opcodes_h_l499_c15_ac7a_iftrue;
     MUX_uxn_opcodes_h_l499_c15_ac7a_iffalse <= VAR_MUX_uxn_opcodes_h_l499_c15_ac7a_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l499_c15_ac7a_return_output := MUX_uxn_opcodes_h_l499_c15_ac7a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l519_c8_71d4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l519_c8_71d4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l519_c8_71d4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l519_c8_71d4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l519_c8_71d4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l519_c8_71d4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l519_c8_71d4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l519_c8_71d4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l519_c8_71d4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l488_c7_4ea7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_4ea7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_4ea7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l491_c7_e023] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_e023_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_e023_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_e023_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_e023_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_e023_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_e023_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_e023_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_e023_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l519_c8_71d4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l519_c8_71d4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l519_c8_71d4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l519_c8_71d4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l519_c8_71d4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l519_c8_71d4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l519_c8_71d4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l519_c8_71d4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l519_c8_71d4_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_opcodes_h_l500_c8_abdc_right := VAR_BIN_OP_AND_uxn_opcodes_h_l500_c29_3cc7_return_output;
     VAR_MUX_uxn_opcodes_h_l495_c32_c0a3_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l495_c32_77d3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_e023_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l491_c7_e023_iffalse := VAR_MUX_uxn_opcodes_h_l499_c15_ac7a_return_output;
     VAR_device_in_uxn_opcodes_h_l501_c23_c417_device_address := VAR_MUX_uxn_opcodes_h_l499_c15_ac7a_return_output;
     VAR_printf_uxn_opcodes_h_l477_c3_6ce6_uxn_opcodes_h_l477_c3_6ce6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l476_c1_abb2_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l512_c8_8313_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l512_c8_8313_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l519_c8_71d4_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l512_c8_8313_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l512_c8_8313_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l519_c8_71d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_e023_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_e023_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l512_c8_8313_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l519_c8_71d4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c8_8313_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l519_c8_71d4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l512_c8_8313_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l519_c8_71d4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse := VAR_t8_MUX_uxn_opcodes_h_l491_c7_e023_return_output;
     -- has_written_to_n_MUX[uxn_opcodes_h_l512_c8_8313] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l512_c8_8313_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l512_c8_8313_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l512_c8_8313_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l512_c8_8313_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l512_c8_8313_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l512_c8_8313_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l512_c8_8313_return_output := has_written_to_n_MUX_uxn_opcodes_h_l512_c8_8313_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l512_c8_8313] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l512_c8_8313_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l512_c8_8313_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l512_c8_8313_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l512_c8_8313_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l512_c8_8313_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l512_c8_8313_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l512_c8_8313_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l512_c8_8313_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l488_c7_4ea7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l488_c7_4ea7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l488_c7_4ea7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l491_c7_e023] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_e023_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_e023_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_e023_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_e023_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_e023_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_e023_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_e023_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_e023_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l488_c7_4ea7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_4ea7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_4ea7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output;

     -- MUX[uxn_opcodes_h_l495_c32_c0a3] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l495_c32_c0a3_cond <= VAR_MUX_uxn_opcodes_h_l495_c32_c0a3_cond;
     MUX_uxn_opcodes_h_l495_c32_c0a3_iftrue <= VAR_MUX_uxn_opcodes_h_l495_c32_c0a3_iftrue;
     MUX_uxn_opcodes_h_l495_c32_c0a3_iffalse <= VAR_MUX_uxn_opcodes_h_l495_c32_c0a3_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l495_c32_c0a3_return_output := MUX_uxn_opcodes_h_l495_c32_c0a3_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l500_c8_abdc] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l500_c8_abdc_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l500_c8_abdc_left;
     BIN_OP_OR_uxn_opcodes_h_l500_c8_abdc_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l500_c8_abdc_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l500_c8_abdc_return_output := BIN_OP_OR_uxn_opcodes_h_l500_c8_abdc_return_output;

     -- t8_MUX[uxn_opcodes_h_l488_c7_4ea7] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l488_c7_4ea7_cond <= VAR_t8_MUX_uxn_opcodes_h_l488_c7_4ea7_cond;
     t8_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue;
     t8_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output := t8_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l512_c8_8313] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l512_c8_8313_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l512_c8_8313_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l512_c8_8313_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l512_c8_8313_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l512_c8_8313_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l512_c8_8313_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l512_c8_8313_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l512_c8_8313_return_output;

     -- printf_uxn_opcodes_h_l477_c3_6ce6[uxn_opcodes_h_l477_c3_6ce6] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l477_c3_6ce6_uxn_opcodes_h_l477_c3_6ce6_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l477_c3_6ce6_uxn_opcodes_h_l477_c3_6ce6_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_value_MUX[uxn_opcodes_h_l512_c8_8313] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l512_c8_8313_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l512_c8_8313_cond;
     result_stack_value_MUX_uxn_opcodes_h_l512_c8_8313_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l512_c8_8313_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l512_c8_8313_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l512_c8_8313_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l512_c8_8313_return_output := result_stack_value_MUX_uxn_opcodes_h_l512_c8_8313_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l491_c7_e023] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l491_c7_e023_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l491_c7_e023_cond;
     dei_param_MUX_uxn_opcodes_h_l491_c7_e023_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l491_c7_e023_iftrue;
     dei_param_MUX_uxn_opcodes_h_l491_c7_e023_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l491_c7_e023_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l491_c7_e023_return_output := dei_param_MUX_uxn_opcodes_h_l491_c7_e023_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l512_c8_8313] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c8_8313_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c8_8313_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c8_8313_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c8_8313_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c8_8313_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c8_8313_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c8_8313_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c8_8313_return_output;

     -- Submodule level 3
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_9bd3_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l500_c8_abdc_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l500_c3_03b7_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l500_c8_abdc_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l500_c3_03b7_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l500_c8_abdc_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l500_c3_03b7_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l500_c8_abdc_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l500_c3_03b7_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l500_c8_abdc_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l500_c8_abdc_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l500_c8_abdc_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c3_03b7_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l500_c8_abdc_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c3_03b7_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l500_c8_abdc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c3_03b7_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l500_c8_abdc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l500_c3_03b7_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l500_c8_abdc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c3_03b7_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l500_c8_abdc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l500_c3_03b7_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l500_c8_abdc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c1_429d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_e023_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_e023_iftrue := VAR_MUX_uxn_opcodes_h_l495_c32_c0a3_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse := VAR_dei_param_MUX_uxn_opcodes_h_l491_c7_e023_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l512_c8_8313_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l512_c8_8313_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l476_c2_3272_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l476_c2_3272_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l512_c8_8313_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c8_8313_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l512_c8_8313_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l476_c2_3272_iffalse := VAR_t8_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l500_c3_03b7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c3_03b7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c3_03b7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c3_03b7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c3_03b7_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l500_c3_03b7] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l500_c3_03b7_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l500_c3_03b7_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l500_c3_03b7_return_output := has_written_to_n_MUX_uxn_opcodes_h_l500_c3_03b7_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l476_c2_3272] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l476_c2_3272_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l476_c2_3272_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l476_c2_3272_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l476_c2_3272_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l476_c2_3272_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l476_c2_3272_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l476_c2_3272_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l476_c2_3272_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l500_c3_03b7] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l500_c3_03b7_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l500_c3_03b7_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l500_c3_03b7_return_output := current_dei_phase_MUX_uxn_opcodes_h_l500_c3_03b7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l500_c3_03b7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l500_c3_03b7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l500_c3_03b7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l500_c3_03b7_return_output := result_stack_value_MUX_uxn_opcodes_h_l500_c3_03b7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l500_c3_03b7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l500_c3_03b7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c3_03b7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c3_03b7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l500_c3_03b7_return_output;

     -- t8_MUX[uxn_opcodes_h_l476_c2_3272] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l476_c2_3272_cond <= VAR_t8_MUX_uxn_opcodes_h_l476_c2_3272_cond;
     t8_MUX_uxn_opcodes_h_l476_c2_3272_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l476_c2_3272_iftrue;
     t8_MUX_uxn_opcodes_h_l476_c2_3272_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l476_c2_3272_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l476_c2_3272_return_output := t8_MUX_uxn_opcodes_h_l476_c2_3272_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l488_c7_4ea7] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l488_c7_4ea7_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l488_c7_4ea7_cond;
     dei_param_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue;
     dei_param_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output := dei_param_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l476_c2_3272] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l476_c2_3272_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l476_c2_3272_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l476_c2_3272_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l476_c2_3272_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l476_c2_3272_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l476_c2_3272_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l476_c2_3272_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l476_c2_3272_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l500_c3_03b7] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l500_c3_03b7_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l500_c3_03b7_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l500_c3_03b7_return_output := has_written_to_t_MUX_uxn_opcodes_h_l500_c3_03b7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l500_c3_03b7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l500_c3_03b7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l500_c3_03b7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l500_c3_03b7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l500_c3_03b7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l491_c7_e023] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_e023_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_e023_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_e023_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_e023_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_e023_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_e023_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_e023_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_e023_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l497_c1_429d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c1_429d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c1_429d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c1_429d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c1_429d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c1_429d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c1_429d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c1_429d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c1_429d_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_9bd3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c1_429d_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l491_c7_e023_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l500_c3_03b7_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l476_c2_3272_iffalse := VAR_dei_param_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l491_c7_e023_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l500_c3_03b7_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l491_c7_e023_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l500_c3_03b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_e023_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c3_03b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l491_c7_e023_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l500_c3_03b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_e023_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_e023_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c3_03b7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l491_c7_e023_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l500_c3_03b7_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l476_c2_3272_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l491_c7_e023] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l491_c7_e023_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l491_c7_e023_cond;
     result_stack_value_MUX_uxn_opcodes_h_l491_c7_e023_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l491_c7_e023_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l491_c7_e023_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l491_c7_e023_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l491_c7_e023_return_output := result_stack_value_MUX_uxn_opcodes_h_l491_c7_e023_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l491_c7_e023] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l491_c7_e023_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l491_c7_e023_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l491_c7_e023_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l491_c7_e023_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l491_c7_e023_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l491_c7_e023_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l491_c7_e023_return_output := current_dei_phase_MUX_uxn_opcodes_h_l491_c7_e023_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l500_c1_9bd3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_9bd3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_9bd3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_9bd3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_9bd3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_9bd3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_9bd3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_9bd3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_9bd3_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l491_c7_e023] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l491_c7_e023_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l491_c7_e023_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l491_c7_e023_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l491_c7_e023_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l491_c7_e023_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l491_c7_e023_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l491_c7_e023_return_output := has_written_to_t_MUX_uxn_opcodes_h_l491_c7_e023_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l491_c7_e023] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l491_c7_e023_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l491_c7_e023_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l491_c7_e023_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l491_c7_e023_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l491_c7_e023_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l491_c7_e023_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l491_c7_e023_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l491_c7_e023_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l488_c7_4ea7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c7_4ea7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c7_4ea7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l491_c7_e023] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_e023_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_e023_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_e023_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_e023_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_e023_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_e023_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_e023_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_e023_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l476_c2_3272] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l476_c2_3272_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l476_c2_3272_cond;
     dei_param_MUX_uxn_opcodes_h_l476_c2_3272_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l476_c2_3272_iftrue;
     dei_param_MUX_uxn_opcodes_h_l476_c2_3272_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l476_c2_3272_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l476_c2_3272_return_output := dei_param_MUX_uxn_opcodes_h_l476_c2_3272_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l491_c7_e023] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l491_c7_e023_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l491_c7_e023_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l491_c7_e023_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l491_c7_e023_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l491_c7_e023_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l491_c7_e023_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l491_c7_e023_return_output := has_written_to_n_MUX_uxn_opcodes_h_l491_c7_e023_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l491_c7_e023] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_e023_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_e023_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_e023_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_e023_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_e023_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_e023_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_e023_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_e023_return_output;

     -- Submodule level 5
     VAR_device_in_uxn_opcodes_h_l501_c23_c417_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c1_9bd3_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l491_c7_e023_return_output;
     REG_VAR_dei_param := VAR_dei_param_MUX_uxn_opcodes_h_l476_c2_3272_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l491_c7_e023_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l491_c7_e023_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_e023_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l491_c7_e023_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l476_c2_3272_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_e023_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l491_c7_e023_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l488_c7_4ea7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c7_4ea7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c7_4ea7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output;

     -- device_in[uxn_opcodes_h_l501_c23_c417] LATENCY=0
     -- Clock enable
     device_in_uxn_opcodes_h_l501_c23_c417_CLOCK_ENABLE <= VAR_device_in_uxn_opcodes_h_l501_c23_c417_CLOCK_ENABLE;
     -- Inputs
     device_in_uxn_opcodes_h_l501_c23_c417_device_address <= VAR_device_in_uxn_opcodes_h_l501_c23_c417_device_address;
     device_in_uxn_opcodes_h_l501_c23_c417_phase <= VAR_device_in_uxn_opcodes_h_l501_c23_c417_phase;
     device_in_uxn_opcodes_h_l501_c23_c417_previous_device_ram_read <= VAR_device_in_uxn_opcodes_h_l501_c23_c417_previous_device_ram_read;
     -- Outputs
     VAR_device_in_uxn_opcodes_h_l501_c23_c417_return_output := device_in_uxn_opcodes_h_l501_c23_c417_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l476_c2_3272] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l476_c2_3272_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l476_c2_3272_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l476_c2_3272_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l476_c2_3272_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l476_c2_3272_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l476_c2_3272_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l476_c2_3272_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l476_c2_3272_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l488_c7_4ea7] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l488_c7_4ea7_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c7_4ea7_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output := has_written_to_n_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l488_c7_4ea7] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l488_c7_4ea7_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c7_4ea7_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output := current_dei_phase_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l488_c7_4ea7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_4ea7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_4ea7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l488_c7_4ea7] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l488_c7_4ea7_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c7_4ea7_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output := has_written_to_t_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l488_c7_4ea7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l488_c7_4ea7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l488_c7_4ea7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output := result_stack_value_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l488_c7_4ea7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l488_c7_4ea7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c7_4ea7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output;

     -- Submodule level 6
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l476_c2_3272_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue := VAR_device_in_uxn_opcodes_h_l501_c23_c417_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c2_3272_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l476_c2_3272_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c2_3272_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c2_3272_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c2_3272_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l476_c2_3272_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l476_c2_3272] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l476_c2_3272_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l476_c2_3272_cond;
     result_stack_value_MUX_uxn_opcodes_h_l476_c2_3272_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l476_c2_3272_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l476_c2_3272_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l476_c2_3272_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l476_c2_3272_return_output := result_stack_value_MUX_uxn_opcodes_h_l476_c2_3272_return_output;

     -- CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d[uxn_opcodes_h_l503_c32_e183] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l503_c32_e183_return_output := VAR_device_in_uxn_opcodes_h_l501_c23_c417_return_output.device_ram_address;

     -- has_written_to_n_MUX[uxn_opcodes_h_l476_c2_3272] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l476_c2_3272_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c2_3272_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l476_c2_3272_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c2_3272_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l476_c2_3272_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c2_3272_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c2_3272_return_output := has_written_to_n_MUX_uxn_opcodes_h_l476_c2_3272_return_output;

     -- CONST_REF_RD_uint1_t_device_in_result_t_is_device_ram_read_d41d[uxn_opcodes_h_l502_c32_d114] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l502_c32_d114_return_output := VAR_device_in_uxn_opcodes_h_l501_c23_c417_return_output.is_device_ram_read;

     -- current_dei_phase_MUX[uxn_opcodes_h_l476_c2_3272] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l476_c2_3272_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l476_c2_3272_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l476_c2_3272_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l476_c2_3272_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l476_c2_3272_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l476_c2_3272_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l476_c2_3272_return_output := current_dei_phase_MUX_uxn_opcodes_h_l476_c2_3272_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l476_c2_3272] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c2_3272_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c2_3272_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c2_3272_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c2_3272_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c2_3272_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c2_3272_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c2_3272_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c2_3272_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l500_c3_03b7] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l500_c3_03b7_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l500_c3_03b7_cond;
     device_in_result_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l500_c3_03b7_return_output := device_in_result_MUX_uxn_opcodes_h_l500_c3_03b7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l476_c2_3272] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l476_c2_3272_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c2_3272_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l476_c2_3272_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c2_3272_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l476_c2_3272_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c2_3272_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c2_3272_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l476_c2_3272_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l476_c2_3272] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l476_c2_3272_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c2_3272_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l476_c2_3272_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c2_3272_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l476_c2_3272_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c2_3272_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c2_3272_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l476_c2_3272_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l476_c2_3272] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l476_c2_3272_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l476_c2_3272_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l476_c2_3272_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l476_c2_3272_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l476_c2_3272_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l476_c2_3272_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l476_c2_3272_return_output := has_written_to_t_MUX_uxn_opcodes_h_l476_c2_3272_return_output;

     -- CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l506_l508_DUPLICATE_7c28 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l506_l508_DUPLICATE_7c28_return_output := VAR_device_in_uxn_opcodes_h_l501_c23_c417_return_output.is_dei_done;

     -- Submodule level 7
     VAR_BIN_OP_AND_uxn_opcodes_h_l506_c9_d4ab_right := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l506_l508_DUPLICATE_7c28_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l508_c11_c6cf_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l506_l508_DUPLICATE_7c28_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l502_c32_d114_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l503_c32_e183_return_output;
     REG_VAR_current_dei_phase := VAR_current_dei_phase_MUX_uxn_opcodes_h_l476_c2_3272_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l491_c7_e023_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l500_c3_03b7_return_output;
     REG_VAR_has_written_to_n := VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c2_3272_return_output;
     REG_VAR_has_written_to_t := VAR_has_written_to_t_MUX_uxn_opcodes_h_l476_c2_3272_return_output;
     -- device_in_result_MUX[uxn_opcodes_h_l491_c7_e023] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l491_c7_e023_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l491_c7_e023_cond;
     device_in_result_MUX_uxn_opcodes_h_l491_c7_e023_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l491_c7_e023_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l491_c7_e023_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l491_c7_e023_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l491_c7_e023_return_output := device_in_result_MUX_uxn_opcodes_h_l491_c7_e023_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l508_c11_c6cf] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l508_c11_c6cf_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l508_c11_c6cf_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l508_c11_c6cf_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l508_c11_c6cf_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l508_c11_c6cf_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l508_c11_c6cf_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l508_c11_c6cf_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l508_c11_c6cf_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l506_c9_d4ab] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l506_c9_d4ab_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l506_c9_d4ab_left;
     BIN_OP_AND_uxn_opcodes_h_l506_c9_d4ab_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l506_c9_d4ab_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l506_c9_d4ab_return_output := BIN_OP_AND_uxn_opcodes_h_l506_c9_d4ab_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l500_c3_03b7] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l500_c3_03b7_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c3_03b7_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c3_03b7_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l500_c3_03b7_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l500_c3_03b7] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c3_03b7_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c3_03b7_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c3_03b7_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c3_03b7_return_output;

     -- Submodule level 8
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb_cond := VAR_BIN_OP_AND_uxn_opcodes_h_l506_c9_d4ab_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb_cond := VAR_BIN_OP_AND_uxn_opcodes_h_l506_c9_d4ab_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l491_c7_e023_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l508_c11_c6cf_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_e023_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c3_03b7_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_e023_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c3_03b7_return_output;
     -- is_second_dei_done_MUX[uxn_opcodes_h_l506_c4_35eb] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l491_c7_e023] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_e023_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_e023_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_e023_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_e023_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_e023_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_e023_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_e023_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_e023_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l491_c7_e023] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_e023_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_e023_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_e023_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_e023_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_e023_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_e023_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_e023_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_e023_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l488_c7_4ea7] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l488_c7_4ea7_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l488_c7_4ea7_cond;
     device_in_result_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output := device_in_result_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l506_c4_35eb] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb_return_output;

     -- Submodule level 9
     VAR_device_in_result_MUX_uxn_opcodes_h_l476_c2_3272_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l506_c4_35eb_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_e023_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_e023_return_output;
     -- is_first_dei_done_MUX[uxn_opcodes_h_l500_c3_03b7] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l476_c2_3272] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l476_c2_3272_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l476_c2_3272_cond;
     device_in_result_MUX_uxn_opcodes_h_l476_c2_3272_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l476_c2_3272_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l476_c2_3272_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l476_c2_3272_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l476_c2_3272_return_output := device_in_result_MUX_uxn_opcodes_h_l476_c2_3272_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l488_c7_4ea7] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_4ea7_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_4ea7_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l500_c3_03b7] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l488_c7_4ea7] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_4ea7_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_4ea7_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output;

     -- Submodule level 10
     REG_VAR_device_in_result := VAR_device_in_result_MUX_uxn_opcodes_h_l476_c2_3272_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l491_c7_e023_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l491_c7_e023_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l500_c3_03b7_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l476_c2_3272_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l476_c2_3272_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output;
     -- is_first_dei_done_MUX[uxn_opcodes_h_l491_c7_e023] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l491_c7_e023_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l491_c7_e023_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l491_c7_e023_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l491_c7_e023_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l491_c7_e023_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l491_c7_e023_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l491_c7_e023_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l491_c7_e023_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l476_c2_3272] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l476_c2_3272_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l476_c2_3272_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l476_c2_3272_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l476_c2_3272_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l476_c2_3272_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l476_c2_3272_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l476_c2_3272_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l476_c2_3272_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l476_c2_3272] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l476_c2_3272_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l476_c2_3272_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l476_c2_3272_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l476_c2_3272_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l476_c2_3272_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l476_c2_3272_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l476_c2_3272_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l476_c2_3272_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l491_c7_e023] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l491_c7_e023_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l491_c7_e023_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l491_c7_e023_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l491_c7_e023_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l491_c7_e023_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l491_c7_e023_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l491_c7_e023_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l491_c7_e023_return_output;

     -- Submodule level 11
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l491_c7_e023_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l491_c7_e023_return_output;
     -- is_second_dei_done_MUX[uxn_opcodes_h_l488_c7_4ea7] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l488_c7_4ea7] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output;

     -- CONST_REF_RD_opcode_result_t_opcode_result_t_7bb2_uxn_opcodes_h_l470_l531_DUPLICATE_32b4 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7bb2_uxn_opcodes_h_l470_l531_DUPLICATE_32b4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_7bb2(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l476_c2_3272_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l476_c2_3272_return_output,
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l476_c2_3272_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l476_c2_3272_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l476_c2_3272_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l476_c2_3272_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c2_3272_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c2_3272_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c2_3272_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7bb2_uxn_opcodes_h_l470_l531_DUPLICATE_32b4_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7bb2_uxn_opcodes_h_l470_l531_DUPLICATE_32b4_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l476_c2_3272_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l476_c2_3272_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c7_4ea7_return_output;
     -- is_first_dei_done_MUX[uxn_opcodes_h_l476_c2_3272] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l476_c2_3272_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l476_c2_3272_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l476_c2_3272_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l476_c2_3272_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l476_c2_3272_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l476_c2_3272_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l476_c2_3272_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l476_c2_3272_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l476_c2_3272] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l476_c2_3272_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l476_c2_3272_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l476_c2_3272_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l476_c2_3272_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l476_c2_3272_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l476_c2_3272_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l476_c2_3272_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l476_c2_3272_return_output;

     -- Submodule level 13
     REG_VAR_is_first_dei_done := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l476_c2_3272_return_output;
     REG_VAR_is_second_dei_done := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l476_c2_3272_return_output;
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
