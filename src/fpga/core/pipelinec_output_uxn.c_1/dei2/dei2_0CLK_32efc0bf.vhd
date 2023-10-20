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
-- Submodules: 93
entity dei2_0CLK_32efc0bf is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end dei2_0CLK_32efc0bf;
architecture arch of dei2_0CLK_32efc0bf is
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
-- BIN_OP_EQ[uxn_opcodes_h_l465_c6_83ef]
signal BIN_OP_EQ_uxn_opcodes_h_l465_c6_83ef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l465_c6_83ef_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l465_c6_83ef_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l477_c7_f9cc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f9cc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l465_c2_9655]
signal has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9655_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9655_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9655_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9655_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l465_c2_9655]
signal device_in_result_MUX_uxn_opcodes_h_l465_c2_9655_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l465_c2_9655_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l465_c2_9655_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l465_c2_9655_return_output : device_in_result_t;

-- is_second_dei_done_MUX[uxn_opcodes_h_l465_c2_9655]
signal is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9655_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9655_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9655_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9655_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l465_c2_9655]
signal t8_MUX_uxn_opcodes_h_l465_c2_9655_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l465_c2_9655_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l465_c2_9655_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l465_c2_9655_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l465_c2_9655]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9655_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9655_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9655_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9655_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l465_c2_9655]
signal result_u8_value_MUX_uxn_opcodes_h_l465_c2_9655_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l465_c2_9655_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l465_c2_9655_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l465_c2_9655_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l465_c2_9655]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9655_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9655_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9655_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9655_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l465_c2_9655]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9655_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9655_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9655_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9655_return_output : signed(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l465_c2_9655]
signal result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9655_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9655_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9655_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9655_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l465_c2_9655]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9655_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9655_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9655_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9655_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l465_c2_9655]
signal result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9655_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9655_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9655_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9655_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l465_c2_9655]
signal result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9655_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9655_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9655_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9655_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l465_c2_9655]
signal has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9655_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9655_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9655_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9655_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l465_c2_9655]
signal is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9655_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9655_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9655_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9655_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l465_c2_9655]
signal current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9655_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9655_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9655_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9655_return_output : unsigned(7 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l465_c2_9655]
signal dei_param_MUX_uxn_opcodes_h_l465_c2_9655_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l465_c2_9655_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l465_c2_9655_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l465_c2_9655_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l477_c11_91d5]
signal BIN_OP_EQ_uxn_opcodes_h_l477_c11_91d5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l477_c11_91d5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l477_c11_91d5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l480_c7_31b0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_31b0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_31b0_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l477_c7_f9cc]
signal has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f9cc_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l477_c7_f9cc]
signal device_in_result_MUX_uxn_opcodes_h_l477_c7_f9cc_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output : device_in_result_t;

-- is_second_dei_done_MUX[uxn_opcodes_h_l477_c7_f9cc]
signal is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l477_c7_f9cc]
signal t8_MUX_uxn_opcodes_h_l477_c7_f9cc_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l477_c7_f9cc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f9cc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l477_c7_f9cc]
signal result_u8_value_MUX_uxn_opcodes_h_l477_c7_f9cc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l477_c7_f9cc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f9cc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l477_c7_f9cc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f9cc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l477_c7_f9cc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f9cc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output : signed(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l477_c7_f9cc]
signal result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f9cc_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l477_c7_f9cc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f9cc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l477_c7_f9cc]
signal has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f9cc_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l477_c7_f9cc]
signal is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l477_c7_f9cc]
signal current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f9cc_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output : unsigned(7 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l477_c7_f9cc]
signal dei_param_MUX_uxn_opcodes_h_l477_c7_f9cc_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l480_c11_7821]
signal BIN_OP_EQ_uxn_opcodes_h_l480_c11_7821_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l480_c11_7821_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l480_c11_7821_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l485_c1_a046]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_a046_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_a046_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_a046_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_a046_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l480_c7_31b0]
signal has_written_to_n_MUX_uxn_opcodes_h_l480_c7_31b0_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l480_c7_31b0_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l480_c7_31b0]
signal device_in_result_MUX_uxn_opcodes_h_l480_c7_31b0_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l480_c7_31b0_return_output : device_in_result_t;

-- is_second_dei_done_MUX[uxn_opcodes_h_l480_c7_31b0]
signal is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l480_c7_31b0]
signal t8_MUX_uxn_opcodes_h_l480_c7_31b0_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l480_c7_31b0_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l480_c7_31b0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_31b0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_31b0_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l480_c7_31b0]
signal result_u8_value_MUX_uxn_opcodes_h_l480_c7_31b0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l480_c7_31b0_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l480_c7_31b0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_31b0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_31b0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l480_c7_31b0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_31b0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_31b0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l480_c7_31b0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_31b0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_31b0_return_output : signed(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l480_c7_31b0]
signal result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_31b0_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_31b0_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l480_c7_31b0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_31b0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_31b0_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l480_c7_31b0]
signal has_written_to_t_MUX_uxn_opcodes_h_l480_c7_31b0_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l480_c7_31b0_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l480_c7_31b0]
signal is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l480_c7_31b0]
signal current_dei_phase_MUX_uxn_opcodes_h_l480_c7_31b0_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l480_c7_31b0_return_output : unsigned(7 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l480_c7_31b0]
signal dei_param_MUX_uxn_opcodes_h_l480_c7_31b0_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l480_c7_31b0_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l483_c30_e2c0]
signal sp_relative_shift_uxn_opcodes_h_l483_c30_e2c0_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l483_c30_e2c0_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l483_c30_e2c0_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l483_c30_e2c0_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l487_c35_ed2f]
signal BIN_OP_PLUS_uxn_opcodes_h_l487_c35_ed2f_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l487_c35_ed2f_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l487_c35_ed2f_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l487_c15_7452]
signal MUX_uxn_opcodes_h_l487_c15_7452_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l487_c15_7452_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l487_c15_7452_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l487_c15_7452_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l488_c49_2ba7]
signal UNARY_OP_NOT_uxn_opcodes_h_l488_c49_2ba7_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l488_c49_2ba7_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l488_c29_2e2d]
signal BIN_OP_AND_uxn_opcodes_h_l488_c29_2e2d_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l488_c29_2e2d_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l488_c29_2e2d_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l488_c8_f23c]
signal BIN_OP_OR_uxn_opcodes_h_l488_c8_f23c_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l488_c8_f23c_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l488_c8_f23c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l488_c1_3134]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_3134_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_3134_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_3134_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_3134_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l488_c3_09c7]
signal has_written_to_n_MUX_uxn_opcodes_h_l488_c3_09c7_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l488_c3_09c7_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l488_c3_09c7]
signal device_in_result_MUX_uxn_opcodes_h_l488_c3_09c7_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l488_c3_09c7_return_output : device_in_result_t;

-- is_second_dei_done_MUX[uxn_opcodes_h_l488_c3_09c7]
signal is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l488_c3_09c7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_09c7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_09c7_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l488_c3_09c7]
signal result_u8_value_MUX_uxn_opcodes_h_l488_c3_09c7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l488_c3_09c7_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l488_c3_09c7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_09c7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_09c7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l488_c3_09c7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_09c7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_09c7_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l488_c3_09c7]
signal result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_09c7_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_09c7_return_output : unsigned(7 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l488_c3_09c7]
signal has_written_to_t_MUX_uxn_opcodes_h_l488_c3_09c7_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l488_c3_09c7_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l488_c3_09c7]
signal is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l488_c3_09c7]
signal current_dei_phase_MUX_uxn_opcodes_h_l488_c3_09c7_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l488_c3_09c7_return_output : unsigned(7 downto 0);

-- device_in[uxn_opcodes_h_l489_c23_e11a]
signal device_in_uxn_opcodes_h_l489_c23_e11a_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_in_uxn_opcodes_h_l489_c23_e11a_device_address : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l489_c23_e11a_phase : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l489_c23_e11a_previous_device_ram_read : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l489_c23_e11a_return_output : device_in_result_t;

-- BIN_OP_PLUS[uxn_opcodes_h_l492_c4_8535]
signal BIN_OP_PLUS_uxn_opcodes_h_l492_c4_8535_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l492_c4_8535_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l492_c4_8535_return_output : unsigned(8 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l493_c9_5e3f]
signal BIN_OP_AND_uxn_opcodes_h_l493_c9_5e3f_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l493_c9_5e3f_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l493_c9_5e3f_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l493_c4_9147]
signal is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_9147_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_9147_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_9147_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_9147_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l493_c4_9147]
signal is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_9147_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_9147_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_9147_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_9147_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l495_c11_3e8c]
signal is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_3e8c_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_3e8c_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_3e8c_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_3e8c_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l499_c13_d7ba]
signal UNARY_OP_NOT_uxn_opcodes_h_l499_c13_d7ba_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l499_c13_d7ba_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l499_c8_7468]
signal has_written_to_n_MUX_uxn_opcodes_h_l499_c8_7468_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l499_c8_7468_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l499_c8_7468_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l499_c8_7468_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l499_c8_7468]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_7468_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_7468_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_7468_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_7468_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l499_c8_7468]
signal result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_7468_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_7468_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_7468_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_7468_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l499_c8_7468]
signal result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_7468_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_7468_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_7468_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_7468_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l499_c8_7468]
signal result_u8_value_MUX_uxn_opcodes_h_l499_c8_7468_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l499_c8_7468_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l499_c8_7468_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l499_c8_7468_return_output : unsigned(7 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l499_c8_7468]
signal has_written_to_t_MUX_uxn_opcodes_h_l499_c8_7468_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l499_c8_7468_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l499_c8_7468_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l499_c8_7468_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l499_c8_7468]
signal current_dei_phase_MUX_uxn_opcodes_h_l499_c8_7468_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l499_c8_7468_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l499_c8_7468_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l499_c8_7468_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l506_c13_1f00]
signal UNARY_OP_NOT_uxn_opcodes_h_l506_c13_1f00_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l506_c13_1f00_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l506_c8_af1e]
signal has_written_to_n_MUX_uxn_opcodes_h_l506_c8_af1e_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l506_c8_af1e_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l506_c8_af1e_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l506_c8_af1e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l506_c8_af1e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_af1e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_af1e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_af1e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_af1e_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l506_c8_af1e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_af1e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_af1e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_af1e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_af1e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l506_c8_af1e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_af1e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_af1e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_af1e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_af1e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l506_c8_af1e]
signal result_u8_value_MUX_uxn_opcodes_h_l506_c8_af1e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l506_c8_af1e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l506_c8_af1e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l506_c8_af1e_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l488_l493_DUPLICATE_533b
signal UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l488_l493_DUPLICATE_533b_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l488_l493_DUPLICATE_533b_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_5be4( ref_toks_0 : opcode_result_t;
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
      base.u8_value := ref_toks_2;
      base.is_device_ram_write := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.device_ram_address := ref_toks_5;
      base.is_sp_shift := ref_toks_6;
      base.is_stack_write := ref_toks_7;
      base.is_opc_done := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l465_c6_83ef
BIN_OP_EQ_uxn_opcodes_h_l465_c6_83ef : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l465_c6_83ef_left,
BIN_OP_EQ_uxn_opcodes_h_l465_c6_83ef_right,
BIN_OP_EQ_uxn_opcodes_h_l465_c6_83ef_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f9cc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f9cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f9cc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9655
has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9655 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9655_cond,
has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9655_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9655_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9655_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l465_c2_9655
device_in_result_MUX_uxn_opcodes_h_l465_c2_9655 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l465_c2_9655_cond,
device_in_result_MUX_uxn_opcodes_h_l465_c2_9655_iftrue,
device_in_result_MUX_uxn_opcodes_h_l465_c2_9655_iffalse,
device_in_result_MUX_uxn_opcodes_h_l465_c2_9655_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9655
is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9655 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9655_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9655_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9655_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9655_return_output);

-- t8_MUX_uxn_opcodes_h_l465_c2_9655
t8_MUX_uxn_opcodes_h_l465_c2_9655 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l465_c2_9655_cond,
t8_MUX_uxn_opcodes_h_l465_c2_9655_iftrue,
t8_MUX_uxn_opcodes_h_l465_c2_9655_iffalse,
t8_MUX_uxn_opcodes_h_l465_c2_9655_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9655
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9655 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9655_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9655_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9655_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9655_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l465_c2_9655
result_u8_value_MUX_uxn_opcodes_h_l465_c2_9655 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l465_c2_9655_cond,
result_u8_value_MUX_uxn_opcodes_h_l465_c2_9655_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l465_c2_9655_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l465_c2_9655_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9655
result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9655 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9655_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9655_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9655_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9655_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9655
result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9655 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9655_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9655_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9655_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9655_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9655
result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9655 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9655_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9655_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9655_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9655_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9655
result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9655 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9655_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9655_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9655_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9655_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9655
result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9655 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9655_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9655_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9655_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9655_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9655
result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9655 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9655_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9655_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9655_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9655_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9655
has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9655 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9655_cond,
has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9655_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9655_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9655_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9655
is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9655 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9655_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9655_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9655_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9655_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9655
current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9655 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9655_cond,
current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9655_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9655_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9655_return_output);

-- dei_param_MUX_uxn_opcodes_h_l465_c2_9655
dei_param_MUX_uxn_opcodes_h_l465_c2_9655 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l465_c2_9655_cond,
dei_param_MUX_uxn_opcodes_h_l465_c2_9655_iftrue,
dei_param_MUX_uxn_opcodes_h_l465_c2_9655_iffalse,
dei_param_MUX_uxn_opcodes_h_l465_c2_9655_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l477_c11_91d5
BIN_OP_EQ_uxn_opcodes_h_l477_c11_91d5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l477_c11_91d5_left,
BIN_OP_EQ_uxn_opcodes_h_l477_c11_91d5_right,
BIN_OP_EQ_uxn_opcodes_h_l477_c11_91d5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_31b0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_31b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_31b0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_31b0_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f9cc
has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f9cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f9cc_cond,
has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l477_c7_f9cc
device_in_result_MUX_uxn_opcodes_h_l477_c7_f9cc : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l477_c7_f9cc_cond,
device_in_result_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue,
device_in_result_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse,
device_in_result_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc
is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output);

-- t8_MUX_uxn_opcodes_h_l477_c7_f9cc
t8_MUX_uxn_opcodes_h_l477_c7_f9cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l477_c7_f9cc_cond,
t8_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue,
t8_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse,
t8_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f9cc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f9cc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f9cc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l477_c7_f9cc
result_u8_value_MUX_uxn_opcodes_h_l477_c7_f9cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l477_c7_f9cc_cond,
result_u8_value_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f9cc
result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f9cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f9cc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f9cc
result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f9cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f9cc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f9cc
result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f9cc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f9cc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f9cc
result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f9cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f9cc_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f9cc
result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f9cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f9cc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f9cc
has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f9cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f9cc_cond,
has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc
is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f9cc
current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f9cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f9cc_cond,
current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output);

-- dei_param_MUX_uxn_opcodes_h_l477_c7_f9cc
dei_param_MUX_uxn_opcodes_h_l477_c7_f9cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l477_c7_f9cc_cond,
dei_param_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue,
dei_param_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse,
dei_param_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l480_c11_7821
BIN_OP_EQ_uxn_opcodes_h_l480_c11_7821 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l480_c11_7821_left,
BIN_OP_EQ_uxn_opcodes_h_l480_c11_7821_right,
BIN_OP_EQ_uxn_opcodes_h_l480_c11_7821_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_a046
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_a046 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_a046_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_a046_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_a046_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_a046_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l480_c7_31b0
has_written_to_n_MUX_uxn_opcodes_h_l480_c7_31b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l480_c7_31b0_cond,
has_written_to_n_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l480_c7_31b0_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l480_c7_31b0
device_in_result_MUX_uxn_opcodes_h_l480_c7_31b0 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l480_c7_31b0_cond,
device_in_result_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue,
device_in_result_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse,
device_in_result_MUX_uxn_opcodes_h_l480_c7_31b0_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0
is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0_return_output);

-- t8_MUX_uxn_opcodes_h_l480_c7_31b0
t8_MUX_uxn_opcodes_h_l480_c7_31b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l480_c7_31b0_cond,
t8_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue,
t8_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse,
t8_MUX_uxn_opcodes_h_l480_c7_31b0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_31b0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_31b0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_31b0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_31b0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l480_c7_31b0
result_u8_value_MUX_uxn_opcodes_h_l480_c7_31b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l480_c7_31b0_cond,
result_u8_value_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l480_c7_31b0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_31b0
result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_31b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_31b0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_31b0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_31b0
result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_31b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_31b0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_31b0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_31b0
result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_31b0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_31b0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_31b0_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_31b0
result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_31b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_31b0_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_31b0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_31b0
result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_31b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_31b0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_31b0_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l480_c7_31b0
has_written_to_t_MUX_uxn_opcodes_h_l480_c7_31b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l480_c7_31b0_cond,
has_written_to_t_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l480_c7_31b0_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0
is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l480_c7_31b0
current_dei_phase_MUX_uxn_opcodes_h_l480_c7_31b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l480_c7_31b0_cond,
current_dei_phase_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l480_c7_31b0_return_output);

-- dei_param_MUX_uxn_opcodes_h_l480_c7_31b0
dei_param_MUX_uxn_opcodes_h_l480_c7_31b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l480_c7_31b0_cond,
dei_param_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue,
dei_param_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse,
dei_param_MUX_uxn_opcodes_h_l480_c7_31b0_return_output);

-- sp_relative_shift_uxn_opcodes_h_l483_c30_e2c0
sp_relative_shift_uxn_opcodes_h_l483_c30_e2c0 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l483_c30_e2c0_ins,
sp_relative_shift_uxn_opcodes_h_l483_c30_e2c0_x,
sp_relative_shift_uxn_opcodes_h_l483_c30_e2c0_y,
sp_relative_shift_uxn_opcodes_h_l483_c30_e2c0_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l487_c35_ed2f
BIN_OP_PLUS_uxn_opcodes_h_l487_c35_ed2f : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l487_c35_ed2f_left,
BIN_OP_PLUS_uxn_opcodes_h_l487_c35_ed2f_right,
BIN_OP_PLUS_uxn_opcodes_h_l487_c35_ed2f_return_output);

-- MUX_uxn_opcodes_h_l487_c15_7452
MUX_uxn_opcodes_h_l487_c15_7452 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l487_c15_7452_cond,
MUX_uxn_opcodes_h_l487_c15_7452_iftrue,
MUX_uxn_opcodes_h_l487_c15_7452_iffalse,
MUX_uxn_opcodes_h_l487_c15_7452_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l488_c49_2ba7
UNARY_OP_NOT_uxn_opcodes_h_l488_c49_2ba7 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l488_c49_2ba7_expr,
UNARY_OP_NOT_uxn_opcodes_h_l488_c49_2ba7_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l488_c29_2e2d
BIN_OP_AND_uxn_opcodes_h_l488_c29_2e2d : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l488_c29_2e2d_left,
BIN_OP_AND_uxn_opcodes_h_l488_c29_2e2d_right,
BIN_OP_AND_uxn_opcodes_h_l488_c29_2e2d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l488_c8_f23c
BIN_OP_OR_uxn_opcodes_h_l488_c8_f23c : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l488_c8_f23c_left,
BIN_OP_OR_uxn_opcodes_h_l488_c8_f23c_right,
BIN_OP_OR_uxn_opcodes_h_l488_c8_f23c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_3134
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_3134 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_3134_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_3134_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_3134_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_3134_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l488_c3_09c7
has_written_to_n_MUX_uxn_opcodes_h_l488_c3_09c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l488_c3_09c7_cond,
has_written_to_n_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l488_c3_09c7_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l488_c3_09c7
device_in_result_MUX_uxn_opcodes_h_l488_c3_09c7 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l488_c3_09c7_cond,
device_in_result_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue,
device_in_result_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse,
device_in_result_MUX_uxn_opcodes_h_l488_c3_09c7_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7
is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_09c7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_09c7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_09c7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_09c7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l488_c3_09c7
result_u8_value_MUX_uxn_opcodes_h_l488_c3_09c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l488_c3_09c7_cond,
result_u8_value_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l488_c3_09c7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_09c7
result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_09c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_09c7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_09c7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_09c7
result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_09c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_09c7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_09c7_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_09c7
result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_09c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_09c7_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_09c7_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l488_c3_09c7
has_written_to_t_MUX_uxn_opcodes_h_l488_c3_09c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l488_c3_09c7_cond,
has_written_to_t_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l488_c3_09c7_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7
is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l488_c3_09c7
current_dei_phase_MUX_uxn_opcodes_h_l488_c3_09c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l488_c3_09c7_cond,
current_dei_phase_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l488_c3_09c7_return_output);

-- device_in_uxn_opcodes_h_l489_c23_e11a
device_in_uxn_opcodes_h_l489_c23_e11a : entity work.device_in_0CLK_5af1a430 port map (
clk,
device_in_uxn_opcodes_h_l489_c23_e11a_CLOCK_ENABLE,
device_in_uxn_opcodes_h_l489_c23_e11a_device_address,
device_in_uxn_opcodes_h_l489_c23_e11a_phase,
device_in_uxn_opcodes_h_l489_c23_e11a_previous_device_ram_read,
device_in_uxn_opcodes_h_l489_c23_e11a_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l492_c4_8535
BIN_OP_PLUS_uxn_opcodes_h_l492_c4_8535 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l492_c4_8535_left,
BIN_OP_PLUS_uxn_opcodes_h_l492_c4_8535_right,
BIN_OP_PLUS_uxn_opcodes_h_l492_c4_8535_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l493_c9_5e3f
BIN_OP_AND_uxn_opcodes_h_l493_c9_5e3f : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l493_c9_5e3f_left,
BIN_OP_AND_uxn_opcodes_h_l493_c9_5e3f_right,
BIN_OP_AND_uxn_opcodes_h_l493_c9_5e3f_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_9147
is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_9147 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_9147_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_9147_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_9147_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_9147_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_9147
is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_9147 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_9147_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_9147_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_9147_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_9147_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_3e8c
is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_3e8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_3e8c_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_3e8c_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_3e8c_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_3e8c_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l499_c13_d7ba
UNARY_OP_NOT_uxn_opcodes_h_l499_c13_d7ba : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l499_c13_d7ba_expr,
UNARY_OP_NOT_uxn_opcodes_h_l499_c13_d7ba_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l499_c8_7468
has_written_to_n_MUX_uxn_opcodes_h_l499_c8_7468 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l499_c8_7468_cond,
has_written_to_n_MUX_uxn_opcodes_h_l499_c8_7468_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l499_c8_7468_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l499_c8_7468_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_7468
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_7468 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_7468_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_7468_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_7468_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_7468_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_7468
result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_7468 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_7468_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_7468_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_7468_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_7468_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_7468
result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_7468 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_7468_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_7468_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_7468_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_7468_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l499_c8_7468
result_u8_value_MUX_uxn_opcodes_h_l499_c8_7468 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l499_c8_7468_cond,
result_u8_value_MUX_uxn_opcodes_h_l499_c8_7468_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l499_c8_7468_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l499_c8_7468_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l499_c8_7468
has_written_to_t_MUX_uxn_opcodes_h_l499_c8_7468 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l499_c8_7468_cond,
has_written_to_t_MUX_uxn_opcodes_h_l499_c8_7468_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l499_c8_7468_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l499_c8_7468_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l499_c8_7468
current_dei_phase_MUX_uxn_opcodes_h_l499_c8_7468 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l499_c8_7468_cond,
current_dei_phase_MUX_uxn_opcodes_h_l499_c8_7468_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l499_c8_7468_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l499_c8_7468_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l506_c13_1f00
UNARY_OP_NOT_uxn_opcodes_h_l506_c13_1f00 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l506_c13_1f00_expr,
UNARY_OP_NOT_uxn_opcodes_h_l506_c13_1f00_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l506_c8_af1e
has_written_to_n_MUX_uxn_opcodes_h_l506_c8_af1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l506_c8_af1e_cond,
has_written_to_n_MUX_uxn_opcodes_h_l506_c8_af1e_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l506_c8_af1e_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l506_c8_af1e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_af1e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_af1e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_af1e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_af1e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_af1e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_af1e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_af1e
result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_af1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_af1e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_af1e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_af1e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_af1e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_af1e
result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_af1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_af1e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_af1e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_af1e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_af1e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l506_c8_af1e
result_u8_value_MUX_uxn_opcodes_h_l506_c8_af1e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l506_c8_af1e_cond,
result_u8_value_MUX_uxn_opcodes_h_l506_c8_af1e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l506_c8_af1e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l506_c8_af1e_return_output);

-- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l488_l493_DUPLICATE_533b
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l488_l493_DUPLICATE_533b : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l488_l493_DUPLICATE_533b_expr,
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l488_l493_DUPLICATE_533b_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l465_c6_83ef_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9655_return_output,
 device_in_result_MUX_uxn_opcodes_h_l465_c2_9655_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9655_return_output,
 t8_MUX_uxn_opcodes_h_l465_c2_9655_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9655_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l465_c2_9655_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9655_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9655_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9655_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9655_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9655_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9655_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9655_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9655_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9655_return_output,
 dei_param_MUX_uxn_opcodes_h_l465_c2_9655_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l477_c11_91d5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_31b0_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output,
 device_in_result_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output,
 t8_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output,
 dei_param_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l480_c11_7821_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_a046_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l480_c7_31b0_return_output,
 device_in_result_MUX_uxn_opcodes_h_l480_c7_31b0_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0_return_output,
 t8_MUX_uxn_opcodes_h_l480_c7_31b0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_31b0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l480_c7_31b0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_31b0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_31b0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_31b0_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_31b0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_31b0_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l480_c7_31b0_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l480_c7_31b0_return_output,
 dei_param_MUX_uxn_opcodes_h_l480_c7_31b0_return_output,
 sp_relative_shift_uxn_opcodes_h_l483_c30_e2c0_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l487_c35_ed2f_return_output,
 MUX_uxn_opcodes_h_l487_c15_7452_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l488_c49_2ba7_return_output,
 BIN_OP_AND_uxn_opcodes_h_l488_c29_2e2d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l488_c8_f23c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_3134_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l488_c3_09c7_return_output,
 device_in_result_MUX_uxn_opcodes_h_l488_c3_09c7_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_09c7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l488_c3_09c7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_09c7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_09c7_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_09c7_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l488_c3_09c7_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l488_c3_09c7_return_output,
 device_in_uxn_opcodes_h_l489_c23_e11a_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l492_c4_8535_return_output,
 BIN_OP_AND_uxn_opcodes_h_l493_c9_5e3f_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_9147_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_9147_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_3e8c_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l499_c13_d7ba_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l499_c8_7468_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_7468_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_7468_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_7468_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l499_c8_7468_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l499_c8_7468_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l499_c8_7468_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l506_c13_1f00_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l506_c8_af1e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_af1e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_af1e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_af1e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l506_c8_af1e_return_output,
 UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l488_l493_DUPLICATE_533b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_83ef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_83ef_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_83ef_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f9cc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9655_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9655_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9655_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9655_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l465_c2_9655_iftrue : device_in_result_t;
 variable VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l465_c2_9655_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l465_c2_9655_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l465_c2_9655_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l465_c2_9655_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9655_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9655_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9655_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9655_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l465_c2_9655_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l465_c2_9655_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l465_c2_9655_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l465_c2_9655_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9655_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l472_c3_a84a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9655_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9655_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9655_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l465_c2_9655_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l465_c2_9655_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l465_c2_9655_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l465_c2_9655_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9655_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9655_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l465_c2_9655_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9655_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9655_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9655_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9655_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9655_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9655_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9655_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9655_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9655_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9655_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9655_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9655_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9655_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9655_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9655_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9655_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9655_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9655_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9655_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9655_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9655_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9655_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9655_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9655_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9655_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9655_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9655_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9655_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9655_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9655_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9655_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l471_c3_2438 : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9655_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9655_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9655_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l465_c2_9655_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l465_c2_9655_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l465_c2_9655_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l465_c2_9655_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_91d5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_91d5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_91d5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_31b0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_31b0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l480_c7_31b0_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f9cc_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l480_c7_31b0_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_f9cc_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l480_c7_31b0_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l477_c7_f9cc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l478_c3_ff67 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_31b0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f9cc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l480_c7_31b0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c7_f9cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_31b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f9cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_31b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f9cc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_31b0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f9cc_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_31b0_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f9cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_31b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f9cc_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l480_c7_31b0_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f9cc_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l480_c7_31b0_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f9cc_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l480_c7_31b0_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_f9cc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_7821_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_7821_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_7821_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_a046_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_a046_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_a046_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_a046_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c3_09c7_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l480_c7_31b0_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l488_c3_09c7_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l480_c7_31b0_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l480_c7_31b0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_09c7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_31b0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c3_09c7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l480_c7_31b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_09c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_31b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_09c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_31b0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_31b0_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_09c7_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_31b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_31b0_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c3_09c7_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l480_c7_31b0_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c3_09c7_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l480_c7_31b0_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l480_c7_31b0_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l483_c30_e2c0_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l483_c30_e2c0_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l483_c30_e2c0_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l483_c30_e2c0_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l487_c15_7452_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l487_c15_7452_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l487_c15_7452_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l487_c35_ed2f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l487_c35_ed2f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l487_c35_ed2f_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l487_c15_7452_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_f23c_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l488_c29_2e2d_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c49_2ba7_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c49_2ba7_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l488_c29_2e2d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l488_c29_2e2d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_f23c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_f23c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_3134_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_3134_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_3134_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_3134_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l499_c8_7468_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c3_09c7_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l488_c3_09c7_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_9147_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_7468_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_09c7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l499_c8_7468_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c3_09c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_7468_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_09c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_7468_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_09c7_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_09c7_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l499_c8_7468_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c3_09c7_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_9147_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l492_c4_a3b1 : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l499_c8_7468_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c3_09c7_cond : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l489_c23_e11a_device_address : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l489_c23_e11a_phase : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l489_c23_e11a_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l489_c23_e11a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l489_c23_e11a_return_output : device_in_result_t;
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l490_c32_aea8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l492_c4_8535_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l492_c4_8535_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l492_c4_8535_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l493_c9_5e3f_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l493_c9_5e3f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l493_c9_5e3f_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_9147_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_9147_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_3e8c_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_9147_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_9147_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_9147_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_9147_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_3e8c_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_3e8c_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_3e8c_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l499_c13_d7ba_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l499_c13_d7ba_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l499_c8_7468_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l499_c8_7468_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l506_c8_af1e_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l499_c8_7468_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_7468_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l502_c4_876c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_7468_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_af1e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_7468_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_7468_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_7468_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_af1e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_7468_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_7468_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_7468_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_af1e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_7468_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l499_c8_7468_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l499_c8_7468_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c8_af1e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l499_c8_7468_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l499_c8_7468_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l499_c8_7468_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l499_c8_7468_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l499_c8_7468_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l500_c4_eb4f : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l499_c8_7468_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l499_c8_7468_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l506_c13_1f00_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l506_c13_1f00_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l506_c8_af1e_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l506_c8_af1e_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l506_c8_af1e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_af1e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l507_c4_4528 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_af1e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_af1e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_af1e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_af1e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_af1e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_af1e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_af1e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_af1e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c8_af1e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c8_af1e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c8_af1e_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l480_l465_l488_l506_l477_DUPLICATE_35c6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l480_l477_l465_DUPLICATE_3971_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l488_l480_l477_l465_DUPLICATE_112b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l477_l465_DUPLICATE_6e75_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l506_l480_l477_l465_DUPLICATE_cd45_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l499_l480_l488_l506_l477_DUPLICATE_9fc5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l488_l480_l506_DUPLICATE_24ce_return_output : unsigned(3 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l488_l493_DUPLICATE_533b_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l488_l493_DUPLICATE_533b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l493_l495_DUPLICATE_eab6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l508_l503_DUPLICATE_bd03_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5be4_uxn_opcodes_h_l517_l459_DUPLICATE_2660_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l472_c3_a84a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9655_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l472_c3_a84a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_7821_right := to_unsigned(2, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_a046_iftrue := to_unsigned(0, 1);
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9655_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_7468_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l483_c30_e2c0_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l483_c30_e2c0_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l487_c35_ed2f_right := to_unsigned(1, 1);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l499_c8_7468_iftrue := to_unsigned(1, 1);
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9655_iftrue := to_unsigned(0, 1);
     VAR_current_dei_phase_uxn_opcodes_h_l471_c3_2438 := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9655_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l471_c3_2438;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l506_c8_af1e_iftrue := to_unsigned(1, 1);
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9655_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_3134_iffalse := to_unsigned(0, 1);
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_3e8c_iftrue := to_unsigned(1, 1);
     VAR_current_dei_phase_uxn_opcodes_h_l500_c4_eb4f := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l499_c8_7468_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l500_c4_eb4f;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l492_c4_8535_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_91d5_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l507_c4_4528 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_af1e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l507_c4_4528;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9655_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_83ef_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l502_c4_876c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_7468_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l502_c4_876c;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_af1e_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l478_c3_ff67 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l478_c3_ff67;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_af1e_iffalse := to_unsigned(1, 1);
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_9147_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9655_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9655_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l492_c4_8535_left := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l499_c8_7468_iffalse := current_dei_phase;
     VAR_device_in_uxn_opcodes_h_l489_c23_e11a_phase := current_dei_phase;
     VAR_dei_param_MUX_uxn_opcodes_h_l465_c2_9655_iftrue := dei_param;
     VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue := dei_param;
     VAR_dei_param_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue := dei_param;
     VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse := device_in_result;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l506_c13_1f00_expr := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l499_c8_7468_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l506_c8_af1e_iffalse := has_written_to_n;
     VAR_BIN_OP_AND_uxn_opcodes_h_l488_c29_2e2d_left := has_written_to_t;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l499_c13_d7ba_expr := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l499_c8_7468_iffalse := has_written_to_t;
     VAR_sp_relative_shift_uxn_opcodes_h_l483_c30_e2c0_ins := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l487_c15_7452_cond := is_first_dei_done;
     VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l488_l493_DUPLICATE_533b_expr := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_9147_iffalse := is_first_dei_done;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c49_2ba7_expr := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_9147_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_3e8c_iffalse := is_second_dei_done;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_83ef_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_91d5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_7821_left := VAR_phase;
     VAR_device_in_uxn_opcodes_h_l489_c23_e11a_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l487_c35_ed2f_left := t8;
     VAR_MUX_uxn_opcodes_h_l487_c15_7452_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l465_c2_9655_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse := t8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l480_l465_l488_l506_l477_DUPLICATE_35c6 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l480_l465_l488_l506_l477_DUPLICATE_35c6_return_output := result.u8_value;

     -- sp_relative_shift[uxn_opcodes_h_l483_c30_e2c0] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l483_c30_e2c0_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l483_c30_e2c0_ins;
     sp_relative_shift_uxn_opcodes_h_l483_c30_e2c0_x <= VAR_sp_relative_shift_uxn_opcodes_h_l483_c30_e2c0_x;
     sp_relative_shift_uxn_opcodes_h_l483_c30_e2c0_y <= VAR_sp_relative_shift_uxn_opcodes_h_l483_c30_e2c0_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l483_c30_e2c0_return_output := sp_relative_shift_uxn_opcodes_h_l483_c30_e2c0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l477_l465_DUPLICATE_6e75 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l477_l465_DUPLICATE_6e75_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l488_l480_l477_l465_DUPLICATE_112b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l488_l480_l477_l465_DUPLICATE_112b_return_output := result.device_ram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l506_l480_l477_l465_DUPLICATE_cd45 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l506_l480_l477_l465_DUPLICATE_cd45_return_output := result.is_stack_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l480_l477_l465_DUPLICATE_3971 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l480_l477_l465_DUPLICATE_3971_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l508_l503_DUPLICATE_bd03 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l508_l503_DUPLICATE_bd03_return_output := device_in_result.dei_value;

     -- result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l465_c2_9655] LATENCY=0
     VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l465_c2_9655_return_output := result.is_device_ram_write;

     -- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l488_l493_DUPLICATE_533b LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l488_l493_DUPLICATE_533b_expr <= VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l488_l493_DUPLICATE_533b_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l488_l493_DUPLICATE_533b_return_output := UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l488_l493_DUPLICATE_533b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l499_l480_l488_l506_l477_DUPLICATE_9fc5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l499_l480_l488_l506_l477_DUPLICATE_9fc5_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l488_l480_l506_DUPLICATE_24ce LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l488_l480_l506_DUPLICATE_24ce_return_output := result.stack_address_sp_offset;

     -- UNARY_OP_NOT[uxn_opcodes_h_l506_c13_1f00] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l506_c13_1f00_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l506_c13_1f00_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l506_c13_1f00_return_output := UNARY_OP_NOT_uxn_opcodes_h_l506_c13_1f00_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l480_c11_7821] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l480_c11_7821_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_7821_left;
     BIN_OP_EQ_uxn_opcodes_h_l480_c11_7821_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_7821_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_7821_return_output := BIN_OP_EQ_uxn_opcodes_h_l480_c11_7821_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l465_c6_83ef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l465_c6_83ef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_83ef_left;
     BIN_OP_EQ_uxn_opcodes_h_l465_c6_83ef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_83ef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_83ef_return_output := BIN_OP_EQ_uxn_opcodes_h_l465_c6_83ef_return_output;

     -- device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6[uxn_opcodes_h_l465_c2_9655] LATENCY=0
     VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l465_c2_9655_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6(
     device_in_result,
     to_unsigned(0, 1));

     -- BIN_OP_PLUS[uxn_opcodes_h_l487_c35_ed2f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l487_c35_ed2f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l487_c35_ed2f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l487_c35_ed2f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l487_c35_ed2f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l487_c35_ed2f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l487_c35_ed2f_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l492_c4_8535] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l492_c4_8535_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l492_c4_8535_left;
     BIN_OP_PLUS_uxn_opcodes_h_l492_c4_8535_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l492_c4_8535_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l492_c4_8535_return_output := BIN_OP_PLUS_uxn_opcodes_h_l492_c4_8535_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l499_c13_d7ba] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l499_c13_d7ba_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l499_c13_d7ba_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l499_c13_d7ba_return_output := UNARY_OP_NOT_uxn_opcodes_h_l499_c13_d7ba_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l477_c11_91d5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l477_c11_91d5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_91d5_left;
     BIN_OP_EQ_uxn_opcodes_h_l477_c11_91d5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_91d5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_91d5_return_output := BIN_OP_EQ_uxn_opcodes_h_l477_c11_91d5_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l488_c49_2ba7] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l488_c49_2ba7_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c49_2ba7_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c49_2ba7_return_output := UNARY_OP_NOT_uxn_opcodes_h_l488_c49_2ba7_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f9cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_83ef_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9655_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_83ef_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l465_c2_9655_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_83ef_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l465_c2_9655_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_83ef_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9655_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_83ef_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9655_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_83ef_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9655_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_83ef_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9655_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_83ef_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9655_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_83ef_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9655_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_83ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9655_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_83ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9655_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_83ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9655_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_83ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9655_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_83ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9655_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_83ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l465_c2_9655_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_83ef_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l465_c2_9655_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_83ef_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_31b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_91d5_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f9cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_91d5_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_f9cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_91d5_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_f9cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_91d5_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f9cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_91d5_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f9cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_91d5_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_91d5_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_91d5_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f9cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_91d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f9cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_91d5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f9cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_91d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f9cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_91d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f9cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_91d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f9cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_91d5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c7_f9cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_91d5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l477_c7_f9cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_91d5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_a046_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_7821_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l480_c7_31b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_7821_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l480_c7_31b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_7821_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l480_c7_31b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_7821_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l480_c7_31b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_7821_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l480_c7_31b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_7821_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_7821_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_7821_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_31b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_7821_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_31b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_7821_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_31b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_7821_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_31b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_7821_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_31b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_7821_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_31b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_7821_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l480_c7_31b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_7821_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l480_c7_31b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_7821_return_output;
     VAR_MUX_uxn_opcodes_h_l487_c15_7452_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l487_c35_ed2f_return_output, 8);
     VAR_current_dei_phase_uxn_opcodes_h_l492_c4_a3b1 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l492_c4_8535_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9655_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l480_l477_l465_DUPLICATE_3971_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l480_l477_l465_DUPLICATE_3971_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l480_l477_l465_DUPLICATE_3971_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l499_l480_l488_l506_l477_DUPLICATE_9fc5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l499_l480_l488_l506_l477_DUPLICATE_9fc5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l499_l480_l488_l506_l477_DUPLICATE_9fc5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_7468_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l499_l480_l488_l506_l477_DUPLICATE_9fc5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_af1e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l499_l480_l488_l506_l477_DUPLICATE_9fc5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9655_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l477_l465_DUPLICATE_6e75_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l477_l465_DUPLICATE_6e75_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9655_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l506_l480_l477_l465_DUPLICATE_cd45_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l506_l480_l477_l465_DUPLICATE_cd45_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l506_l480_l477_l465_DUPLICATE_cd45_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_af1e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l506_l480_l477_l465_DUPLICATE_cd45_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l488_l480_l506_DUPLICATE_24ce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l488_l480_l506_DUPLICATE_24ce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_af1e_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l488_l480_l506_DUPLICATE_24ce_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l499_c8_7468_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l508_l503_DUPLICATE_bd03_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c8_af1e_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l508_l503_DUPLICATE_bd03_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9655_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l488_l480_l477_l465_DUPLICATE_112b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l488_l480_l477_l465_DUPLICATE_112b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l488_l480_l477_l465_DUPLICATE_112b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l488_l480_l477_l465_DUPLICATE_112b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l465_c2_9655_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l480_l465_l488_l506_l477_DUPLICATE_35c6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l480_l465_l488_l506_l477_DUPLICATE_35c6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l480_l465_l488_l506_l477_DUPLICATE_35c6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l480_l465_l488_l506_l477_DUPLICATE_35c6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c8_af1e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l480_l465_l488_l506_l477_DUPLICATE_35c6_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l488_c29_2e2d_right := VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c49_2ba7_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l499_c8_7468_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l499_c13_d7ba_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l499_c8_7468_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l499_c13_d7ba_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l499_c8_7468_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l499_c13_d7ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_7468_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l499_c13_d7ba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_7468_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l499_c13_d7ba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_7468_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l499_c13_d7ba_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l499_c8_7468_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l499_c13_d7ba_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l506_c8_af1e_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l506_c13_1f00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_af1e_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l506_c13_1f00_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_af1e_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l506_c13_1f00_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_af1e_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l506_c13_1f00_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c8_af1e_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l506_c13_1f00_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l493_c9_5e3f_left := VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l488_l493_DUPLICATE_533b_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_f23c_left := VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l488_l493_DUPLICATE_533b_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l465_c2_9655_iftrue := VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l465_c2_9655_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9655_iffalse := VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l465_c2_9655_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l483_c30_e2c0_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l492_c4_a3b1;
     -- MUX[uxn_opcodes_h_l487_c15_7452] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l487_c15_7452_cond <= VAR_MUX_uxn_opcodes_h_l487_c15_7452_cond;
     MUX_uxn_opcodes_h_l487_c15_7452_iftrue <= VAR_MUX_uxn_opcodes_h_l487_c15_7452_iftrue;
     MUX_uxn_opcodes_h_l487_c15_7452_iffalse <= VAR_MUX_uxn_opcodes_h_l487_c15_7452_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l487_c15_7452_return_output := MUX_uxn_opcodes_h_l487_c15_7452_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l506_c8_af1e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_af1e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_af1e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_af1e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_af1e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_af1e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_af1e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_af1e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_af1e_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l465_c2_9655] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9655_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9655_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9655_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9655_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9655_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9655_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9655_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9655_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l488_c29_2e2d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l488_c29_2e2d_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l488_c29_2e2d_left;
     BIN_OP_AND_uxn_opcodes_h_l488_c29_2e2d_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l488_c29_2e2d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l488_c29_2e2d_return_output := BIN_OP_AND_uxn_opcodes_h_l488_c29_2e2d_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l506_c8_af1e] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l506_c8_af1e_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l506_c8_af1e_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l506_c8_af1e_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l506_c8_af1e_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l506_c8_af1e_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l506_c8_af1e_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l506_c8_af1e_return_output := has_written_to_n_MUX_uxn_opcodes_h_l506_c8_af1e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l506_c8_af1e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_af1e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_af1e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_af1e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_af1e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_af1e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_af1e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_af1e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_af1e_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l499_c8_7468] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l499_c8_7468_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l499_c8_7468_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l499_c8_7468_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l499_c8_7468_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l499_c8_7468_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l499_c8_7468_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l499_c8_7468_return_output := current_dei_phase_MUX_uxn_opcodes_h_l499_c8_7468_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l506_c8_af1e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_af1e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_af1e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_af1e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_af1e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_af1e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_af1e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_af1e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_af1e_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l499_c8_7468] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l499_c8_7468_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l499_c8_7468_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l499_c8_7468_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l499_c8_7468_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l499_c8_7468_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l499_c8_7468_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l499_c8_7468_return_output := has_written_to_t_MUX_uxn_opcodes_h_l499_c8_7468_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l506_c8_af1e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l506_c8_af1e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c8_af1e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l506_c8_af1e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c8_af1e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l506_c8_af1e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c8_af1e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c8_af1e_return_output := result_u8_value_MUX_uxn_opcodes_h_l506_c8_af1e_return_output;

     -- t8_MUX[uxn_opcodes_h_l480_c7_31b0] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l480_c7_31b0_cond <= VAR_t8_MUX_uxn_opcodes_h_l480_c7_31b0_cond;
     t8_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue;
     t8_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l480_c7_31b0_return_output := t8_MUX_uxn_opcodes_h_l480_c7_31b0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l480_c7_31b0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_31b0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_31b0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_31b0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_31b0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l477_c7_f9cc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f9cc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f9cc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l480_c7_31b0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_31b0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_31b0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_31b0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_31b0_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_f23c_right := VAR_BIN_OP_AND_uxn_opcodes_h_l488_c29_2e2d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse := VAR_MUX_uxn_opcodes_h_l487_c15_7452_return_output;
     VAR_device_in_uxn_opcodes_h_l489_c23_e11a_device_address := VAR_MUX_uxn_opcodes_h_l487_c15_7452_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l499_c8_7468_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l499_c8_7468_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l506_c8_af1e_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l499_c8_7468_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_7468_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_af1e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_31b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_7468_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_af1e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_31b0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_7468_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_af1e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l499_c8_7468_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c8_af1e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse := VAR_t8_MUX_uxn_opcodes_h_l480_c7_31b0_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l499_c8_7468] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_7468_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_7468_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_7468_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_7468_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_7468_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_7468_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_7468_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_7468_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l499_c8_7468] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l499_c8_7468_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l499_c8_7468_cond;
     result_u8_value_MUX_uxn_opcodes_h_l499_c8_7468_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l499_c8_7468_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l499_c8_7468_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l499_c8_7468_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l499_c8_7468_return_output := result_u8_value_MUX_uxn_opcodes_h_l499_c8_7468_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l480_c7_31b0] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l480_c7_31b0_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l480_c7_31b0_cond;
     dei_param_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue;
     dei_param_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l480_c7_31b0_return_output := dei_param_MUX_uxn_opcodes_h_l480_c7_31b0_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l488_c8_f23c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l488_c8_f23c_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_f23c_left;
     BIN_OP_OR_uxn_opcodes_h_l488_c8_f23c_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_f23c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_f23c_return_output := BIN_OP_OR_uxn_opcodes_h_l488_c8_f23c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l477_c7_f9cc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f9cc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f9cc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l477_c7_f9cc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f9cc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f9cc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l499_c8_7468] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l499_c8_7468_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l499_c8_7468_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l499_c8_7468_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l499_c8_7468_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l499_c8_7468_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l499_c8_7468_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l499_c8_7468_return_output := has_written_to_n_MUX_uxn_opcodes_h_l499_c8_7468_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l499_c8_7468] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_7468_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_7468_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_7468_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_7468_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_7468_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_7468_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_7468_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_7468_return_output;

     -- t8_MUX[uxn_opcodes_h_l477_c7_f9cc] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l477_c7_f9cc_cond <= VAR_t8_MUX_uxn_opcodes_h_l477_c7_f9cc_cond;
     t8_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue;
     t8_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output := t8_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l499_c8_7468] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_7468_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_7468_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_7468_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_7468_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_7468_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_7468_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_7468_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_7468_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l480_c7_31b0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_31b0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_31b0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_31b0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_31b0_return_output;

     -- Submodule level 3
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_3134_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_f23c_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c3_09c7_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_f23c_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l488_c3_09c7_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_f23c_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c3_09c7_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_f23c_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c3_09c7_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_f23c_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_f23c_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_f23c_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_09c7_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_f23c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_09c7_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_f23c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_09c7_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_f23c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_09c7_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_f23c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c3_09c7_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_f23c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_a046_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_31b0_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse := VAR_dei_param_MUX_uxn_opcodes_h_l480_c7_31b0_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l499_c8_7468_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_7468_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9655_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_7468_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9655_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_7468_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l499_c8_7468_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l465_c2_9655_iffalse := VAR_t8_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l465_c2_9655] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9655_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9655_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9655_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9655_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9655_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9655_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9655_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9655_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l488_c3_09c7] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l488_c3_09c7_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c3_09c7_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c3_09c7_return_output := current_dei_phase_MUX_uxn_opcodes_h_l488_c3_09c7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l488_c3_09c7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_09c7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_09c7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_09c7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_09c7_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l488_c3_09c7] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l488_c3_09c7_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c3_09c7_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c3_09c7_return_output := has_written_to_n_MUX_uxn_opcodes_h_l488_c3_09c7_return_output;

     -- t8_MUX[uxn_opcodes_h_l465_c2_9655] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l465_c2_9655_cond <= VAR_t8_MUX_uxn_opcodes_h_l465_c2_9655_cond;
     t8_MUX_uxn_opcodes_h_l465_c2_9655_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l465_c2_9655_iftrue;
     t8_MUX_uxn_opcodes_h_l465_c2_9655_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l465_c2_9655_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l465_c2_9655_return_output := t8_MUX_uxn_opcodes_h_l465_c2_9655_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l477_c7_f9cc] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l477_c7_f9cc_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_f9cc_cond;
     dei_param_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue;
     dei_param_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output := dei_param_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l488_c3_09c7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_09c7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_09c7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_09c7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_09c7_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l488_c3_09c7] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l488_c3_09c7_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c3_09c7_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c3_09c7_return_output := has_written_to_t_MUX_uxn_opcodes_h_l488_c3_09c7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l465_c2_9655] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9655_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9655_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9655_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9655_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9655_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9655_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9655_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9655_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l488_c3_09c7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_09c7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_09c7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_09c7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_09c7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l488_c3_09c7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l488_c3_09c7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c3_09c7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c3_09c7_return_output := result_u8_value_MUX_uxn_opcodes_h_l488_c3_09c7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l485_c1_a046] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_a046_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_a046_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_a046_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_a046_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_a046_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_a046_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_a046_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_a046_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_3134_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_a046_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c3_09c7_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l465_c2_9655_iffalse := VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c3_09c7_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c3_09c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_09c7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_09c7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_09c7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c3_09c7_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l465_c2_9655_return_output;
     -- dei_param_MUX[uxn_opcodes_h_l465_c2_9655] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l465_c2_9655_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l465_c2_9655_cond;
     dei_param_MUX_uxn_opcodes_h_l465_c2_9655_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l465_c2_9655_iftrue;
     dei_param_MUX_uxn_opcodes_h_l465_c2_9655_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l465_c2_9655_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l465_c2_9655_return_output := dei_param_MUX_uxn_opcodes_h_l465_c2_9655_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l480_c7_31b0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_31b0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_31b0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_31b0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_31b0_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l480_c7_31b0] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l480_c7_31b0_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l480_c7_31b0_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l480_c7_31b0_return_output := has_written_to_n_MUX_uxn_opcodes_h_l480_c7_31b0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l480_c7_31b0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_31b0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_31b0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_31b0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_31b0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l480_c7_31b0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l480_c7_31b0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l480_c7_31b0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l480_c7_31b0_return_output := result_u8_value_MUX_uxn_opcodes_h_l480_c7_31b0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l480_c7_31b0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_31b0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_31b0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_31b0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_31b0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l488_c1_3134] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_3134_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_3134_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_3134_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_3134_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_3134_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_3134_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_3134_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_3134_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l480_c7_31b0] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l480_c7_31b0_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l480_c7_31b0_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l480_c7_31b0_return_output := current_dei_phase_MUX_uxn_opcodes_h_l480_c7_31b0_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l480_c7_31b0] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l480_c7_31b0_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l480_c7_31b0_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l480_c7_31b0_return_output := has_written_to_t_MUX_uxn_opcodes_h_l480_c7_31b0_return_output;

     -- Submodule level 5
     VAR_device_in_uxn_opcodes_h_l489_c23_e11a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_3134_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l480_c7_31b0_return_output;
     REG_VAR_dei_param := VAR_dei_param_MUX_uxn_opcodes_h_l465_c2_9655_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l480_c7_31b0_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l480_c7_31b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_31b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_31b0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_31b0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l480_c7_31b0_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l477_c7_f9cc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f9cc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f9cc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l477_c7_f9cc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f9cc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f9cc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l477_c7_f9cc] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f9cc_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f9cc_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output := has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l477_c7_f9cc] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f9cc_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f9cc_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output := current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l477_c7_f9cc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l477_c7_f9cc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c7_f9cc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output := result_u8_value_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l477_c7_f9cc] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f9cc_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f9cc_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output := has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output;

     -- device_in[uxn_opcodes_h_l489_c23_e11a] LATENCY=0
     -- Clock enable
     device_in_uxn_opcodes_h_l489_c23_e11a_CLOCK_ENABLE <= VAR_device_in_uxn_opcodes_h_l489_c23_e11a_CLOCK_ENABLE;
     -- Inputs
     device_in_uxn_opcodes_h_l489_c23_e11a_device_address <= VAR_device_in_uxn_opcodes_h_l489_c23_e11a_device_address;
     device_in_uxn_opcodes_h_l489_c23_e11a_phase <= VAR_device_in_uxn_opcodes_h_l489_c23_e11a_phase;
     device_in_uxn_opcodes_h_l489_c23_e11a_previous_device_ram_read <= VAR_device_in_uxn_opcodes_h_l489_c23_e11a_previous_device_ram_read;
     -- Outputs
     VAR_device_in_uxn_opcodes_h_l489_c23_e11a_return_output := device_in_uxn_opcodes_h_l489_c23_e11a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l477_c7_f9cc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f9cc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f9cc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output;

     -- Submodule level 6
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9655_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue := VAR_device_in_uxn_opcodes_h_l489_c23_e11a_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9655_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9655_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9655_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9655_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9655_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l465_c2_9655_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l465_c2_9655] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l465_c2_9655_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l465_c2_9655_cond;
     result_u8_value_MUX_uxn_opcodes_h_l465_c2_9655_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l465_c2_9655_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l465_c2_9655_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l465_c2_9655_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l465_c2_9655_return_output := result_u8_value_MUX_uxn_opcodes_h_l465_c2_9655_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l465_c2_9655] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9655_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9655_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9655_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9655_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9655_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9655_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9655_return_output := has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9655_return_output;

     -- CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d[uxn_opcodes_h_l490_c32_aea8] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l490_c32_aea8_return_output := VAR_device_in_uxn_opcodes_h_l489_c23_e11a_return_output.device_ram_address;

     -- current_dei_phase_MUX[uxn_opcodes_h_l465_c2_9655] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9655_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9655_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9655_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9655_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9655_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9655_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9655_return_output := current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9655_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l465_c2_9655] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9655_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9655_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9655_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9655_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9655_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9655_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9655_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9655_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l465_c2_9655] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9655_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9655_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9655_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9655_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9655_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9655_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9655_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9655_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l488_c3_09c7] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l488_c3_09c7_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l488_c3_09c7_cond;
     device_in_result_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l488_c3_09c7_return_output := device_in_result_MUX_uxn_opcodes_h_l488_c3_09c7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l465_c2_9655] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9655_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9655_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9655_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9655_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9655_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9655_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9655_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9655_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l465_c2_9655] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9655_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9655_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9655_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9655_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9655_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9655_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9655_return_output := has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9655_return_output;

     -- CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l493_l495_DUPLICATE_eab6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l493_l495_DUPLICATE_eab6_return_output := VAR_device_in_uxn_opcodes_h_l489_c23_e11a_return_output.is_dei_done;

     -- Submodule level 7
     VAR_BIN_OP_AND_uxn_opcodes_h_l493_c9_5e3f_right := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l493_l495_DUPLICATE_eab6_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_3e8c_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l493_l495_DUPLICATE_eab6_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l490_c32_aea8_return_output;
     REG_VAR_current_dei_phase := VAR_current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9655_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l488_c3_09c7_return_output;
     REG_VAR_has_written_to_n := VAR_has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9655_return_output;
     REG_VAR_has_written_to_t := VAR_has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9655_return_output;
     -- device_in_result_MUX[uxn_opcodes_h_l480_c7_31b0] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l480_c7_31b0_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l480_c7_31b0_cond;
     device_in_result_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l480_c7_31b0_return_output := device_in_result_MUX_uxn_opcodes_h_l480_c7_31b0_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l493_c9_5e3f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l493_c9_5e3f_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l493_c9_5e3f_left;
     BIN_OP_AND_uxn_opcodes_h_l493_c9_5e3f_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l493_c9_5e3f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l493_c9_5e3f_return_output := BIN_OP_AND_uxn_opcodes_h_l493_c9_5e3f_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l495_c11_3e8c] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_3e8c_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_3e8c_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_3e8c_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_3e8c_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_3e8c_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_3e8c_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_3e8c_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_3e8c_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l488_c3_09c7] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_09c7_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_09c7_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_09c7_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_09c7_return_output;

     -- Submodule level 8
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_9147_cond := VAR_BIN_OP_AND_uxn_opcodes_h_l493_c9_5e3f_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_9147_cond := VAR_BIN_OP_AND_uxn_opcodes_h_l493_c9_5e3f_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l480_c7_31b0_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_9147_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_3e8c_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_09c7_return_output;
     -- is_first_dei_done_MUX[uxn_opcodes_h_l493_c4_9147] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_9147_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_9147_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_9147_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_9147_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_9147_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_9147_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_9147_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_9147_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l480_c7_31b0] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_31b0_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_31b0_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_31b0_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_31b0_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l477_c7_f9cc] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l477_c7_f9cc_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_f9cc_cond;
     device_in_result_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output := device_in_result_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l493_c4_9147] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_9147_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_9147_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_9147_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_9147_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_9147_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_9147_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_9147_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_9147_return_output;

     -- Submodule level 9
     VAR_device_in_result_MUX_uxn_opcodes_h_l465_c2_9655_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_9147_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_9147_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_31b0_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l477_c7_f9cc] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f9cc_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f9cc_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l488_c3_09c7] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l465_c2_9655] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l465_c2_9655_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l465_c2_9655_cond;
     device_in_result_MUX_uxn_opcodes_h_l465_c2_9655_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l465_c2_9655_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l465_c2_9655_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l465_c2_9655_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l465_c2_9655_return_output := device_in_result_MUX_uxn_opcodes_h_l465_c2_9655_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l488_c3_09c7] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7_return_output;

     -- Submodule level 10
     REG_VAR_device_in_result := VAR_device_in_result_MUX_uxn_opcodes_h_l465_c2_9655_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_09c7_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9655_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l465_c2_9655] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9655_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9655_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9655_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9655_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9655_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9655_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9655_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9655_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l480_c7_31b0] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l480_c7_31b0] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0_return_output;

     -- Submodule level 11
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_31b0_return_output;
     -- is_first_dei_done_MUX[uxn_opcodes_h_l477_c7_f9cc] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l477_c7_f9cc] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output;

     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5be4_uxn_opcodes_h_l517_l459_DUPLICATE_2660 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5be4_uxn_opcodes_h_l517_l459_DUPLICATE_2660_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5be4(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9655_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l465_c2_9655_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9655_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9655_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9655_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9655_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9655_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9655_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5be4_uxn_opcodes_h_l517_l459_DUPLICATE_2660_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5be4_uxn_opcodes_h_l517_l459_DUPLICATE_2660_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9655_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9655_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f9cc_return_output;
     -- is_second_dei_done_MUX[uxn_opcodes_h_l465_c2_9655] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9655_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9655_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9655_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9655_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9655_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9655_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9655_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9655_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l465_c2_9655] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9655_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9655_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9655_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9655_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9655_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9655_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9655_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9655_return_output;

     -- Submodule level 13
     REG_VAR_is_first_dei_done := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9655_return_output;
     REG_VAR_is_second_dei_done := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9655_return_output;
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
