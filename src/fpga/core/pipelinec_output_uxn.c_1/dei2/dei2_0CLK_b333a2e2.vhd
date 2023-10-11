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
-- Submodules: 97
entity dei2_0CLK_b333a2e2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end dei2_0CLK_b333a2e2;
architecture arch of dei2_0CLK_b333a2e2 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l467_c6_40ea]
signal BIN_OP_EQ_uxn_opcodes_h_l467_c6_40ea_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l467_c6_40ea_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l467_c6_40ea_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l467_c1_f8b7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c1_f8b7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c1_f8b7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c1_f8b7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c1_f8b7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l479_c7_e9a8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_e9a8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l467_c2_b1f7]
signal is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l467_c2_b1f7]
signal is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l467_c2_b1f7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_b1f7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l467_c2_b1f7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_b1f7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l467_c2_b1f7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_b1f7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l467_c2_b1f7]
signal result_stack_value_MUX_uxn_opcodes_h_l467_c2_b1f7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l467_c2_b1f7]
signal result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_b1f7_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l467_c2_b1f7]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_b1f7_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l467_c2_b1f7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_b1f7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l467_c2_b1f7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_b1f7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l467_c2_b1f7]
signal current_dei_phase_MUX_uxn_opcodes_h_l467_c2_b1f7_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l467_c2_b1f7]
signal device_in_result_MUX_uxn_opcodes_h_l467_c2_b1f7_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output : device_in_result_t;

-- dei_param_MUX[uxn_opcodes_h_l467_c2_b1f7]
signal dei_param_MUX_uxn_opcodes_h_l467_c2_b1f7_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output : unsigned(7 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l467_c2_b1f7]
signal has_written_to_t_MUX_uxn_opcodes_h_l467_c2_b1f7_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l467_c2_b1f7]
signal has_written_to_n_MUX_uxn_opcodes_h_l467_c2_b1f7_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l467_c2_b1f7]
signal t8_MUX_uxn_opcodes_h_l467_c2_b1f7_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l468_c3_5ec1[uxn_opcodes_h_l468_c3_5ec1]
signal printf_uxn_opcodes_h_l468_c3_5ec1_uxn_opcodes_h_l468_c3_5ec1_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l479_c11_3664]
signal BIN_OP_EQ_uxn_opcodes_h_l479_c11_3664_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l479_c11_3664_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l479_c11_3664_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l482_c7_f048]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f048_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f048_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f048_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f048_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l479_c7_e9a8]
signal is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l479_c7_e9a8]
signal is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l479_c7_e9a8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_e9a8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l479_c7_e9a8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_e9a8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l479_c7_e9a8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_e9a8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l479_c7_e9a8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_e9a8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l479_c7_e9a8]
signal result_stack_value_MUX_uxn_opcodes_h_l479_c7_e9a8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l479_c7_e9a8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_e9a8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l479_c7_e9a8]
signal result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_e9a8_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output : unsigned(7 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l479_c7_e9a8]
signal current_dei_phase_MUX_uxn_opcodes_h_l479_c7_e9a8_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l479_c7_e9a8]
signal device_in_result_MUX_uxn_opcodes_h_l479_c7_e9a8_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output : device_in_result_t;

-- dei_param_MUX[uxn_opcodes_h_l479_c7_e9a8]
signal dei_param_MUX_uxn_opcodes_h_l479_c7_e9a8_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output : unsigned(7 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l479_c7_e9a8]
signal has_written_to_t_MUX_uxn_opcodes_h_l479_c7_e9a8_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l479_c7_e9a8]
signal has_written_to_n_MUX_uxn_opcodes_h_l479_c7_e9a8_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l479_c7_e9a8]
signal t8_MUX_uxn_opcodes_h_l479_c7_e9a8_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l482_c11_98b5]
signal BIN_OP_EQ_uxn_opcodes_h_l482_c11_98b5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l482_c11_98b5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l482_c11_98b5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l487_c1_2fbe]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_2fbe_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_2fbe_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_2fbe_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_2fbe_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l482_c7_f048]
signal is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f048_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f048_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f048_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f048_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l482_c7_f048]
signal is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f048_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f048_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f048_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f048_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l482_c7_f048]
signal result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f048_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f048_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f048_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f048_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l482_c7_f048]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f048_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f048_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f048_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f048_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l482_c7_f048]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f048_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f048_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f048_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f048_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l482_c7_f048]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f048_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f048_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f048_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f048_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l482_c7_f048]
signal result_stack_value_MUX_uxn_opcodes_h_l482_c7_f048_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l482_c7_f048_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l482_c7_f048_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l482_c7_f048_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l482_c7_f048]
signal result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f048_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f048_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f048_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f048_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l482_c7_f048]
signal result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f048_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f048_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f048_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f048_return_output : unsigned(7 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l482_c7_f048]
signal current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f048_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f048_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f048_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f048_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l482_c7_f048]
signal device_in_result_MUX_uxn_opcodes_h_l482_c7_f048_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l482_c7_f048_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l482_c7_f048_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l482_c7_f048_return_output : device_in_result_t;

-- dei_param_MUX[uxn_opcodes_h_l482_c7_f048]
signal dei_param_MUX_uxn_opcodes_h_l482_c7_f048_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l482_c7_f048_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l482_c7_f048_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l482_c7_f048_return_output : unsigned(7 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l482_c7_f048]
signal has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f048_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f048_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f048_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f048_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l482_c7_f048]
signal has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f048_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f048_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f048_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f048_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l482_c7_f048]
signal t8_MUX_uxn_opcodes_h_l482_c7_f048_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l482_c7_f048_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l482_c7_f048_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l482_c7_f048_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l485_c32_17af]
signal BIN_OP_AND_uxn_opcodes_h_l485_c32_17af_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l485_c32_17af_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l485_c32_17af_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l485_c32_1a06]
signal BIN_OP_GT_uxn_opcodes_h_l485_c32_1a06_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l485_c32_1a06_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l485_c32_1a06_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l485_c32_a2f9]
signal MUX_uxn_opcodes_h_l485_c32_a2f9_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l485_c32_a2f9_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l485_c32_a2f9_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l485_c32_a2f9_return_output : signed(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l489_c35_df61]
signal BIN_OP_PLUS_uxn_opcodes_h_l489_c35_df61_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l489_c35_df61_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l489_c35_df61_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l489_c15_a93b]
signal MUX_uxn_opcodes_h_l489_c15_a93b_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l489_c15_a93b_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l489_c15_a93b_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l489_c15_a93b_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l490_c49_65f8]
signal UNARY_OP_NOT_uxn_opcodes_h_l490_c49_65f8_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l490_c49_65f8_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l490_c29_197f]
signal BIN_OP_AND_uxn_opcodes_h_l490_c29_197f_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l490_c29_197f_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l490_c29_197f_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l490_c8_926f]
signal BIN_OP_OR_uxn_opcodes_h_l490_c8_926f_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l490_c8_926f_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l490_c8_926f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l490_c1_f78b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_f78b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_f78b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_f78b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_f78b_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l490_c3_38c2]
signal is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l490_c3_38c2]
signal is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l490_c3_38c2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_38c2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_38c2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l490_c3_38c2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_38c2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_38c2_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l490_c3_38c2]
signal result_stack_value_MUX_uxn_opcodes_h_l490_c3_38c2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l490_c3_38c2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l490_c3_38c2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_38c2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_38c2_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l490_c3_38c2]
signal result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_38c2_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_38c2_return_output : unsigned(7 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l490_c3_38c2]
signal current_dei_phase_MUX_uxn_opcodes_h_l490_c3_38c2_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l490_c3_38c2_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l490_c3_38c2]
signal device_in_result_MUX_uxn_opcodes_h_l490_c3_38c2_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l490_c3_38c2_return_output : device_in_result_t;

-- has_written_to_t_MUX[uxn_opcodes_h_l490_c3_38c2]
signal has_written_to_t_MUX_uxn_opcodes_h_l490_c3_38c2_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l490_c3_38c2_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l490_c3_38c2]
signal has_written_to_n_MUX_uxn_opcodes_h_l490_c3_38c2_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l490_c3_38c2_return_output : unsigned(0 downto 0);

-- device_in[uxn_opcodes_h_l491_c23_549b]
signal device_in_uxn_opcodes_h_l491_c23_549b_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_in_uxn_opcodes_h_l491_c23_549b_device_address : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l491_c23_549b_phase : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l491_c23_549b_previous_device_ram_read : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l491_c23_549b_return_output : device_in_result_t;

-- BIN_OP_PLUS[uxn_opcodes_h_l494_c4_57b2]
signal BIN_OP_PLUS_uxn_opcodes_h_l494_c4_57b2_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l494_c4_57b2_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l494_c4_57b2_return_output : unsigned(8 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l495_c9_ca3b]
signal BIN_OP_AND_uxn_opcodes_h_l495_c9_ca3b_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l495_c9_ca3b_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l495_c9_ca3b_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l495_c4_e7a4]
signal is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l495_c4_e7a4]
signal is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l497_c11_aec2]
signal is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_aec2_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_aec2_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_aec2_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_aec2_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l501_c13_9f82]
signal UNARY_OP_NOT_uxn_opcodes_h_l501_c13_9f82_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l501_c13_9f82_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l501_c8_2503]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_2503_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_2503_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_2503_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_2503_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l501_c8_2503]
signal result_stack_value_MUX_uxn_opcodes_h_l501_c8_2503_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l501_c8_2503_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l501_c8_2503_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l501_c8_2503_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l501_c8_2503]
signal result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_2503_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_2503_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_2503_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_2503_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l501_c8_2503]
signal result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_2503_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_2503_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_2503_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_2503_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l501_c8_2503]
signal current_dei_phase_MUX_uxn_opcodes_h_l501_c8_2503_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l501_c8_2503_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l501_c8_2503_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l501_c8_2503_return_output : unsigned(7 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l501_c8_2503]
signal has_written_to_t_MUX_uxn_opcodes_h_l501_c8_2503_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l501_c8_2503_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l501_c8_2503_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l501_c8_2503_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l501_c8_2503]
signal has_written_to_n_MUX_uxn_opcodes_h_l501_c8_2503_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l501_c8_2503_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l501_c8_2503_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l501_c8_2503_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l508_c13_8c0c]
signal UNARY_OP_NOT_uxn_opcodes_h_l508_c13_8c0c_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l508_c13_8c0c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l508_c8_9ba9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_9ba9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_9ba9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_9ba9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_9ba9_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l508_c8_9ba9]
signal result_stack_value_MUX_uxn_opcodes_h_l508_c8_9ba9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l508_c8_9ba9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l508_c8_9ba9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l508_c8_9ba9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l508_c8_9ba9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_9ba9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_9ba9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_9ba9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_9ba9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l508_c8_9ba9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_9ba9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_9ba9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_9ba9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_9ba9_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l508_c8_9ba9]
signal has_written_to_n_MUX_uxn_opcodes_h_l508_c8_9ba9_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l508_c8_9ba9_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l508_c8_9ba9_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l508_c8_9ba9_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l495_DUPLICATE_5d02
signal UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l495_DUPLICATE_5d02_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l495_DUPLICATE_5d02_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_cbf8( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.stack_value := ref_toks_4;
      base.device_ram_address := ref_toks_5;
      base.is_device_ram_write := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_opc_done := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l467_c6_40ea
BIN_OP_EQ_uxn_opcodes_h_l467_c6_40ea : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l467_c6_40ea_left,
BIN_OP_EQ_uxn_opcodes_h_l467_c6_40ea_right,
BIN_OP_EQ_uxn_opcodes_h_l467_c6_40ea_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c1_f8b7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c1_f8b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c1_f8b7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c1_f8b7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c1_f8b7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c1_f8b7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_e9a8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_e9a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_e9a8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7
is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7
is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_b1f7
result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_b1f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_b1f7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_b1f7
result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_b1f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_b1f7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_b1f7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_b1f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_b1f7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l467_c2_b1f7
result_stack_value_MUX_uxn_opcodes_h_l467_c2_b1f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l467_c2_b1f7_cond,
result_stack_value_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_b1f7
result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_b1f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_b1f7_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_b1f7
result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_b1f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_b1f7_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_b1f7
result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_b1f7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_b1f7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_b1f7
result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_b1f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_b1f7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l467_c2_b1f7
current_dei_phase_MUX_uxn_opcodes_h_l467_c2_b1f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l467_c2_b1f7_cond,
current_dei_phase_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l467_c2_b1f7
device_in_result_MUX_uxn_opcodes_h_l467_c2_b1f7 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l467_c2_b1f7_cond,
device_in_result_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue,
device_in_result_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse,
device_in_result_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output);

-- dei_param_MUX_uxn_opcodes_h_l467_c2_b1f7
dei_param_MUX_uxn_opcodes_h_l467_c2_b1f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l467_c2_b1f7_cond,
dei_param_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue,
dei_param_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse,
dei_param_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l467_c2_b1f7
has_written_to_t_MUX_uxn_opcodes_h_l467_c2_b1f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l467_c2_b1f7_cond,
has_written_to_t_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l467_c2_b1f7
has_written_to_n_MUX_uxn_opcodes_h_l467_c2_b1f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l467_c2_b1f7_cond,
has_written_to_n_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output);

-- t8_MUX_uxn_opcodes_h_l467_c2_b1f7
t8_MUX_uxn_opcodes_h_l467_c2_b1f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l467_c2_b1f7_cond,
t8_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue,
t8_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse,
t8_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output);

-- printf_uxn_opcodes_h_l468_c3_5ec1_uxn_opcodes_h_l468_c3_5ec1
printf_uxn_opcodes_h_l468_c3_5ec1_uxn_opcodes_h_l468_c3_5ec1 : entity work.printf_uxn_opcodes_h_l468_c3_5ec1_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l468_c3_5ec1_uxn_opcodes_h_l468_c3_5ec1_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l479_c11_3664
BIN_OP_EQ_uxn_opcodes_h_l479_c11_3664 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l479_c11_3664_left,
BIN_OP_EQ_uxn_opcodes_h_l479_c11_3664_right,
BIN_OP_EQ_uxn_opcodes_h_l479_c11_3664_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f048
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f048 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f048_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f048_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f048_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f048_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8
is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8
is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_e9a8
result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_e9a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_e9a8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_e9a8
result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_e9a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_e9a8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_e9a8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_e9a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_e9a8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_e9a8
result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_e9a8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_e9a8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l479_c7_e9a8
result_stack_value_MUX_uxn_opcodes_h_l479_c7_e9a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l479_c7_e9a8_cond,
result_stack_value_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_e9a8
result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_e9a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_e9a8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_e9a8
result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_e9a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_e9a8_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l479_c7_e9a8
current_dei_phase_MUX_uxn_opcodes_h_l479_c7_e9a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l479_c7_e9a8_cond,
current_dei_phase_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l479_c7_e9a8
device_in_result_MUX_uxn_opcodes_h_l479_c7_e9a8 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l479_c7_e9a8_cond,
device_in_result_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue,
device_in_result_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse,
device_in_result_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output);

-- dei_param_MUX_uxn_opcodes_h_l479_c7_e9a8
dei_param_MUX_uxn_opcodes_h_l479_c7_e9a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l479_c7_e9a8_cond,
dei_param_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue,
dei_param_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse,
dei_param_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l479_c7_e9a8
has_written_to_t_MUX_uxn_opcodes_h_l479_c7_e9a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l479_c7_e9a8_cond,
has_written_to_t_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l479_c7_e9a8
has_written_to_n_MUX_uxn_opcodes_h_l479_c7_e9a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l479_c7_e9a8_cond,
has_written_to_n_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output);

-- t8_MUX_uxn_opcodes_h_l479_c7_e9a8
t8_MUX_uxn_opcodes_h_l479_c7_e9a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l479_c7_e9a8_cond,
t8_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue,
t8_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse,
t8_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l482_c11_98b5
BIN_OP_EQ_uxn_opcodes_h_l482_c11_98b5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l482_c11_98b5_left,
BIN_OP_EQ_uxn_opcodes_h_l482_c11_98b5_right,
BIN_OP_EQ_uxn_opcodes_h_l482_c11_98b5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_2fbe
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_2fbe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_2fbe_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_2fbe_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_2fbe_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_2fbe_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f048
is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f048 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f048_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f048_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f048_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f048_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f048
is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f048 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f048_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f048_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f048_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f048_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f048
result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f048 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f048_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f048_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f048_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f048_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f048
result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f048 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f048_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f048_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f048_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f048_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f048
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f048 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f048_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f048_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f048_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f048_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f048
result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f048 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f048_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f048_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f048_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f048_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l482_c7_f048
result_stack_value_MUX_uxn_opcodes_h_l482_c7_f048 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l482_c7_f048_cond,
result_stack_value_MUX_uxn_opcodes_h_l482_c7_f048_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l482_c7_f048_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l482_c7_f048_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f048
result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f048 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f048_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f048_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f048_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f048_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f048
result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f048 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f048_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f048_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f048_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f048_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f048
current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f048 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f048_cond,
current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f048_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f048_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f048_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l482_c7_f048
device_in_result_MUX_uxn_opcodes_h_l482_c7_f048 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l482_c7_f048_cond,
device_in_result_MUX_uxn_opcodes_h_l482_c7_f048_iftrue,
device_in_result_MUX_uxn_opcodes_h_l482_c7_f048_iffalse,
device_in_result_MUX_uxn_opcodes_h_l482_c7_f048_return_output);

-- dei_param_MUX_uxn_opcodes_h_l482_c7_f048
dei_param_MUX_uxn_opcodes_h_l482_c7_f048 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l482_c7_f048_cond,
dei_param_MUX_uxn_opcodes_h_l482_c7_f048_iftrue,
dei_param_MUX_uxn_opcodes_h_l482_c7_f048_iffalse,
dei_param_MUX_uxn_opcodes_h_l482_c7_f048_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f048
has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f048 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f048_cond,
has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f048_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f048_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f048_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f048
has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f048 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f048_cond,
has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f048_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f048_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f048_return_output);

-- t8_MUX_uxn_opcodes_h_l482_c7_f048
t8_MUX_uxn_opcodes_h_l482_c7_f048 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l482_c7_f048_cond,
t8_MUX_uxn_opcodes_h_l482_c7_f048_iftrue,
t8_MUX_uxn_opcodes_h_l482_c7_f048_iffalse,
t8_MUX_uxn_opcodes_h_l482_c7_f048_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l485_c32_17af
BIN_OP_AND_uxn_opcodes_h_l485_c32_17af : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l485_c32_17af_left,
BIN_OP_AND_uxn_opcodes_h_l485_c32_17af_right,
BIN_OP_AND_uxn_opcodes_h_l485_c32_17af_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l485_c32_1a06
BIN_OP_GT_uxn_opcodes_h_l485_c32_1a06 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l485_c32_1a06_left,
BIN_OP_GT_uxn_opcodes_h_l485_c32_1a06_right,
BIN_OP_GT_uxn_opcodes_h_l485_c32_1a06_return_output);

-- MUX_uxn_opcodes_h_l485_c32_a2f9
MUX_uxn_opcodes_h_l485_c32_a2f9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l485_c32_a2f9_cond,
MUX_uxn_opcodes_h_l485_c32_a2f9_iftrue,
MUX_uxn_opcodes_h_l485_c32_a2f9_iffalse,
MUX_uxn_opcodes_h_l485_c32_a2f9_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l489_c35_df61
BIN_OP_PLUS_uxn_opcodes_h_l489_c35_df61 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l489_c35_df61_left,
BIN_OP_PLUS_uxn_opcodes_h_l489_c35_df61_right,
BIN_OP_PLUS_uxn_opcodes_h_l489_c35_df61_return_output);

-- MUX_uxn_opcodes_h_l489_c15_a93b
MUX_uxn_opcodes_h_l489_c15_a93b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l489_c15_a93b_cond,
MUX_uxn_opcodes_h_l489_c15_a93b_iftrue,
MUX_uxn_opcodes_h_l489_c15_a93b_iffalse,
MUX_uxn_opcodes_h_l489_c15_a93b_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l490_c49_65f8
UNARY_OP_NOT_uxn_opcodes_h_l490_c49_65f8 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l490_c49_65f8_expr,
UNARY_OP_NOT_uxn_opcodes_h_l490_c49_65f8_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l490_c29_197f
BIN_OP_AND_uxn_opcodes_h_l490_c29_197f : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l490_c29_197f_left,
BIN_OP_AND_uxn_opcodes_h_l490_c29_197f_right,
BIN_OP_AND_uxn_opcodes_h_l490_c29_197f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l490_c8_926f
BIN_OP_OR_uxn_opcodes_h_l490_c8_926f : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l490_c8_926f_left,
BIN_OP_OR_uxn_opcodes_h_l490_c8_926f_right,
BIN_OP_OR_uxn_opcodes_h_l490_c8_926f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_f78b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_f78b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_f78b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_f78b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_f78b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_f78b_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2
is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2
is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_38c2
result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_38c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_38c2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_38c2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_38c2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_38c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_38c2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_38c2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l490_c3_38c2
result_stack_value_MUX_uxn_opcodes_h_l490_c3_38c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l490_c3_38c2_cond,
result_stack_value_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l490_c3_38c2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_38c2
result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_38c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_38c2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_38c2_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_38c2
result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_38c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_38c2_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_38c2_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l490_c3_38c2
current_dei_phase_MUX_uxn_opcodes_h_l490_c3_38c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l490_c3_38c2_cond,
current_dei_phase_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l490_c3_38c2_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l490_c3_38c2
device_in_result_MUX_uxn_opcodes_h_l490_c3_38c2 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l490_c3_38c2_cond,
device_in_result_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue,
device_in_result_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse,
device_in_result_MUX_uxn_opcodes_h_l490_c3_38c2_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l490_c3_38c2
has_written_to_t_MUX_uxn_opcodes_h_l490_c3_38c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l490_c3_38c2_cond,
has_written_to_t_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l490_c3_38c2_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l490_c3_38c2
has_written_to_n_MUX_uxn_opcodes_h_l490_c3_38c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l490_c3_38c2_cond,
has_written_to_n_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l490_c3_38c2_return_output);

-- device_in_uxn_opcodes_h_l491_c23_549b
device_in_uxn_opcodes_h_l491_c23_549b : entity work.device_in_0CLK_5af1a430 port map (
clk,
device_in_uxn_opcodes_h_l491_c23_549b_CLOCK_ENABLE,
device_in_uxn_opcodes_h_l491_c23_549b_device_address,
device_in_uxn_opcodes_h_l491_c23_549b_phase,
device_in_uxn_opcodes_h_l491_c23_549b_previous_device_ram_read,
device_in_uxn_opcodes_h_l491_c23_549b_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l494_c4_57b2
BIN_OP_PLUS_uxn_opcodes_h_l494_c4_57b2 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l494_c4_57b2_left,
BIN_OP_PLUS_uxn_opcodes_h_l494_c4_57b2_right,
BIN_OP_PLUS_uxn_opcodes_h_l494_c4_57b2_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l495_c9_ca3b
BIN_OP_AND_uxn_opcodes_h_l495_c9_ca3b : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l495_c9_ca3b_left,
BIN_OP_AND_uxn_opcodes_h_l495_c9_ca3b_right,
BIN_OP_AND_uxn_opcodes_h_l495_c9_ca3b_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4
is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4
is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_aec2
is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_aec2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_aec2_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_aec2_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_aec2_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_aec2_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l501_c13_9f82
UNARY_OP_NOT_uxn_opcodes_h_l501_c13_9f82 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l501_c13_9f82_expr,
UNARY_OP_NOT_uxn_opcodes_h_l501_c13_9f82_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_2503
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_2503 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_2503_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_2503_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_2503_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_2503_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l501_c8_2503
result_stack_value_MUX_uxn_opcodes_h_l501_c8_2503 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l501_c8_2503_cond,
result_stack_value_MUX_uxn_opcodes_h_l501_c8_2503_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l501_c8_2503_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l501_c8_2503_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_2503
result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_2503 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_2503_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_2503_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_2503_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_2503_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_2503
result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_2503 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_2503_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_2503_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_2503_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_2503_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l501_c8_2503
current_dei_phase_MUX_uxn_opcodes_h_l501_c8_2503 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l501_c8_2503_cond,
current_dei_phase_MUX_uxn_opcodes_h_l501_c8_2503_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l501_c8_2503_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l501_c8_2503_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l501_c8_2503
has_written_to_t_MUX_uxn_opcodes_h_l501_c8_2503 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l501_c8_2503_cond,
has_written_to_t_MUX_uxn_opcodes_h_l501_c8_2503_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l501_c8_2503_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l501_c8_2503_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l501_c8_2503
has_written_to_n_MUX_uxn_opcodes_h_l501_c8_2503 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l501_c8_2503_cond,
has_written_to_n_MUX_uxn_opcodes_h_l501_c8_2503_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l501_c8_2503_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l501_c8_2503_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l508_c13_8c0c
UNARY_OP_NOT_uxn_opcodes_h_l508_c13_8c0c : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l508_c13_8c0c_expr,
UNARY_OP_NOT_uxn_opcodes_h_l508_c13_8c0c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_9ba9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_9ba9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_9ba9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_9ba9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_9ba9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_9ba9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l508_c8_9ba9
result_stack_value_MUX_uxn_opcodes_h_l508_c8_9ba9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l508_c8_9ba9_cond,
result_stack_value_MUX_uxn_opcodes_h_l508_c8_9ba9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l508_c8_9ba9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l508_c8_9ba9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_9ba9
result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_9ba9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_9ba9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_9ba9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_9ba9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_9ba9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_9ba9
result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_9ba9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_9ba9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_9ba9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_9ba9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_9ba9_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l508_c8_9ba9
has_written_to_n_MUX_uxn_opcodes_h_l508_c8_9ba9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l508_c8_9ba9_cond,
has_written_to_n_MUX_uxn_opcodes_h_l508_c8_9ba9_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l508_c8_9ba9_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l508_c8_9ba9_return_output);

-- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l495_DUPLICATE_5d02
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l495_DUPLICATE_5d02 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l495_DUPLICATE_5d02_expr,
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l495_DUPLICATE_5d02_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l467_c6_40ea_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c1_f8b7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output,
 device_in_result_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output,
 dei_param_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output,
 t8_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l479_c11_3664_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f048_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output,
 device_in_result_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output,
 dei_param_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output,
 t8_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l482_c11_98b5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_2fbe_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f048_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f048_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f048_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f048_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f048_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f048_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l482_c7_f048_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f048_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f048_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f048_return_output,
 device_in_result_MUX_uxn_opcodes_h_l482_c7_f048_return_output,
 dei_param_MUX_uxn_opcodes_h_l482_c7_f048_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f048_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f048_return_output,
 t8_MUX_uxn_opcodes_h_l482_c7_f048_return_output,
 BIN_OP_AND_uxn_opcodes_h_l485_c32_17af_return_output,
 BIN_OP_GT_uxn_opcodes_h_l485_c32_1a06_return_output,
 MUX_uxn_opcodes_h_l485_c32_a2f9_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l489_c35_df61_return_output,
 MUX_uxn_opcodes_h_l489_c15_a93b_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l490_c49_65f8_return_output,
 BIN_OP_AND_uxn_opcodes_h_l490_c29_197f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l490_c8_926f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_f78b_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_38c2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_38c2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l490_c3_38c2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_38c2_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_38c2_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l490_c3_38c2_return_output,
 device_in_result_MUX_uxn_opcodes_h_l490_c3_38c2_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l490_c3_38c2_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l490_c3_38c2_return_output,
 device_in_uxn_opcodes_h_l491_c23_549b_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l494_c4_57b2_return_output,
 BIN_OP_AND_uxn_opcodes_h_l495_c9_ca3b_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_aec2_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l501_c13_9f82_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_2503_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l501_c8_2503_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_2503_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_2503_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l501_c8_2503_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l501_c8_2503_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l501_c8_2503_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l508_c13_8c0c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_9ba9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l508_c8_9ba9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_9ba9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_9ba9_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l508_c8_9ba9_return_output,
 UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l495_DUPLICATE_5d02_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c6_40ea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c6_40ea_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c6_40ea_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c1_f8b7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c1_f8b7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c1_f8b7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c1_f8b7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_e9a8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_b1f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_b1f7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l474_c3_97e3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_b1f7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l467_c2_b1f7_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_b1f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l467_c2_b1f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_b1f7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_b1f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_b1f7_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l473_c3_9f5a : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c2_b1f7_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue : device_in_result_t;
 variable VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l467_c2_b1f7_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l467_c2_b1f7_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l467_c2_b1f7_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l467_c2_b1f7_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l467_c2_b1f7_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l467_c2_b1f7_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l468_c3_5ec1_uxn_opcodes_h_l468_c3_5ec1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_3664_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_3664_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_3664_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f048_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f048_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f048_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f048_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f048_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f048_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f048_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_e9a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f048_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_e9a8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l480_c3_3d8b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f048_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_e9a8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f048_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_e9a8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l482_c7_f048_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l479_c7_e9a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f048_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_e9a8_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f048_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_e9a8_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f048_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l479_c7_e9a8_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l482_c7_f048_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l479_c7_e9a8_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l482_c7_f048_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l479_c7_e9a8_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f048_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l479_c7_e9a8_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f048_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l479_c7_e9a8_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l482_c7_f048_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l479_c7_e9a8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l482_c11_98b5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l482_c11_98b5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l482_c11_98b5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_2fbe_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_2fbe_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_2fbe_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_2fbe_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f048_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f048_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f048_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f048_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f048_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f048_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f048_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f048_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_38c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f048_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f048_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f048_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f048_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f048_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f048_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_38c2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f048_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f048_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f048_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f048_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l482_c7_f048_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l482_c7_f048_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l490_c3_38c2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l482_c7_f048_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f048_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f048_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_38c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f048_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f048_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f048_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_38c2_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f048_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f048_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f048_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l490_c3_38c2_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f048_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l482_c7_f048_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l482_c7_f048_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l490_c3_38c2_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l482_c7_f048_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l482_c7_f048_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l482_c7_f048_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l482_c7_f048_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f048_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f048_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l490_c3_38c2_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f048_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f048_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f048_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l490_c3_38c2_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f048_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l482_c7_f048_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l482_c7_f048_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l482_c7_f048_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l485_c32_a2f9_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l485_c32_a2f9_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l485_c32_a2f9_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l485_c32_17af_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l485_c32_17af_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l485_c32_17af_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l485_c32_1a06_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l485_c32_1a06_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l485_c32_1a06_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l485_c32_a2f9_return_output : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l489_c15_a93b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l489_c15_a93b_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l489_c15_a93b_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l489_c35_df61_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l489_c35_df61_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l489_c35_df61_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l489_c15_a93b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l490_c8_926f_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l490_c29_197f_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l490_c49_65f8_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l490_c49_65f8_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l490_c29_197f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l490_c29_197f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l490_c8_926f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l490_c8_926f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_f78b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_f78b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_f78b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_f78b_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_2503_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_38c2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_2503_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_38c2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l501_c8_2503_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l490_c3_38c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_2503_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_38c2_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_38c2_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l494_c4_de24 : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l501_c8_2503_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l490_c3_38c2_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l490_c3_38c2_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l501_c8_2503_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l490_c3_38c2_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l501_c8_2503_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l490_c3_38c2_cond : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l491_c23_549b_device_address : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l491_c23_549b_phase : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l491_c23_549b_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l491_c23_549b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l491_c23_549b_return_output : device_in_result_t;
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l492_c32_c1cf_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l494_c4_57b2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l494_c4_57b2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l494_c4_57b2_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l495_c9_ca3b_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l495_c9_ca3b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l495_c9_ca3b_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_aec2_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_aec2_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_aec2_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_aec2_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l501_c13_9f82_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l501_c13_9f82_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_2503_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l504_c4_c307 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_2503_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_9ba9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_2503_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l501_c8_2503_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l501_c8_2503_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l508_c8_9ba9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l501_c8_2503_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_2503_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_2503_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_9ba9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_2503_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_2503_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_2503_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_9ba9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_2503_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l501_c8_2503_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l502_c4_6e99 : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l501_c8_2503_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l501_c8_2503_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l501_c8_2503_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l501_c8_2503_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l501_c8_2503_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l501_c8_2503_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l501_c8_2503_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l508_c8_9ba9_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l501_c8_2503_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l508_c13_8c0c_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l508_c13_8c0c_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_9ba9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l509_c4_4604 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_9ba9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_9ba9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l508_c8_9ba9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l508_c8_9ba9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l508_c8_9ba9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_9ba9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_9ba9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_9ba9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_9ba9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_9ba9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_9ba9_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l508_c8_9ba9_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l508_c8_9ba9_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l508_c8_9ba9_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l467_l482_l479_l508_DUPLICATE_8ff3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l467_l479_DUPLICATE_411e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l467_l479_l482_l490_l508_DUPLICATE_3f72_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l490_l467_l482_l479_DUPLICATE_b1da_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l467_l482_l479_DUPLICATE_6483_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l479_l482_l490_l508_l501_DUPLICATE_29c0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l490_l482_l508_DUPLICATE_7f7f_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l495_DUPLICATE_5d02_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l495_DUPLICATE_5d02_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l495_l497_DUPLICATE_6730_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l505_l510_DUPLICATE_dd70_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cbf8_uxn_opcodes_h_l519_l461_DUPLICATE_522a_return_output : opcode_result_t;
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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f048_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l509_c4_4604 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_9ba9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l509_c4_4604;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l489_c35_df61_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l485_c32_a2f9_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l504_c4_c307 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_2503_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l504_c4_c307;
     VAR_MUX_uxn_opcodes_h_l485_c32_a2f9_iffalse := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_2503_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l485_c32_1a06_right := to_unsigned(0, 1);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_9ba9_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l485_c32_17af_right := to_unsigned(128, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c1_f8b7_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue := to_unsigned(0, 1);
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l508_c8_9ba9_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_9ba9_iffalse := to_unsigned(0, 1);
     VAR_current_dei_phase_uxn_opcodes_h_l502_c4_6e99 := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l501_c8_2503_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l502_c4_6e99;
     VAR_current_dei_phase_uxn_opcodes_h_l473_c3_9f5a := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l473_c3_9f5a;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_f78b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l482_c11_98b5_right := to_unsigned(2, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_2fbe_iftrue := to_unsigned(0, 1);
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l474_c3_97e3 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l474_c3_97e3;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_3664_right := to_unsigned(1, 1);
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_aec2_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f048_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f048_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l480_c3_3d8b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l480_c3_3d8b;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l501_c8_2503_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c6_40ea_right := to_unsigned(0, 1);
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l494_c4_57b2_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c1_f8b7_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l494_c4_57b2_left := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f048_iftrue := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l501_c8_2503_iffalse := current_dei_phase;
     VAR_device_in_uxn_opcodes_h_l491_c23_549b_phase := current_dei_phase;
     VAR_dei_param_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue := dei_param;
     VAR_dei_param_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue := dei_param;
     VAR_dei_param_MUX_uxn_opcodes_h_l482_c7_f048_iftrue := dei_param;
     VAR_device_in_result_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l482_c7_f048_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse := device_in_result;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l508_c13_8c0c_expr := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f048_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l501_c8_2503_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l508_c8_9ba9_iffalse := has_written_to_n;
     VAR_BIN_OP_AND_uxn_opcodes_h_l490_c29_197f_left := has_written_to_t;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l501_c13_9f82_expr := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f048_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l501_c8_2503_iffalse := has_written_to_t;
     VAR_BIN_OP_AND_uxn_opcodes_h_l485_c32_17af_left := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l489_c15_a93b_cond := is_first_dei_done;
     VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l495_DUPLICATE_5d02_expr := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f048_iftrue := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4_iffalse := is_first_dei_done;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l490_c49_65f8_expr := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f048_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_aec2_iffalse := is_second_dei_done;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c6_40ea_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_3664_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l482_c11_98b5_left := VAR_phase;
     VAR_device_in_uxn_opcodes_h_l491_c23_549b_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l482_c7_f048_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l489_c35_df61_left := t8;
     VAR_MUX_uxn_opcodes_h_l489_c15_a93b_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l482_c7_f048_iffalse := t8;
     -- UNARY_OP_NOT[uxn_opcodes_h_l508_c13_8c0c] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l508_c13_8c0c_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l508_c13_8c0c_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l508_c13_8c0c_return_output := UNARY_OP_NOT_uxn_opcodes_h_l508_c13_8c0c_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l490_c49_65f8] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l490_c49_65f8_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l490_c49_65f8_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l490_c49_65f8_return_output := UNARY_OP_NOT_uxn_opcodes_h_l490_c49_65f8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l467_l479_DUPLICATE_411e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l467_l479_DUPLICATE_411e_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l490_l482_l508_DUPLICATE_7f7f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l490_l482_l508_DUPLICATE_7f7f_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l467_l482_l479_DUPLICATE_6483 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l467_l482_l479_DUPLICATE_6483_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l479_l482_l490_l508_l501_DUPLICATE_29c0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l479_l482_l490_l508_l501_DUPLICATE_29c0_return_output := result.is_opc_done;

     -- BIN_OP_PLUS[uxn_opcodes_h_l494_c4_57b2] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l494_c4_57b2_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l494_c4_57b2_left;
     BIN_OP_PLUS_uxn_opcodes_h_l494_c4_57b2_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l494_c4_57b2_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l494_c4_57b2_return_output := BIN_OP_PLUS_uxn_opcodes_h_l494_c4_57b2_return_output;

     -- result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l467_c2_b1f7] LATENCY=0
     VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l467_c2_b1f7_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l467_l482_l479_l508_DUPLICATE_8ff3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l467_l482_l479_l508_DUPLICATE_8ff3_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l467_l479_l482_l490_l508_DUPLICATE_3f72 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l467_l479_l482_l490_l508_DUPLICATE_3f72_return_output := result.stack_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l490_l467_l482_l479_DUPLICATE_b1da LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l490_l467_l482_l479_DUPLICATE_b1da_return_output := result.device_ram_address;

     -- BIN_OP_EQ[uxn_opcodes_h_l482_c11_98b5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l482_c11_98b5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l482_c11_98b5_left;
     BIN_OP_EQ_uxn_opcodes_h_l482_c11_98b5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l482_c11_98b5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l482_c11_98b5_return_output := BIN_OP_EQ_uxn_opcodes_h_l482_c11_98b5_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l501_c13_9f82] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l501_c13_9f82_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l501_c13_9f82_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l501_c13_9f82_return_output := UNARY_OP_NOT_uxn_opcodes_h_l501_c13_9f82_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l479_c11_3664] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l479_c11_3664_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_3664_left;
     BIN_OP_EQ_uxn_opcodes_h_l479_c11_3664_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_3664_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_3664_return_output := BIN_OP_EQ_uxn_opcodes_h_l479_c11_3664_return_output;

     -- CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l505_l510_DUPLICATE_dd70 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l505_l510_DUPLICATE_dd70_return_output := device_in_result.dei_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l467_c6_40ea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l467_c6_40ea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c6_40ea_left;
     BIN_OP_EQ_uxn_opcodes_h_l467_c6_40ea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c6_40ea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c6_40ea_return_output := BIN_OP_EQ_uxn_opcodes_h_l467_c6_40ea_return_output;

     -- device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6[uxn_opcodes_h_l467_c2_b1f7] LATENCY=0
     VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l467_c2_b1f7_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6(
     device_in_result,
     to_unsigned(0, 1));

     -- BIN_OP_PLUS[uxn_opcodes_h_l489_c35_df61] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l489_c35_df61_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l489_c35_df61_left;
     BIN_OP_PLUS_uxn_opcodes_h_l489_c35_df61_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l489_c35_df61_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l489_c35_df61_return_output := BIN_OP_PLUS_uxn_opcodes_h_l489_c35_df61_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l485_c32_17af] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l485_c32_17af_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l485_c32_17af_left;
     BIN_OP_AND_uxn_opcodes_h_l485_c32_17af_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l485_c32_17af_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l485_c32_17af_return_output := BIN_OP_AND_uxn_opcodes_h_l485_c32_17af_return_output;

     -- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l495_DUPLICATE_5d02 LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l495_DUPLICATE_5d02_expr <= VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l495_DUPLICATE_5d02_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l495_DUPLICATE_5d02_return_output := UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l495_DUPLICATE_5d02_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l485_c32_1a06_left := VAR_BIN_OP_AND_uxn_opcodes_h_l485_c32_17af_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_e9a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c6_40ea_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c1_f8b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c6_40ea_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c2_b1f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c6_40ea_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l467_c2_b1f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c6_40ea_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l467_c2_b1f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c6_40ea_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l467_c2_b1f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c6_40ea_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l467_c2_b1f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c6_40ea_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c6_40ea_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c6_40ea_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_b1f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c6_40ea_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_b1f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c6_40ea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_b1f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c6_40ea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_b1f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c6_40ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_b1f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c6_40ea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_b1f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c6_40ea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_b1f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c6_40ea_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l467_c2_b1f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c6_40ea_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l467_c2_b1f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c6_40ea_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_3664_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l479_c7_e9a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_3664_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l479_c7_e9a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_3664_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l479_c7_e9a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_3664_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l479_c7_e9a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_3664_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l479_c7_e9a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_3664_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_3664_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_3664_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_e9a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_3664_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_e9a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_3664_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_e9a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_3664_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_e9a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_3664_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_e9a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_3664_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_e9a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_3664_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l479_c7_e9a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_3664_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l479_c7_e9a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l479_c11_3664_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_2fbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l482_c11_98b5_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l482_c11_98b5_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l482_c7_f048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l482_c11_98b5_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l482_c7_f048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l482_c11_98b5_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l482_c11_98b5_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l482_c11_98b5_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l482_c11_98b5_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l482_c11_98b5_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l482_c11_98b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l482_c11_98b5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l482_c11_98b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l482_c11_98b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l482_c11_98b5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l482_c11_98b5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l482_c7_f048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l482_c11_98b5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l482_c7_f048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l482_c11_98b5_return_output;
     VAR_MUX_uxn_opcodes_h_l489_c15_a93b_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l489_c35_df61_return_output, 8);
     VAR_current_dei_phase_uxn_opcodes_h_l494_c4_de24 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l494_c4_57b2_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l467_l482_l479_DUPLICATE_6483_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l467_l482_l479_DUPLICATE_6483_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f048_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l467_l482_l479_DUPLICATE_6483_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l479_l482_l490_l508_l501_DUPLICATE_29c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f048_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l479_l482_l490_l508_l501_DUPLICATE_29c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l479_l482_l490_l508_l501_DUPLICATE_29c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_2503_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l479_l482_l490_l508_l501_DUPLICATE_29c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_9ba9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l479_l482_l490_l508_l501_DUPLICATE_29c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l467_l479_DUPLICATE_411e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l467_l479_DUPLICATE_411e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l467_l482_l479_l508_DUPLICATE_8ff3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l467_l482_l479_l508_DUPLICATE_8ff3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f048_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l467_l482_l479_l508_DUPLICATE_8ff3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_9ba9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l467_l482_l479_l508_DUPLICATE_8ff3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l501_c8_2503_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l505_l510_DUPLICATE_dd70_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l508_c8_9ba9_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l505_l510_DUPLICATE_dd70_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l490_l467_l482_l479_DUPLICATE_b1da_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l490_l467_l482_l479_DUPLICATE_b1da_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f048_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l490_l467_l482_l479_DUPLICATE_b1da_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l490_l467_l482_l479_DUPLICATE_b1da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f048_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l490_l482_l508_DUPLICATE_7f7f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l490_l482_l508_DUPLICATE_7f7f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_9ba9_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l490_l482_l508_DUPLICATE_7f7f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l467_l479_l482_l490_l508_DUPLICATE_3f72_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l467_l479_l482_l490_l508_DUPLICATE_3f72_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l482_c7_f048_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l467_l479_l482_l490_l508_DUPLICATE_3f72_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l467_l479_l482_l490_l508_DUPLICATE_3f72_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l508_c8_9ba9_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l467_l479_l482_l490_l508_DUPLICATE_3f72_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l490_c29_197f_right := VAR_UNARY_OP_NOT_uxn_opcodes_h_l490_c49_65f8_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l501_c8_2503_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l501_c13_9f82_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l501_c8_2503_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l501_c13_9f82_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l501_c8_2503_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l501_c13_9f82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_2503_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l501_c13_9f82_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_2503_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l501_c13_9f82_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_2503_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l501_c13_9f82_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l501_c8_2503_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l501_c13_9f82_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l508_c8_9ba9_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l508_c13_8c0c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_9ba9_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l508_c13_8c0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_9ba9_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l508_c13_8c0c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_9ba9_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l508_c13_8c0c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l508_c8_9ba9_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l508_c13_8c0c_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l495_c9_ca3b_left := VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l495_DUPLICATE_5d02_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l490_c8_926f_left := VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l490_l495_DUPLICATE_5d02_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue := VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l467_c2_b1f7_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse := VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l467_c2_b1f7_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l494_c4_de24;
     -- current_dei_phase_MUX[uxn_opcodes_h_l501_c8_2503] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l501_c8_2503_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l501_c8_2503_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l501_c8_2503_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l501_c8_2503_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l501_c8_2503_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l501_c8_2503_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l501_c8_2503_return_output := current_dei_phase_MUX_uxn_opcodes_h_l501_c8_2503_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l485_c32_1a06] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l485_c32_1a06_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l485_c32_1a06_left;
     BIN_OP_GT_uxn_opcodes_h_l485_c32_1a06_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l485_c32_1a06_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l485_c32_1a06_return_output := BIN_OP_GT_uxn_opcodes_h_l485_c32_1a06_return_output;

     -- MUX[uxn_opcodes_h_l489_c15_a93b] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l489_c15_a93b_cond <= VAR_MUX_uxn_opcodes_h_l489_c15_a93b_cond;
     MUX_uxn_opcodes_h_l489_c15_a93b_iftrue <= VAR_MUX_uxn_opcodes_h_l489_c15_a93b_iftrue;
     MUX_uxn_opcodes_h_l489_c15_a93b_iffalse <= VAR_MUX_uxn_opcodes_h_l489_c15_a93b_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l489_c15_a93b_return_output := MUX_uxn_opcodes_h_l489_c15_a93b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l508_c8_9ba9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_9ba9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_9ba9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_9ba9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_9ba9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_9ba9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_9ba9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_9ba9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_9ba9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l467_c1_f8b7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c1_f8b7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c1_f8b7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c1_f8b7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c1_f8b7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c1_f8b7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c1_f8b7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c1_f8b7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c1_f8b7_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l501_c8_2503] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l501_c8_2503_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l501_c8_2503_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l501_c8_2503_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l501_c8_2503_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l501_c8_2503_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l501_c8_2503_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l501_c8_2503_return_output := has_written_to_t_MUX_uxn_opcodes_h_l501_c8_2503_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l479_c7_e9a8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_e9a8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_e9a8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l508_c8_9ba9] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l508_c8_9ba9_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l508_c8_9ba9_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l508_c8_9ba9_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l508_c8_9ba9_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l508_c8_9ba9_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l508_c8_9ba9_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l508_c8_9ba9_return_output := has_written_to_n_MUX_uxn_opcodes_h_l508_c8_9ba9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l508_c8_9ba9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_9ba9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_9ba9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_9ba9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_9ba9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_9ba9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_9ba9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_9ba9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_9ba9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l508_c8_9ba9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l508_c8_9ba9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l508_c8_9ba9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l508_c8_9ba9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l508_c8_9ba9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l508_c8_9ba9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l508_c8_9ba9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l508_c8_9ba9_return_output := result_stack_value_MUX_uxn_opcodes_h_l508_c8_9ba9_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l490_c29_197f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l490_c29_197f_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l490_c29_197f_left;
     BIN_OP_AND_uxn_opcodes_h_l490_c29_197f_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l490_c29_197f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l490_c29_197f_return_output := BIN_OP_AND_uxn_opcodes_h_l490_c29_197f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l482_c7_f048] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f048_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f048_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f048_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f048_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f048_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f048_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f048_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f048_return_output;

     -- t8_MUX[uxn_opcodes_h_l482_c7_f048] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l482_c7_f048_cond <= VAR_t8_MUX_uxn_opcodes_h_l482_c7_f048_cond;
     t8_MUX_uxn_opcodes_h_l482_c7_f048_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l482_c7_f048_iftrue;
     t8_MUX_uxn_opcodes_h_l482_c7_f048_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l482_c7_f048_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l482_c7_f048_return_output := t8_MUX_uxn_opcodes_h_l482_c7_f048_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l508_c8_9ba9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_9ba9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_9ba9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_9ba9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_9ba9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_9ba9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_9ba9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_9ba9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_9ba9_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l467_c2_b1f7] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_b1f7_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_b1f7_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_opcodes_h_l490_c8_926f_right := VAR_BIN_OP_AND_uxn_opcodes_h_l490_c29_197f_return_output;
     VAR_MUX_uxn_opcodes_h_l485_c32_a2f9_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l485_c32_1a06_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f048_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l482_c7_f048_iffalse := VAR_MUX_uxn_opcodes_h_l489_c15_a93b_return_output;
     VAR_device_in_uxn_opcodes_h_l491_c23_549b_device_address := VAR_MUX_uxn_opcodes_h_l489_c15_a93b_return_output;
     VAR_printf_uxn_opcodes_h_l468_c3_5ec1_uxn_opcodes_h_l468_c3_5ec1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c1_f8b7_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l501_c8_2503_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l501_c8_2503_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l508_c8_9ba9_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l501_c8_2503_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_2503_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l508_c8_9ba9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l482_c7_f048_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_2503_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l508_c8_9ba9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_2503_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l508_c8_9ba9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l501_c8_2503_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l508_c8_9ba9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse := VAR_t8_MUX_uxn_opcodes_h_l482_c7_f048_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l482_c7_f048] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f048_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f048_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f048_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f048_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f048_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f048_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f048_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f048_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l479_c7_e9a8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_e9a8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_e9a8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l501_c8_2503] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l501_c8_2503_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l501_c8_2503_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l501_c8_2503_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l501_c8_2503_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l501_c8_2503_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l501_c8_2503_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l501_c8_2503_return_output := has_written_to_n_MUX_uxn_opcodes_h_l501_c8_2503_return_output;

     -- printf_uxn_opcodes_h_l468_c3_5ec1[uxn_opcodes_h_l468_c3_5ec1] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l468_c3_5ec1_uxn_opcodes_h_l468_c3_5ec1_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l468_c3_5ec1_uxn_opcodes_h_l468_c3_5ec1_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l501_c8_2503] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_2503_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_2503_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_2503_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_2503_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_2503_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_2503_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_2503_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_2503_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l501_c8_2503] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l501_c8_2503_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l501_c8_2503_cond;
     result_stack_value_MUX_uxn_opcodes_h_l501_c8_2503_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l501_c8_2503_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l501_c8_2503_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l501_c8_2503_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l501_c8_2503_return_output := result_stack_value_MUX_uxn_opcodes_h_l501_c8_2503_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l501_c8_2503] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_2503_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_2503_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_2503_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_2503_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_2503_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_2503_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_2503_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_2503_return_output;

     -- MUX[uxn_opcodes_h_l485_c32_a2f9] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l485_c32_a2f9_cond <= VAR_MUX_uxn_opcodes_h_l485_c32_a2f9_cond;
     MUX_uxn_opcodes_h_l485_c32_a2f9_iftrue <= VAR_MUX_uxn_opcodes_h_l485_c32_a2f9_iftrue;
     MUX_uxn_opcodes_h_l485_c32_a2f9_iffalse <= VAR_MUX_uxn_opcodes_h_l485_c32_a2f9_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l485_c32_a2f9_return_output := MUX_uxn_opcodes_h_l485_c32_a2f9_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l490_c8_926f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l490_c8_926f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l490_c8_926f_left;
     BIN_OP_OR_uxn_opcodes_h_l490_c8_926f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l490_c8_926f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l490_c8_926f_return_output := BIN_OP_OR_uxn_opcodes_h_l490_c8_926f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l501_c8_2503] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_2503_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_2503_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_2503_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_2503_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_2503_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_2503_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_2503_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_2503_return_output;

     -- t8_MUX[uxn_opcodes_h_l479_c7_e9a8] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l479_c7_e9a8_cond <= VAR_t8_MUX_uxn_opcodes_h_l479_c7_e9a8_cond;
     t8_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue;
     t8_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output := t8_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l482_c7_f048] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l482_c7_f048_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l482_c7_f048_cond;
     dei_param_MUX_uxn_opcodes_h_l482_c7_f048_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l482_c7_f048_iftrue;
     dei_param_MUX_uxn_opcodes_h_l482_c7_f048_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l482_c7_f048_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l482_c7_f048_return_output := dei_param_MUX_uxn_opcodes_h_l482_c7_f048_return_output;

     -- Submodule level 3
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_f78b_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l490_c8_926f_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l490_c3_38c2_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l490_c8_926f_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l490_c3_38c2_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l490_c8_926f_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l490_c3_38c2_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l490_c8_926f_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l490_c3_38c2_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l490_c8_926f_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l490_c8_926f_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l490_c8_926f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_38c2_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l490_c8_926f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_38c2_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l490_c8_926f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_38c2_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l490_c8_926f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_38c2_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l490_c8_926f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l490_c3_38c2_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l490_c8_926f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_2fbe_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c7_f048_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f048_iftrue := VAR_MUX_uxn_opcodes_h_l485_c32_a2f9_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse := VAR_dei_param_MUX_uxn_opcodes_h_l482_c7_f048_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l501_c8_2503_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l501_c8_2503_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l501_c8_2503_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l501_c8_2503_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l501_c8_2503_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse := VAR_t8_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l490_c3_38c2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_38c2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_38c2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_38c2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_38c2_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l490_c3_38c2] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l490_c3_38c2_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l490_c3_38c2_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l490_c3_38c2_return_output := has_written_to_t_MUX_uxn_opcodes_h_l490_c3_38c2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l487_c1_2fbe] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_2fbe_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_2fbe_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_2fbe_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_2fbe_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_2fbe_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_2fbe_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_2fbe_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_2fbe_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l490_c3_38c2] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l490_c3_38c2_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l490_c3_38c2_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l490_c3_38c2_return_output := current_dei_phase_MUX_uxn_opcodes_h_l490_c3_38c2_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l490_c3_38c2] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l490_c3_38c2_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l490_c3_38c2_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l490_c3_38c2_return_output := has_written_to_n_MUX_uxn_opcodes_h_l490_c3_38c2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l467_c2_b1f7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_b1f7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_b1f7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l490_c3_38c2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_38c2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_38c2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_38c2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_38c2_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l479_c7_e9a8] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l479_c7_e9a8_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l479_c7_e9a8_cond;
     dei_param_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue;
     dei_param_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output := dei_param_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l482_c7_f048] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f048_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f048_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f048_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f048_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f048_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f048_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f048_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f048_return_output;

     -- t8_MUX[uxn_opcodes_h_l467_c2_b1f7] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l467_c2_b1f7_cond <= VAR_t8_MUX_uxn_opcodes_h_l467_c2_b1f7_cond;
     t8_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue;
     t8_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output := t8_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l490_c3_38c2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_38c2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_38c2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_38c2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_38c2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l490_c3_38c2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l490_c3_38c2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l490_c3_38c2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l490_c3_38c2_return_output := result_stack_value_MUX_uxn_opcodes_h_l490_c3_38c2_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_f78b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l487_c1_2fbe_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f048_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l490_c3_38c2_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse := VAR_dei_param_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f048_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l490_c3_38c2_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f048_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l490_c3_38c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f048_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l490_c3_38c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f048_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l490_c3_38c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l482_c7_f048_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f048_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l490_c3_38c2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l482_c7_f048_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l490_c3_38c2_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l482_c7_f048] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f048_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f048_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f048_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f048_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f048_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f048_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f048_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f048_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l482_c7_f048] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f048_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f048_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f048_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f048_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f048_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f048_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f048_return_output := current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f048_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l482_c7_f048] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f048_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f048_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f048_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f048_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f048_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f048_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f048_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f048_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l490_c1_f78b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_f78b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_f78b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_f78b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_f78b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_f78b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_f78b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_f78b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_f78b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l479_c7_e9a8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_e9a8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_e9a8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l467_c2_b1f7] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l467_c2_b1f7_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l467_c2_b1f7_cond;
     dei_param_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue;
     dei_param_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output := dei_param_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l482_c7_f048] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l482_c7_f048_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l482_c7_f048_cond;
     result_stack_value_MUX_uxn_opcodes_h_l482_c7_f048_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l482_c7_f048_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l482_c7_f048_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l482_c7_f048_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l482_c7_f048_return_output := result_stack_value_MUX_uxn_opcodes_h_l482_c7_f048_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l482_c7_f048] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f048_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f048_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f048_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f048_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f048_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f048_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f048_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f048_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l482_c7_f048] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f048_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f048_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f048_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f048_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f048_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f048_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f048_return_output := has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f048_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l482_c7_f048] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f048_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f048_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f048_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f048_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f048_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f048_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f048_return_output := has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f048_return_output;

     -- Submodule level 5
     VAR_device_in_uxn_opcodes_h_l491_c23_549b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l490_c1_f78b_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l482_c7_f048_return_output;
     REG_VAR_dei_param := VAR_dei_param_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l482_c7_f048_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l482_c7_f048_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l482_c7_f048_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l482_c7_f048_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c7_f048_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l482_c7_f048_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l479_c7_e9a8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l479_c7_e9a8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l479_c7_e9a8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output := result_stack_value_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output;

     -- device_in[uxn_opcodes_h_l491_c23_549b] LATENCY=0
     -- Clock enable
     device_in_uxn_opcodes_h_l491_c23_549b_CLOCK_ENABLE <= VAR_device_in_uxn_opcodes_h_l491_c23_549b_CLOCK_ENABLE;
     -- Inputs
     device_in_uxn_opcodes_h_l491_c23_549b_device_address <= VAR_device_in_uxn_opcodes_h_l491_c23_549b_device_address;
     device_in_uxn_opcodes_h_l491_c23_549b_phase <= VAR_device_in_uxn_opcodes_h_l491_c23_549b_phase;
     device_in_uxn_opcodes_h_l491_c23_549b_previous_device_ram_read <= VAR_device_in_uxn_opcodes_h_l491_c23_549b_previous_device_ram_read;
     -- Outputs
     VAR_device_in_uxn_opcodes_h_l491_c23_549b_return_output := device_in_uxn_opcodes_h_l491_c23_549b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l479_c7_e9a8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_e9a8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_e9a8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l467_c2_b1f7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_b1f7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_b1f7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l479_c7_e9a8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_e9a8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_e9a8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l479_c7_e9a8] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l479_c7_e9a8_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l479_c7_e9a8_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output := has_written_to_t_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l479_c7_e9a8] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l479_c7_e9a8_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l479_c7_e9a8_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output := current_dei_phase_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l479_c7_e9a8] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l479_c7_e9a8_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l479_c7_e9a8_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output := has_written_to_n_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l479_c7_e9a8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_e9a8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_e9a8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output;

     -- Submodule level 6
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue := VAR_device_in_uxn_opcodes_h_l491_c23_549b_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output;
     -- has_written_to_n_MUX[uxn_opcodes_h_l467_c2_b1f7] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l467_c2_b1f7_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l467_c2_b1f7_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output := has_written_to_n_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l467_c2_b1f7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_b1f7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_b1f7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l467_c2_b1f7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_b1f7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_b1f7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l467_c2_b1f7] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l467_c2_b1f7_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c2_b1f7_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output := current_dei_phase_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l467_c2_b1f7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_b1f7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_b1f7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l490_c3_38c2] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l490_c3_38c2_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l490_c3_38c2_cond;
     device_in_result_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l490_c3_38c2_return_output := device_in_result_MUX_uxn_opcodes_h_l490_c3_38c2_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l467_c2_b1f7] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l467_c2_b1f7_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l467_c2_b1f7_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output := has_written_to_t_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output;

     -- CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l495_l497_DUPLICATE_6730 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l495_l497_DUPLICATE_6730_return_output := VAR_device_in_uxn_opcodes_h_l491_c23_549b_return_output.is_dei_done;

     -- result_stack_value_MUX[uxn_opcodes_h_l467_c2_b1f7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l467_c2_b1f7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l467_c2_b1f7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output := result_stack_value_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output;

     -- CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d[uxn_opcodes_h_l492_c32_c1cf] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l492_c32_c1cf_return_output := VAR_device_in_uxn_opcodes_h_l491_c23_549b_return_output.device_ram_address;

     -- Submodule level 7
     VAR_BIN_OP_AND_uxn_opcodes_h_l495_c9_ca3b_right := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l495_l497_DUPLICATE_6730_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_aec2_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l495_l497_DUPLICATE_6730_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l492_c32_c1cf_return_output;
     REG_VAR_current_dei_phase := VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l482_c7_f048_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l490_c3_38c2_return_output;
     REG_VAR_has_written_to_n := VAR_has_written_to_n_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output;
     REG_VAR_has_written_to_t := VAR_has_written_to_t_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l490_c3_38c2] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_38c2_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_38c2_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_38c2_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_38c2_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l497_c11_aec2] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_aec2_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_aec2_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_aec2_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_aec2_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_aec2_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_aec2_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_aec2_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_aec2_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l495_c9_ca3b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l495_c9_ca3b_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l495_c9_ca3b_left;
     BIN_OP_AND_uxn_opcodes_h_l495_c9_ca3b_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l495_c9_ca3b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l495_c9_ca3b_return_output := BIN_OP_AND_uxn_opcodes_h_l495_c9_ca3b_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l482_c7_f048] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l482_c7_f048_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l482_c7_f048_cond;
     device_in_result_MUX_uxn_opcodes_h_l482_c7_f048_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l482_c7_f048_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l482_c7_f048_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l482_c7_f048_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l482_c7_f048_return_output := device_in_result_MUX_uxn_opcodes_h_l482_c7_f048_return_output;

     -- Submodule level 8
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4_cond := VAR_BIN_OP_AND_uxn_opcodes_h_l495_c9_ca3b_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4_cond := VAR_BIN_OP_AND_uxn_opcodes_h_l495_c9_ca3b_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l482_c7_f048_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l497_c11_aec2_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f048_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l490_c3_38c2_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l482_c7_f048] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f048_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f048_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f048_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f048_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f048_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f048_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f048_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f048_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l479_c7_e9a8] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l479_c7_e9a8_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l479_c7_e9a8_cond;
     device_in_result_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output := device_in_result_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l495_c4_e7a4] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l495_c4_e7a4] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4_return_output;

     -- Submodule level 9
     VAR_device_in_result_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c4_e7a4_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l482_c7_f048_return_output;
     -- device_in_result_MUX[uxn_opcodes_h_l467_c2_b1f7] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l467_c2_b1f7_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l467_c2_b1f7_cond;
     device_in_result_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output := device_in_result_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l490_c3_38c2] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l479_c7_e9a8] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_e9a8_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_e9a8_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l490_c3_38c2] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2_return_output;

     -- Submodule level 10
     REG_VAR_device_in_result := VAR_device_in_result_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f048_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f048_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l490_c3_38c2_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l467_c2_b1f7] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_b1f7_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_b1f7_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l482_c7_f048] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f048_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f048_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f048_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f048_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f048_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f048_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f048_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f048_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l482_c7_f048] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f048_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f048_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f048_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f048_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f048_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f048_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f048_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f048_return_output;

     -- Submodule level 11
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c7_f048_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c7_f048_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_cbf8_uxn_opcodes_h_l519_l461_DUPLICATE_522a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cbf8_uxn_opcodes_h_l519_l461_DUPLICATE_522a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_cbf8(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output);

     -- is_first_dei_done_MUX[uxn_opcodes_h_l479_c7_e9a8] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l479_c7_e9a8] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output;

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cbf8_uxn_opcodes_h_l519_l461_DUPLICATE_522a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cbf8_uxn_opcodes_h_l519_l461_DUPLICATE_522a_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l479_c7_e9a8_return_output;
     -- is_second_dei_done_MUX[uxn_opcodes_h_l467_c2_b1f7] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l467_c2_b1f7] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output;

     -- Submodule level 13
     REG_VAR_is_first_dei_done := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output;
     REG_VAR_is_second_dei_done := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l467_c2_b1f7_return_output;
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
