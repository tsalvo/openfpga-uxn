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
-- BIN_OP_EQ[uxn_opcodes_h_l429_c6_9824]
signal BIN_OP_EQ_uxn_opcodes_h_l429_c6_9824_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l429_c6_9824_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l429_c6_9824_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l429_c1_1885]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_1885_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_1885_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_1885_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_1885_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l441_c7_8980]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_8980_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_8980_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_8980_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_8980_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l429_c2_1dc4]
signal has_written_to_t_MUX_uxn_opcodes_h_l429_c2_1dc4_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l429_c2_1dc4]
signal has_written_to_n_MUX_uxn_opcodes_h_l429_c2_1dc4_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l429_c2_1dc4]
signal t8_MUX_uxn_opcodes_h_l429_c2_1dc4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output : unsigned(7 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l429_c2_1dc4]
signal is_first_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l429_c2_1dc4]
signal result_device_ram_address_MUX_uxn_opcodes_h_l429_c2_1dc4_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l429_c2_1dc4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l429_c2_1dc4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l429_c2_1dc4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l429_c2_1dc4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l429_c2_1dc4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l429_c2_1dc4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l429_c2_1dc4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l429_c2_1dc4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l429_c2_1dc4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l429_c2_1dc4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l429_c2_1dc4]
signal result_u8_value_MUX_uxn_opcodes_h_l429_c2_1dc4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l429_c2_1dc4]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l429_c2_1dc4_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l429_c2_1dc4]
signal is_second_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output : unsigned(0 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l429_c2_1dc4]
signal dei_param_MUX_uxn_opcodes_h_l429_c2_1dc4_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l429_c2_1dc4]
signal device_in_result_MUX_uxn_opcodes_h_l429_c2_1dc4_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output : device_in_result_t;

-- current_dei_phase_MUX[uxn_opcodes_h_l429_c2_1dc4]
signal current_dei_phase_MUX_uxn_opcodes_h_l429_c2_1dc4_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l430_c3_1188[uxn_opcodes_h_l430_c3_1188]
signal printf_uxn_opcodes_h_l430_c3_1188_uxn_opcodes_h_l430_c3_1188_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l441_c11_307a]
signal BIN_OP_EQ_uxn_opcodes_h_l441_c11_307a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l441_c11_307a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l441_c11_307a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l444_c7_3c73]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l444_c7_3c73_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l444_c7_3c73_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l441_c7_8980]
signal has_written_to_t_MUX_uxn_opcodes_h_l441_c7_8980_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l441_c7_8980_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l441_c7_8980_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l441_c7_8980_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l441_c7_8980]
signal has_written_to_n_MUX_uxn_opcodes_h_l441_c7_8980_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l441_c7_8980_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l441_c7_8980_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l441_c7_8980_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l441_c7_8980]
signal t8_MUX_uxn_opcodes_h_l441_c7_8980_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l441_c7_8980_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l441_c7_8980_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l441_c7_8980_return_output : unsigned(7 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l441_c7_8980]
signal is_first_dei_done_MUX_uxn_opcodes_h_l441_c7_8980_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l441_c7_8980_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l441_c7_8980_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l441_c7_8980_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l441_c7_8980]
signal result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_8980_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_8980_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_8980_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_8980_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l441_c7_8980]
signal result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_8980_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_8980_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_8980_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_8980_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l441_c7_8980]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_8980_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_8980_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_8980_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_8980_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l441_c7_8980]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_8980_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_8980_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_8980_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_8980_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l441_c7_8980]
signal result_u8_value_MUX_uxn_opcodes_h_l441_c7_8980_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l441_c7_8980_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l441_c7_8980_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l441_c7_8980_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l441_c7_8980]
signal result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_8980_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_8980_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_8980_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_8980_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l441_c7_8980]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_8980_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_8980_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_8980_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_8980_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l441_c7_8980]
signal is_second_dei_done_MUX_uxn_opcodes_h_l441_c7_8980_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l441_c7_8980_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l441_c7_8980_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l441_c7_8980_return_output : unsigned(0 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l441_c7_8980]
signal dei_param_MUX_uxn_opcodes_h_l441_c7_8980_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l441_c7_8980_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l441_c7_8980_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l441_c7_8980_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l441_c7_8980]
signal device_in_result_MUX_uxn_opcodes_h_l441_c7_8980_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l441_c7_8980_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l441_c7_8980_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l441_c7_8980_return_output : device_in_result_t;

-- current_dei_phase_MUX[uxn_opcodes_h_l441_c7_8980]
signal current_dei_phase_MUX_uxn_opcodes_h_l441_c7_8980_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l441_c7_8980_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l441_c7_8980_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l441_c7_8980_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l444_c11_547c]
signal BIN_OP_EQ_uxn_opcodes_h_l444_c11_547c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l444_c11_547c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l444_c11_547c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l449_c1_2740]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_2740_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_2740_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_2740_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_2740_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l444_c7_3c73]
signal has_written_to_t_MUX_uxn_opcodes_h_l444_c7_3c73_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l444_c7_3c73_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l444_c7_3c73]
signal has_written_to_n_MUX_uxn_opcodes_h_l444_c7_3c73_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l444_c7_3c73_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l444_c7_3c73]
signal t8_MUX_uxn_opcodes_h_l444_c7_3c73_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l444_c7_3c73_return_output : unsigned(7 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l444_c7_3c73]
signal is_first_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l444_c7_3c73]
signal result_device_ram_address_MUX_uxn_opcodes_h_l444_c7_3c73_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l444_c7_3c73_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l444_c7_3c73]
signal result_is_stack_write_MUX_uxn_opcodes_h_l444_c7_3c73_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l444_c7_3c73_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l444_c7_3c73]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c7_3c73_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c7_3c73_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l444_c7_3c73]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l444_c7_3c73_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l444_c7_3c73_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l444_c7_3c73]
signal result_u8_value_MUX_uxn_opcodes_h_l444_c7_3c73_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l444_c7_3c73_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l444_c7_3c73]
signal result_is_opc_done_MUX_uxn_opcodes_h_l444_c7_3c73_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l444_c7_3c73_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l444_c7_3c73]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l444_c7_3c73_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l444_c7_3c73_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l444_c7_3c73]
signal is_second_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73_return_output : unsigned(0 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l444_c7_3c73]
signal dei_param_MUX_uxn_opcodes_h_l444_c7_3c73_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l444_c7_3c73_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l444_c7_3c73]
signal device_in_result_MUX_uxn_opcodes_h_l444_c7_3c73_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l444_c7_3c73_return_output : device_in_result_t;

-- current_dei_phase_MUX[uxn_opcodes_h_l444_c7_3c73]
signal current_dei_phase_MUX_uxn_opcodes_h_l444_c7_3c73_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l444_c7_3c73_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l447_c30_fe30]
signal sp_relative_shift_uxn_opcodes_h_l447_c30_fe30_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l447_c30_fe30_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l447_c30_fe30_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l447_c30_fe30_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l451_c35_343a]
signal BIN_OP_PLUS_uxn_opcodes_h_l451_c35_343a_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l451_c35_343a_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l451_c35_343a_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l451_c15_f4aa]
signal MUX_uxn_opcodes_h_l451_c15_f4aa_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l451_c15_f4aa_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l451_c15_f4aa_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l451_c15_f4aa_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l452_c49_46d8]
signal UNARY_OP_NOT_uxn_opcodes_h_l452_c49_46d8_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l452_c49_46d8_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l452_c29_e245]
signal BIN_OP_AND_uxn_opcodes_h_l452_c29_e245_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l452_c29_e245_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l452_c29_e245_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l452_c8_e4a2]
signal BIN_OP_OR_uxn_opcodes_h_l452_c8_e4a2_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l452_c8_e4a2_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l452_c8_e4a2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l452_c1_871c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_871c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_871c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_871c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_871c_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l452_c3_2910]
signal has_written_to_t_MUX_uxn_opcodes_h_l452_c3_2910_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l452_c3_2910_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l452_c3_2910_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l452_c3_2910_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l452_c3_2910]
signal has_written_to_n_MUX_uxn_opcodes_h_l452_c3_2910_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l452_c3_2910_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l452_c3_2910_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l452_c3_2910_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l452_c3_2910]
signal is_first_dei_done_MUX_uxn_opcodes_h_l452_c3_2910_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l452_c3_2910_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l452_c3_2910_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l452_c3_2910_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l452_c3_2910]
signal result_device_ram_address_MUX_uxn_opcodes_h_l452_c3_2910_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l452_c3_2910_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l452_c3_2910_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l452_c3_2910_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l452_c3_2910]
signal result_is_stack_write_MUX_uxn_opcodes_h_l452_c3_2910_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l452_c3_2910_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l452_c3_2910_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l452_c3_2910_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l452_c3_2910]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c3_2910_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c3_2910_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c3_2910_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c3_2910_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l452_c3_2910]
signal result_u8_value_MUX_uxn_opcodes_h_l452_c3_2910_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l452_c3_2910_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l452_c3_2910_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l452_c3_2910_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l452_c3_2910]
signal result_is_opc_done_MUX_uxn_opcodes_h_l452_c3_2910_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l452_c3_2910_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l452_c3_2910_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l452_c3_2910_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l452_c3_2910]
signal is_second_dei_done_MUX_uxn_opcodes_h_l452_c3_2910_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l452_c3_2910_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l452_c3_2910_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l452_c3_2910_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l452_c3_2910]
signal device_in_result_MUX_uxn_opcodes_h_l452_c3_2910_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l452_c3_2910_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l452_c3_2910_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l452_c3_2910_return_output : device_in_result_t;

-- current_dei_phase_MUX[uxn_opcodes_h_l452_c3_2910]
signal current_dei_phase_MUX_uxn_opcodes_h_l452_c3_2910_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l452_c3_2910_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l452_c3_2910_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l452_c3_2910_return_output : unsigned(7 downto 0);

-- device_in[uxn_opcodes_h_l453_c23_c21d]
signal device_in_uxn_opcodes_h_l453_c23_c21d_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_in_uxn_opcodes_h_l453_c23_c21d_device_address : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l453_c23_c21d_phase : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l453_c23_c21d_previous_device_ram_read : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l453_c23_c21d_return_output : device_in_result_t;

-- BIN_OP_PLUS[uxn_opcodes_h_l456_c4_b0e1]
signal BIN_OP_PLUS_uxn_opcodes_h_l456_c4_b0e1_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l456_c4_b0e1_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l456_c4_b0e1_return_output : unsigned(8 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l457_c9_b355]
signal BIN_OP_AND_uxn_opcodes_h_l457_c9_b355_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l457_c9_b355_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l457_c9_b355_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l457_c4_4c15]
signal is_first_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l457_c4_4c15]
signal is_second_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l459_c11_1790]
signal is_second_dei_done_MUX_uxn_opcodes_h_l459_c11_1790_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l459_c11_1790_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l459_c11_1790_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l459_c11_1790_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l463_c13_320e]
signal UNARY_OP_NOT_uxn_opcodes_h_l463_c13_320e_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l463_c13_320e_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l463_c8_49da]
signal has_written_to_t_MUX_uxn_opcodes_h_l463_c8_49da_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l463_c8_49da_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l463_c8_49da_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l463_c8_49da_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l463_c8_49da]
signal has_written_to_n_MUX_uxn_opcodes_h_l463_c8_49da_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l463_c8_49da_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l463_c8_49da_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l463_c8_49da_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l463_c8_49da]
signal result_is_stack_write_MUX_uxn_opcodes_h_l463_c8_49da_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l463_c8_49da_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l463_c8_49da_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l463_c8_49da_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l463_c8_49da]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c8_49da_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c8_49da_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c8_49da_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c8_49da_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l463_c8_49da]
signal result_is_opc_done_MUX_uxn_opcodes_h_l463_c8_49da_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l463_c8_49da_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l463_c8_49da_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l463_c8_49da_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l463_c8_49da]
signal result_u8_value_MUX_uxn_opcodes_h_l463_c8_49da_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l463_c8_49da_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l463_c8_49da_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l463_c8_49da_return_output : unsigned(7 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l463_c8_49da]
signal current_dei_phase_MUX_uxn_opcodes_h_l463_c8_49da_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l463_c8_49da_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l463_c8_49da_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l463_c8_49da_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l470_c13_8d8a]
signal UNARY_OP_NOT_uxn_opcodes_h_l470_c13_8d8a_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l470_c13_8d8a_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l470_c8_0e81]
signal has_written_to_n_MUX_uxn_opcodes_h_l470_c8_0e81_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l470_c8_0e81_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l470_c8_0e81_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l470_c8_0e81_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l470_c8_0e81]
signal result_is_stack_write_MUX_uxn_opcodes_h_l470_c8_0e81_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l470_c8_0e81_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l470_c8_0e81_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l470_c8_0e81_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l470_c8_0e81]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c8_0e81_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c8_0e81_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c8_0e81_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c8_0e81_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l470_c8_0e81]
signal result_is_opc_done_MUX_uxn_opcodes_h_l470_c8_0e81_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l470_c8_0e81_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l470_c8_0e81_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l470_c8_0e81_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l470_c8_0e81]
signal result_u8_value_MUX_uxn_opcodes_h_l470_c8_0e81_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l470_c8_0e81_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l470_c8_0e81_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l470_c8_0e81_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l457_l452_DUPLICATE_6d5a
signal UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l457_l452_DUPLICATE_6d5a_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l457_l452_DUPLICATE_6d5a_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_6c44( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.device_ram_address := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.u8_value := ref_toks_7;
      base.is_device_ram_write := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l429_c6_9824
BIN_OP_EQ_uxn_opcodes_h_l429_c6_9824 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l429_c6_9824_left,
BIN_OP_EQ_uxn_opcodes_h_l429_c6_9824_right,
BIN_OP_EQ_uxn_opcodes_h_l429_c6_9824_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_1885
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_1885 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_1885_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_1885_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_1885_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_1885_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_8980
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_8980 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_8980_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_8980_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_8980_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_8980_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l429_c2_1dc4
has_written_to_t_MUX_uxn_opcodes_h_l429_c2_1dc4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l429_c2_1dc4_cond,
has_written_to_t_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l429_c2_1dc4
has_written_to_n_MUX_uxn_opcodes_h_l429_c2_1dc4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l429_c2_1dc4_cond,
has_written_to_n_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output);

-- t8_MUX_uxn_opcodes_h_l429_c2_1dc4
t8_MUX_uxn_opcodes_h_l429_c2_1dc4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l429_c2_1dc4_cond,
t8_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue,
t8_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse,
t8_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4
is_first_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l429_c2_1dc4
result_device_ram_address_MUX_uxn_opcodes_h_l429_c2_1dc4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l429_c2_1dc4_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l429_c2_1dc4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l429_c2_1dc4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l429_c2_1dc4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l429_c2_1dc4
result_sp_relative_shift_MUX_uxn_opcodes_h_l429_c2_1dc4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l429_c2_1dc4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l429_c2_1dc4
result_is_opc_done_MUX_uxn_opcodes_h_l429_c2_1dc4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l429_c2_1dc4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l429_c2_1dc4
result_is_sp_shift_MUX_uxn_opcodes_h_l429_c2_1dc4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l429_c2_1dc4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l429_c2_1dc4
result_is_stack_write_MUX_uxn_opcodes_h_l429_c2_1dc4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l429_c2_1dc4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l429_c2_1dc4
result_u8_value_MUX_uxn_opcodes_h_l429_c2_1dc4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l429_c2_1dc4_cond,
result_u8_value_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l429_c2_1dc4
result_is_device_ram_write_MUX_uxn_opcodes_h_l429_c2_1dc4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l429_c2_1dc4_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4
is_second_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output);

-- dei_param_MUX_uxn_opcodes_h_l429_c2_1dc4
dei_param_MUX_uxn_opcodes_h_l429_c2_1dc4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l429_c2_1dc4_cond,
dei_param_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue,
dei_param_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse,
dei_param_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l429_c2_1dc4
device_in_result_MUX_uxn_opcodes_h_l429_c2_1dc4 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l429_c2_1dc4_cond,
device_in_result_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue,
device_in_result_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse,
device_in_result_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l429_c2_1dc4
current_dei_phase_MUX_uxn_opcodes_h_l429_c2_1dc4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l429_c2_1dc4_cond,
current_dei_phase_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output);

-- printf_uxn_opcodes_h_l430_c3_1188_uxn_opcodes_h_l430_c3_1188
printf_uxn_opcodes_h_l430_c3_1188_uxn_opcodes_h_l430_c3_1188 : entity work.printf_uxn_opcodes_h_l430_c3_1188_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l430_c3_1188_uxn_opcodes_h_l430_c3_1188_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l441_c11_307a
BIN_OP_EQ_uxn_opcodes_h_l441_c11_307a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l441_c11_307a_left,
BIN_OP_EQ_uxn_opcodes_h_l441_c11_307a_right,
BIN_OP_EQ_uxn_opcodes_h_l441_c11_307a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l444_c7_3c73
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l444_c7_3c73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l444_c7_3c73_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l444_c7_3c73_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l441_c7_8980
has_written_to_t_MUX_uxn_opcodes_h_l441_c7_8980 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l441_c7_8980_cond,
has_written_to_t_MUX_uxn_opcodes_h_l441_c7_8980_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l441_c7_8980_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l441_c7_8980_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l441_c7_8980
has_written_to_n_MUX_uxn_opcodes_h_l441_c7_8980 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l441_c7_8980_cond,
has_written_to_n_MUX_uxn_opcodes_h_l441_c7_8980_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l441_c7_8980_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l441_c7_8980_return_output);

-- t8_MUX_uxn_opcodes_h_l441_c7_8980
t8_MUX_uxn_opcodes_h_l441_c7_8980 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l441_c7_8980_cond,
t8_MUX_uxn_opcodes_h_l441_c7_8980_iftrue,
t8_MUX_uxn_opcodes_h_l441_c7_8980_iffalse,
t8_MUX_uxn_opcodes_h_l441_c7_8980_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l441_c7_8980
is_first_dei_done_MUX_uxn_opcodes_h_l441_c7_8980 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l441_c7_8980_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l441_c7_8980_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l441_c7_8980_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l441_c7_8980_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_8980
result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_8980 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_8980_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_8980_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_8980_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_8980_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_8980
result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_8980 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_8980_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_8980_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_8980_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_8980_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_8980
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_8980 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_8980_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_8980_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_8980_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_8980_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_8980
result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_8980 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_8980_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_8980_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_8980_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_8980_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l441_c7_8980
result_u8_value_MUX_uxn_opcodes_h_l441_c7_8980 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l441_c7_8980_cond,
result_u8_value_MUX_uxn_opcodes_h_l441_c7_8980_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l441_c7_8980_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l441_c7_8980_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_8980
result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_8980 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_8980_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_8980_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_8980_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_8980_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_8980
result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_8980 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_8980_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_8980_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_8980_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_8980_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l441_c7_8980
is_second_dei_done_MUX_uxn_opcodes_h_l441_c7_8980 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l441_c7_8980_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l441_c7_8980_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l441_c7_8980_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l441_c7_8980_return_output);

-- dei_param_MUX_uxn_opcodes_h_l441_c7_8980
dei_param_MUX_uxn_opcodes_h_l441_c7_8980 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l441_c7_8980_cond,
dei_param_MUX_uxn_opcodes_h_l441_c7_8980_iftrue,
dei_param_MUX_uxn_opcodes_h_l441_c7_8980_iffalse,
dei_param_MUX_uxn_opcodes_h_l441_c7_8980_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l441_c7_8980
device_in_result_MUX_uxn_opcodes_h_l441_c7_8980 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l441_c7_8980_cond,
device_in_result_MUX_uxn_opcodes_h_l441_c7_8980_iftrue,
device_in_result_MUX_uxn_opcodes_h_l441_c7_8980_iffalse,
device_in_result_MUX_uxn_opcodes_h_l441_c7_8980_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l441_c7_8980
current_dei_phase_MUX_uxn_opcodes_h_l441_c7_8980 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l441_c7_8980_cond,
current_dei_phase_MUX_uxn_opcodes_h_l441_c7_8980_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l441_c7_8980_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l441_c7_8980_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l444_c11_547c
BIN_OP_EQ_uxn_opcodes_h_l444_c11_547c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l444_c11_547c_left,
BIN_OP_EQ_uxn_opcodes_h_l444_c11_547c_right,
BIN_OP_EQ_uxn_opcodes_h_l444_c11_547c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_2740
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_2740 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_2740_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_2740_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_2740_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_2740_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l444_c7_3c73
has_written_to_t_MUX_uxn_opcodes_h_l444_c7_3c73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l444_c7_3c73_cond,
has_written_to_t_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l444_c7_3c73_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l444_c7_3c73
has_written_to_n_MUX_uxn_opcodes_h_l444_c7_3c73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l444_c7_3c73_cond,
has_written_to_n_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l444_c7_3c73_return_output);

-- t8_MUX_uxn_opcodes_h_l444_c7_3c73
t8_MUX_uxn_opcodes_h_l444_c7_3c73 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l444_c7_3c73_cond,
t8_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue,
t8_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse,
t8_MUX_uxn_opcodes_h_l444_c7_3c73_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73
is_first_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l444_c7_3c73
result_device_ram_address_MUX_uxn_opcodes_h_l444_c7_3c73 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l444_c7_3c73_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l444_c7_3c73_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l444_c7_3c73
result_is_stack_write_MUX_uxn_opcodes_h_l444_c7_3c73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l444_c7_3c73_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l444_c7_3c73_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c7_3c73
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c7_3c73 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c7_3c73_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c7_3c73_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l444_c7_3c73
result_sp_relative_shift_MUX_uxn_opcodes_h_l444_c7_3c73 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l444_c7_3c73_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l444_c7_3c73_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l444_c7_3c73
result_u8_value_MUX_uxn_opcodes_h_l444_c7_3c73 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l444_c7_3c73_cond,
result_u8_value_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l444_c7_3c73_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l444_c7_3c73
result_is_opc_done_MUX_uxn_opcodes_h_l444_c7_3c73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l444_c7_3c73_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l444_c7_3c73_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l444_c7_3c73
result_is_sp_shift_MUX_uxn_opcodes_h_l444_c7_3c73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l444_c7_3c73_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l444_c7_3c73_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73
is_second_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73_return_output);

-- dei_param_MUX_uxn_opcodes_h_l444_c7_3c73
dei_param_MUX_uxn_opcodes_h_l444_c7_3c73 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l444_c7_3c73_cond,
dei_param_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue,
dei_param_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse,
dei_param_MUX_uxn_opcodes_h_l444_c7_3c73_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l444_c7_3c73
device_in_result_MUX_uxn_opcodes_h_l444_c7_3c73 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l444_c7_3c73_cond,
device_in_result_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue,
device_in_result_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse,
device_in_result_MUX_uxn_opcodes_h_l444_c7_3c73_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l444_c7_3c73
current_dei_phase_MUX_uxn_opcodes_h_l444_c7_3c73 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l444_c7_3c73_cond,
current_dei_phase_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l444_c7_3c73_return_output);

-- sp_relative_shift_uxn_opcodes_h_l447_c30_fe30
sp_relative_shift_uxn_opcodes_h_l447_c30_fe30 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l447_c30_fe30_ins,
sp_relative_shift_uxn_opcodes_h_l447_c30_fe30_x,
sp_relative_shift_uxn_opcodes_h_l447_c30_fe30_y,
sp_relative_shift_uxn_opcodes_h_l447_c30_fe30_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l451_c35_343a
BIN_OP_PLUS_uxn_opcodes_h_l451_c35_343a : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l451_c35_343a_left,
BIN_OP_PLUS_uxn_opcodes_h_l451_c35_343a_right,
BIN_OP_PLUS_uxn_opcodes_h_l451_c35_343a_return_output);

-- MUX_uxn_opcodes_h_l451_c15_f4aa
MUX_uxn_opcodes_h_l451_c15_f4aa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l451_c15_f4aa_cond,
MUX_uxn_opcodes_h_l451_c15_f4aa_iftrue,
MUX_uxn_opcodes_h_l451_c15_f4aa_iffalse,
MUX_uxn_opcodes_h_l451_c15_f4aa_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l452_c49_46d8
UNARY_OP_NOT_uxn_opcodes_h_l452_c49_46d8 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l452_c49_46d8_expr,
UNARY_OP_NOT_uxn_opcodes_h_l452_c49_46d8_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l452_c29_e245
BIN_OP_AND_uxn_opcodes_h_l452_c29_e245 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l452_c29_e245_left,
BIN_OP_AND_uxn_opcodes_h_l452_c29_e245_right,
BIN_OP_AND_uxn_opcodes_h_l452_c29_e245_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l452_c8_e4a2
BIN_OP_OR_uxn_opcodes_h_l452_c8_e4a2 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l452_c8_e4a2_left,
BIN_OP_OR_uxn_opcodes_h_l452_c8_e4a2_right,
BIN_OP_OR_uxn_opcodes_h_l452_c8_e4a2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_871c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_871c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_871c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_871c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_871c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_871c_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l452_c3_2910
has_written_to_t_MUX_uxn_opcodes_h_l452_c3_2910 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l452_c3_2910_cond,
has_written_to_t_MUX_uxn_opcodes_h_l452_c3_2910_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l452_c3_2910_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l452_c3_2910_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l452_c3_2910
has_written_to_n_MUX_uxn_opcodes_h_l452_c3_2910 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l452_c3_2910_cond,
has_written_to_n_MUX_uxn_opcodes_h_l452_c3_2910_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l452_c3_2910_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l452_c3_2910_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l452_c3_2910
is_first_dei_done_MUX_uxn_opcodes_h_l452_c3_2910 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l452_c3_2910_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l452_c3_2910_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l452_c3_2910_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l452_c3_2910_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l452_c3_2910
result_device_ram_address_MUX_uxn_opcodes_h_l452_c3_2910 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l452_c3_2910_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l452_c3_2910_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l452_c3_2910_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l452_c3_2910_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l452_c3_2910
result_is_stack_write_MUX_uxn_opcodes_h_l452_c3_2910 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l452_c3_2910_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l452_c3_2910_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l452_c3_2910_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l452_c3_2910_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c3_2910
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c3_2910 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c3_2910_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c3_2910_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c3_2910_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c3_2910_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l452_c3_2910
result_u8_value_MUX_uxn_opcodes_h_l452_c3_2910 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l452_c3_2910_cond,
result_u8_value_MUX_uxn_opcodes_h_l452_c3_2910_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l452_c3_2910_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l452_c3_2910_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l452_c3_2910
result_is_opc_done_MUX_uxn_opcodes_h_l452_c3_2910 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l452_c3_2910_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l452_c3_2910_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l452_c3_2910_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l452_c3_2910_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l452_c3_2910
is_second_dei_done_MUX_uxn_opcodes_h_l452_c3_2910 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l452_c3_2910_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l452_c3_2910_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l452_c3_2910_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l452_c3_2910_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l452_c3_2910
device_in_result_MUX_uxn_opcodes_h_l452_c3_2910 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l452_c3_2910_cond,
device_in_result_MUX_uxn_opcodes_h_l452_c3_2910_iftrue,
device_in_result_MUX_uxn_opcodes_h_l452_c3_2910_iffalse,
device_in_result_MUX_uxn_opcodes_h_l452_c3_2910_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l452_c3_2910
current_dei_phase_MUX_uxn_opcodes_h_l452_c3_2910 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l452_c3_2910_cond,
current_dei_phase_MUX_uxn_opcodes_h_l452_c3_2910_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l452_c3_2910_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l452_c3_2910_return_output);

-- device_in_uxn_opcodes_h_l453_c23_c21d
device_in_uxn_opcodes_h_l453_c23_c21d : entity work.device_in_0CLK_b9b05a79 port map (
clk,
device_in_uxn_opcodes_h_l453_c23_c21d_CLOCK_ENABLE,
device_in_uxn_opcodes_h_l453_c23_c21d_device_address,
device_in_uxn_opcodes_h_l453_c23_c21d_phase,
device_in_uxn_opcodes_h_l453_c23_c21d_previous_device_ram_read,
device_in_uxn_opcodes_h_l453_c23_c21d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l456_c4_b0e1
BIN_OP_PLUS_uxn_opcodes_h_l456_c4_b0e1 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l456_c4_b0e1_left,
BIN_OP_PLUS_uxn_opcodes_h_l456_c4_b0e1_right,
BIN_OP_PLUS_uxn_opcodes_h_l456_c4_b0e1_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l457_c9_b355
BIN_OP_AND_uxn_opcodes_h_l457_c9_b355 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l457_c9_b355_left,
BIN_OP_AND_uxn_opcodes_h_l457_c9_b355_right,
BIN_OP_AND_uxn_opcodes_h_l457_c9_b355_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15
is_first_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15
is_second_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l459_c11_1790
is_second_dei_done_MUX_uxn_opcodes_h_l459_c11_1790 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l459_c11_1790_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l459_c11_1790_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l459_c11_1790_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l459_c11_1790_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l463_c13_320e
UNARY_OP_NOT_uxn_opcodes_h_l463_c13_320e : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l463_c13_320e_expr,
UNARY_OP_NOT_uxn_opcodes_h_l463_c13_320e_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l463_c8_49da
has_written_to_t_MUX_uxn_opcodes_h_l463_c8_49da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l463_c8_49da_cond,
has_written_to_t_MUX_uxn_opcodes_h_l463_c8_49da_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l463_c8_49da_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l463_c8_49da_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l463_c8_49da
has_written_to_n_MUX_uxn_opcodes_h_l463_c8_49da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l463_c8_49da_cond,
has_written_to_n_MUX_uxn_opcodes_h_l463_c8_49da_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l463_c8_49da_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l463_c8_49da_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l463_c8_49da
result_is_stack_write_MUX_uxn_opcodes_h_l463_c8_49da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l463_c8_49da_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l463_c8_49da_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l463_c8_49da_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l463_c8_49da_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c8_49da
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c8_49da : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c8_49da_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c8_49da_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c8_49da_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c8_49da_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l463_c8_49da
result_is_opc_done_MUX_uxn_opcodes_h_l463_c8_49da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l463_c8_49da_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l463_c8_49da_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l463_c8_49da_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l463_c8_49da_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l463_c8_49da
result_u8_value_MUX_uxn_opcodes_h_l463_c8_49da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l463_c8_49da_cond,
result_u8_value_MUX_uxn_opcodes_h_l463_c8_49da_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l463_c8_49da_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l463_c8_49da_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l463_c8_49da
current_dei_phase_MUX_uxn_opcodes_h_l463_c8_49da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l463_c8_49da_cond,
current_dei_phase_MUX_uxn_opcodes_h_l463_c8_49da_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l463_c8_49da_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l463_c8_49da_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l470_c13_8d8a
UNARY_OP_NOT_uxn_opcodes_h_l470_c13_8d8a : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l470_c13_8d8a_expr,
UNARY_OP_NOT_uxn_opcodes_h_l470_c13_8d8a_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l470_c8_0e81
has_written_to_n_MUX_uxn_opcodes_h_l470_c8_0e81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l470_c8_0e81_cond,
has_written_to_n_MUX_uxn_opcodes_h_l470_c8_0e81_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l470_c8_0e81_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l470_c8_0e81_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l470_c8_0e81
result_is_stack_write_MUX_uxn_opcodes_h_l470_c8_0e81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l470_c8_0e81_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l470_c8_0e81_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l470_c8_0e81_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l470_c8_0e81_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c8_0e81
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c8_0e81 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c8_0e81_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c8_0e81_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c8_0e81_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c8_0e81_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l470_c8_0e81
result_is_opc_done_MUX_uxn_opcodes_h_l470_c8_0e81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l470_c8_0e81_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l470_c8_0e81_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l470_c8_0e81_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l470_c8_0e81_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l470_c8_0e81
result_u8_value_MUX_uxn_opcodes_h_l470_c8_0e81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l470_c8_0e81_cond,
result_u8_value_MUX_uxn_opcodes_h_l470_c8_0e81_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l470_c8_0e81_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l470_c8_0e81_return_output);

-- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l457_l452_DUPLICATE_6d5a
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l457_l452_DUPLICATE_6d5a : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l457_l452_DUPLICATE_6d5a_expr,
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l457_l452_DUPLICATE_6d5a_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l429_c6_9824_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_1885_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_8980_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output,
 t8_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output,
 dei_param_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output,
 device_in_result_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l441_c11_307a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l444_c7_3c73_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l441_c7_8980_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l441_c7_8980_return_output,
 t8_MUX_uxn_opcodes_h_l441_c7_8980_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l441_c7_8980_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_8980_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_8980_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_8980_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_8980_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l441_c7_8980_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_8980_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_8980_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l441_c7_8980_return_output,
 dei_param_MUX_uxn_opcodes_h_l441_c7_8980_return_output,
 device_in_result_MUX_uxn_opcodes_h_l441_c7_8980_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l441_c7_8980_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l444_c11_547c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_2740_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l444_c7_3c73_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l444_c7_3c73_return_output,
 t8_MUX_uxn_opcodes_h_l444_c7_3c73_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l444_c7_3c73_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l444_c7_3c73_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c7_3c73_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l444_c7_3c73_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l444_c7_3c73_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l444_c7_3c73_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l444_c7_3c73_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73_return_output,
 dei_param_MUX_uxn_opcodes_h_l444_c7_3c73_return_output,
 device_in_result_MUX_uxn_opcodes_h_l444_c7_3c73_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l444_c7_3c73_return_output,
 sp_relative_shift_uxn_opcodes_h_l447_c30_fe30_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l451_c35_343a_return_output,
 MUX_uxn_opcodes_h_l451_c15_f4aa_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l452_c49_46d8_return_output,
 BIN_OP_AND_uxn_opcodes_h_l452_c29_e245_return_output,
 BIN_OP_OR_uxn_opcodes_h_l452_c8_e4a2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_871c_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l452_c3_2910_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l452_c3_2910_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l452_c3_2910_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l452_c3_2910_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l452_c3_2910_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c3_2910_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l452_c3_2910_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l452_c3_2910_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l452_c3_2910_return_output,
 device_in_result_MUX_uxn_opcodes_h_l452_c3_2910_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l452_c3_2910_return_output,
 device_in_uxn_opcodes_h_l453_c23_c21d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l456_c4_b0e1_return_output,
 BIN_OP_AND_uxn_opcodes_h_l457_c9_b355_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l459_c11_1790_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l463_c13_320e_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l463_c8_49da_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l463_c8_49da_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l463_c8_49da_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c8_49da_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l463_c8_49da_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l463_c8_49da_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l463_c8_49da_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l470_c13_8d8a_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l470_c8_0e81_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l470_c8_0e81_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c8_0e81_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l470_c8_0e81_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l470_c8_0e81_return_output,
 UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l457_l452_DUPLICATE_6d5a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l429_c6_9824_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l429_c6_9824_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l429_c6_9824_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_1885_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_1885_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_1885_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_1885_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_8980_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_8980_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_8980_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_8980_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l441_c7_8980_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l429_c2_1dc4_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l441_c7_8980_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l429_c2_1dc4_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l441_c7_8980_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l429_c2_1dc4_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l441_c7_8980_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_8980_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l429_c2_1dc4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l436_c3_2d40 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_8980_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l429_c2_1dc4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_8980_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l429_c2_1dc4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_8980_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l429_c2_1dc4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_8980_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l429_c2_1dc4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_8980_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l429_c2_1dc4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l441_c7_8980_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l429_c2_1dc4_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l429_c2_1dc4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l429_c2_1dc4_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l441_c7_8980_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l441_c7_8980_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l429_c2_1dc4_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue : device_in_result_t;
 variable VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l429_c2_1dc4_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l441_c7_8980_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l429_c2_1dc4_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l435_c3_02e3 : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l441_c7_8980_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l429_c2_1dc4_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l430_c3_1188_uxn_opcodes_h_l430_c3_1188_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l441_c11_307a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l441_c11_307a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l441_c11_307a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l444_c7_3c73_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l444_c7_3c73_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l441_c7_8980_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l441_c7_8980_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l444_c7_3c73_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l441_c7_8980_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l441_c7_8980_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l441_c7_8980_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l444_c7_3c73_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l441_c7_8980_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l441_c7_8980_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l441_c7_8980_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l444_c7_3c73_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l441_c7_8980_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l441_c7_8980_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l441_c7_8980_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l441_c7_8980_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_8980_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_8980_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l444_c7_3c73_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_8980_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_8980_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_8980_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l444_c7_3c73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_8980_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_8980_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l442_c3_844d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_8980_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c7_3c73_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_8980_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_8980_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_8980_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l444_c7_3c73_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_8980_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l441_c7_8980_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l441_c7_8980_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l444_c7_3c73_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l441_c7_8980_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_8980_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_8980_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l444_c7_3c73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_8980_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_8980_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_8980_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l444_c7_3c73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_8980_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l441_c7_8980_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l441_c7_8980_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l441_c7_8980_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l441_c7_8980_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l441_c7_8980_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l444_c7_3c73_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l441_c7_8980_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l441_c7_8980_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l441_c7_8980_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l444_c7_3c73_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l441_c7_8980_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l441_c7_8980_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l441_c7_8980_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l444_c7_3c73_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l441_c7_8980_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l444_c11_547c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l444_c11_547c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l444_c11_547c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_2740_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_2740_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_2740_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_2740_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l452_c3_2910_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l444_c7_3c73_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l452_c3_2910_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l444_c7_3c73_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l444_c7_3c73_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l452_c3_2910_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l452_c3_2910_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l444_c7_3c73_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l452_c3_2910_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l444_c7_3c73_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c3_2910_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c7_3c73_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l444_c7_3c73_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l452_c3_2910_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l444_c7_3c73_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l452_c3_2910_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l444_c7_3c73_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l444_c7_3c73_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l452_c3_2910_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l444_c7_3c73_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l452_c3_2910_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l444_c7_3c73_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l452_c3_2910_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l444_c7_3c73_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l447_c30_fe30_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l447_c30_fe30_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l447_c30_fe30_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l447_c30_fe30_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l451_c15_f4aa_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l451_c15_f4aa_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l451_c15_f4aa_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l451_c35_343a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l451_c35_343a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l451_c35_343a_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l451_c15_f4aa_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l452_c8_e4a2_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l452_c29_e245_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l452_c49_46d8_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l452_c49_46d8_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l452_c29_e245_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l452_c29_e245_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l452_c8_e4a2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l452_c8_e4a2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_871c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_871c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_871c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_871c_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l452_c3_2910_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l452_c3_2910_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l463_c8_49da_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l452_c3_2910_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l452_c3_2910_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l452_c3_2910_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l463_c8_49da_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l452_c3_2910_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l452_c3_2910_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l452_c3_2910_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l452_c3_2910_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l452_c3_2910_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l452_c3_2910_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l452_c3_2910_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l452_c3_2910_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l452_c3_2910_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l463_c8_49da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l452_c3_2910_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c3_2910_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c3_2910_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c8_49da_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c3_2910_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l452_c3_2910_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l452_c3_2910_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l463_c8_49da_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l452_c3_2910_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l452_c3_2910_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l452_c3_2910_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c8_49da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l452_c3_2910_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l452_c3_2910_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l452_c3_2910_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l452_c3_2910_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l452_c3_2910_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l452_c3_2910_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l452_c3_2910_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l452_c3_2910_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l456_c4_26de : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l452_c3_2910_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l463_c8_49da_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l452_c3_2910_cond : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l453_c23_c21d_device_address : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l453_c23_c21d_phase : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l453_c23_c21d_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l453_c23_c21d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l453_c23_c21d_return_output : device_in_result_t;
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l454_c32_4ac5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l456_c4_b0e1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l456_c4_b0e1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l456_c4_b0e1_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l457_c9_b355_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l457_c9_b355_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l457_c9_b355_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l459_c11_1790_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l459_c11_1790_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l459_c11_1790_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l459_c11_1790_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l463_c13_320e_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l463_c13_320e_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l463_c8_49da_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l463_c8_49da_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l463_c8_49da_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l463_c8_49da_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l463_c8_49da_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l470_c8_0e81_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l463_c8_49da_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l463_c8_49da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l463_c8_49da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l470_c8_0e81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l463_c8_49da_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c8_49da_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l466_c4_4e6b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c8_49da_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c8_0e81_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c8_49da_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c8_49da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c8_49da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c8_0e81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c8_49da_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l463_c8_49da_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l463_c8_49da_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l470_c8_0e81_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l463_c8_49da_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l463_c8_49da_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l464_c4_4dd6 : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l463_c8_49da_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l463_c8_49da_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l470_c13_8d8a_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l470_c13_8d8a_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l470_c8_0e81_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l470_c8_0e81_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l470_c8_0e81_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l470_c8_0e81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l470_c8_0e81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l470_c8_0e81_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c8_0e81_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l471_c4_9619 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c8_0e81_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c8_0e81_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c8_0e81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c8_0e81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c8_0e81_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l470_c8_0e81_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l470_c8_0e81_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l470_c8_0e81_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l441_l444_l429_l452_DUPLICATE_7f58_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l441_l444_l429_DUPLICATE_f14d_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l441_l429_DUPLICATE_bf44_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l441_l444_l470_l429_DUPLICATE_29ae_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l470_l452_l444_l441_l429_DUPLICATE_f8b4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l470_l463_l452_l444_l441_DUPLICATE_b98a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l444_l470_l452_DUPLICATE_2946_return_output : unsigned(3 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l457_l452_DUPLICATE_6d5a_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l457_l452_DUPLICATE_6d5a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l459_l457_DUPLICATE_0e5f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l467_l472_DUPLICATE_e933_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6c44_uxn_opcodes_h_l481_l423_DUPLICATE_d98e_return_output : opcode_result_t;
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
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l459_c11_1790_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l442_c3_844d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_8980_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l442_c3_844d;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l452_c3_2910_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse := to_unsigned(0, 1);
     VAR_current_dei_phase_uxn_opcodes_h_l464_c4_4dd6 := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l463_c8_49da_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l464_c4_4dd6;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue := to_unsigned(0, 1);
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l447_c30_fe30_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l447_c30_fe30_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l451_c35_343a_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l436_c3_2d40 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l436_c3_2d40;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_2740_iftrue := to_unsigned(0, 1);
     VAR_current_dei_phase_uxn_opcodes_h_l435_c3_02e3 := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l435_c3_02e3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l444_c11_547c_right := to_unsigned(2, 2);
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c8_0e81_iffalse := to_unsigned(1, 1);
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue := to_unsigned(0, 1);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue := to_unsigned(0, 1);
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l441_c11_307a_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_8980_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_1885_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l463_c8_49da_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_871c_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l470_c8_0e81_iffalse := to_unsigned(0, 1);
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l470_c8_0e81_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l456_c4_b0e1_right := to_unsigned(1, 1);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l463_c8_49da_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l466_c4_4e6b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c8_49da_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l466_c4_4e6b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l429_c6_9824_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l471_c4_9619 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c8_0e81_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l471_c4_9619;

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_8980_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_1885_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l456_c4_b0e1_left := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l441_c7_8980_iftrue := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l463_c8_49da_iffalse := current_dei_phase;
     VAR_device_in_uxn_opcodes_h_l453_c23_c21d_phase := current_dei_phase;
     VAR_dei_param_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue := dei_param;
     VAR_dei_param_MUX_uxn_opcodes_h_l441_c7_8980_iftrue := dei_param;
     VAR_dei_param_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue := dei_param;
     VAR_device_in_result_MUX_uxn_opcodes_h_l441_c7_8980_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l452_c3_2910_iffalse := device_in_result;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l470_c13_8d8a_expr := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l441_c7_8980_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l452_c3_2910_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l463_c8_49da_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l470_c8_0e81_iffalse := has_written_to_n;
     VAR_BIN_OP_AND_uxn_opcodes_h_l452_c29_e245_left := has_written_to_t;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l463_c13_320e_expr := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l441_c7_8980_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l452_c3_2910_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l463_c8_49da_iffalse := has_written_to_t;
     VAR_sp_relative_shift_uxn_opcodes_h_l447_c30_fe30_ins := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l451_c15_f4aa_cond := is_first_dei_done;
     VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l457_l452_DUPLICATE_6d5a_expr := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l441_c7_8980_iftrue := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l452_c3_2910_iffalse := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15_iffalse := is_first_dei_done;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l452_c49_46d8_expr := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l441_c7_8980_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l452_c3_2910_iffalse := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l459_c11_1790_iffalse := is_second_dei_done;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l429_c6_9824_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l441_c11_307a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l444_c11_547c_left := VAR_phase;
     VAR_device_in_uxn_opcodes_h_l453_c23_c21d_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l451_c35_343a_left := t8;
     VAR_MUX_uxn_opcodes_h_l451_c15_f4aa_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l441_c7_8980_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l441_l444_l470_l429_DUPLICATE_29ae LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l441_l444_l470_l429_DUPLICATE_29ae_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l470_l452_l444_l441_l429_DUPLICATE_f8b4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l470_l452_l444_l441_l429_DUPLICATE_f8b4_return_output := result.u8_value;

     -- sp_relative_shift[uxn_opcodes_h_l447_c30_fe30] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l447_c30_fe30_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l447_c30_fe30_ins;
     sp_relative_shift_uxn_opcodes_h_l447_c30_fe30_x <= VAR_sp_relative_shift_uxn_opcodes_h_l447_c30_fe30_x;
     sp_relative_shift_uxn_opcodes_h_l447_c30_fe30_y <= VAR_sp_relative_shift_uxn_opcodes_h_l447_c30_fe30_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l447_c30_fe30_return_output := sp_relative_shift_uxn_opcodes_h_l447_c30_fe30_return_output;

     -- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l457_l452_DUPLICATE_6d5a LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l457_l452_DUPLICATE_6d5a_expr <= VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l457_l452_DUPLICATE_6d5a_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l457_l452_DUPLICATE_6d5a_return_output := UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l457_l452_DUPLICATE_6d5a_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l441_l444_l429_DUPLICATE_f14d LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l441_l444_l429_DUPLICATE_f14d_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l441_c11_307a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l441_c11_307a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l441_c11_307a_left;
     BIN_OP_EQ_uxn_opcodes_h_l441_c11_307a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l441_c11_307a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l441_c11_307a_return_output := BIN_OP_EQ_uxn_opcodes_h_l441_c11_307a_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l444_l470_l452_DUPLICATE_2946 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l444_l470_l452_DUPLICATE_2946_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l467_l472_DUPLICATE_e933 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l467_l472_DUPLICATE_e933_return_output := device_in_result.dei_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l470_l463_l452_l444_l441_DUPLICATE_b98a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l470_l463_l452_l444_l441_DUPLICATE_b98a_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l441_l429_DUPLICATE_bf44 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l441_l429_DUPLICATE_bf44_return_output := result.is_sp_shift;

     -- BIN_OP_PLUS[uxn_opcodes_h_l451_c35_343a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l451_c35_343a_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l451_c35_343a_left;
     BIN_OP_PLUS_uxn_opcodes_h_l451_c35_343a_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l451_c35_343a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l451_c35_343a_return_output := BIN_OP_PLUS_uxn_opcodes_h_l451_c35_343a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l429_c6_9824] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l429_c6_9824_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l429_c6_9824_left;
     BIN_OP_EQ_uxn_opcodes_h_l429_c6_9824_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l429_c6_9824_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l429_c6_9824_return_output := BIN_OP_EQ_uxn_opcodes_h_l429_c6_9824_return_output;

     -- result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l429_c2_1dc4] LATENCY=0
     VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l429_c2_1dc4_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l441_l444_l429_l452_DUPLICATE_7f58 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l441_l444_l429_l452_DUPLICATE_7f58_return_output := result.device_ram_address;

     -- device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6[uxn_opcodes_h_l429_c2_1dc4] LATENCY=0
     VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l429_c2_1dc4_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6(
     device_in_result,
     to_unsigned(0, 1));

     -- BIN_OP_EQ[uxn_opcodes_h_l444_c11_547c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l444_c11_547c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l444_c11_547c_left;
     BIN_OP_EQ_uxn_opcodes_h_l444_c11_547c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l444_c11_547c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l444_c11_547c_return_output := BIN_OP_EQ_uxn_opcodes_h_l444_c11_547c_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l463_c13_320e] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l463_c13_320e_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l463_c13_320e_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l463_c13_320e_return_output := UNARY_OP_NOT_uxn_opcodes_h_l463_c13_320e_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l470_c13_8d8a] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l470_c13_8d8a_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l470_c13_8d8a_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l470_c13_8d8a_return_output := UNARY_OP_NOT_uxn_opcodes_h_l470_c13_8d8a_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l452_c49_46d8] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l452_c49_46d8_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l452_c49_46d8_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l452_c49_46d8_return_output := UNARY_OP_NOT_uxn_opcodes_h_l452_c49_46d8_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l456_c4_b0e1] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l456_c4_b0e1_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l456_c4_b0e1_left;
     BIN_OP_PLUS_uxn_opcodes_h_l456_c4_b0e1_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l456_c4_b0e1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l456_c4_b0e1_return_output := BIN_OP_PLUS_uxn_opcodes_h_l456_c4_b0e1_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_8980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l429_c6_9824_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_1885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l429_c6_9824_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l429_c2_1dc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l429_c6_9824_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l429_c2_1dc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l429_c6_9824_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l429_c2_1dc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l429_c6_9824_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l429_c2_1dc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l429_c6_9824_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l429_c2_1dc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l429_c6_9824_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l429_c6_9824_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l429_c6_9824_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l429_c2_1dc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l429_c6_9824_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l429_c2_1dc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l429_c6_9824_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l429_c2_1dc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l429_c6_9824_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l429_c2_1dc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l429_c6_9824_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l429_c2_1dc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l429_c6_9824_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l429_c2_1dc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l429_c6_9824_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l429_c2_1dc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l429_c6_9824_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l429_c2_1dc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l429_c6_9824_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l429_c2_1dc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l429_c6_9824_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l444_c7_3c73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l441_c11_307a_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l441_c7_8980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l441_c11_307a_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l441_c7_8980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l441_c11_307a_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l441_c7_8980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l441_c11_307a_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l441_c7_8980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l441_c11_307a_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l441_c7_8980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l441_c11_307a_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l441_c7_8980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l441_c11_307a_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l441_c7_8980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l441_c11_307a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_8980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l441_c11_307a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_8980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l441_c11_307a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_8980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l441_c11_307a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_8980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l441_c11_307a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_8980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l441_c11_307a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_8980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l441_c11_307a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l441_c7_8980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l441_c11_307a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l441_c7_8980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l441_c11_307a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_2740_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l444_c11_547c_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l444_c7_3c73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l444_c11_547c_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l444_c7_3c73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l444_c11_547c_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l444_c7_3c73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l444_c11_547c_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l444_c7_3c73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l444_c11_547c_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l444_c7_3c73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l444_c11_547c_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l444_c11_547c_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l444_c11_547c_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l444_c7_3c73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l444_c11_547c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l444_c7_3c73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l444_c11_547c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l444_c7_3c73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l444_c11_547c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l444_c7_3c73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l444_c11_547c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l444_c7_3c73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l444_c11_547c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c7_3c73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l444_c11_547c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l444_c7_3c73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l444_c11_547c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l444_c7_3c73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l444_c11_547c_return_output;
     VAR_MUX_uxn_opcodes_h_l451_c15_f4aa_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l451_c35_343a_return_output, 8);
     VAR_current_dei_phase_uxn_opcodes_h_l456_c4_26de := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l456_c4_b0e1_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l441_l444_l429_DUPLICATE_f14d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_8980_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l441_l444_l429_DUPLICATE_f14d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l441_l444_l429_DUPLICATE_f14d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_8980_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l470_l463_l452_l444_l441_DUPLICATE_b98a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l470_l463_l452_l444_l441_DUPLICATE_b98a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l452_c3_2910_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l470_l463_l452_l444_l441_DUPLICATE_b98a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c8_49da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l470_l463_l452_l444_l441_DUPLICATE_b98a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c8_0e81_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l470_l463_l452_l444_l441_DUPLICATE_b98a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l441_l429_DUPLICATE_bf44_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_8980_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l441_l429_DUPLICATE_bf44_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l441_l444_l470_l429_DUPLICATE_29ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_8980_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l441_l444_l470_l429_DUPLICATE_29ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l441_l444_l470_l429_DUPLICATE_29ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l470_c8_0e81_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l441_l444_l470_l429_DUPLICATE_29ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l444_l470_l452_DUPLICATE_2946_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c3_2910_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l444_l470_l452_DUPLICATE_2946_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c8_0e81_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l444_l470_l452_DUPLICATE_2946_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l463_c8_49da_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l467_l472_DUPLICATE_e933_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l470_c8_0e81_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l467_l472_DUPLICATE_e933_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l441_l444_l429_l452_DUPLICATE_7f58_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_8980_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l441_l444_l429_l452_DUPLICATE_7f58_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l441_l444_l429_l452_DUPLICATE_7f58_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l452_c3_2910_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l441_l444_l429_l452_DUPLICATE_7f58_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l470_l452_l444_l441_l429_DUPLICATE_f8b4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l441_c7_8980_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l470_l452_l444_l441_l429_DUPLICATE_f8b4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l470_l452_l444_l441_l429_DUPLICATE_f8b4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l452_c3_2910_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l470_l452_l444_l441_l429_DUPLICATE_f8b4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l470_c8_0e81_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l470_l452_l444_l441_l429_DUPLICATE_f8b4_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l452_c29_e245_right := VAR_UNARY_OP_NOT_uxn_opcodes_h_l452_c49_46d8_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l463_c8_49da_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l463_c13_320e_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l463_c8_49da_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l463_c13_320e_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l463_c8_49da_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l463_c13_320e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c8_49da_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l463_c13_320e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l463_c8_49da_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l463_c13_320e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c8_49da_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l463_c13_320e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l463_c8_49da_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l463_c13_320e_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l470_c8_0e81_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l470_c13_8d8a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c8_0e81_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l470_c13_8d8a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l470_c8_0e81_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l470_c13_8d8a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c8_0e81_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l470_c13_8d8a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l470_c8_0e81_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l470_c13_8d8a_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l457_c9_b355_left := VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l457_l452_DUPLICATE_6d5a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l452_c8_e4a2_left := VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l457_l452_DUPLICATE_6d5a_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue := VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l429_c2_1dc4_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse := VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l429_c2_1dc4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l447_c30_fe30_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l452_c3_2910_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l456_c4_26de;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l444_c7_3c73] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l444_c7_3c73_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l444_c7_3c73_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l444_c7_3c73_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l444_c7_3c73_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l463_c8_49da] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l463_c8_49da_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l463_c8_49da_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l463_c8_49da_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l463_c8_49da_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l463_c8_49da_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l463_c8_49da_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l463_c8_49da_return_output := has_written_to_t_MUX_uxn_opcodes_h_l463_c8_49da_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l470_c8_0e81] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c8_0e81_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c8_0e81_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c8_0e81_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c8_0e81_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c8_0e81_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c8_0e81_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c8_0e81_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c8_0e81_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l470_c8_0e81] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l470_c8_0e81_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l470_c8_0e81_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l470_c8_0e81_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l470_c8_0e81_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l470_c8_0e81_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l470_c8_0e81_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l470_c8_0e81_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l470_c8_0e81_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l470_c8_0e81] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l470_c8_0e81_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l470_c8_0e81_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l470_c8_0e81_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l470_c8_0e81_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l470_c8_0e81_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l470_c8_0e81_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l470_c8_0e81_return_output := has_written_to_n_MUX_uxn_opcodes_h_l470_c8_0e81_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l470_c8_0e81] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l470_c8_0e81_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c8_0e81_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l470_c8_0e81_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c8_0e81_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l470_c8_0e81_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c8_0e81_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c8_0e81_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l470_c8_0e81_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l452_c29_e245] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l452_c29_e245_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l452_c29_e245_left;
     BIN_OP_AND_uxn_opcodes_h_l452_c29_e245_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l452_c29_e245_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l452_c29_e245_return_output := BIN_OP_AND_uxn_opcodes_h_l452_c29_e245_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l444_c7_3c73] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l444_c7_3c73_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l444_c7_3c73_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l444_c7_3c73_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l444_c7_3c73_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l429_c2_1dc4] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l429_c2_1dc4_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l429_c2_1dc4_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output;

     -- MUX[uxn_opcodes_h_l451_c15_f4aa] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l451_c15_f4aa_cond <= VAR_MUX_uxn_opcodes_h_l451_c15_f4aa_cond;
     MUX_uxn_opcodes_h_l451_c15_f4aa_iftrue <= VAR_MUX_uxn_opcodes_h_l451_c15_f4aa_iftrue;
     MUX_uxn_opcodes_h_l451_c15_f4aa_iffalse <= VAR_MUX_uxn_opcodes_h_l451_c15_f4aa_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l451_c15_f4aa_return_output := MUX_uxn_opcodes_h_l451_c15_f4aa_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l463_c8_49da] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l463_c8_49da_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l463_c8_49da_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l463_c8_49da_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l463_c8_49da_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l463_c8_49da_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l463_c8_49da_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l463_c8_49da_return_output := current_dei_phase_MUX_uxn_opcodes_h_l463_c8_49da_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l470_c8_0e81] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l470_c8_0e81_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l470_c8_0e81_cond;
     result_u8_value_MUX_uxn_opcodes_h_l470_c8_0e81_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l470_c8_0e81_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l470_c8_0e81_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l470_c8_0e81_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l470_c8_0e81_return_output := result_u8_value_MUX_uxn_opcodes_h_l470_c8_0e81_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l429_c1_1885] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_1885_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_1885_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_1885_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_1885_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_1885_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_1885_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_1885_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_1885_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l441_c7_8980] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_8980_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_8980_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_8980_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_8980_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_8980_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_8980_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_8980_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_8980_return_output;

     -- t8_MUX[uxn_opcodes_h_l444_c7_3c73] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l444_c7_3c73_cond <= VAR_t8_MUX_uxn_opcodes_h_l444_c7_3c73_cond;
     t8_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue;
     t8_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l444_c7_3c73_return_output := t8_MUX_uxn_opcodes_h_l444_c7_3c73_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_opcodes_h_l452_c8_e4a2_right := VAR_BIN_OP_AND_uxn_opcodes_h_l452_c29_e245_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_8980_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse := VAR_MUX_uxn_opcodes_h_l451_c15_f4aa_return_output;
     VAR_device_in_uxn_opcodes_h_l453_c23_c21d_device_address := VAR_MUX_uxn_opcodes_h_l451_c15_f4aa_return_output;
     VAR_printf_uxn_opcodes_h_l430_c3_1188_uxn_opcodes_h_l430_c3_1188_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_1885_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l452_c3_2910_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l463_c8_49da_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l463_c8_49da_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l470_c8_0e81_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l452_c3_2910_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l463_c8_49da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c8_49da_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c8_0e81_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_8980_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l444_c7_3c73_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l463_c8_49da_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l470_c8_0e81_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_8980_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l444_c7_3c73_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c8_49da_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c8_0e81_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l463_c8_49da_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l470_c8_0e81_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l441_c7_8980_iffalse := VAR_t8_MUX_uxn_opcodes_h_l444_c7_3c73_return_output;
     -- has_written_to_n_MUX[uxn_opcodes_h_l463_c8_49da] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l463_c8_49da_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l463_c8_49da_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l463_c8_49da_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l463_c8_49da_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l463_c8_49da_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l463_c8_49da_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l463_c8_49da_return_output := has_written_to_n_MUX_uxn_opcodes_h_l463_c8_49da_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l463_c8_49da] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l463_c8_49da_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l463_c8_49da_cond;
     result_u8_value_MUX_uxn_opcodes_h_l463_c8_49da_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l463_c8_49da_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l463_c8_49da_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l463_c8_49da_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l463_c8_49da_return_output := result_u8_value_MUX_uxn_opcodes_h_l463_c8_49da_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l441_c7_8980] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_8980_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_8980_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_8980_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_8980_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_8980_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_8980_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_8980_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_8980_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l441_c7_8980] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_8980_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_8980_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_8980_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_8980_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_8980_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_8980_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_8980_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_8980_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l463_c8_49da] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c8_49da_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c8_49da_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c8_49da_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c8_49da_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c8_49da_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c8_49da_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c8_49da_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c8_49da_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l463_c8_49da] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l463_c8_49da_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c8_49da_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l463_c8_49da_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c8_49da_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l463_c8_49da_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c8_49da_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c8_49da_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l463_c8_49da_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l444_c7_3c73] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l444_c7_3c73_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l444_c7_3c73_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l444_c7_3c73_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l444_c7_3c73_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l463_c8_49da] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l463_c8_49da_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l463_c8_49da_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l463_c8_49da_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l463_c8_49da_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l463_c8_49da_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l463_c8_49da_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l463_c8_49da_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l463_c8_49da_return_output;

     -- printf_uxn_opcodes_h_l430_c3_1188[uxn_opcodes_h_l430_c3_1188] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l430_c3_1188_uxn_opcodes_h_l430_c3_1188_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l430_c3_1188_uxn_opcodes_h_l430_c3_1188_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t8_MUX[uxn_opcodes_h_l441_c7_8980] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l441_c7_8980_cond <= VAR_t8_MUX_uxn_opcodes_h_l441_c7_8980_cond;
     t8_MUX_uxn_opcodes_h_l441_c7_8980_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l441_c7_8980_iftrue;
     t8_MUX_uxn_opcodes_h_l441_c7_8980_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l441_c7_8980_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l441_c7_8980_return_output := t8_MUX_uxn_opcodes_h_l441_c7_8980_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l452_c8_e4a2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l452_c8_e4a2_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l452_c8_e4a2_left;
     BIN_OP_OR_uxn_opcodes_h_l452_c8_e4a2_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l452_c8_e4a2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l452_c8_e4a2_return_output := BIN_OP_OR_uxn_opcodes_h_l452_c8_e4a2_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l444_c7_3c73] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l444_c7_3c73_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l444_c7_3c73_cond;
     dei_param_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue;
     dei_param_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l444_c7_3c73_return_output := dei_param_MUX_uxn_opcodes_h_l444_c7_3c73_return_output;

     -- Submodule level 3
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_871c_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l452_c8_e4a2_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l452_c3_2910_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l452_c8_e4a2_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l452_c3_2910_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l452_c8_e4a2_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l452_c3_2910_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l452_c8_e4a2_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l452_c3_2910_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l452_c8_e4a2_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l452_c3_2910_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l452_c8_e4a2_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l452_c3_2910_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l452_c8_e4a2_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l452_c3_2910_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l452_c8_e4a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l452_c3_2910_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l452_c8_e4a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l452_c3_2910_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l452_c8_e4a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c3_2910_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l452_c8_e4a2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l452_c3_2910_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l452_c8_e4a2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_2740_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l444_c7_3c73_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l441_c7_8980_iffalse := VAR_dei_param_MUX_uxn_opcodes_h_l444_c7_3c73_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l452_c3_2910_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l463_c8_49da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l452_c3_2910_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c8_49da_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_8980_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l452_c3_2910_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l463_c8_49da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_8980_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c3_2910_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c8_49da_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l452_c3_2910_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l463_c8_49da_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse := VAR_t8_MUX_uxn_opcodes_h_l441_c7_8980_return_output;
     -- t8_MUX[uxn_opcodes_h_l429_c2_1dc4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l429_c2_1dc4_cond <= VAR_t8_MUX_uxn_opcodes_h_l429_c2_1dc4_cond;
     t8_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue;
     t8_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output := t8_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l429_c2_1dc4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l429_c2_1dc4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l429_c2_1dc4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l452_c3_2910] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l452_c3_2910_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l452_c3_2910_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l452_c3_2910_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l452_c3_2910_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l452_c3_2910_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l452_c3_2910_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l452_c3_2910_return_output := current_dei_phase_MUX_uxn_opcodes_h_l452_c3_2910_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l429_c2_1dc4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l429_c2_1dc4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l429_c2_1dc4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l452_c3_2910] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l452_c3_2910_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l452_c3_2910_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l452_c3_2910_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l452_c3_2910_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l452_c3_2910_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l452_c3_2910_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l452_c3_2910_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l452_c3_2910_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l452_c3_2910] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l452_c3_2910_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l452_c3_2910_cond;
     result_u8_value_MUX_uxn_opcodes_h_l452_c3_2910_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l452_c3_2910_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l452_c3_2910_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l452_c3_2910_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l452_c3_2910_return_output := result_u8_value_MUX_uxn_opcodes_h_l452_c3_2910_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l452_c3_2910] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l452_c3_2910_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l452_c3_2910_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l452_c3_2910_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l452_c3_2910_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l452_c3_2910_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l452_c3_2910_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l452_c3_2910_return_output := has_written_to_t_MUX_uxn_opcodes_h_l452_c3_2910_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l452_c3_2910] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l452_c3_2910_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l452_c3_2910_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l452_c3_2910_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l452_c3_2910_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l452_c3_2910_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l452_c3_2910_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l452_c3_2910_return_output := has_written_to_n_MUX_uxn_opcodes_h_l452_c3_2910_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l452_c3_2910] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l452_c3_2910_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l452_c3_2910_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l452_c3_2910_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l452_c3_2910_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l452_c3_2910_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l452_c3_2910_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l452_c3_2910_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l452_c3_2910_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l449_c1_2740] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_2740_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_2740_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_2740_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_2740_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_2740_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_2740_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_2740_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_2740_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l452_c3_2910] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c3_2910_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c3_2910_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c3_2910_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c3_2910_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c3_2910_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c3_2910_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c3_2910_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c3_2910_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l441_c7_8980] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l441_c7_8980_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l441_c7_8980_cond;
     dei_param_MUX_uxn_opcodes_h_l441_c7_8980_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l441_c7_8980_iftrue;
     dei_param_MUX_uxn_opcodes_h_l441_c7_8980_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l441_c7_8980_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l441_c7_8980_return_output := dei_param_MUX_uxn_opcodes_h_l441_c7_8980_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_871c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_2740_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l452_c3_2910_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse := VAR_dei_param_MUX_uxn_opcodes_h_l441_c7_8980_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l452_c3_2910_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l452_c3_2910_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l452_c3_2910_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l452_c3_2910_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l452_c3_2910_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l452_c3_2910_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l452_c1_871c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_871c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_871c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_871c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_871c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_871c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_871c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_871c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_871c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l444_c7_3c73] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c7_3c73_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c7_3c73_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c7_3c73_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c7_3c73_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l444_c7_3c73] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l444_c7_3c73_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l444_c7_3c73_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l444_c7_3c73_return_output := has_written_to_n_MUX_uxn_opcodes_h_l444_c7_3c73_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l429_c2_1dc4] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l429_c2_1dc4_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l429_c2_1dc4_cond;
     dei_param_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue;
     dei_param_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output := dei_param_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l444_c7_3c73] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l444_c7_3c73_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l444_c7_3c73_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l444_c7_3c73_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l444_c7_3c73_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l444_c7_3c73] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l444_c7_3c73_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l444_c7_3c73_cond;
     result_u8_value_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l444_c7_3c73_return_output := result_u8_value_MUX_uxn_opcodes_h_l444_c7_3c73_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l444_c7_3c73] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l444_c7_3c73_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l444_c7_3c73_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l444_c7_3c73_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l444_c7_3c73_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l444_c7_3c73] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l444_c7_3c73_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l444_c7_3c73_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l444_c7_3c73_return_output := current_dei_phase_MUX_uxn_opcodes_h_l444_c7_3c73_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l444_c7_3c73] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l444_c7_3c73_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l444_c7_3c73_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l444_c7_3c73_return_output := has_written_to_t_MUX_uxn_opcodes_h_l444_c7_3c73_return_output;

     -- Submodule level 5
     VAR_device_in_uxn_opcodes_h_l453_c23_c21d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l452_c1_871c_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l441_c7_8980_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l444_c7_3c73_return_output;
     REG_VAR_dei_param := VAR_dei_param_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l441_c7_8980_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l444_c7_3c73_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l441_c7_8980_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l444_c7_3c73_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_8980_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l444_c7_3c73_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_8980_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l444_c7_3c73_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_8980_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c7_3c73_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l441_c7_8980_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l444_c7_3c73_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l441_c7_8980] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_8980_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_8980_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_8980_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_8980_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_8980_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_8980_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_8980_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_8980_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l441_c7_8980] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_8980_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_8980_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_8980_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_8980_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_8980_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_8980_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_8980_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_8980_return_output;

     -- device_in[uxn_opcodes_h_l453_c23_c21d] LATENCY=0
     -- Clock enable
     device_in_uxn_opcodes_h_l453_c23_c21d_CLOCK_ENABLE <= VAR_device_in_uxn_opcodes_h_l453_c23_c21d_CLOCK_ENABLE;
     -- Inputs
     device_in_uxn_opcodes_h_l453_c23_c21d_device_address <= VAR_device_in_uxn_opcodes_h_l453_c23_c21d_device_address;
     device_in_uxn_opcodes_h_l453_c23_c21d_phase <= VAR_device_in_uxn_opcodes_h_l453_c23_c21d_phase;
     device_in_uxn_opcodes_h_l453_c23_c21d_previous_device_ram_read <= VAR_device_in_uxn_opcodes_h_l453_c23_c21d_previous_device_ram_read;
     -- Outputs
     VAR_device_in_uxn_opcodes_h_l453_c23_c21d_return_output := device_in_uxn_opcodes_h_l453_c23_c21d_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l441_c7_8980] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l441_c7_8980_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l441_c7_8980_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l441_c7_8980_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l441_c7_8980_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l441_c7_8980_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l441_c7_8980_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l441_c7_8980_return_output := has_written_to_n_MUX_uxn_opcodes_h_l441_c7_8980_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l441_c7_8980] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l441_c7_8980_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l441_c7_8980_cond;
     result_u8_value_MUX_uxn_opcodes_h_l441_c7_8980_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l441_c7_8980_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l441_c7_8980_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l441_c7_8980_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l441_c7_8980_return_output := result_u8_value_MUX_uxn_opcodes_h_l441_c7_8980_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l441_c7_8980] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l441_c7_8980_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l441_c7_8980_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l441_c7_8980_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l441_c7_8980_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l441_c7_8980_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l441_c7_8980_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l441_c7_8980_return_output := current_dei_phase_MUX_uxn_opcodes_h_l441_c7_8980_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l441_c7_8980] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l441_c7_8980_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l441_c7_8980_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l441_c7_8980_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l441_c7_8980_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l441_c7_8980_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l441_c7_8980_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l441_c7_8980_return_output := has_written_to_t_MUX_uxn_opcodes_h_l441_c7_8980_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l441_c7_8980] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_8980_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_8980_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_8980_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_8980_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_8980_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_8980_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_8980_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_8980_return_output;

     -- Submodule level 6
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l441_c7_8980_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l452_c3_2910_iftrue := VAR_device_in_uxn_opcodes_h_l453_c23_c21d_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l441_c7_8980_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l441_c7_8980_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_8980_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_8980_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_8980_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l441_c7_8980_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l429_c2_1dc4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l429_c2_1dc4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l429_c2_1dc4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l429_c2_1dc4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l429_c2_1dc4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l429_c2_1dc4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output;

     -- CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d[uxn_opcodes_h_l454_c32_4ac5] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l454_c32_4ac5_return_output := VAR_device_in_uxn_opcodes_h_l453_c23_c21d_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l459_l457_DUPLICATE_0e5f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l459_l457_DUPLICATE_0e5f_return_output := VAR_device_in_uxn_opcodes_h_l453_c23_c21d_return_output.is_dei_done;

     -- has_written_to_t_MUX[uxn_opcodes_h_l429_c2_1dc4] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l429_c2_1dc4_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l429_c2_1dc4_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output := has_written_to_t_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l429_c2_1dc4] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l429_c2_1dc4_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l429_c2_1dc4_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output := current_dei_phase_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l429_c2_1dc4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l429_c2_1dc4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l429_c2_1dc4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output := result_u8_value_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l429_c2_1dc4] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l429_c2_1dc4_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l429_c2_1dc4_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output := has_written_to_n_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l452_c3_2910] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l452_c3_2910_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l452_c3_2910_cond;
     device_in_result_MUX_uxn_opcodes_h_l452_c3_2910_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l452_c3_2910_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l452_c3_2910_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l452_c3_2910_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l452_c3_2910_return_output := device_in_result_MUX_uxn_opcodes_h_l452_c3_2910_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l429_c2_1dc4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l429_c2_1dc4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l429_c2_1dc4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output;

     -- Submodule level 7
     VAR_BIN_OP_AND_uxn_opcodes_h_l457_c9_b355_right := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l459_l457_DUPLICATE_0e5f_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l459_c11_1790_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l459_l457_DUPLICATE_0e5f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l452_c3_2910_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l454_c32_4ac5_return_output;
     REG_VAR_current_dei_phase := VAR_current_dei_phase_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l452_c3_2910_return_output;
     REG_VAR_has_written_to_n := VAR_has_written_to_n_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output;
     REG_VAR_has_written_to_t := VAR_has_written_to_t_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output;
     -- is_second_dei_done_MUX[uxn_opcodes_h_l459_c11_1790] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l459_c11_1790_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l459_c11_1790_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l459_c11_1790_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l459_c11_1790_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l459_c11_1790_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l459_c11_1790_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l459_c11_1790_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l459_c11_1790_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l457_c9_b355] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l457_c9_b355_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l457_c9_b355_left;
     BIN_OP_AND_uxn_opcodes_h_l457_c9_b355_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l457_c9_b355_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l457_c9_b355_return_output := BIN_OP_AND_uxn_opcodes_h_l457_c9_b355_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l444_c7_3c73] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l444_c7_3c73_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l444_c7_3c73_cond;
     device_in_result_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l444_c7_3c73_return_output := device_in_result_MUX_uxn_opcodes_h_l444_c7_3c73_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l452_c3_2910] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l452_c3_2910_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l452_c3_2910_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l452_c3_2910_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l452_c3_2910_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l452_c3_2910_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l452_c3_2910_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l452_c3_2910_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l452_c3_2910_return_output;

     -- Submodule level 8
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15_cond := VAR_BIN_OP_AND_uxn_opcodes_h_l457_c9_b355_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15_cond := VAR_BIN_OP_AND_uxn_opcodes_h_l457_c9_b355_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l441_c7_8980_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l444_c7_3c73_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l459_c11_1790_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l452_c3_2910_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l444_c7_3c73] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l444_c7_3c73_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l444_c7_3c73_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l444_c7_3c73_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l444_c7_3c73_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l457_c4_4c15] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l457_c4_4c15] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l441_c7_8980] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l441_c7_8980_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l441_c7_8980_cond;
     device_in_result_MUX_uxn_opcodes_h_l441_c7_8980_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l441_c7_8980_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l441_c7_8980_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l441_c7_8980_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l441_c7_8980_return_output := device_in_result_MUX_uxn_opcodes_h_l441_c7_8980_return_output;

     -- Submodule level 9
     VAR_device_in_result_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l441_c7_8980_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l452_c3_2910_iftrue := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l452_c3_2910_iftrue := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l457_c4_4c15_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_8980_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l444_c7_3c73_return_output;
     -- is_second_dei_done_MUX[uxn_opcodes_h_l452_c3_2910] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l452_c3_2910_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l452_c3_2910_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l452_c3_2910_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l452_c3_2910_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l452_c3_2910_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l452_c3_2910_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l452_c3_2910_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l452_c3_2910_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l441_c7_8980] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_8980_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_8980_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_8980_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_8980_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_8980_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_8980_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_8980_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_8980_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l452_c3_2910] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l452_c3_2910_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l452_c3_2910_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l452_c3_2910_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l452_c3_2910_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l452_c3_2910_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l452_c3_2910_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l452_c3_2910_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l452_c3_2910_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l429_c2_1dc4] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l429_c2_1dc4_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l429_c2_1dc4_cond;
     device_in_result_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output := device_in_result_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output;

     -- Submodule level 10
     REG_VAR_device_in_result := VAR_device_in_result_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l452_c3_2910_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l452_c3_2910_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_8980_return_output;
     -- is_first_dei_done_MUX[uxn_opcodes_h_l444_c7_3c73] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l444_c7_3c73] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l429_c2_1dc4] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l429_c2_1dc4_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l429_c2_1dc4_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output;

     -- Submodule level 11
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l441_c7_8980_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l441_c7_8980_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l444_c7_3c73_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6c44_uxn_opcodes_h_l481_l423_DUPLICATE_d98e LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6c44_uxn_opcodes_h_l481_l423_DUPLICATE_d98e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6c44(
     result,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output);

     -- is_first_dei_done_MUX[uxn_opcodes_h_l441_c7_8980] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l441_c7_8980_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l441_c7_8980_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l441_c7_8980_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l441_c7_8980_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l441_c7_8980_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l441_c7_8980_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l441_c7_8980_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l441_c7_8980_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l441_c7_8980] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l441_c7_8980_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l441_c7_8980_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l441_c7_8980_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l441_c7_8980_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l441_c7_8980_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l441_c7_8980_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l441_c7_8980_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l441_c7_8980_return_output;

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6c44_uxn_opcodes_h_l481_l423_DUPLICATE_d98e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6c44_uxn_opcodes_h_l481_l423_DUPLICATE_d98e_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l441_c7_8980_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l441_c7_8980_return_output;
     -- is_first_dei_done_MUX[uxn_opcodes_h_l429_c2_1dc4] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l429_c2_1dc4] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output;

     -- Submodule level 13
     REG_VAR_is_first_dei_done := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output;
     REG_VAR_is_second_dei_done := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l429_c2_1dc4_return_output;
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
