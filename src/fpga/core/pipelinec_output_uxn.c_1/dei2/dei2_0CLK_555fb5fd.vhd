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
-- -- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 95
entity dei2_0CLK_555fb5fd is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end dei2_0CLK_555fb5fd;
architecture arch of dei2_0CLK_555fb5fd is
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
-- BIN_OP_EQ[uxn_opcodes_h_l467_c6_09af]
signal BIN_OP_EQ_uxn_opcodes_h_l467_c6_09af_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l467_c6_09af_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l467_c6_09af_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l479_c7_56c0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_56c0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_56c0_return_output : unsigned(0 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l467_c2_54d9]
signal dei_param_MUX_uxn_opcodes_h_l467_c2_54d9_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l467_c2_54d9_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l467_c2_54d9]
signal t8_MUX_uxn_opcodes_h_l467_c2_54d9_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l467_c2_54d9_return_output : unsigned(7 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l467_c2_54d9]
signal has_written_to_n_MUX_uxn_opcodes_h_l467_c2_54d9_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l467_c2_54d9_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l467_c2_54d9]
signal current_dei_phase_MUX_uxn_opcodes_h_l467_c2_54d9_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l467_c2_54d9_return_output : unsigned(7 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l467_c2_54d9]
signal has_written_to_t_MUX_uxn_opcodes_h_l467_c2_54d9_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l467_c2_54d9_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l467_c2_54d9]
signal device_in_result_MUX_uxn_opcodes_h_l467_c2_54d9_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l467_c2_54d9_return_output : device_in_result_t;

-- is_first_dei_done_MUX[uxn_opcodes_h_l467_c2_54d9]
signal is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l467_c2_54d9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_54d9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_54d9_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l467_c2_54d9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_54d9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_54d9_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l467_c2_54d9]
signal result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_54d9_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_54d9_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l467_c2_54d9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_54d9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_54d9_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l467_c2_54d9]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_54d9_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_54d9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l467_c2_54d9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_54d9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_54d9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l467_c2_54d9]
signal result_stack_value_MUX_uxn_opcodes_h_l467_c2_54d9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l467_c2_54d9_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l467_c2_54d9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_54d9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_54d9_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l467_c2_54d9]
signal is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l479_c11_527e]
signal BIN_OP_EQ_uxn_opcodes_h_l479_c11_527e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l479_c11_527e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l479_c11_527e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l482_c7_f249]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f249_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f249_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f249_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f249_return_output : unsigned(0 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l479_c7_56c0]
signal dei_param_MUX_uxn_opcodes_h_l479_c7_56c0_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l479_c7_56c0_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l479_c7_56c0]
signal t8_MUX_uxn_opcodes_h_l479_c7_56c0_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l479_c7_56c0_return_output : unsigned(7 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l479_c7_56c0]
signal has_written_to_n_MUX_uxn_opcodes_h_l479_c7_56c0_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l479_c7_56c0_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l479_c7_56c0]
signal current_dei_phase_MUX_uxn_opcodes_h_l479_c7_56c0_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l479_c7_56c0_return_output : unsigned(7 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l479_c7_56c0]
signal has_written_to_t_MUX_uxn_opcodes_h_l479_c7_56c0_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l479_c7_56c0_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l479_c7_56c0]
signal device_in_result_MUX_uxn_opcodes_h_l479_c7_56c0_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l479_c7_56c0_return_output : device_in_result_t;

-- is_first_dei_done_MUX[uxn_opcodes_h_l479_c7_56c0]
signal is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l479_c7_56c0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_56c0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_56c0_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l479_c7_56c0]
signal result_stack_value_MUX_uxn_opcodes_h_l479_c7_56c0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l479_c7_56c0_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l479_c7_56c0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_56c0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_56c0_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l479_c7_56c0]
signal result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_56c0_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_56c0_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l479_c7_56c0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_56c0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_56c0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l479_c7_56c0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_56c0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_56c0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l479_c7_56c0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_56c0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_56c0_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l479_c7_56c0]
signal is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l482_c11_0b26]
signal BIN_OP_EQ_uxn_opcodes_h_l482_c11_0b26_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l482_c11_0b26_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l482_c11_0b26_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l487_c1_e201]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_e201_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_e201_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_e201_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_e201_return_output : unsigned(0 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l482_c7_f249]
signal dei_param_MUX_uxn_opcodes_h_l482_c7_f249_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l482_c7_f249_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l482_c7_f249_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l482_c7_f249_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l482_c7_f249]
signal t8_MUX_uxn_opcodes_h_l482_c7_f249_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l482_c7_f249_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l482_c7_f249_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l482_c7_f249_return_output : unsigned(7 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l482_c7_f249]
signal has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f249_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f249_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f249_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f249_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l482_c7_f249]
signal current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f249_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f249_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f249_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f249_return_output : unsigned(7 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l482_c7_f249]
signal has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f249_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f249_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f249_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f249_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l482_c7_f249]
signal device_in_result_MUX_uxn_opcodes_h_l482_c7_f249_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l482_c7_f249_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l482_c7_f249_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l482_c7_f249_return_output : device_in_result_t;

-- is_first_dei_done_MUX[uxn_opcodes_h_l482_c7_f249]
signal is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f249_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f249_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f249_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f249_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l482_c7_f249]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f249_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f249_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f249_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f249_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l482_c7_f249]
signal result_stack_value_MUX_uxn_opcodes_h_l482_c7_f249_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l482_c7_f249_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l482_c7_f249_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l482_c7_f249_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l482_c7_f249]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f249_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f249_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f249_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f249_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l482_c7_f249]
signal result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f249_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f249_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f249_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f249_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l482_c7_f249]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f249_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f249_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f249_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f249_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l482_c7_f249]
signal result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f249_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f249_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f249_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f249_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l482_c7_f249]
signal result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f249_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f249_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f249_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f249_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l482_c7_f249]
signal is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f249_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f249_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f249_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f249_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l485_c32_1c20]
signal BIN_OP_AND_uxn_opcodes_h_l485_c32_1c20_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l485_c32_1c20_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l485_c32_1c20_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l485_c32_92e6]
signal BIN_OP_GT_uxn_opcodes_h_l485_c32_92e6_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l485_c32_92e6_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l485_c32_92e6_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l485_c32_c0be]
signal MUX_uxn_opcodes_h_l485_c32_c0be_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l485_c32_c0be_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l485_c32_c0be_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l485_c32_c0be_return_output : signed(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l489_c35_08ad]
signal BIN_OP_PLUS_uxn_opcodes_h_l489_c35_08ad_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l489_c35_08ad_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l489_c35_08ad_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l489_c15_c2a3]
signal MUX_uxn_opcodes_h_l489_c15_c2a3_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l489_c15_c2a3_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l489_c15_c2a3_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l489_c15_c2a3_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l490_c49_f5fe]
signal UNARY_OP_NOT_uxn_opcodes_h_l490_c49_f5fe_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l490_c49_f5fe_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l490_c29_8959]
signal BIN_OP_AND_uxn_opcodes_h_l490_c29_8959_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l490_c29_8959_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l490_c29_8959_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l490_c8_62c0]
signal BIN_OP_OR_uxn_opcodes_h_l490_c8_62c0_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l490_c8_62c0_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l490_c8_62c0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l490_c1_591f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_591f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_591f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_591f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_591f_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l490_c3_e0ed]
signal has_written_to_n_MUX_uxn_opcodes_h_l490_c3_e0ed_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l490_c3_e0ed]
signal current_dei_phase_MUX_uxn_opcodes_h_l490_c3_e0ed_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output : unsigned(7 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l490_c3_e0ed]
signal has_written_to_t_MUX_uxn_opcodes_h_l490_c3_e0ed_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l490_c3_e0ed]
signal device_in_result_MUX_uxn_opcodes_h_l490_c3_e0ed_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output : device_in_result_t;

-- is_first_dei_done_MUX[uxn_opcodes_h_l490_c3_e0ed]
signal is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l490_c3_e0ed]
signal result_stack_value_MUX_uxn_opcodes_h_l490_c3_e0ed_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l490_c3_e0ed]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_e0ed_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l490_c3_e0ed]
signal result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_e0ed_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l490_c3_e0ed]
signal result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_e0ed_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l490_c3_e0ed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_e0ed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l490_c3_e0ed]
signal is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output : unsigned(0 downto 0);

-- device_in[uxn_opcodes_h_l491_c23_b8dc]
signal device_in_uxn_opcodes_h_l491_c23_b8dc_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_in_uxn_opcodes_h_l491_c23_b8dc_device_address : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l491_c23_b8dc_phase : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l491_c23_b8dc_previous_device_ram_read : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l491_c23_b8dc_return_output : device_in_result_t;

-- BIN_OP_PLUS[uxn_opcodes_h_l494_c4_7697]
signal BIN_OP_PLUS_uxn_opcodes_h_l494_c4_7697_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l494_c4_7697_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l494_c4_7697_return_output : unsigned(8 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l495_c9_209a]
signal BIN_OP_AND_uxn_opcodes_h_l495_c9_209a_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l495_c9_209a_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l495_c9_209a_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l495_c4_1913]
signal is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_1913_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_1913_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_1913_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_1913_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l495_c4_1913]
signal is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_1913_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_1913_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_1913_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_1913_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l497_c11_9c75]
signal is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_9c75_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_9c75_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_9c75_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_9c75_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l501_c13_bd74]
signal UNARY_OP_NOT_uxn_opcodes_h_l501_c13_bd74_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l501_c13_bd74_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l501_c8_a10f]
signal has_written_to_n_MUX_uxn_opcodes_h_l501_c8_a10f_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l501_c8_a10f_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l501_c8_a10f_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l501_c8_a10f_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l501_c8_a10f]
signal current_dei_phase_MUX_uxn_opcodes_h_l501_c8_a10f_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l501_c8_a10f_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l501_c8_a10f_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l501_c8_a10f_return_output : unsigned(7 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l501_c8_a10f]
signal has_written_to_t_MUX_uxn_opcodes_h_l501_c8_a10f_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l501_c8_a10f_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l501_c8_a10f_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l501_c8_a10f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l501_c8_a10f]
signal result_stack_value_MUX_uxn_opcodes_h_l501_c8_a10f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l501_c8_a10f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l501_c8_a10f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l501_c8_a10f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l501_c8_a10f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_a10f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_a10f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_a10f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_a10f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l501_c8_a10f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_a10f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_a10f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_a10f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_a10f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l501_c8_a10f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_a10f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_a10f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_a10f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_a10f_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l508_c13_4b32]
signal UNARY_OP_NOT_uxn_opcodes_h_l508_c13_4b32_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l508_c13_4b32_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l508_c8_0e90]
signal has_written_to_n_MUX_uxn_opcodes_h_l508_c8_0e90_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l508_c8_0e90_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l508_c8_0e90_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l508_c8_0e90_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l508_c8_0e90]
signal result_stack_value_MUX_uxn_opcodes_h_l508_c8_0e90_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l508_c8_0e90_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l508_c8_0e90_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l508_c8_0e90_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l508_c8_0e90]
signal result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_0e90_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_0e90_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_0e90_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_0e90_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l508_c8_0e90]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_0e90_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_0e90_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_0e90_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_0e90_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l508_c8_0e90]
signal result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_0e90_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_0e90_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_0e90_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_0e90_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l495_DUPLICATE_7d4e
signal UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l495_DUPLICATE_7d4e_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l495_DUPLICATE_7d4e_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_c1d0( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.device_ram_address := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_device_ram_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_value := ref_toks_7;
      base.is_sp_shift := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l467_c6_09af
BIN_OP_EQ_uxn_opcodes_h_l467_c6_09af : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l467_c6_09af_left,
BIN_OP_EQ_uxn_opcodes_h_l467_c6_09af_right,
BIN_OP_EQ_uxn_opcodes_h_l467_c6_09af_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_56c0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_56c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_56c0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_56c0_return_output);

-- dei_param_MUX_uxn_opcodes_h_l467_c2_54d9
dei_param_MUX_uxn_opcodes_h_l467_c2_54d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l467_c2_54d9_cond,
dei_param_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue,
dei_param_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse,
dei_param_MUX_uxn_opcodes_h_l467_c2_54d9_return_output);

-- t8_MUX_uxn_opcodes_h_l467_c2_54d9
t8_MUX_uxn_opcodes_h_l467_c2_54d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l467_c2_54d9_cond,
t8_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue,
t8_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse,
t8_MUX_uxn_opcodes_h_l467_c2_54d9_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l467_c2_54d9
has_written_to_n_MUX_uxn_opcodes_h_l467_c2_54d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l467_c2_54d9_cond,
has_written_to_n_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l467_c2_54d9_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l467_c2_54d9
current_dei_phase_MUX_uxn_opcodes_h_l467_c2_54d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l467_c2_54d9_cond,
current_dei_phase_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l467_c2_54d9_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l467_c2_54d9
has_written_to_t_MUX_uxn_opcodes_h_l467_c2_54d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l467_c2_54d9_cond,
has_written_to_t_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l467_c2_54d9_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l467_c2_54d9
device_in_result_MUX_uxn_opcodes_h_l467_c2_54d9 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l467_c2_54d9_cond,
device_in_result_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue,
device_in_result_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse,
device_in_result_MUX_uxn_opcodes_h_l467_c2_54d9_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9
is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_54d9
result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_54d9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_54d9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_54d9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_54d9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_54d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_54d9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_54d9_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_54d9
result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_54d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_54d9_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_54d9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_54d9
result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_54d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_54d9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_54d9_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_54d9
result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_54d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_54d9_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_54d9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_54d9
result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_54d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_54d9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_54d9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l467_c2_54d9
result_stack_value_MUX_uxn_opcodes_h_l467_c2_54d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l467_c2_54d9_cond,
result_stack_value_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l467_c2_54d9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_54d9
result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_54d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_54d9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_54d9_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9
is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l479_c11_527e
BIN_OP_EQ_uxn_opcodes_h_l479_c11_527e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l479_c11_527e_left,
BIN_OP_EQ_uxn_opcodes_h_l479_c11_527e_right,
BIN_OP_EQ_uxn_opcodes_h_l479_c11_527e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f249
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f249 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f249_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f249_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f249_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f249_return_output);

-- dei_param_MUX_uxn_opcodes_h_l479_c7_56c0
dei_param_MUX_uxn_opcodes_h_l479_c7_56c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l479_c7_56c0_cond,
dei_param_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue,
dei_param_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse,
dei_param_MUX_uxn_opcodes_h_l479_c7_56c0_return_output);

-- t8_MUX_uxn_opcodes_h_l479_c7_56c0
t8_MUX_uxn_opcodes_h_l479_c7_56c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l479_c7_56c0_cond,
t8_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue,
t8_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse,
t8_MUX_uxn_opcodes_h_l479_c7_56c0_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l479_c7_56c0
has_written_to_n_MUX_uxn_opcodes_h_l479_c7_56c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l479_c7_56c0_cond,
has_written_to_n_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l479_c7_56c0_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l479_c7_56c0
current_dei_phase_MUX_uxn_opcodes_h_l479_c7_56c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l479_c7_56c0_cond,
current_dei_phase_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l479_c7_56c0_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l479_c7_56c0
has_written_to_t_MUX_uxn_opcodes_h_l479_c7_56c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l479_c7_56c0_cond,
has_written_to_t_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l479_c7_56c0_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l479_c7_56c0
device_in_result_MUX_uxn_opcodes_h_l479_c7_56c0 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l479_c7_56c0_cond,
device_in_result_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue,
device_in_result_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse,
device_in_result_MUX_uxn_opcodes_h_l479_c7_56c0_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0
is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_56c0
result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_56c0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_56c0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_56c0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l479_c7_56c0
result_stack_value_MUX_uxn_opcodes_h_l479_c7_56c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l479_c7_56c0_cond,
result_stack_value_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l479_c7_56c0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_56c0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_56c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_56c0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_56c0_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_56c0
result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_56c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_56c0_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_56c0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_56c0
result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_56c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_56c0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_56c0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_56c0
result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_56c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_56c0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_56c0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_56c0
result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_56c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_56c0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_56c0_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0
is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l482_c11_0b26
BIN_OP_EQ_uxn_opcodes_h_l482_c11_0b26 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l482_c11_0b26_left,
BIN_OP_EQ_uxn_opcodes_h_l482_c11_0b26_right,
BIN_OP_EQ_uxn_opcodes_h_l482_c11_0b26_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_e201
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_e201 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_e201_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_e201_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_e201_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_e201_return_output);

-- dei_param_MUX_uxn_opcodes_h_l482_c7_f249
dei_param_MUX_uxn_opcodes_h_l482_c7_f249 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l482_c7_f249_cond,
dei_param_MUX_uxn_opcodes_h_l482_c7_f249_iftrue,
dei_param_MUX_uxn_opcodes_h_l482_c7_f249_iffalse,
dei_param_MUX_uxn_opcodes_h_l482_c7_f249_return_output);

-- t8_MUX_uxn_opcodes_h_l482_c7_f249
t8_MUX_uxn_opcodes_h_l482_c7_f249 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l482_c7_f249_cond,
t8_MUX_uxn_opcodes_h_l482_c7_f249_iftrue,
t8_MUX_uxn_opcodes_h_l482_c7_f249_iffalse,
t8_MUX_uxn_opcodes_h_l482_c7_f249_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f249
has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f249 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f249_cond,
has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f249_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f249_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f249_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f249
current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f249 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f249_cond,
current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f249_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f249_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f249_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f249
has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f249 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f249_cond,
has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f249_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f249_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f249_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l482_c7_f249
device_in_result_MUX_uxn_opcodes_h_l482_c7_f249 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l482_c7_f249_cond,
device_in_result_MUX_uxn_opcodes_h_l482_c7_f249_iftrue,
device_in_result_MUX_uxn_opcodes_h_l482_c7_f249_iffalse,
device_in_result_MUX_uxn_opcodes_h_l482_c7_f249_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f249
is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f249 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f249_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f249_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f249_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f249_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f249
result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f249 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f249_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f249_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f249_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f249_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l482_c7_f249
result_stack_value_MUX_uxn_opcodes_h_l482_c7_f249 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l482_c7_f249_cond,
result_stack_value_MUX_uxn_opcodes_h_l482_c7_f249_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l482_c7_f249_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l482_c7_f249_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f249
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f249 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f249_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f249_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f249_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f249_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f249
result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f249 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f249_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f249_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f249_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f249_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f249
result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f249 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f249_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f249_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f249_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f249_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f249
result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f249 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f249_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f249_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f249_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f249_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f249
result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f249 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f249_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f249_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f249_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f249_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f249
is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f249 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f249_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f249_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f249_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f249_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l485_c32_1c20
BIN_OP_AND_uxn_opcodes_h_l485_c32_1c20 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l485_c32_1c20_left,
BIN_OP_AND_uxn_opcodes_h_l485_c32_1c20_right,
BIN_OP_AND_uxn_opcodes_h_l485_c32_1c20_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l485_c32_92e6
BIN_OP_GT_uxn_opcodes_h_l485_c32_92e6 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l485_c32_92e6_left,
BIN_OP_GT_uxn_opcodes_h_l485_c32_92e6_right,
BIN_OP_GT_uxn_opcodes_h_l485_c32_92e6_return_output);

-- MUX_uxn_opcodes_h_l485_c32_c0be
MUX_uxn_opcodes_h_l485_c32_c0be : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l485_c32_c0be_cond,
MUX_uxn_opcodes_h_l485_c32_c0be_iftrue,
MUX_uxn_opcodes_h_l485_c32_c0be_iffalse,
MUX_uxn_opcodes_h_l485_c32_c0be_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l489_c35_08ad
BIN_OP_PLUS_uxn_opcodes_h_l489_c35_08ad : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l489_c35_08ad_left,
BIN_OP_PLUS_uxn_opcodes_h_l489_c35_08ad_right,
BIN_OP_PLUS_uxn_opcodes_h_l489_c35_08ad_return_output);

-- MUX_uxn_opcodes_h_l489_c15_c2a3
MUX_uxn_opcodes_h_l489_c15_c2a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l489_c15_c2a3_cond,
MUX_uxn_opcodes_h_l489_c15_c2a3_iftrue,
MUX_uxn_opcodes_h_l489_c15_c2a3_iffalse,
MUX_uxn_opcodes_h_l489_c15_c2a3_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l490_c49_f5fe
UNARY_OP_NOT_uxn_opcodes_h_l490_c49_f5fe : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l490_c49_f5fe_expr,
UNARY_OP_NOT_uxn_opcodes_h_l490_c49_f5fe_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l490_c29_8959
BIN_OP_AND_uxn_opcodes_h_l490_c29_8959 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l490_c29_8959_left,
BIN_OP_AND_uxn_opcodes_h_l490_c29_8959_right,
BIN_OP_AND_uxn_opcodes_h_l490_c29_8959_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l490_c8_62c0
BIN_OP_OR_uxn_opcodes_h_l490_c8_62c0 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l490_c8_62c0_left,
BIN_OP_OR_uxn_opcodes_h_l490_c8_62c0_right,
BIN_OP_OR_uxn_opcodes_h_l490_c8_62c0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_591f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_591f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_591f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_591f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_591f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_591f_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l490_c3_e0ed
has_written_to_n_MUX_uxn_opcodes_h_l490_c3_e0ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l490_c3_e0ed_cond,
has_written_to_n_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l490_c3_e0ed
current_dei_phase_MUX_uxn_opcodes_h_l490_c3_e0ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l490_c3_e0ed_cond,
current_dei_phase_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l490_c3_e0ed
has_written_to_t_MUX_uxn_opcodes_h_l490_c3_e0ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l490_c3_e0ed_cond,
has_written_to_t_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l490_c3_e0ed
device_in_result_MUX_uxn_opcodes_h_l490_c3_e0ed : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l490_c3_e0ed_cond,
device_in_result_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue,
device_in_result_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse,
device_in_result_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed
is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l490_c3_e0ed
result_stack_value_MUX_uxn_opcodes_h_l490_c3_e0ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l490_c3_e0ed_cond,
result_stack_value_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_e0ed
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_e0ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_e0ed_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_e0ed
result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_e0ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_e0ed_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_e0ed
result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_e0ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_e0ed_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_e0ed
result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_e0ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_e0ed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed
is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output);

-- device_in_uxn_opcodes_h_l491_c23_b8dc
device_in_uxn_opcodes_h_l491_c23_b8dc : entity work.device_in_0CLK_5af1a430 port map (
clk,
device_in_uxn_opcodes_h_l491_c23_b8dc_CLOCK_ENABLE,
device_in_uxn_opcodes_h_l491_c23_b8dc_device_address,
device_in_uxn_opcodes_h_l491_c23_b8dc_phase,
device_in_uxn_opcodes_h_l491_c23_b8dc_previous_device_ram_read,
device_in_uxn_opcodes_h_l491_c23_b8dc_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l494_c4_7697
BIN_OP_PLUS_uxn_opcodes_h_l494_c4_7697 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l494_c4_7697_left,
BIN_OP_PLUS_uxn_opcodes_h_l494_c4_7697_right,
BIN_OP_PLUS_uxn_opcodes_h_l494_c4_7697_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l495_c9_209a
BIN_OP_AND_uxn_opcodes_h_l495_c9_209a : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l495_c9_209a_left,
BIN_OP_AND_uxn_opcodes_h_l495_c9_209a_right,
BIN_OP_AND_uxn_opcodes_h_l495_c9_209a_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_1913
is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_1913 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_1913_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_1913_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_1913_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_1913_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_1913
is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_1913 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_1913_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_1913_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_1913_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_1913_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_9c75
is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_9c75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_9c75_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_9c75_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_9c75_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_9c75_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l501_c13_bd74
UNARY_OP_NOT_uxn_opcodes_h_l501_c13_bd74 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l501_c13_bd74_expr,
UNARY_OP_NOT_uxn_opcodes_h_l501_c13_bd74_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l501_c8_a10f
has_written_to_n_MUX_uxn_opcodes_h_l501_c8_a10f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l501_c8_a10f_cond,
has_written_to_n_MUX_uxn_opcodes_h_l501_c8_a10f_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l501_c8_a10f_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l501_c8_a10f_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l501_c8_a10f
current_dei_phase_MUX_uxn_opcodes_h_l501_c8_a10f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l501_c8_a10f_cond,
current_dei_phase_MUX_uxn_opcodes_h_l501_c8_a10f_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l501_c8_a10f_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l501_c8_a10f_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l501_c8_a10f
has_written_to_t_MUX_uxn_opcodes_h_l501_c8_a10f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l501_c8_a10f_cond,
has_written_to_t_MUX_uxn_opcodes_h_l501_c8_a10f_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l501_c8_a10f_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l501_c8_a10f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l501_c8_a10f
result_stack_value_MUX_uxn_opcodes_h_l501_c8_a10f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l501_c8_a10f_cond,
result_stack_value_MUX_uxn_opcodes_h_l501_c8_a10f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l501_c8_a10f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l501_c8_a10f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_a10f
result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_a10f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_a10f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_a10f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_a10f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_a10f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_a10f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_a10f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_a10f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_a10f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_a10f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_a10f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_a10f
result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_a10f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_a10f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_a10f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_a10f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_a10f_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l508_c13_4b32
UNARY_OP_NOT_uxn_opcodes_h_l508_c13_4b32 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l508_c13_4b32_expr,
UNARY_OP_NOT_uxn_opcodes_h_l508_c13_4b32_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l508_c8_0e90
has_written_to_n_MUX_uxn_opcodes_h_l508_c8_0e90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l508_c8_0e90_cond,
has_written_to_n_MUX_uxn_opcodes_h_l508_c8_0e90_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l508_c8_0e90_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l508_c8_0e90_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l508_c8_0e90
result_stack_value_MUX_uxn_opcodes_h_l508_c8_0e90 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l508_c8_0e90_cond,
result_stack_value_MUX_uxn_opcodes_h_l508_c8_0e90_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l508_c8_0e90_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l508_c8_0e90_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_0e90
result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_0e90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_0e90_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_0e90_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_0e90_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_0e90_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_0e90
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_0e90 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_0e90_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_0e90_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_0e90_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_0e90_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_0e90
result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_0e90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_0e90_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_0e90_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_0e90_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_0e90_return_output);

-- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l495_DUPLICATE_7d4e
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l495_DUPLICATE_7d4e : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l495_DUPLICATE_7d4e_expr,
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l495_DUPLICATE_7d4e_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l467_c6_09af_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_56c0_return_output,
 dei_param_MUX_uxn_opcodes_h_l467_c2_54d9_return_output,
 t8_MUX_uxn_opcodes_h_l467_c2_54d9_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l467_c2_54d9_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l467_c2_54d9_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l467_c2_54d9_return_output,
 device_in_result_MUX_uxn_opcodes_h_l467_c2_54d9_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_54d9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_54d9_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_54d9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_54d9_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_54d9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_54d9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l467_c2_54d9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_54d9_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l479_c11_527e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f249_return_output,
 dei_param_MUX_uxn_opcodes_h_l479_c7_56c0_return_output,
 t8_MUX_uxn_opcodes_h_l479_c7_56c0_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l479_c7_56c0_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l479_c7_56c0_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l479_c7_56c0_return_output,
 device_in_result_MUX_uxn_opcodes_h_l479_c7_56c0_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_56c0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l479_c7_56c0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_56c0_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_56c0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_56c0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_56c0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_56c0_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l482_c11_0b26_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_e201_return_output,
 dei_param_MUX_uxn_opcodes_h_l482_c7_f249_return_output,
 t8_MUX_uxn_opcodes_h_l482_c7_f249_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f249_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f249_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f249_return_output,
 device_in_result_MUX_uxn_opcodes_h_l482_c7_f249_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f249_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f249_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l482_c7_f249_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f249_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f249_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f249_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f249_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f249_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f249_return_output,
 BIN_OP_AND_uxn_opcodes_h_l485_c32_1c20_return_output,
 BIN_OP_GT_uxn_opcodes_h_l485_c32_92e6_return_output,
 MUX_uxn_opcodes_h_l485_c32_c0be_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l489_c35_08ad_return_output,
 MUX_uxn_opcodes_h_l489_c15_c2a3_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l490_c49_f5fe_return_output,
 BIN_OP_AND_uxn_opcodes_h_l490_c29_8959_return_output,
 BIN_OP_OR_uxn_opcodes_h_l490_c8_62c0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_591f_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output,
 device_in_result_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output,
 device_in_uxn_opcodes_h_l491_c23_b8dc_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l494_c4_7697_return_output,
 BIN_OP_AND_uxn_opcodes_h_l495_c9_209a_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_1913_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_1913_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_9c75_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l501_c13_bd74_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l501_c8_a10f_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l501_c8_a10f_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l501_c8_a10f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l501_c8_a10f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_a10f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_a10f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_a10f_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l508_c13_4b32_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l508_c8_0e90_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l508_c8_0e90_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_0e90_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_0e90_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_0e90_return_output,
 UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l495_DUPLICATE_7d4e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c6_09af_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c6_09af_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c6_09af_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_56c0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_56c0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l479_c7_56c0_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l467_c2_54d9_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l467_c2_54d9_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l479_c7_56c0_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l467_c2_54d9_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l467_c2_54d9_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l479_c7_56c0_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l467_c2_54d9_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l467_c2_54d9_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l473_c3_ab5e : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l479_c7_56c0_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c2_54d9_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c2_54d9_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l479_c7_56c0_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l467_c2_54d9_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l467_c2_54d9_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue : device_in_result_t;
 variable VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l467_c2_54d9_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l479_c7_56c0_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l467_c2_54d9_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l467_c2_54d9_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_56c0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_54d9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_54d9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l474_c3_8aba : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_56c0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_54d9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_54d9_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_56c0_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_54d9_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_54d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_56c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_54d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_54d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l467_c2_54d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_54d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_54d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_56c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_54d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_54d9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l479_c7_56c0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l467_c2_54d9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l467_c2_54d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_56c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_54d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_54d9_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_527e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_527e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_527e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f249_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f249_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f249_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f249_iffalse : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l482_c7_f249_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l479_c7_56c0_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l482_c7_f249_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l479_c7_56c0_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f249_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l479_c7_56c0_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f249_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l479_c7_56c0_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f249_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l479_c7_56c0_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l482_c7_f249_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l479_c7_56c0_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f249_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f249_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_56c0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l482_c7_f249_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l479_c7_56c0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l480_c3_7644 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f249_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_56c0_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f249_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_56c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f249_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_56c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f249_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_56c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f249_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_56c0_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f249_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l482_c11_0b26_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l482_c11_0b26_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l482_c11_0b26_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_e201_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_e201_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_e201_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_e201_iffalse : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l482_c7_f249_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l482_c7_f249_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l482_c7_f249_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l482_c7_f249_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l482_c7_f249_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l482_c7_f249_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f249_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f249_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f249_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f249_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f249_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f249_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f249_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f249_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f249_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l482_c7_f249_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l482_c7_f249_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l482_c7_f249_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f249_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f249_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f249_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f249_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f249_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f249_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l482_c7_f249_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l482_c7_f249_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l482_c7_f249_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f249_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f249_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f249_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f249_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f249_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f249_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f249_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f249_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f249_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f249_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f249_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f249_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f249_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f249_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f249_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f249_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f249_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f249_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l485_c32_c0be_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l485_c32_c0be_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l485_c32_c0be_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l485_c32_1c20_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l485_c32_1c20_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l485_c32_1c20_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l485_c32_92e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l485_c32_92e6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l485_c32_92e6_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l485_c32_c0be_return_output : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l489_c15_c2a3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l489_c15_c2a3_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l489_c15_c2a3_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l489_c35_08ad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l489_c35_08ad_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l489_c35_08ad_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l489_c15_c2a3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l490_c8_62c0_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l490_c29_8959_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l490_c49_f5fe_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l490_c49_f5fe_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l490_c29_8959_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l490_c29_8959_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l490_c8_62c0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l490_c8_62c0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_591f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_591f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_591f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_591f_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l501_c8_a10f_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l490_c3_e0ed_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l494_c4_23a6 : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l501_c8_a10f_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l490_c3_e0ed_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l501_c8_a10f_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l490_c3_e0ed_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l490_c3_e0ed_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_1913_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l501_c8_a10f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l490_c3_e0ed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_a10f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_e0ed_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_e0ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_a10f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_e0ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_a10f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_e0ed_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_1913_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed_cond : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l491_c23_b8dc_device_address : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l491_c23_b8dc_phase : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l491_c23_b8dc_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l491_c23_b8dc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l491_c23_b8dc_return_output : device_in_result_t;
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l492_c32_5a6a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l494_c4_7697_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l494_c4_7697_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l494_c4_7697_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l495_c9_209a_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l495_c9_209a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l495_c9_209a_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_1913_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_1913_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_1913_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_1913_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_1913_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_9c75_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_1913_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_9c75_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_9c75_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_9c75_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l501_c13_bd74_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l501_c13_bd74_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l501_c8_a10f_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l501_c8_a10f_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l508_c8_0e90_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l501_c8_a10f_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l501_c8_a10f_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l502_c4_fde2 : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l501_c8_a10f_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l501_c8_a10f_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l501_c8_a10f_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l501_c8_a10f_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l501_c8_a10f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l501_c8_a10f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l501_c8_a10f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l508_c8_0e90_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l501_c8_a10f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_a10f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_a10f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_0e90_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_a10f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_a10f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l504_c4_fdbd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_a10f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_0e90_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_a10f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_a10f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_a10f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_0e90_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_a10f_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l508_c13_4b32_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l508_c13_4b32_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l508_c8_0e90_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l508_c8_0e90_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l508_c8_0e90_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l508_c8_0e90_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l508_c8_0e90_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l508_c8_0e90_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_0e90_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_0e90_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_0e90_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_0e90_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l509_c4_dc5b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_0e90_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_0e90_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_0e90_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_0e90_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_0e90_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l467_l479_l482_DUPLICATE_ac55_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l467_l490_l479_l482_DUPLICATE_0905_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l508_l467_l479_l482_DUPLICATE_5afc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l479_l467_l508_l490_l482_DUPLICATE_3e92_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l467_l479_DUPLICATE_54d9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l479_l508_l490_l501_l482_DUPLICATE_d37d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l508_l490_l482_DUPLICATE_9df7_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l495_DUPLICATE_7d4e_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l495_DUPLICATE_7d4e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l495_l497_DUPLICATE_b35c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l510_l505_DUPLICATE_1dba_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c1d0_uxn_opcodes_h_l519_l461_DUPLICATE_e902_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c6_09af_right := to_unsigned(0, 1);
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l480_c3_7644 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l480_c3_7644;
     VAR_current_dei_phase_uxn_opcodes_h_l502_c4_fde2 := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l501_c8_a10f_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l502_c4_fde2;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l509_c4_dc5b := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_0e90_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l509_c4_dc5b;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_591f_iffalse := to_unsigned(0, 1);
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l485_c32_c0be_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l482_c11_0b26_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_0e90_iffalse := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l485_c32_c0be_iffalse := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_0e90_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l494_c4_7697_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_e201_iftrue := to_unsigned(0, 1);
     VAR_current_dei_phase_uxn_opcodes_h_l473_c3_ab5e := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l473_c3_ab5e;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l489_c35_08ad_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l485_c32_1c20_right := to_unsigned(128, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f249_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_a10f_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l474_c3_8aba := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l474_c3_8aba;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_527e_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f249_iftrue := to_unsigned(1, 1);
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_9c75_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f249_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l504_c4_fdbd := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_a10f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l504_c4_fdbd;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_1913_iftrue := to_unsigned(1, 1);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l501_c8_a10f_iftrue := to_unsigned(1, 1);
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l508_c8_0e90_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l485_c32_92e6_right := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l494_c4_7697_left := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f249_iftrue := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l501_c8_a10f_iffalse := current_dei_phase;
     VAR_device_in_uxn_opcodes_h_l491_c23_b8dc_phase := current_dei_phase;
     VAR_dei_param_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue := dei_param;
     VAR_dei_param_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue := dei_param;
     VAR_dei_param_MUX_uxn_opcodes_h_l482_c7_f249_iftrue := dei_param;
     VAR_device_in_result_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l482_c7_f249_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse := device_in_result;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l508_c13_4b32_expr := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f249_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l501_c8_a10f_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l508_c8_0e90_iffalse := has_written_to_n;
     VAR_BIN_OP_AND_uxn_opcodes_h_l490_c29_8959_left := has_written_to_t;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l501_c13_bd74_expr := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f249_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l501_c8_a10f_iffalse := has_written_to_t;
     VAR_BIN_OP_AND_uxn_opcodes_h_l485_c32_1c20_left := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l489_c15_c2a3_cond := is_first_dei_done;
     VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l495_DUPLICATE_7d4e_expr := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f249_iftrue := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_1913_iffalse := is_first_dei_done;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l490_c49_f5fe_expr := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f249_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_1913_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_9c75_iffalse := is_second_dei_done;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c6_09af_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_527e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l482_c11_0b26_left := VAR_phase;
     VAR_device_in_uxn_opcodes_h_l491_c23_b8dc_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l482_c7_f249_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l489_c35_08ad_left := t8;
     VAR_MUX_uxn_opcodes_h_l489_c15_c2a3_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l482_c7_f249_iffalse := t8;
     -- UNARY_OP_NOT[uxn_opcodes_h_l508_c13_4b32] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l508_c13_4b32_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l508_c13_4b32_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l508_c13_4b32_return_output := UNARY_OP_NOT_uxn_opcodes_h_l508_c13_4b32_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l508_l467_l479_l482_DUPLICATE_5afc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l508_l467_l479_l482_DUPLICATE_5afc_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l479_l508_l490_l501_l482_DUPLICATE_d37d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l479_l508_l490_l501_l482_DUPLICATE_d37d_return_output := result.is_opc_done;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l467_l479_l482_DUPLICATE_ac55 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l467_l479_l482_DUPLICATE_ac55_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l508_l490_l482_DUPLICATE_9df7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l508_l490_l482_DUPLICATE_9df7_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l467_l490_l479_l482_DUPLICATE_0905 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l467_l490_l479_l482_DUPLICATE_0905_return_output := result.device_ram_address;

     -- BIN_OP_PLUS[uxn_opcodes_h_l494_c4_7697] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l494_c4_7697_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l494_c4_7697_left;
     BIN_OP_PLUS_uxn_opcodes_h_l494_c4_7697_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l494_c4_7697_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l494_c4_7697_return_output := BIN_OP_PLUS_uxn_opcodes_h_l494_c4_7697_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l467_c6_09af] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l467_c6_09af_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c6_09af_left;
     BIN_OP_EQ_uxn_opcodes_h_l467_c6_09af_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c6_09af_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c6_09af_return_output := BIN_OP_EQ_uxn_opcodes_h_l467_c6_09af_return_output;

     -- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l495_DUPLICATE_7d4e LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l495_DUPLICATE_7d4e_expr <= VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l495_DUPLICATE_7d4e_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l495_DUPLICATE_7d4e_return_output := UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l495_DUPLICATE_7d4e_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l489_c35_08ad] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l489_c35_08ad_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l489_c35_08ad_left;
     BIN_OP_PLUS_uxn_opcodes_h_l489_c35_08ad_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l489_c35_08ad_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l489_c35_08ad_return_output := BIN_OP_PLUS_uxn_opcodes_h_l489_c35_08ad_return_output;

     -- result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l467_c2_54d9] LATENCY=0
     VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l467_c2_54d9_return_output := result.is_device_ram_write;

     -- BIN_OP_AND[uxn_opcodes_h_l485_c32_1c20] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l485_c32_1c20_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l485_c32_1c20_left;
     BIN_OP_AND_uxn_opcodes_h_l485_c32_1c20_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l485_c32_1c20_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l485_c32_1c20_return_output := BIN_OP_AND_uxn_opcodes_h_l485_c32_1c20_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l501_c13_bd74] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l501_c13_bd74_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l501_c13_bd74_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l501_c13_bd74_return_output := UNARY_OP_NOT_uxn_opcodes_h_l501_c13_bd74_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l479_l467_l508_l490_l482_DUPLICATE_3e92 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l479_l467_l508_l490_l482_DUPLICATE_3e92_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l467_l479_DUPLICATE_54d9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l467_l479_DUPLICATE_54d9_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l510_l505_DUPLICATE_1dba LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l510_l505_DUPLICATE_1dba_return_output := device_in_result.dei_value;

     -- UNARY_OP_NOT[uxn_opcodes_h_l490_c49_f5fe] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l490_c49_f5fe_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l490_c49_f5fe_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l490_c49_f5fe_return_output := UNARY_OP_NOT_uxn_opcodes_h_l490_c49_f5fe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l482_c11_0b26] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l482_c11_0b26_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l482_c11_0b26_left;
     BIN_OP_EQ_uxn_opcodes_h_l482_c11_0b26_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l482_c11_0b26_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l482_c11_0b26_return_output := BIN_OP_EQ_uxn_opcodes_h_l482_c11_0b26_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l479_c11_527e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l479_c11_527e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_527e_left;
     BIN_OP_EQ_uxn_opcodes_h_l479_c11_527e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_527e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_527e_return_output := BIN_OP_EQ_uxn_opcodes_h_l479_c11_527e_return_output;

     -- device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6[uxn_opcodes_h_l467_c2_54d9] LATENCY=0
     VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l467_c2_54d9_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6(
     device_in_result,
     to_unsigned(0, 1));

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l485_c32_92e6_left := VAR_BIN_OP_AND_uxn_opcodes_h_l485_c32_1c20_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_56c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c6_09af_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c2_54d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c6_09af_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l467_c2_54d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c6_09af_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l467_c2_54d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c6_09af_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l467_c2_54d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c6_09af_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l467_c2_54d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c6_09af_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c6_09af_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c6_09af_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_54d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c6_09af_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_54d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c6_09af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_54d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c6_09af_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_54d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c6_09af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_54d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c6_09af_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_54d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c6_09af_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_54d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c6_09af_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l467_c2_54d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c6_09af_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l467_c2_54d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c6_09af_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f249_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_527e_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l479_c7_56c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_527e_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l479_c7_56c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_527e_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l479_c7_56c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_527e_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l479_c7_56c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_527e_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l479_c7_56c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_527e_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_527e_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_527e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_56c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_527e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_56c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_527e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_56c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_527e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_56c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_527e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_56c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_527e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_56c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_527e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l479_c7_56c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_527e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l479_c7_56c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_527e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_e201_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l482_c11_0b26_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f249_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l482_c11_0b26_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l482_c7_f249_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l482_c11_0b26_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l482_c7_f249_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l482_c11_0b26_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f249_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l482_c11_0b26_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f249_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l482_c11_0b26_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f249_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l482_c11_0b26_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f249_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l482_c11_0b26_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f249_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l482_c11_0b26_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f249_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l482_c11_0b26_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f249_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l482_c11_0b26_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f249_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l482_c11_0b26_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f249_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l482_c11_0b26_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f249_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l482_c11_0b26_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l482_c7_f249_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l482_c11_0b26_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l482_c7_f249_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l482_c11_0b26_return_output;
     VAR_MUX_uxn_opcodes_h_l489_c15_c2a3_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l489_c35_08ad_return_output, 8);
     VAR_current_dei_phase_uxn_opcodes_h_l494_c4_23a6 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l494_c4_7697_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l467_l479_l482_DUPLICATE_ac55_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l467_l479_l482_DUPLICATE_ac55_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f249_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l467_l479_l482_DUPLICATE_ac55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l479_l508_l490_l501_l482_DUPLICATE_d37d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f249_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l479_l508_l490_l501_l482_DUPLICATE_d37d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l479_l508_l490_l501_l482_DUPLICATE_d37d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_a10f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l479_l508_l490_l501_l482_DUPLICATE_d37d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_0e90_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l479_l508_l490_l501_l482_DUPLICATE_d37d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l467_l479_DUPLICATE_54d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l467_l479_DUPLICATE_54d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l508_l467_l479_l482_DUPLICATE_5afc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l508_l467_l479_l482_DUPLICATE_5afc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f249_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l508_l467_l479_l482_DUPLICATE_5afc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_0e90_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l508_l467_l479_l482_DUPLICATE_5afc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l501_c8_a10f_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l510_l505_DUPLICATE_1dba_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l508_c8_0e90_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l510_l505_DUPLICATE_1dba_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l467_l490_l479_l482_DUPLICATE_0905_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l467_l490_l479_l482_DUPLICATE_0905_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f249_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l467_l490_l479_l482_DUPLICATE_0905_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l467_l490_l479_l482_DUPLICATE_0905_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f249_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l508_l490_l482_DUPLICATE_9df7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l508_l490_l482_DUPLICATE_9df7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_0e90_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l508_l490_l482_DUPLICATE_9df7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l479_l467_l508_l490_l482_DUPLICATE_3e92_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l479_l467_l508_l490_l482_DUPLICATE_3e92_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l482_c7_f249_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l479_l467_l508_l490_l482_DUPLICATE_3e92_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l479_l467_l508_l490_l482_DUPLICATE_3e92_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l508_c8_0e90_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l479_l467_l508_l490_l482_DUPLICATE_3e92_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l490_c29_8959_right := VAR_UNARY_OP_NOT_uxn_opcodes_h_l490_c49_f5fe_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l501_c8_a10f_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l501_c13_bd74_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l501_c8_a10f_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l501_c13_bd74_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l501_c8_a10f_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l501_c13_bd74_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_a10f_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l501_c13_bd74_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_a10f_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l501_c13_bd74_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_a10f_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l501_c13_bd74_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l501_c8_a10f_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l501_c13_bd74_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l508_c8_0e90_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l508_c13_4b32_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_0e90_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l508_c13_4b32_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_0e90_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l508_c13_4b32_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_0e90_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l508_c13_4b32_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l508_c8_0e90_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l508_c13_4b32_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l495_c9_209a_left := VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l495_DUPLICATE_7d4e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l490_c8_62c0_left := VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l495_DUPLICATE_7d4e_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue := VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l467_c2_54d9_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse := VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l467_c2_54d9_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l494_c4_23a6;
     -- current_dei_phase_MUX[uxn_opcodes_h_l501_c8_a10f] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l501_c8_a10f_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l501_c8_a10f_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l501_c8_a10f_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l501_c8_a10f_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l501_c8_a10f_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l501_c8_a10f_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l501_c8_a10f_return_output := current_dei_phase_MUX_uxn_opcodes_h_l501_c8_a10f_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l501_c8_a10f] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l501_c8_a10f_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l501_c8_a10f_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l501_c8_a10f_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l501_c8_a10f_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l501_c8_a10f_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l501_c8_a10f_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l501_c8_a10f_return_output := has_written_to_t_MUX_uxn_opcodes_h_l501_c8_a10f_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l490_c29_8959] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l490_c29_8959_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l490_c29_8959_left;
     BIN_OP_AND_uxn_opcodes_h_l490_c29_8959_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l490_c29_8959_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l490_c29_8959_return_output := BIN_OP_AND_uxn_opcodes_h_l490_c29_8959_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l482_c7_f249] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f249_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f249_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f249_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f249_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f249_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f249_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f249_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f249_return_output;

     -- MUX[uxn_opcodes_h_l489_c15_c2a3] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l489_c15_c2a3_cond <= VAR_MUX_uxn_opcodes_h_l489_c15_c2a3_cond;
     MUX_uxn_opcodes_h_l489_c15_c2a3_iftrue <= VAR_MUX_uxn_opcodes_h_l489_c15_c2a3_iftrue;
     MUX_uxn_opcodes_h_l489_c15_c2a3_iffalse <= VAR_MUX_uxn_opcodes_h_l489_c15_c2a3_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l489_c15_c2a3_return_output := MUX_uxn_opcodes_h_l489_c15_c2a3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l479_c7_56c0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_56c0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_56c0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_56c0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_56c0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l508_c8_0e90] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_0e90_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_0e90_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_0e90_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_0e90_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_0e90_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_0e90_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_0e90_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_0e90_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l508_c8_0e90] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_0e90_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_0e90_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_0e90_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_0e90_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_0e90_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_0e90_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_0e90_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_0e90_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l508_c8_0e90] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_0e90_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_0e90_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_0e90_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_0e90_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_0e90_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_0e90_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_0e90_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_0e90_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l508_c8_0e90] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l508_c8_0e90_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l508_c8_0e90_cond;
     result_stack_value_MUX_uxn_opcodes_h_l508_c8_0e90_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l508_c8_0e90_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l508_c8_0e90_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l508_c8_0e90_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l508_c8_0e90_return_output := result_stack_value_MUX_uxn_opcodes_h_l508_c8_0e90_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l467_c2_54d9] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_54d9_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_54d9_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_54d9_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_54d9_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l485_c32_92e6] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l485_c32_92e6_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l485_c32_92e6_left;
     BIN_OP_GT_uxn_opcodes_h_l485_c32_92e6_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l485_c32_92e6_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l485_c32_92e6_return_output := BIN_OP_GT_uxn_opcodes_h_l485_c32_92e6_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l508_c8_0e90] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l508_c8_0e90_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l508_c8_0e90_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l508_c8_0e90_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l508_c8_0e90_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l508_c8_0e90_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l508_c8_0e90_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l508_c8_0e90_return_output := has_written_to_n_MUX_uxn_opcodes_h_l508_c8_0e90_return_output;

     -- t8_MUX[uxn_opcodes_h_l482_c7_f249] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l482_c7_f249_cond <= VAR_t8_MUX_uxn_opcodes_h_l482_c7_f249_cond;
     t8_MUX_uxn_opcodes_h_l482_c7_f249_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l482_c7_f249_iftrue;
     t8_MUX_uxn_opcodes_h_l482_c7_f249_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l482_c7_f249_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l482_c7_f249_return_output := t8_MUX_uxn_opcodes_h_l482_c7_f249_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_opcodes_h_l490_c8_62c0_right := VAR_BIN_OP_AND_uxn_opcodes_h_l490_c29_8959_return_output;
     VAR_MUX_uxn_opcodes_h_l485_c32_c0be_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l485_c32_92e6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f249_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_56c0_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l482_c7_f249_iffalse := VAR_MUX_uxn_opcodes_h_l489_c15_c2a3_return_output;
     VAR_device_in_uxn_opcodes_h_l491_c23_b8dc_device_address := VAR_MUX_uxn_opcodes_h_l489_c15_c2a3_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l501_c8_a10f_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l501_c8_a10f_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l508_c8_0e90_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l501_c8_a10f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_a10f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_0e90_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f249_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_a10f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_0e90_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_a10f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_0e90_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l501_c8_a10f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l508_c8_0e90_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse := VAR_t8_MUX_uxn_opcodes_h_l482_c7_f249_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l482_c7_f249] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f249_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f249_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f249_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f249_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f249_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f249_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f249_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f249_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l479_c7_56c0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_56c0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_56c0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_56c0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_56c0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l501_c8_a10f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_a10f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_a10f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_a10f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_a10f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_a10f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_a10f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_a10f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_a10f_return_output;

     -- MUX[uxn_opcodes_h_l485_c32_c0be] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l485_c32_c0be_cond <= VAR_MUX_uxn_opcodes_h_l485_c32_c0be_cond;
     MUX_uxn_opcodes_h_l485_c32_c0be_iftrue <= VAR_MUX_uxn_opcodes_h_l485_c32_c0be_iftrue;
     MUX_uxn_opcodes_h_l485_c32_c0be_iffalse <= VAR_MUX_uxn_opcodes_h_l485_c32_c0be_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l485_c32_c0be_return_output := MUX_uxn_opcodes_h_l485_c32_c0be_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l490_c8_62c0] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l490_c8_62c0_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l490_c8_62c0_left;
     BIN_OP_OR_uxn_opcodes_h_l490_c8_62c0_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l490_c8_62c0_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l490_c8_62c0_return_output := BIN_OP_OR_uxn_opcodes_h_l490_c8_62c0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l501_c8_a10f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_a10f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_a10f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_a10f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_a10f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_a10f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_a10f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_a10f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_a10f_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l482_c7_f249] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l482_c7_f249_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l482_c7_f249_cond;
     dei_param_MUX_uxn_opcodes_h_l482_c7_f249_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l482_c7_f249_iftrue;
     dei_param_MUX_uxn_opcodes_h_l482_c7_f249_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l482_c7_f249_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l482_c7_f249_return_output := dei_param_MUX_uxn_opcodes_h_l482_c7_f249_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l501_c8_a10f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l501_c8_a10f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l501_c8_a10f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l501_c8_a10f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l501_c8_a10f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l501_c8_a10f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l501_c8_a10f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l501_c8_a10f_return_output := result_stack_value_MUX_uxn_opcodes_h_l501_c8_a10f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l501_c8_a10f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_a10f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_a10f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_a10f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_a10f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_a10f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_a10f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_a10f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_a10f_return_output;

     -- t8_MUX[uxn_opcodes_h_l479_c7_56c0] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l479_c7_56c0_cond <= VAR_t8_MUX_uxn_opcodes_h_l479_c7_56c0_cond;
     t8_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue;
     t8_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l479_c7_56c0_return_output := t8_MUX_uxn_opcodes_h_l479_c7_56c0_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l501_c8_a10f] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l501_c8_a10f_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l501_c8_a10f_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l501_c8_a10f_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l501_c8_a10f_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l501_c8_a10f_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l501_c8_a10f_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l501_c8_a10f_return_output := has_written_to_n_MUX_uxn_opcodes_h_l501_c8_a10f_return_output;

     -- Submodule level 3
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_591f_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l490_c8_62c0_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l490_c3_e0ed_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l490_c8_62c0_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l490_c3_e0ed_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l490_c8_62c0_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l490_c3_e0ed_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l490_c8_62c0_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l490_c3_e0ed_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l490_c8_62c0_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l490_c8_62c0_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l490_c8_62c0_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_e0ed_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l490_c8_62c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_e0ed_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l490_c8_62c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_e0ed_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l490_c8_62c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_e0ed_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l490_c8_62c0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l490_c3_e0ed_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l490_c8_62c0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_e201_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f249_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f249_iftrue := VAR_MUX_uxn_opcodes_h_l485_c32_c0be_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse := VAR_dei_param_MUX_uxn_opcodes_h_l482_c7_f249_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l501_c8_a10f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_a10f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_56c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_a10f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_a10f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l501_c8_a10f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse := VAR_t8_MUX_uxn_opcodes_h_l479_c7_56c0_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l467_c2_54d9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_54d9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_54d9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_54d9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_54d9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l490_c3_e0ed] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l490_c3_e0ed_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l490_c3_e0ed_cond;
     result_stack_value_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output := result_stack_value_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l490_c3_e0ed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_e0ed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_e0ed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l490_c3_e0ed] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_e0ed_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_e0ed_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output;

     -- t8_MUX[uxn_opcodes_h_l467_c2_54d9] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l467_c2_54d9_cond <= VAR_t8_MUX_uxn_opcodes_h_l467_c2_54d9_cond;
     t8_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue;
     t8_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l467_c2_54d9_return_output := t8_MUX_uxn_opcodes_h_l467_c2_54d9_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l479_c7_56c0] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l479_c7_56c0_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l479_c7_56c0_cond;
     dei_param_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue;
     dei_param_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l479_c7_56c0_return_output := dei_param_MUX_uxn_opcodes_h_l479_c7_56c0_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l490_c3_e0ed] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l490_c3_e0ed_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l490_c3_e0ed_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output := has_written_to_n_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l482_c7_f249] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f249_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f249_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f249_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f249_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f249_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f249_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f249_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f249_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l490_c3_e0ed] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l490_c3_e0ed_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l490_c3_e0ed_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output := has_written_to_t_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l487_c1_e201] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_e201_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_e201_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_e201_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_e201_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_e201_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_e201_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_e201_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_e201_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l490_c3_e0ed] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l490_c3_e0ed_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l490_c3_e0ed_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output := current_dei_phase_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l490_c3_e0ed] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_e0ed_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_e0ed_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_591f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_e201_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f249_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse := VAR_dei_param_MUX_uxn_opcodes_h_l479_c7_56c0_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f249_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f249_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f249_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f249_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f249_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f249_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l482_c7_f249_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l467_c2_54d9_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l482_c7_f249] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f249_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f249_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f249_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f249_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f249_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f249_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f249_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f249_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l482_c7_f249] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f249_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f249_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f249_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f249_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f249_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f249_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f249_return_output := current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f249_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l482_c7_f249] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f249_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f249_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f249_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f249_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f249_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f249_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f249_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f249_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l490_c1_591f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_591f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_591f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_591f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_591f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_591f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_591f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_591f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_591f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l482_c7_f249] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l482_c7_f249_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l482_c7_f249_cond;
     result_stack_value_MUX_uxn_opcodes_h_l482_c7_f249_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l482_c7_f249_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l482_c7_f249_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l482_c7_f249_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l482_c7_f249_return_output := result_stack_value_MUX_uxn_opcodes_h_l482_c7_f249_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l482_c7_f249] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f249_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f249_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f249_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f249_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f249_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f249_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f249_return_output := has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f249_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l467_c2_54d9] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l467_c2_54d9_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l467_c2_54d9_cond;
     dei_param_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue;
     dei_param_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l467_c2_54d9_return_output := dei_param_MUX_uxn_opcodes_h_l467_c2_54d9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l482_c7_f249] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f249_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f249_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f249_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f249_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f249_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f249_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f249_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f249_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l479_c7_56c0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_56c0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_56c0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_56c0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_56c0_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l482_c7_f249] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f249_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f249_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f249_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f249_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f249_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f249_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f249_return_output := has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f249_return_output;

     -- Submodule level 5
     VAR_device_in_uxn_opcodes_h_l491_c23_b8dc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_591f_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f249_return_output;
     REG_VAR_dei_param := VAR_dei_param_MUX_uxn_opcodes_h_l467_c2_54d9_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f249_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f249_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f249_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f249_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_56c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f249_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l482_c7_f249_return_output;
     -- device_in[uxn_opcodes_h_l491_c23_b8dc] LATENCY=0
     -- Clock enable
     device_in_uxn_opcodes_h_l491_c23_b8dc_CLOCK_ENABLE <= VAR_device_in_uxn_opcodes_h_l491_c23_b8dc_CLOCK_ENABLE;
     -- Inputs
     device_in_uxn_opcodes_h_l491_c23_b8dc_device_address <= VAR_device_in_uxn_opcodes_h_l491_c23_b8dc_device_address;
     device_in_uxn_opcodes_h_l491_c23_b8dc_phase <= VAR_device_in_uxn_opcodes_h_l491_c23_b8dc_phase;
     device_in_uxn_opcodes_h_l491_c23_b8dc_previous_device_ram_read <= VAR_device_in_uxn_opcodes_h_l491_c23_b8dc_previous_device_ram_read;
     -- Outputs
     VAR_device_in_uxn_opcodes_h_l491_c23_b8dc_return_output := device_in_uxn_opcodes_h_l491_c23_b8dc_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l479_c7_56c0] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l479_c7_56c0_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l479_c7_56c0_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l479_c7_56c0_return_output := current_dei_phase_MUX_uxn_opcodes_h_l479_c7_56c0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l479_c7_56c0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l479_c7_56c0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l479_c7_56c0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l479_c7_56c0_return_output := result_stack_value_MUX_uxn_opcodes_h_l479_c7_56c0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l479_c7_56c0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_56c0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_56c0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_56c0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_56c0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l467_c2_54d9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_54d9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_54d9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_54d9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_54d9_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l479_c7_56c0] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l479_c7_56c0_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l479_c7_56c0_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l479_c7_56c0_return_output := has_written_to_n_MUX_uxn_opcodes_h_l479_c7_56c0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l479_c7_56c0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_56c0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_56c0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_56c0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_56c0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l479_c7_56c0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_56c0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_56c0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_56c0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_56c0_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l479_c7_56c0] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l479_c7_56c0_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l479_c7_56c0_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l479_c7_56c0_return_output := has_written_to_t_MUX_uxn_opcodes_h_l479_c7_56c0_return_output;

     -- Submodule level 6
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l479_c7_56c0_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue := VAR_device_in_uxn_opcodes_h_l491_c23_b8dc_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l479_c7_56c0_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l479_c7_56c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_56c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_56c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_56c0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l479_c7_56c0_return_output;
     -- CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l495_l497_DUPLICATE_b35c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l495_l497_DUPLICATE_b35c_return_output := VAR_device_in_uxn_opcodes_h_l491_c23_b8dc_return_output.is_dei_done;

     -- has_written_to_n_MUX[uxn_opcodes_h_l467_c2_54d9] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l467_c2_54d9_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l467_c2_54d9_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l467_c2_54d9_return_output := has_written_to_n_MUX_uxn_opcodes_h_l467_c2_54d9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l467_c2_54d9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_54d9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_54d9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_54d9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_54d9_return_output;

     -- CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d[uxn_opcodes_h_l492_c32_5a6a] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l492_c32_5a6a_return_output := VAR_device_in_uxn_opcodes_h_l491_c23_b8dc_return_output.device_ram_address;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l467_c2_54d9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_54d9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_54d9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_54d9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_54d9_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l490_c3_e0ed] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l490_c3_e0ed_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l490_c3_e0ed_cond;
     device_in_result_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output := device_in_result_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l467_c2_54d9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_54d9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_54d9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_54d9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_54d9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l467_c2_54d9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l467_c2_54d9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l467_c2_54d9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l467_c2_54d9_return_output := result_stack_value_MUX_uxn_opcodes_h_l467_c2_54d9_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l467_c2_54d9] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l467_c2_54d9_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l467_c2_54d9_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l467_c2_54d9_return_output := has_written_to_t_MUX_uxn_opcodes_h_l467_c2_54d9_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l467_c2_54d9] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l467_c2_54d9_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c2_54d9_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c2_54d9_return_output := current_dei_phase_MUX_uxn_opcodes_h_l467_c2_54d9_return_output;

     -- Submodule level 7
     VAR_BIN_OP_AND_uxn_opcodes_h_l495_c9_209a_right := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l495_l497_DUPLICATE_b35c_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_9c75_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l495_l497_DUPLICATE_b35c_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l492_c32_5a6a_return_output;
     REG_VAR_current_dei_phase := VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c2_54d9_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l482_c7_f249_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output;
     REG_VAR_has_written_to_n := VAR_has_written_to_n_MUX_uxn_opcodes_h_l467_c2_54d9_return_output;
     REG_VAR_has_written_to_t := VAR_has_written_to_t_MUX_uxn_opcodes_h_l467_c2_54d9_return_output;
     -- BIN_OP_AND[uxn_opcodes_h_l495_c9_209a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l495_c9_209a_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l495_c9_209a_left;
     BIN_OP_AND_uxn_opcodes_h_l495_c9_209a_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l495_c9_209a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l495_c9_209a_return_output := BIN_OP_AND_uxn_opcodes_h_l495_c9_209a_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l482_c7_f249] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l482_c7_f249_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l482_c7_f249_cond;
     device_in_result_MUX_uxn_opcodes_h_l482_c7_f249_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l482_c7_f249_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l482_c7_f249_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l482_c7_f249_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l482_c7_f249_return_output := device_in_result_MUX_uxn_opcodes_h_l482_c7_f249_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l490_c3_e0ed] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_e0ed_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_e0ed_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l497_c11_9c75] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_9c75_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_9c75_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_9c75_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_9c75_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_9c75_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_9c75_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_9c75_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_9c75_return_output;

     -- Submodule level 8
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_1913_cond := VAR_BIN_OP_AND_uxn_opcodes_h_l495_c9_209a_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_1913_cond := VAR_BIN_OP_AND_uxn_opcodes_h_l495_c9_209a_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l482_c7_f249_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_1913_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_9c75_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f249_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output;
     -- is_second_dei_done_MUX[uxn_opcodes_h_l495_c4_1913] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_1913_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_1913_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_1913_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_1913_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_1913_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_1913_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_1913_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_1913_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l479_c7_56c0] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l479_c7_56c0_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l479_c7_56c0_cond;
     device_in_result_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l479_c7_56c0_return_output := device_in_result_MUX_uxn_opcodes_h_l479_c7_56c0_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l495_c4_1913] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_1913_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_1913_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_1913_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_1913_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_1913_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_1913_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_1913_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_1913_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l482_c7_f249] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f249_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f249_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f249_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f249_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f249_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f249_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f249_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f249_return_output;

     -- Submodule level 9
     VAR_device_in_result_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l479_c7_56c0_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_1913_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_1913_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f249_return_output;
     -- is_second_dei_done_MUX[uxn_opcodes_h_l490_c3_e0ed] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l479_c7_56c0] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_56c0_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_56c0_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_56c0_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_56c0_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l467_c2_54d9] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l467_c2_54d9_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l467_c2_54d9_cond;
     device_in_result_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l467_c2_54d9_return_output := device_in_result_MUX_uxn_opcodes_h_l467_c2_54d9_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l490_c3_e0ed] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output;

     -- Submodule level 10
     REG_VAR_device_in_result := VAR_device_in_result_MUX_uxn_opcodes_h_l467_c2_54d9_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f249_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f249_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_e0ed_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_56c0_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l467_c2_54d9] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_54d9_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_54d9_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_54d9_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_54d9_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l482_c7_f249] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f249_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f249_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f249_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f249_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f249_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f249_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f249_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f249_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l482_c7_f249] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f249_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f249_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f249_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f249_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f249_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f249_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f249_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f249_return_output;

     -- Submodule level 11
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f249_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f249_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c1d0_uxn_opcodes_h_l519_l461_DUPLICATE_e902 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c1d0_uxn_opcodes_h_l519_l461_DUPLICATE_e902_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c1d0(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_54d9_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_54d9_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_54d9_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_54d9_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_54d9_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_54d9_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l467_c2_54d9_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_54d9_return_output);

     -- is_second_dei_done_MUX[uxn_opcodes_h_l479_c7_56c0] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l479_c7_56c0] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0_return_output;

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c1d0_uxn_opcodes_h_l519_l461_DUPLICATE_e902_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c1d0_uxn_opcodes_h_l519_l461_DUPLICATE_e902_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_56c0_return_output;
     -- is_second_dei_done_MUX[uxn_opcodes_h_l467_c2_54d9] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l467_c2_54d9] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9_return_output;

     -- Submodule level 13
     REG_VAR_is_first_dei_done := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9_return_output;
     REG_VAR_is_second_dei_done := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_54d9_return_output;
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
