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
entity dei2_0CLK_22d8dfe9 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(15 downto 0);
 return_output : out opcode_result_t);
end dei2_0CLK_22d8dfe9;
architecture arch of dei2_0CLK_22d8dfe9 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l423_c6_ea3b]
signal BIN_OP_EQ_uxn_opcodes_h_l423_c6_ea3b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l423_c6_ea3b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l423_c6_ea3b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l438_c7_2e4e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_2e4e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l423_c2_abeb]
signal device_in_result_MUX_uxn_opcodes_h_l423_c2_abeb_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l423_c2_abeb_return_output : device_in_result_t;

-- dei_param_MUX[uxn_opcodes_h_l423_c2_abeb]
signal dei_param_MUX_uxn_opcodes_h_l423_c2_abeb_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l423_c2_abeb_return_output : unsigned(7 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l423_c2_abeb]
signal is_second_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l423_c2_abeb]
signal is_first_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l423_c2_abeb]
signal has_written_to_t_MUX_uxn_opcodes_h_l423_c2_abeb_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l423_c2_abeb_return_output : unsigned(0 downto 0);

-- result_is_device_ram_16bit_MUX[uxn_opcodes_h_l423_c2_abeb]
signal result_is_device_ram_16bit_MUX_uxn_opcodes_h_l423_c2_abeb_cond : unsigned(0 downto 0);
signal result_is_device_ram_16bit_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_16bit_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_16bit_MUX_uxn_opcodes_h_l423_c2_abeb_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l423_c2_abeb]
signal result_device_ram_address_MUX_uxn_opcodes_h_l423_c2_abeb_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l423_c2_abeb_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l423_c2_abeb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l423_c2_abeb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l423_c2_abeb_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l423_c2_abeb]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c2_abeb_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c2_abeb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l423_c2_abeb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l423_c2_abeb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l423_c2_abeb_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l423_c2_abeb]
signal result_u8_value_MUX_uxn_opcodes_h_l423_c2_abeb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l423_c2_abeb_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l423_c2_abeb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c2_abeb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c2_abeb_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l423_c2_abeb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l423_c2_abeb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l423_c2_abeb_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l423_c2_abeb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l423_c2_abeb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l423_c2_abeb_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l423_c2_abeb]
signal current_dei_phase_MUX_uxn_opcodes_h_l423_c2_abeb_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l423_c2_abeb_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l423_c2_abeb]
signal t8_MUX_uxn_opcodes_h_l423_c2_abeb_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l423_c2_abeb_return_output : unsigned(7 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l423_c2_abeb]
signal has_written_to_n_MUX_uxn_opcodes_h_l423_c2_abeb_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l423_c2_abeb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l438_c11_ddd5]
signal BIN_OP_EQ_uxn_opcodes_h_l438_c11_ddd5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l438_c11_ddd5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l438_c11_ddd5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l442_c1_4192]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_4192_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_4192_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_4192_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_4192_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l438_c7_2e4e]
signal device_in_result_MUX_uxn_opcodes_h_l438_c7_2e4e_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output : device_in_result_t;

-- dei_param_MUX[uxn_opcodes_h_l438_c7_2e4e]
signal dei_param_MUX_uxn_opcodes_h_l438_c7_2e4e_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output : unsigned(7 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l438_c7_2e4e]
signal is_second_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l438_c7_2e4e]
signal is_first_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l438_c7_2e4e]
signal has_written_to_t_MUX_uxn_opcodes_h_l438_c7_2e4e_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l438_c7_2e4e]
signal result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_2e4e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l438_c7_2e4e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2e4e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l438_c7_2e4e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_2e4e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l438_c7_2e4e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2e4e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l438_c7_2e4e]
signal result_u8_value_MUX_uxn_opcodes_h_l438_c7_2e4e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l438_c7_2e4e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_2e4e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l438_c7_2e4e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2e4e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l438_c7_2e4e]
signal current_dei_phase_MUX_uxn_opcodes_h_l438_c7_2e4e_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l438_c7_2e4e]
signal t8_MUX_uxn_opcodes_h_l438_c7_2e4e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output : unsigned(7 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l438_c7_2e4e]
signal has_written_to_n_MUX_uxn_opcodes_h_l438_c7_2e4e_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l440_c30_d33d]
signal sp_relative_shift_uxn_opcodes_h_l440_c30_d33d_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l440_c30_d33d_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l440_c30_d33d_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l440_c30_d33d_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l444_c9_8b88]
signal BIN_OP_EQ_uxn_opcodes_h_l444_c9_8b88_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l444_c9_8b88_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l444_c9_8b88_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l444_c9_3e8c]
signal MUX_uxn_opcodes_h_l444_c9_3e8c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l444_c9_3e8c_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l444_c9_3e8c_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l444_c9_3e8c_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l445_c35_6cad]
signal BIN_OP_PLUS_uxn_opcodes_h_l445_c35_6cad_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l445_c35_6cad_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l445_c35_6cad_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l445_c15_9288]
signal MUX_uxn_opcodes_h_l445_c15_9288_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l445_c15_9288_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l445_c15_9288_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l445_c15_9288_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l446_c49_e6ff]
signal UNARY_OP_NOT_uxn_opcodes_h_l446_c49_e6ff_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l446_c49_e6ff_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l446_c29_b236]
signal BIN_OP_AND_uxn_opcodes_h_l446_c29_b236_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l446_c29_b236_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l446_c29_b236_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l446_c8_ba24]
signal BIN_OP_OR_uxn_opcodes_h_l446_c8_ba24_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l446_c8_ba24_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l446_c8_ba24_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l446_c1_54f5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l446_c1_54f5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l446_c1_54f5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l446_c1_54f5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l446_c1_54f5_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l446_c3_d699]
signal device_in_result_MUX_uxn_opcodes_h_l446_c3_d699_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l446_c3_d699_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l446_c3_d699_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l446_c3_d699_return_output : device_in_result_t;

-- is_second_dei_done_MUX[uxn_opcodes_h_l446_c3_d699]
signal is_second_dei_done_MUX_uxn_opcodes_h_l446_c3_d699_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l446_c3_d699_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l446_c3_d699_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l446_c3_d699_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l446_c3_d699]
signal is_first_dei_done_MUX_uxn_opcodes_h_l446_c3_d699_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l446_c3_d699_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l446_c3_d699_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l446_c3_d699_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l446_c3_d699]
signal has_written_to_t_MUX_uxn_opcodes_h_l446_c3_d699_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l446_c3_d699_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l446_c3_d699_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l446_c3_d699_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l446_c3_d699]
signal result_device_ram_address_MUX_uxn_opcodes_h_l446_c3_d699_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l446_c3_d699_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l446_c3_d699_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l446_c3_d699_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l446_c3_d699]
signal result_is_opc_done_MUX_uxn_opcodes_h_l446_c3_d699_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l446_c3_d699_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l446_c3_d699_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l446_c3_d699_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l446_c3_d699]
signal result_u8_value_MUX_uxn_opcodes_h_l446_c3_d699_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l446_c3_d699_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l446_c3_d699_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l446_c3_d699_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l446_c3_d699]
signal result_is_stack_write_MUX_uxn_opcodes_h_l446_c3_d699_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l446_c3_d699_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l446_c3_d699_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l446_c3_d699_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l446_c3_d699]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c3_d699_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c3_d699_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c3_d699_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c3_d699_return_output : unsigned(3 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l446_c3_d699]
signal current_dei_phase_MUX_uxn_opcodes_h_l446_c3_d699_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l446_c3_d699_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l446_c3_d699_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l446_c3_d699_return_output : unsigned(7 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l446_c3_d699]
signal has_written_to_n_MUX_uxn_opcodes_h_l446_c3_d699_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l446_c3_d699_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l446_c3_d699_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l446_c3_d699_return_output : unsigned(0 downto 0);

-- device_in[uxn_opcodes_h_l447_c23_1d48]
signal device_in_uxn_opcodes_h_l447_c23_1d48_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_in_uxn_opcodes_h_l447_c23_1d48_device_address : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l447_c23_1d48_phase : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l447_c23_1d48_previous_device_ram_read : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l447_c23_1d48_return_output : device_in_result_t;

-- BIN_OP_PLUS[uxn_opcodes_h_l450_c4_24df]
signal BIN_OP_PLUS_uxn_opcodes_h_l450_c4_24df_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l450_c4_24df_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l450_c4_24df_return_output : unsigned(8 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l451_c9_969c]
signal BIN_OP_AND_uxn_opcodes_h_l451_c9_969c_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l451_c9_969c_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l451_c9_969c_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l451_c4_7be3]
signal is_second_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l451_c4_7be3]
signal is_first_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l453_c11_12d0]
signal is_second_dei_done_MUX_uxn_opcodes_h_l453_c11_12d0_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l453_c11_12d0_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l453_c11_12d0_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l453_c11_12d0_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l457_c13_cbc5]
signal UNARY_OP_NOT_uxn_opcodes_h_l457_c13_cbc5_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l457_c13_cbc5_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l457_c8_2aea]
signal has_written_to_t_MUX_uxn_opcodes_h_l457_c8_2aea_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l457_c8_2aea_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l457_c8_2aea_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l457_c8_2aea_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l457_c8_2aea]
signal result_is_opc_done_MUX_uxn_opcodes_h_l457_c8_2aea_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l457_c8_2aea_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l457_c8_2aea_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l457_c8_2aea_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l457_c8_2aea]
signal result_u8_value_MUX_uxn_opcodes_h_l457_c8_2aea_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l457_c8_2aea_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l457_c8_2aea_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l457_c8_2aea_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l457_c8_2aea]
signal result_is_stack_write_MUX_uxn_opcodes_h_l457_c8_2aea_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l457_c8_2aea_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l457_c8_2aea_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l457_c8_2aea_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l457_c8_2aea]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c8_2aea_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c8_2aea_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c8_2aea_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c8_2aea_return_output : unsigned(3 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l457_c8_2aea]
signal current_dei_phase_MUX_uxn_opcodes_h_l457_c8_2aea_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l457_c8_2aea_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l457_c8_2aea_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l457_c8_2aea_return_output : unsigned(7 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l457_c8_2aea]
signal has_written_to_n_MUX_uxn_opcodes_h_l457_c8_2aea_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l457_c8_2aea_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l457_c8_2aea_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l457_c8_2aea_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l464_c13_da4d]
signal UNARY_OP_NOT_uxn_opcodes_h_l464_c13_da4d_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l464_c13_da4d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l464_c8_179b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l464_c8_179b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l464_c8_179b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l464_c8_179b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l464_c8_179b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l464_c8_179b]
signal result_u8_value_MUX_uxn_opcodes_h_l464_c8_179b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l464_c8_179b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l464_c8_179b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l464_c8_179b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l464_c8_179b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l464_c8_179b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l464_c8_179b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l464_c8_179b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l464_c8_179b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l464_c8_179b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c8_179b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c8_179b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c8_179b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c8_179b_return_output : unsigned(3 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l464_c8_179b]
signal has_written_to_n_MUX_uxn_opcodes_h_l464_c8_179b_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l464_c8_179b_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l464_c8_179b_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l464_c8_179b_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l446_l451_DUPLICATE_5540
signal UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l446_l451_DUPLICATE_5540_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l446_l451_DUPLICATE_5540_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_8a80( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_device_ram_16bit := ref_toks_1;
      base.device_ram_address := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_device_ram_write := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.u8_value := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_sp_shift := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l423_c6_ea3b
BIN_OP_EQ_uxn_opcodes_h_l423_c6_ea3b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l423_c6_ea3b_left,
BIN_OP_EQ_uxn_opcodes_h_l423_c6_ea3b_right,
BIN_OP_EQ_uxn_opcodes_h_l423_c6_ea3b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_2e4e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_2e4e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_2e4e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l423_c2_abeb
device_in_result_MUX_uxn_opcodes_h_l423_c2_abeb : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l423_c2_abeb_cond,
device_in_result_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue,
device_in_result_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse,
device_in_result_MUX_uxn_opcodes_h_l423_c2_abeb_return_output);

-- dei_param_MUX_uxn_opcodes_h_l423_c2_abeb
dei_param_MUX_uxn_opcodes_h_l423_c2_abeb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l423_c2_abeb_cond,
dei_param_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue,
dei_param_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse,
dei_param_MUX_uxn_opcodes_h_l423_c2_abeb_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb
is_second_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb
is_first_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l423_c2_abeb
has_written_to_t_MUX_uxn_opcodes_h_l423_c2_abeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l423_c2_abeb_cond,
has_written_to_t_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l423_c2_abeb_return_output);

-- result_is_device_ram_16bit_MUX_uxn_opcodes_h_l423_c2_abeb
result_is_device_ram_16bit_MUX_uxn_opcodes_h_l423_c2_abeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_16bit_MUX_uxn_opcodes_h_l423_c2_abeb_cond,
result_is_device_ram_16bit_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue,
result_is_device_ram_16bit_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse,
result_is_device_ram_16bit_MUX_uxn_opcodes_h_l423_c2_abeb_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l423_c2_abeb
result_device_ram_address_MUX_uxn_opcodes_h_l423_c2_abeb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l423_c2_abeb_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l423_c2_abeb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l423_c2_abeb
result_is_opc_done_MUX_uxn_opcodes_h_l423_c2_abeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l423_c2_abeb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l423_c2_abeb_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c2_abeb
result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c2_abeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c2_abeb_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c2_abeb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l423_c2_abeb
result_is_stack_write_MUX_uxn_opcodes_h_l423_c2_abeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l423_c2_abeb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l423_c2_abeb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l423_c2_abeb
result_u8_value_MUX_uxn_opcodes_h_l423_c2_abeb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l423_c2_abeb_cond,
result_u8_value_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l423_c2_abeb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c2_abeb
result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c2_abeb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c2_abeb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c2_abeb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l423_c2_abeb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l423_c2_abeb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l423_c2_abeb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l423_c2_abeb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l423_c2_abeb
result_is_sp_shift_MUX_uxn_opcodes_h_l423_c2_abeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l423_c2_abeb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l423_c2_abeb_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l423_c2_abeb
current_dei_phase_MUX_uxn_opcodes_h_l423_c2_abeb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l423_c2_abeb_cond,
current_dei_phase_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l423_c2_abeb_return_output);

-- t8_MUX_uxn_opcodes_h_l423_c2_abeb
t8_MUX_uxn_opcodes_h_l423_c2_abeb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l423_c2_abeb_cond,
t8_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue,
t8_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse,
t8_MUX_uxn_opcodes_h_l423_c2_abeb_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l423_c2_abeb
has_written_to_n_MUX_uxn_opcodes_h_l423_c2_abeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l423_c2_abeb_cond,
has_written_to_n_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l423_c2_abeb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l438_c11_ddd5
BIN_OP_EQ_uxn_opcodes_h_l438_c11_ddd5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l438_c11_ddd5_left,
BIN_OP_EQ_uxn_opcodes_h_l438_c11_ddd5_right,
BIN_OP_EQ_uxn_opcodes_h_l438_c11_ddd5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_4192
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_4192 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_4192_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_4192_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_4192_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_4192_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l438_c7_2e4e
device_in_result_MUX_uxn_opcodes_h_l438_c7_2e4e : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l438_c7_2e4e_cond,
device_in_result_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue,
device_in_result_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse,
device_in_result_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output);

-- dei_param_MUX_uxn_opcodes_h_l438_c7_2e4e
dei_param_MUX_uxn_opcodes_h_l438_c7_2e4e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l438_c7_2e4e_cond,
dei_param_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue,
dei_param_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse,
dei_param_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e
is_second_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e
is_first_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l438_c7_2e4e
has_written_to_t_MUX_uxn_opcodes_h_l438_c7_2e4e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l438_c7_2e4e_cond,
has_written_to_t_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_2e4e
result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_2e4e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_2e4e_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2e4e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2e4e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2e4e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_2e4e
result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_2e4e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_2e4e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2e4e
result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2e4e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2e4e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l438_c7_2e4e
result_u8_value_MUX_uxn_opcodes_h_l438_c7_2e4e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l438_c7_2e4e_cond,
result_u8_value_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_2e4e
result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_2e4e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_2e4e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2e4e
result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2e4e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2e4e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l438_c7_2e4e
current_dei_phase_MUX_uxn_opcodes_h_l438_c7_2e4e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l438_c7_2e4e_cond,
current_dei_phase_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output);

-- t8_MUX_uxn_opcodes_h_l438_c7_2e4e
t8_MUX_uxn_opcodes_h_l438_c7_2e4e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l438_c7_2e4e_cond,
t8_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue,
t8_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse,
t8_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l438_c7_2e4e
has_written_to_n_MUX_uxn_opcodes_h_l438_c7_2e4e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l438_c7_2e4e_cond,
has_written_to_n_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output);

-- sp_relative_shift_uxn_opcodes_h_l440_c30_d33d
sp_relative_shift_uxn_opcodes_h_l440_c30_d33d : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l440_c30_d33d_ins,
sp_relative_shift_uxn_opcodes_h_l440_c30_d33d_x,
sp_relative_shift_uxn_opcodes_h_l440_c30_d33d_y,
sp_relative_shift_uxn_opcodes_h_l440_c30_d33d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l444_c9_8b88
BIN_OP_EQ_uxn_opcodes_h_l444_c9_8b88 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l444_c9_8b88_left,
BIN_OP_EQ_uxn_opcodes_h_l444_c9_8b88_right,
BIN_OP_EQ_uxn_opcodes_h_l444_c9_8b88_return_output);

-- MUX_uxn_opcodes_h_l444_c9_3e8c
MUX_uxn_opcodes_h_l444_c9_3e8c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l444_c9_3e8c_cond,
MUX_uxn_opcodes_h_l444_c9_3e8c_iftrue,
MUX_uxn_opcodes_h_l444_c9_3e8c_iffalse,
MUX_uxn_opcodes_h_l444_c9_3e8c_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l445_c35_6cad
BIN_OP_PLUS_uxn_opcodes_h_l445_c35_6cad : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l445_c35_6cad_left,
BIN_OP_PLUS_uxn_opcodes_h_l445_c35_6cad_right,
BIN_OP_PLUS_uxn_opcodes_h_l445_c35_6cad_return_output);

-- MUX_uxn_opcodes_h_l445_c15_9288
MUX_uxn_opcodes_h_l445_c15_9288 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l445_c15_9288_cond,
MUX_uxn_opcodes_h_l445_c15_9288_iftrue,
MUX_uxn_opcodes_h_l445_c15_9288_iffalse,
MUX_uxn_opcodes_h_l445_c15_9288_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l446_c49_e6ff
UNARY_OP_NOT_uxn_opcodes_h_l446_c49_e6ff : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l446_c49_e6ff_expr,
UNARY_OP_NOT_uxn_opcodes_h_l446_c49_e6ff_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l446_c29_b236
BIN_OP_AND_uxn_opcodes_h_l446_c29_b236 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l446_c29_b236_left,
BIN_OP_AND_uxn_opcodes_h_l446_c29_b236_right,
BIN_OP_AND_uxn_opcodes_h_l446_c29_b236_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l446_c8_ba24
BIN_OP_OR_uxn_opcodes_h_l446_c8_ba24 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l446_c8_ba24_left,
BIN_OP_OR_uxn_opcodes_h_l446_c8_ba24_right,
BIN_OP_OR_uxn_opcodes_h_l446_c8_ba24_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l446_c1_54f5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l446_c1_54f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l446_c1_54f5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l446_c1_54f5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l446_c1_54f5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l446_c1_54f5_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l446_c3_d699
device_in_result_MUX_uxn_opcodes_h_l446_c3_d699 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l446_c3_d699_cond,
device_in_result_MUX_uxn_opcodes_h_l446_c3_d699_iftrue,
device_in_result_MUX_uxn_opcodes_h_l446_c3_d699_iffalse,
device_in_result_MUX_uxn_opcodes_h_l446_c3_d699_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l446_c3_d699
is_second_dei_done_MUX_uxn_opcodes_h_l446_c3_d699 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l446_c3_d699_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l446_c3_d699_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l446_c3_d699_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l446_c3_d699_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l446_c3_d699
is_first_dei_done_MUX_uxn_opcodes_h_l446_c3_d699 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l446_c3_d699_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l446_c3_d699_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l446_c3_d699_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l446_c3_d699_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l446_c3_d699
has_written_to_t_MUX_uxn_opcodes_h_l446_c3_d699 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l446_c3_d699_cond,
has_written_to_t_MUX_uxn_opcodes_h_l446_c3_d699_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l446_c3_d699_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l446_c3_d699_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l446_c3_d699
result_device_ram_address_MUX_uxn_opcodes_h_l446_c3_d699 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l446_c3_d699_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l446_c3_d699_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l446_c3_d699_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l446_c3_d699_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l446_c3_d699
result_is_opc_done_MUX_uxn_opcodes_h_l446_c3_d699 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l446_c3_d699_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l446_c3_d699_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l446_c3_d699_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l446_c3_d699_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l446_c3_d699
result_u8_value_MUX_uxn_opcodes_h_l446_c3_d699 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l446_c3_d699_cond,
result_u8_value_MUX_uxn_opcodes_h_l446_c3_d699_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l446_c3_d699_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l446_c3_d699_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l446_c3_d699
result_is_stack_write_MUX_uxn_opcodes_h_l446_c3_d699 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l446_c3_d699_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l446_c3_d699_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l446_c3_d699_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l446_c3_d699_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c3_d699
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c3_d699 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c3_d699_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c3_d699_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c3_d699_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c3_d699_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l446_c3_d699
current_dei_phase_MUX_uxn_opcodes_h_l446_c3_d699 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l446_c3_d699_cond,
current_dei_phase_MUX_uxn_opcodes_h_l446_c3_d699_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l446_c3_d699_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l446_c3_d699_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l446_c3_d699
has_written_to_n_MUX_uxn_opcodes_h_l446_c3_d699 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l446_c3_d699_cond,
has_written_to_n_MUX_uxn_opcodes_h_l446_c3_d699_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l446_c3_d699_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l446_c3_d699_return_output);

-- device_in_uxn_opcodes_h_l447_c23_1d48
device_in_uxn_opcodes_h_l447_c23_1d48 : entity work.device_in_0CLK_85463cfa port map (
clk,
device_in_uxn_opcodes_h_l447_c23_1d48_CLOCK_ENABLE,
device_in_uxn_opcodes_h_l447_c23_1d48_device_address,
device_in_uxn_opcodes_h_l447_c23_1d48_phase,
device_in_uxn_opcodes_h_l447_c23_1d48_previous_device_ram_read,
device_in_uxn_opcodes_h_l447_c23_1d48_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l450_c4_24df
BIN_OP_PLUS_uxn_opcodes_h_l450_c4_24df : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l450_c4_24df_left,
BIN_OP_PLUS_uxn_opcodes_h_l450_c4_24df_right,
BIN_OP_PLUS_uxn_opcodes_h_l450_c4_24df_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l451_c9_969c
BIN_OP_AND_uxn_opcodes_h_l451_c9_969c : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l451_c9_969c_left,
BIN_OP_AND_uxn_opcodes_h_l451_c9_969c_right,
BIN_OP_AND_uxn_opcodes_h_l451_c9_969c_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3
is_second_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3
is_first_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l453_c11_12d0
is_second_dei_done_MUX_uxn_opcodes_h_l453_c11_12d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l453_c11_12d0_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l453_c11_12d0_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l453_c11_12d0_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l453_c11_12d0_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l457_c13_cbc5
UNARY_OP_NOT_uxn_opcodes_h_l457_c13_cbc5 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l457_c13_cbc5_expr,
UNARY_OP_NOT_uxn_opcodes_h_l457_c13_cbc5_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l457_c8_2aea
has_written_to_t_MUX_uxn_opcodes_h_l457_c8_2aea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l457_c8_2aea_cond,
has_written_to_t_MUX_uxn_opcodes_h_l457_c8_2aea_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l457_c8_2aea_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l457_c8_2aea_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l457_c8_2aea
result_is_opc_done_MUX_uxn_opcodes_h_l457_c8_2aea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l457_c8_2aea_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l457_c8_2aea_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l457_c8_2aea_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l457_c8_2aea_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l457_c8_2aea
result_u8_value_MUX_uxn_opcodes_h_l457_c8_2aea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l457_c8_2aea_cond,
result_u8_value_MUX_uxn_opcodes_h_l457_c8_2aea_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l457_c8_2aea_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l457_c8_2aea_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l457_c8_2aea
result_is_stack_write_MUX_uxn_opcodes_h_l457_c8_2aea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l457_c8_2aea_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l457_c8_2aea_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l457_c8_2aea_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l457_c8_2aea_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c8_2aea
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c8_2aea : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c8_2aea_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c8_2aea_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c8_2aea_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c8_2aea_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l457_c8_2aea
current_dei_phase_MUX_uxn_opcodes_h_l457_c8_2aea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l457_c8_2aea_cond,
current_dei_phase_MUX_uxn_opcodes_h_l457_c8_2aea_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l457_c8_2aea_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l457_c8_2aea_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l457_c8_2aea
has_written_to_n_MUX_uxn_opcodes_h_l457_c8_2aea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l457_c8_2aea_cond,
has_written_to_n_MUX_uxn_opcodes_h_l457_c8_2aea_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l457_c8_2aea_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l457_c8_2aea_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l464_c13_da4d
UNARY_OP_NOT_uxn_opcodes_h_l464_c13_da4d : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l464_c13_da4d_expr,
UNARY_OP_NOT_uxn_opcodes_h_l464_c13_da4d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l464_c8_179b
result_is_opc_done_MUX_uxn_opcodes_h_l464_c8_179b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l464_c8_179b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l464_c8_179b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l464_c8_179b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l464_c8_179b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l464_c8_179b
result_u8_value_MUX_uxn_opcodes_h_l464_c8_179b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l464_c8_179b_cond,
result_u8_value_MUX_uxn_opcodes_h_l464_c8_179b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l464_c8_179b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l464_c8_179b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l464_c8_179b
result_is_stack_write_MUX_uxn_opcodes_h_l464_c8_179b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l464_c8_179b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l464_c8_179b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l464_c8_179b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l464_c8_179b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c8_179b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c8_179b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c8_179b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c8_179b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c8_179b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c8_179b_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l464_c8_179b
has_written_to_n_MUX_uxn_opcodes_h_l464_c8_179b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l464_c8_179b_cond,
has_written_to_n_MUX_uxn_opcodes_h_l464_c8_179b_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l464_c8_179b_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l464_c8_179b_return_output);

-- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l446_l451_DUPLICATE_5540
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l446_l451_DUPLICATE_5540 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l446_l451_DUPLICATE_5540_expr,
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l446_l451_DUPLICATE_5540_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l423_c6_ea3b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output,
 device_in_result_MUX_uxn_opcodes_h_l423_c2_abeb_return_output,
 dei_param_MUX_uxn_opcodes_h_l423_c2_abeb_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l423_c2_abeb_return_output,
 result_is_device_ram_16bit_MUX_uxn_opcodes_h_l423_c2_abeb_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l423_c2_abeb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l423_c2_abeb_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c2_abeb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l423_c2_abeb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l423_c2_abeb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c2_abeb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l423_c2_abeb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l423_c2_abeb_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l423_c2_abeb_return_output,
 t8_MUX_uxn_opcodes_h_l423_c2_abeb_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l423_c2_abeb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l438_c11_ddd5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_4192_return_output,
 device_in_result_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output,
 dei_param_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output,
 t8_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output,
 sp_relative_shift_uxn_opcodes_h_l440_c30_d33d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l444_c9_8b88_return_output,
 MUX_uxn_opcodes_h_l444_c9_3e8c_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l445_c35_6cad_return_output,
 MUX_uxn_opcodes_h_l445_c15_9288_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l446_c49_e6ff_return_output,
 BIN_OP_AND_uxn_opcodes_h_l446_c29_b236_return_output,
 BIN_OP_OR_uxn_opcodes_h_l446_c8_ba24_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l446_c1_54f5_return_output,
 device_in_result_MUX_uxn_opcodes_h_l446_c3_d699_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l446_c3_d699_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l446_c3_d699_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l446_c3_d699_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l446_c3_d699_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l446_c3_d699_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l446_c3_d699_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l446_c3_d699_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c3_d699_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l446_c3_d699_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l446_c3_d699_return_output,
 device_in_uxn_opcodes_h_l447_c23_1d48_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l450_c4_24df_return_output,
 BIN_OP_AND_uxn_opcodes_h_l451_c9_969c_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l453_c11_12d0_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l457_c13_cbc5_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l457_c8_2aea_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l457_c8_2aea_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l457_c8_2aea_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l457_c8_2aea_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c8_2aea_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l457_c8_2aea_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l457_c8_2aea_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l464_c13_da4d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l464_c8_179b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l464_c8_179b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l464_c8_179b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c8_179b_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l464_c8_179b_return_output,
 UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l446_l451_DUPLICATE_5540_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l423_c6_ea3b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l423_c6_ea3b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l423_c6_ea3b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_2e4e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue : device_in_result_t;
 variable VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l423_c2_abeb_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l423_c2_abeb_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l423_c2_abeb_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l423_c2_abeb_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l423_c2_abeb_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l423_c2_abeb_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l423_c2_abeb_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_16bit_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_16bit_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_16bit_d41d_uxn_opcodes_h_l423_c2_abeb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_16bit_MUX_uxn_opcodes_h_l423_c2_abeb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_16bit_MUX_uxn_opcodes_h_l423_c2_abeb_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l423_c2_abeb_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l423_c2_abeb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l423_c2_abeb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l423_c2_abeb_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l423_c2_abeb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c2_abeb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c2_abeb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l423_c2_abeb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l423_c2_abeb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l423_c2_abeb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l423_c2_abeb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c2_abeb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c2_abeb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l432_c3_139a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l423_c2_abeb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l423_c2_abeb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l423_c2_abeb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l423_c2_abeb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l423_c2_abeb_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l431_c3_8fff : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l423_c2_abeb_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l423_c2_abeb_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l423_c2_abeb_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l423_c2_abeb_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l423_c2_abeb_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l423_c2_abeb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_ddd5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_ddd5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_ddd5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_4192_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_4192_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_4192_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_4192_iffalse : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l446_c3_d699_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l438_c7_2e4e_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l438_c7_2e4e_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l446_c3_d699_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l446_c3_d699_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l446_c3_d699_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l438_c7_2e4e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l446_c3_d699_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_2e4e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c3_d699_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2e4e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_2e4e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l446_c3_d699_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2e4e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l446_c3_d699_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l438_c7_2e4e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_2e4e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l446_c3_d699_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2e4e_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l446_c3_d699_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l438_c7_2e4e_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l438_c7_2e4e_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l446_c3_d699_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l438_c7_2e4e_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l440_c30_d33d_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l440_c30_d33d_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l440_c30_d33d_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l440_c30_d33d_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l444_c9_3e8c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l444_c9_8b88_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l444_c9_8b88_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l444_c9_8b88_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l444_c9_3e8c_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l444_c9_3e8c_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l444_c9_3e8c_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l445_c15_9288_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l445_c15_9288_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l445_c15_9288_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l445_c35_6cad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l445_c35_6cad_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l445_c35_6cad_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l445_c15_9288_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l446_c8_ba24_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l446_c29_b236_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l446_c49_e6ff_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l446_c49_e6ff_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l446_c29_b236_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l446_c29_b236_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l446_c8_ba24_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l446_c8_ba24_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l446_c1_54f5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l446_c1_54f5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l446_c1_54f5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l446_c1_54f5_iffalse : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l446_c3_d699_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l446_c3_d699_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l446_c3_d699_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l446_c3_d699_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l446_c3_d699_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l446_c3_d699_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l446_c3_d699_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l446_c3_d699_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l446_c3_d699_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l446_c3_d699_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l446_c3_d699_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l457_c8_2aea_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l446_c3_d699_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l446_c3_d699_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l446_c3_d699_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l446_c3_d699_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l446_c3_d699_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l446_c3_d699_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l457_c8_2aea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l446_c3_d699_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l446_c3_d699_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l446_c3_d699_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l457_c8_2aea_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l446_c3_d699_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l446_c3_d699_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l446_c3_d699_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l457_c8_2aea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l446_c3_d699_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c3_d699_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c3_d699_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c8_2aea_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c3_d699_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l446_c3_d699_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l450_c4_b4c1 : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l446_c3_d699_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l457_c8_2aea_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l446_c3_d699_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l446_c3_d699_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l446_c3_d699_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l457_c8_2aea_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l446_c3_d699_cond : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l447_c23_1d48_device_address : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l447_c23_1d48_phase : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l447_c23_1d48_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l447_c23_1d48_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l447_c23_1d48_return_output : device_in_result_t;
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l448_c32_5806_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l450_c4_24df_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l450_c4_24df_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l450_c4_24df_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l451_c9_969c_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l451_c9_969c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l451_c9_969c_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l453_c11_12d0_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l453_c11_12d0_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l453_c11_12d0_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l453_c11_12d0_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l457_c13_cbc5_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l457_c13_cbc5_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l457_c8_2aea_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l457_c8_2aea_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l457_c8_2aea_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l457_c8_2aea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l457_c8_2aea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l464_c8_179b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l457_c8_2aea_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l457_c8_2aea_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l457_c8_2aea_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l464_c8_179b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l457_c8_2aea_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l457_c8_2aea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l457_c8_2aea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l464_c8_179b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l457_c8_2aea_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c8_2aea_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l460_c4_8664 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c8_2aea_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c8_179b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c8_2aea_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l457_c8_2aea_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l458_c4_88a7 : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l457_c8_2aea_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l457_c8_2aea_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l457_c8_2aea_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l457_c8_2aea_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l464_c8_179b_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l457_c8_2aea_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l464_c13_da4d_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l464_c13_da4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l464_c8_179b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l464_c8_179b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l464_c8_179b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l464_c8_179b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l464_c8_179b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l464_c8_179b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l464_c8_179b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l464_c8_179b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l464_c8_179b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c8_179b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l465_c4_6329 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c8_179b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c8_179b_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l464_c8_179b_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l464_c8_179b_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l464_c8_179b_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l423_l438_l446_DUPLICATE_904c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l423_l438_l464_DUPLICATE_05bc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l423_l438_l464_l446_DUPLICATE_6579_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l423_l438_DUPLICATE_af9d_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l438_l464_l446_DUPLICATE_eae2_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l457_l438_l464_l446_DUPLICATE_6b86_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l446_l451_DUPLICATE_5540_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l446_l451_DUPLICATE_5540_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l453_l451_DUPLICATE_3de9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l461_l466_DUPLICATE_1586_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8a80_uxn_opcodes_h_l475_l417_DUPLICATE_38ca_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l464_c8_179b_iffalse := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l446_c3_d699_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue := to_unsigned(0, 1);
     VAR_current_dei_phase_uxn_opcodes_h_l458_c4_88a7 := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l457_c8_2aea_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l458_c4_88a7;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l453_c11_12d0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_ddd5_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l460_c4_8664 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c8_2aea_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l460_c4_8664;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l457_c8_2aea_iftrue := to_unsigned(1, 1);
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue := to_unsigned(0, 1);
     VAR_current_dei_phase_uxn_opcodes_h_l431_c3_8fff := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l431_c3_8fff;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l464_c8_179b_iffalse := to_unsigned(0, 1);
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l464_c8_179b_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_4192_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_16bit_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l444_c9_8b88_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l423_c6_ea3b_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l432_c3_139a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l432_c3_139a;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse := to_unsigned(0, 1);
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l445_c35_6cad_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l450_c4_24df_right := to_unsigned(1, 1);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l457_c8_2aea_iftrue := to_unsigned(1, 1);
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l465_c4_6329 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c8_179b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l465_c4_6329;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l446_c1_54f5_iffalse := to_unsigned(0, 1);
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l440_c30_d33d_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_sp_relative_shift_uxn_opcodes_h_l440_c30_d33d_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l450_c4_24df_left := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l457_c8_2aea_iffalse := current_dei_phase;
     VAR_device_in_uxn_opcodes_h_l447_c23_1d48_phase := current_dei_phase;
     VAR_dei_param_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue := dei_param;
     VAR_dei_param_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue := dei_param;
     VAR_device_in_result_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l446_c3_d699_iffalse := device_in_result;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l464_c13_da4d_expr := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l446_c3_d699_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l457_c8_2aea_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l464_c8_179b_iffalse := has_written_to_n;
     VAR_BIN_OP_AND_uxn_opcodes_h_l446_c29_b236_left := has_written_to_t;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l457_c13_cbc5_expr := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l446_c3_d699_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l457_c8_2aea_iffalse := has_written_to_t;
     VAR_sp_relative_shift_uxn_opcodes_h_l440_c30_d33d_ins := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l445_c15_9288_cond := is_first_dei_done;
     VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l446_l451_DUPLICATE_5540_expr := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l446_c3_d699_iffalse := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3_iffalse := is_first_dei_done;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l446_c49_e6ff_expr := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l446_c3_d699_iffalse := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l453_c11_12d0_iffalse := is_second_dei_done;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l423_c6_ea3b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_ddd5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l444_c9_8b88_left := VAR_phase;
     VAR_device_in_uxn_opcodes_h_l447_c23_1d48_previous_device_ram_read := resize(VAR_previous_device_ram_read, 8);
     VAR_MUX_uxn_opcodes_h_l444_c9_3e8c_iftrue := VAR_previous_stack_read;
     VAR_MUX_uxn_opcodes_h_l444_c9_3e8c_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue := t8;
     -- BIN_OP_PLUS[uxn_opcodes_h_l450_c4_24df] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l450_c4_24df_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l450_c4_24df_left;
     BIN_OP_PLUS_uxn_opcodes_h_l450_c4_24df_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l450_c4_24df_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l450_c4_24df_return_output := BIN_OP_PLUS_uxn_opcodes_h_l450_c4_24df_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l438_l464_l446_DUPLICATE_eae2 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l438_l464_l446_DUPLICATE_eae2_return_output := result.stack_address_sp_offset;

     -- UNARY_OP_NOT[uxn_opcodes_h_l457_c13_cbc5] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l457_c13_cbc5_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l457_c13_cbc5_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l457_c13_cbc5_return_output := UNARY_OP_NOT_uxn_opcodes_h_l457_c13_cbc5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l423_c6_ea3b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l423_c6_ea3b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l423_c6_ea3b_left;
     BIN_OP_EQ_uxn_opcodes_h_l423_c6_ea3b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l423_c6_ea3b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l423_c6_ea3b_return_output := BIN_OP_EQ_uxn_opcodes_h_l423_c6_ea3b_return_output;

     -- device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6[uxn_opcodes_h_l423_c2_abeb] LATENCY=0
     VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l423_c2_abeb_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6(
     device_in_result,
     to_unsigned(0, 1));

     -- result_is_sp_shift_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l423_c2_abeb] LATENCY=0
     VAR_result_is_sp_shift_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l423_c2_abeb_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l438_c11_ddd5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l438_c11_ddd5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_ddd5_left;
     BIN_OP_EQ_uxn_opcodes_h_l438_c11_ddd5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_ddd5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_ddd5_return_output := BIN_OP_EQ_uxn_opcodes_h_l438_c11_ddd5_return_output;

     -- CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l461_l466_DUPLICATE_1586 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l461_l466_DUPLICATE_1586_return_output := device_in_result.dei_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l444_c9_8b88] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l444_c9_8b88_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l444_c9_8b88_left;
     BIN_OP_EQ_uxn_opcodes_h_l444_c9_8b88_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l444_c9_8b88_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l444_c9_8b88_return_output := BIN_OP_EQ_uxn_opcodes_h_l444_c9_8b88_return_output;

     -- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l446_l451_DUPLICATE_5540 LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l446_l451_DUPLICATE_5540_expr <= VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l446_l451_DUPLICATE_5540_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l446_l451_DUPLICATE_5540_return_output := UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l446_l451_DUPLICATE_5540_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l464_c13_da4d] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l464_c13_da4d_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l464_c13_da4d_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l464_c13_da4d_return_output := UNARY_OP_NOT_uxn_opcodes_h_l464_c13_da4d_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l423_l438_DUPLICATE_af9d LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l423_l438_DUPLICATE_af9d_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l423_l438_l464_DUPLICATE_05bc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l423_l438_l464_DUPLICATE_05bc_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l423_l438_l446_DUPLICATE_904c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l423_l438_l446_DUPLICATE_904c_return_output := result.device_ram_address;

     -- sp_relative_shift[uxn_opcodes_h_l440_c30_d33d] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l440_c30_d33d_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l440_c30_d33d_ins;
     sp_relative_shift_uxn_opcodes_h_l440_c30_d33d_x <= VAR_sp_relative_shift_uxn_opcodes_h_l440_c30_d33d_x;
     sp_relative_shift_uxn_opcodes_h_l440_c30_d33d_y <= VAR_sp_relative_shift_uxn_opcodes_h_l440_c30_d33d_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l440_c30_d33d_return_output := sp_relative_shift_uxn_opcodes_h_l440_c30_d33d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l457_l438_l464_l446_DUPLICATE_6b86 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l457_l438_l464_l446_DUPLICATE_6b86_return_output := result.is_opc_done;

     -- UNARY_OP_NOT[uxn_opcodes_h_l446_c49_e6ff] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l446_c49_e6ff_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l446_c49_e6ff_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l446_c49_e6ff_return_output := UNARY_OP_NOT_uxn_opcodes_h_l446_c49_e6ff_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l423_l438_l464_l446_DUPLICATE_6579 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l423_l438_l464_l446_DUPLICATE_6579_return_output := result.u8_value;

     -- result_is_device_ram_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_16bit_d41d[uxn_opcodes_h_l423_c2_abeb] LATENCY=0
     VAR_result_is_device_ram_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_16bit_d41d_uxn_opcodes_h_l423_c2_abeb_return_output := result.is_device_ram_16bit;

     -- result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l423_c2_abeb] LATENCY=0
     VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l423_c2_abeb_return_output := result.is_device_ram_write;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_2e4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l423_c6_ea3b_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l423_c2_abeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l423_c6_ea3b_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l423_c2_abeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l423_c6_ea3b_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l423_c2_abeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l423_c6_ea3b_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l423_c2_abeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l423_c6_ea3b_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l423_c2_abeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l423_c6_ea3b_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l423_c6_ea3b_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l423_c6_ea3b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l423_c2_abeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l423_c6_ea3b_return_output;
     VAR_result_is_device_ram_16bit_MUX_uxn_opcodes_h_l423_c2_abeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l423_c6_ea3b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c2_abeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l423_c6_ea3b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l423_c2_abeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l423_c6_ea3b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l423_c2_abeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l423_c6_ea3b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l423_c2_abeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l423_c6_ea3b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c2_abeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l423_c6_ea3b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l423_c2_abeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l423_c6_ea3b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l423_c2_abeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l423_c6_ea3b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l423_c2_abeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l423_c6_ea3b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_4192_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_ddd5_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l438_c7_2e4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_ddd5_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l438_c7_2e4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_ddd5_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l438_c7_2e4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_ddd5_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l438_c7_2e4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_ddd5_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l438_c7_2e4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_ddd5_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_ddd5_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_ddd5_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_2e4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_ddd5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2e4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_ddd5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_2e4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_ddd5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2e4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_ddd5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_2e4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_ddd5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2e4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_ddd5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l438_c7_2e4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_ddd5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l438_c7_2e4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_ddd5_return_output;
     VAR_MUX_uxn_opcodes_h_l444_c9_3e8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l444_c9_8b88_return_output;
     VAR_current_dei_phase_uxn_opcodes_h_l450_c4_b4c1 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l450_c4_24df_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l423_l438_DUPLICATE_af9d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l423_l438_DUPLICATE_af9d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l457_l438_l464_l446_DUPLICATE_6b86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l446_c3_d699_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l457_l438_l464_l446_DUPLICATE_6b86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l457_c8_2aea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l457_l438_l464_l446_DUPLICATE_6b86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l464_c8_179b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l457_l438_l464_l446_DUPLICATE_6b86_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l423_l438_l464_DUPLICATE_05bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l423_l438_l464_DUPLICATE_05bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l464_c8_179b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l423_l438_l464_DUPLICATE_05bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l438_l464_l446_DUPLICATE_eae2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c3_d699_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l438_l464_l446_DUPLICATE_eae2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c8_179b_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l438_l464_l446_DUPLICATE_eae2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l457_c8_2aea_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l461_l466_DUPLICATE_1586_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l464_c8_179b_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l461_l466_DUPLICATE_1586_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l423_l438_l446_DUPLICATE_904c_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l423_l438_l446_DUPLICATE_904c_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l446_c3_d699_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l423_l438_l446_DUPLICATE_904c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l423_l438_l464_l446_DUPLICATE_6579_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l423_l438_l464_l446_DUPLICATE_6579_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l446_c3_d699_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l423_l438_l464_l446_DUPLICATE_6579_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l464_c8_179b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l423_l438_l464_l446_DUPLICATE_6579_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l446_c29_b236_right := VAR_UNARY_OP_NOT_uxn_opcodes_h_l446_c49_e6ff_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l457_c8_2aea_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l457_c13_cbc5_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l457_c8_2aea_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l457_c13_cbc5_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l457_c8_2aea_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l457_c13_cbc5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l457_c8_2aea_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l457_c13_cbc5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l457_c8_2aea_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l457_c13_cbc5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c8_2aea_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l457_c13_cbc5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l457_c8_2aea_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l457_c13_cbc5_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l464_c8_179b_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l464_c13_da4d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l464_c8_179b_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l464_c13_da4d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l464_c8_179b_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l464_c13_da4d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c8_179b_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l464_c13_da4d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l464_c8_179b_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l464_c13_da4d_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l451_c9_969c_left := VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l446_l451_DUPLICATE_5540_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l446_c8_ba24_left := VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l446_l451_DUPLICATE_5540_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue := VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l423_c2_abeb_return_output;
     VAR_result_is_device_ram_16bit_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse := VAR_result_is_device_ram_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_16bit_d41d_uxn_opcodes_h_l423_c2_abeb_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse := VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l423_c2_abeb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue := VAR_result_is_sp_shift_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l423_c2_abeb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l440_c30_d33d_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l446_c3_d699_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l450_c4_b4c1;
     -- has_written_to_t_MUX[uxn_opcodes_h_l457_c8_2aea] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l457_c8_2aea_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l457_c8_2aea_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l457_c8_2aea_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l457_c8_2aea_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l457_c8_2aea_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l457_c8_2aea_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l457_c8_2aea_return_output := has_written_to_t_MUX_uxn_opcodes_h_l457_c8_2aea_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l464_c8_179b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l464_c8_179b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l464_c8_179b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l464_c8_179b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l464_c8_179b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l464_c8_179b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l464_c8_179b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l464_c8_179b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l464_c8_179b_return_output;

     -- result_is_device_ram_16bit_MUX[uxn_opcodes_h_l423_c2_abeb] LATENCY=0
     -- Inputs
     result_is_device_ram_16bit_MUX_uxn_opcodes_h_l423_c2_abeb_cond <= VAR_result_is_device_ram_16bit_MUX_uxn_opcodes_h_l423_c2_abeb_cond;
     result_is_device_ram_16bit_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue <= VAR_result_is_device_ram_16bit_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue;
     result_is_device_ram_16bit_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse <= VAR_result_is_device_ram_16bit_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse;
     -- Outputs
     VAR_result_is_device_ram_16bit_MUX_uxn_opcodes_h_l423_c2_abeb_return_output := result_is_device_ram_16bit_MUX_uxn_opcodes_h_l423_c2_abeb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l464_c8_179b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l464_c8_179b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l464_c8_179b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l464_c8_179b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l464_c8_179b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l464_c8_179b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l464_c8_179b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l464_c8_179b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l464_c8_179b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l464_c8_179b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l464_c8_179b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l464_c8_179b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l464_c8_179b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l464_c8_179b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l464_c8_179b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l464_c8_179b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l464_c8_179b_return_output := result_u8_value_MUX_uxn_opcodes_h_l464_c8_179b_return_output;

     -- MUX[uxn_opcodes_h_l444_c9_3e8c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l444_c9_3e8c_cond <= VAR_MUX_uxn_opcodes_h_l444_c9_3e8c_cond;
     MUX_uxn_opcodes_h_l444_c9_3e8c_iftrue <= VAR_MUX_uxn_opcodes_h_l444_c9_3e8c_iftrue;
     MUX_uxn_opcodes_h_l444_c9_3e8c_iffalse <= VAR_MUX_uxn_opcodes_h_l444_c9_3e8c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l444_c9_3e8c_return_output := MUX_uxn_opcodes_h_l444_c9_3e8c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l464_c8_179b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c8_179b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c8_179b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c8_179b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c8_179b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c8_179b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c8_179b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c8_179b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c8_179b_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l464_c8_179b] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l464_c8_179b_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l464_c8_179b_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l464_c8_179b_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l464_c8_179b_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l464_c8_179b_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l464_c8_179b_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l464_c8_179b_return_output := has_written_to_n_MUX_uxn_opcodes_h_l464_c8_179b_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l423_c2_abeb] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c2_abeb_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c2_abeb_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c2_abeb_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c2_abeb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l438_c7_2e4e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_2e4e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_2e4e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l438_c7_2e4e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_2e4e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_2e4e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l446_c29_b236] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l446_c29_b236_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l446_c29_b236_left;
     BIN_OP_AND_uxn_opcodes_h_l446_c29_b236_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l446_c29_b236_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l446_c29_b236_return_output := BIN_OP_AND_uxn_opcodes_h_l446_c29_b236_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l438_c7_2e4e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_2e4e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_2e4e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l457_c8_2aea] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l457_c8_2aea_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l457_c8_2aea_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l457_c8_2aea_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l457_c8_2aea_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l457_c8_2aea_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l457_c8_2aea_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l457_c8_2aea_return_output := current_dei_phase_MUX_uxn_opcodes_h_l457_c8_2aea_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_opcodes_h_l446_c8_ba24_right := VAR_BIN_OP_AND_uxn_opcodes_h_l446_c29_b236_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_4192_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l445_c35_6cad_left := VAR_MUX_uxn_opcodes_h_l444_c9_3e8c_return_output;
     VAR_MUX_uxn_opcodes_h_l445_c15_9288_iffalse := VAR_MUX_uxn_opcodes_h_l444_c9_3e8c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse := VAR_MUX_uxn_opcodes_h_l444_c9_3e8c_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l446_c3_d699_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l457_c8_2aea_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l457_c8_2aea_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l464_c8_179b_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l446_c3_d699_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l457_c8_2aea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l457_c8_2aea_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l464_c8_179b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l457_c8_2aea_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l464_c8_179b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c8_2aea_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c8_179b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l457_c8_2aea_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l464_c8_179b_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l423_c2_abeb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c2_abeb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c2_abeb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c2_abeb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c2_abeb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l457_c8_2aea] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l457_c8_2aea_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l457_c8_2aea_cond;
     result_u8_value_MUX_uxn_opcodes_h_l457_c8_2aea_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l457_c8_2aea_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l457_c8_2aea_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l457_c8_2aea_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l457_c8_2aea_return_output := result_u8_value_MUX_uxn_opcodes_h_l457_c8_2aea_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l442_c1_4192] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_4192_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_4192_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_4192_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_4192_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_4192_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_4192_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_4192_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_4192_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l457_c8_2aea] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l457_c8_2aea_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l457_c8_2aea_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l457_c8_2aea_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l457_c8_2aea_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l457_c8_2aea_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l457_c8_2aea_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l457_c8_2aea_return_output := has_written_to_n_MUX_uxn_opcodes_h_l457_c8_2aea_return_output;

     -- t8_MUX[uxn_opcodes_h_l438_c7_2e4e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l438_c7_2e4e_cond <= VAR_t8_MUX_uxn_opcodes_h_l438_c7_2e4e_cond;
     t8_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue;
     t8_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output := t8_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l457_c8_2aea] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c8_2aea_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c8_2aea_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c8_2aea_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c8_2aea_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c8_2aea_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c8_2aea_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c8_2aea_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c8_2aea_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l423_c2_abeb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l423_c2_abeb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l423_c2_abeb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l423_c2_abeb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l423_c2_abeb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l457_c8_2aea] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l457_c8_2aea_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l457_c8_2aea_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l457_c8_2aea_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l457_c8_2aea_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l457_c8_2aea_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l457_c8_2aea_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l457_c8_2aea_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l457_c8_2aea_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l457_c8_2aea] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l457_c8_2aea_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l457_c8_2aea_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l457_c8_2aea_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l457_c8_2aea_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l457_c8_2aea_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l457_c8_2aea_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l457_c8_2aea_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l457_c8_2aea_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l445_c35_6cad] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l445_c35_6cad_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l445_c35_6cad_left;
     BIN_OP_PLUS_uxn_opcodes_h_l445_c35_6cad_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l445_c35_6cad_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l445_c35_6cad_return_output := BIN_OP_PLUS_uxn_opcodes_h_l445_c35_6cad_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l446_c8_ba24] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l446_c8_ba24_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l446_c8_ba24_left;
     BIN_OP_OR_uxn_opcodes_h_l446_c8_ba24_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l446_c8_ba24_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l446_c8_ba24_return_output := BIN_OP_OR_uxn_opcodes_h_l446_c8_ba24_return_output;

     -- Submodule level 3
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l446_c1_54f5_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l446_c8_ba24_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l446_c3_d699_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l446_c8_ba24_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l446_c3_d699_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l446_c8_ba24_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l446_c3_d699_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l446_c8_ba24_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l446_c3_d699_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l446_c8_ba24_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l446_c3_d699_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l446_c8_ba24_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l446_c3_d699_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l446_c8_ba24_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l446_c3_d699_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l446_c8_ba24_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l446_c3_d699_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l446_c8_ba24_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l446_c3_d699_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l446_c8_ba24_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c3_d699_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l446_c8_ba24_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l446_c3_d699_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l446_c8_ba24_return_output;
     VAR_MUX_uxn_opcodes_h_l445_c15_9288_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l445_c35_6cad_return_output, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l446_c1_54f5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_4192_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l446_c3_d699_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l457_c8_2aea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l446_c3_d699_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l457_c8_2aea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l446_c3_d699_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l457_c8_2aea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c3_d699_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c8_2aea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l446_c3_d699_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l457_c8_2aea_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse := VAR_t8_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l446_c3_d699] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l446_c3_d699_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l446_c3_d699_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l446_c3_d699_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l446_c3_d699_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l446_c3_d699_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l446_c3_d699_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l446_c3_d699_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l446_c3_d699_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l446_c3_d699] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l446_c3_d699_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l446_c3_d699_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l446_c3_d699_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l446_c3_d699_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l446_c3_d699_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l446_c3_d699_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l446_c3_d699_return_output := current_dei_phase_MUX_uxn_opcodes_h_l446_c3_d699_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l446_c3_d699] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c3_d699_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c3_d699_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c3_d699_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c3_d699_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c3_d699_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c3_d699_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c3_d699_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c3_d699_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l446_c3_d699] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l446_c3_d699_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l446_c3_d699_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l446_c3_d699_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l446_c3_d699_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l446_c3_d699_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l446_c3_d699_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l446_c3_d699_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l446_c3_d699_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l446_c3_d699] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l446_c3_d699_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l446_c3_d699_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l446_c3_d699_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l446_c3_d699_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l446_c3_d699_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l446_c3_d699_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l446_c3_d699_return_output := has_written_to_n_MUX_uxn_opcodes_h_l446_c3_d699_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l446_c3_d699] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l446_c3_d699_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l446_c3_d699_cond;
     result_u8_value_MUX_uxn_opcodes_h_l446_c3_d699_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l446_c3_d699_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l446_c3_d699_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l446_c3_d699_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l446_c3_d699_return_output := result_u8_value_MUX_uxn_opcodes_h_l446_c3_d699_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l446_c1_54f5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l446_c1_54f5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l446_c1_54f5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l446_c1_54f5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l446_c1_54f5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l446_c1_54f5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l446_c1_54f5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l446_c1_54f5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l446_c1_54f5_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l446_c3_d699] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l446_c3_d699_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l446_c3_d699_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l446_c3_d699_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l446_c3_d699_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l446_c3_d699_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l446_c3_d699_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l446_c3_d699_return_output := has_written_to_t_MUX_uxn_opcodes_h_l446_c3_d699_return_output;

     -- MUX[uxn_opcodes_h_l445_c15_9288] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l445_c15_9288_cond <= VAR_MUX_uxn_opcodes_h_l445_c15_9288_cond;
     MUX_uxn_opcodes_h_l445_c15_9288_iftrue <= VAR_MUX_uxn_opcodes_h_l445_c15_9288_iftrue;
     MUX_uxn_opcodes_h_l445_c15_9288_iffalse <= VAR_MUX_uxn_opcodes_h_l445_c15_9288_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l445_c15_9288_return_output := MUX_uxn_opcodes_h_l445_c15_9288_return_output;

     -- t8_MUX[uxn_opcodes_h_l423_c2_abeb] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l423_c2_abeb_cond <= VAR_t8_MUX_uxn_opcodes_h_l423_c2_abeb_cond;
     t8_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue;
     t8_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l423_c2_abeb_return_output := t8_MUX_uxn_opcodes_h_l423_c2_abeb_return_output;

     -- Submodule level 4
     VAR_dei_param_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse := VAR_MUX_uxn_opcodes_h_l445_c15_9288_return_output;
     VAR_device_in_uxn_opcodes_h_l447_c23_1d48_device_address := VAR_MUX_uxn_opcodes_h_l445_c15_9288_return_output;
     VAR_device_in_uxn_opcodes_h_l447_c23_1d48_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l446_c1_54f5_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l446_c3_d699_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l446_c3_d699_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l446_c3_d699_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l446_c3_d699_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l446_c3_d699_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c3_d699_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l446_c3_d699_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l423_c2_abeb_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l438_c7_2e4e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2e4e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2e4e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output;

     -- device_in[uxn_opcodes_h_l447_c23_1d48] LATENCY=0
     -- Clock enable
     device_in_uxn_opcodes_h_l447_c23_1d48_CLOCK_ENABLE <= VAR_device_in_uxn_opcodes_h_l447_c23_1d48_CLOCK_ENABLE;
     -- Inputs
     device_in_uxn_opcodes_h_l447_c23_1d48_device_address <= VAR_device_in_uxn_opcodes_h_l447_c23_1d48_device_address;
     device_in_uxn_opcodes_h_l447_c23_1d48_phase <= VAR_device_in_uxn_opcodes_h_l447_c23_1d48_phase;
     device_in_uxn_opcodes_h_l447_c23_1d48_previous_device_ram_read <= VAR_device_in_uxn_opcodes_h_l447_c23_1d48_previous_device_ram_read;
     -- Outputs
     VAR_device_in_uxn_opcodes_h_l447_c23_1d48_return_output := device_in_uxn_opcodes_h_l447_c23_1d48_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l438_c7_2e4e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l438_c7_2e4e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l438_c7_2e4e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output := result_u8_value_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l438_c7_2e4e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2e4e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2e4e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l438_c7_2e4e] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l438_c7_2e4e_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l438_c7_2e4e_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output := has_written_to_n_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l438_c7_2e4e] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l438_c7_2e4e_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l438_c7_2e4e_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output := has_written_to_t_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l438_c7_2e4e] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l438_c7_2e4e_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l438_c7_2e4e_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output := current_dei_phase_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l438_c7_2e4e] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l438_c7_2e4e_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l438_c7_2e4e_cond;
     dei_param_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue;
     dei_param_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output := dei_param_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l438_c7_2e4e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2e4e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2e4e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output;

     -- Submodule level 5
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse := VAR_dei_param_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l446_c3_d699_iftrue := VAR_device_in_uxn_opcodes_h_l447_c23_1d48_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output;
     -- has_written_to_n_MUX[uxn_opcodes_h_l423_c2_abeb] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l423_c2_abeb_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l423_c2_abeb_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l423_c2_abeb_return_output := has_written_to_n_MUX_uxn_opcodes_h_l423_c2_abeb_return_output;

     -- CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d[uxn_opcodes_h_l448_c32_5806] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l448_c32_5806_return_output := VAR_device_in_uxn_opcodes_h_l447_c23_1d48_return_output.device_ram_address;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l423_c2_abeb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l423_c2_abeb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l423_c2_abeb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l423_c2_abeb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l423_c2_abeb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l423_c2_abeb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l423_c2_abeb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l423_c2_abeb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l423_c2_abeb_return_output := result_u8_value_MUX_uxn_opcodes_h_l423_c2_abeb_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l423_c2_abeb] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l423_c2_abeb_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l423_c2_abeb_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l423_c2_abeb_return_output := has_written_to_t_MUX_uxn_opcodes_h_l423_c2_abeb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l423_c2_abeb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l423_c2_abeb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l423_c2_abeb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l423_c2_abeb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l423_c2_abeb_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l423_c2_abeb] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l423_c2_abeb_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l423_c2_abeb_cond;
     dei_param_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue;
     dei_param_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l423_c2_abeb_return_output := dei_param_MUX_uxn_opcodes_h_l423_c2_abeb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l423_c2_abeb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l423_c2_abeb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l423_c2_abeb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l423_c2_abeb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l423_c2_abeb_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l446_c3_d699] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l446_c3_d699_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l446_c3_d699_cond;
     device_in_result_MUX_uxn_opcodes_h_l446_c3_d699_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l446_c3_d699_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l446_c3_d699_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l446_c3_d699_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l446_c3_d699_return_output := device_in_result_MUX_uxn_opcodes_h_l446_c3_d699_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l423_c2_abeb] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l423_c2_abeb_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l423_c2_abeb_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l423_c2_abeb_return_output := current_dei_phase_MUX_uxn_opcodes_h_l423_c2_abeb_return_output;

     -- CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l453_l451_DUPLICATE_3de9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l453_l451_DUPLICATE_3de9_return_output := VAR_device_in_uxn_opcodes_h_l447_c23_1d48_return_output.is_dei_done;

     -- Submodule level 6
     VAR_BIN_OP_AND_uxn_opcodes_h_l451_c9_969c_right := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l453_l451_DUPLICATE_3de9_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l453_c11_12d0_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l453_l451_DUPLICATE_3de9_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l446_c3_d699_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l448_c32_5806_return_output;
     REG_VAR_current_dei_phase := VAR_current_dei_phase_MUX_uxn_opcodes_h_l423_c2_abeb_return_output;
     REG_VAR_dei_param := VAR_dei_param_MUX_uxn_opcodes_h_l423_c2_abeb_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l446_c3_d699_return_output;
     REG_VAR_has_written_to_n := VAR_has_written_to_n_MUX_uxn_opcodes_h_l423_c2_abeb_return_output;
     REG_VAR_has_written_to_t := VAR_has_written_to_t_MUX_uxn_opcodes_h_l423_c2_abeb_return_output;
     -- is_second_dei_done_MUX[uxn_opcodes_h_l453_c11_12d0] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l453_c11_12d0_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l453_c11_12d0_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l453_c11_12d0_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l453_c11_12d0_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l453_c11_12d0_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l453_c11_12d0_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l453_c11_12d0_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l453_c11_12d0_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l451_c9_969c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l451_c9_969c_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l451_c9_969c_left;
     BIN_OP_AND_uxn_opcodes_h_l451_c9_969c_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l451_c9_969c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l451_c9_969c_return_output := BIN_OP_AND_uxn_opcodes_h_l451_c9_969c_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l446_c3_d699] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l446_c3_d699_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l446_c3_d699_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l446_c3_d699_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l446_c3_d699_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l446_c3_d699_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l446_c3_d699_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l446_c3_d699_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l446_c3_d699_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l438_c7_2e4e] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l438_c7_2e4e_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l438_c7_2e4e_cond;
     device_in_result_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output := device_in_result_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output;

     -- Submodule level 7
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3_cond := VAR_BIN_OP_AND_uxn_opcodes_h_l451_c9_969c_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3_cond := VAR_BIN_OP_AND_uxn_opcodes_h_l451_c9_969c_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l453_c11_12d0_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l446_c3_d699_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l438_c7_2e4e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_2e4e_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_2e4e_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l451_c4_7be3] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l451_c4_7be3] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l423_c2_abeb] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l423_c2_abeb_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l423_c2_abeb_cond;
     device_in_result_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l423_c2_abeb_return_output := device_in_result_MUX_uxn_opcodes_h_l423_c2_abeb_return_output;

     -- Submodule level 8
     REG_VAR_device_in_result := VAR_device_in_result_MUX_uxn_opcodes_h_l423_c2_abeb_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l446_c3_d699_iftrue := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l446_c3_d699_iftrue := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l451_c4_7be3_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output;
     -- is_second_dei_done_MUX[uxn_opcodes_h_l446_c3_d699] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l446_c3_d699_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l446_c3_d699_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l446_c3_d699_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l446_c3_d699_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l446_c3_d699_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l446_c3_d699_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l446_c3_d699_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l446_c3_d699_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l423_c2_abeb] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l423_c2_abeb_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l423_c2_abeb_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l423_c2_abeb_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l423_c2_abeb_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l446_c3_d699] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l446_c3_d699_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l446_c3_d699_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l446_c3_d699_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l446_c3_d699_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l446_c3_d699_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l446_c3_d699_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l446_c3_d699_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l446_c3_d699_return_output;

     -- Submodule level 9
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l446_c3_d699_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l446_c3_d699_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8a80_uxn_opcodes_h_l475_l417_DUPLICATE_38ca LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8a80_uxn_opcodes_h_l475_l417_DUPLICATE_38ca_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8a80(
     result,
     VAR_result_is_device_ram_16bit_MUX_uxn_opcodes_h_l423_c2_abeb_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l423_c2_abeb_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l423_c2_abeb_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c2_abeb_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l423_c2_abeb_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l423_c2_abeb_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c2_abeb_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l423_c2_abeb_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l423_c2_abeb_return_output);

     -- is_first_dei_done_MUX[uxn_opcodes_h_l438_c7_2e4e] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l438_c7_2e4e] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output;

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8a80_uxn_opcodes_h_l475_l417_DUPLICATE_38ca_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8a80_uxn_opcodes_h_l475_l417_DUPLICATE_38ca_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l438_c7_2e4e_return_output;
     -- is_first_dei_done_MUX[uxn_opcodes_h_l423_c2_abeb] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l423_c2_abeb] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb_return_output;

     -- Submodule level 11
     REG_VAR_is_first_dei_done := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb_return_output;
     REG_VAR_is_second_dei_done := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l423_c2_abeb_return_output;
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
