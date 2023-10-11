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
-- BIN_OP_EQ[uxn_opcodes_h_l465_c6_239c]
signal BIN_OP_EQ_uxn_opcodes_h_l465_c6_239c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l465_c6_239c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l465_c6_239c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l465_c1_6ff4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_6ff4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_6ff4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_6ff4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_6ff4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l477_c7_de57]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_de57_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_de57_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_de57_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_de57_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l465_c2_4496]
signal device_in_result_MUX_uxn_opcodes_h_l465_c2_4496_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l465_c2_4496_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l465_c2_4496_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l465_c2_4496_return_output : device_in_result_t;

-- has_written_to_n_MUX[uxn_opcodes_h_l465_c2_4496]
signal has_written_to_n_MUX_uxn_opcodes_h_l465_c2_4496_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l465_c2_4496_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l465_c2_4496_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l465_c2_4496_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l465_c2_4496]
signal is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_4496_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_4496_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_4496_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_4496_return_output : unsigned(0 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l465_c2_4496]
signal dei_param_MUX_uxn_opcodes_h_l465_c2_4496_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l465_c2_4496_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l465_c2_4496_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l465_c2_4496_return_output : unsigned(7 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l465_c2_4496]
signal current_dei_phase_MUX_uxn_opcodes_h_l465_c2_4496_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l465_c2_4496_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l465_c2_4496_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l465_c2_4496_return_output : unsigned(7 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l465_c2_4496]
signal is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_4496_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_4496_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_4496_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_4496_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l465_c2_4496]
signal t8_MUX_uxn_opcodes_h_l465_c2_4496_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l465_c2_4496_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l465_c2_4496_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l465_c2_4496_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l465_c2_4496]
signal result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_4496_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_4496_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_4496_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_4496_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l465_c2_4496]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_4496_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_4496_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_4496_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_4496_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l465_c2_4496]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_4496_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_4496_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_4496_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_4496_return_output : signed(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l465_c2_4496]
signal result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_4496_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_4496_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_4496_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_4496_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l465_c2_4496]
signal result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_4496_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_4496_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_4496_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_4496_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l465_c2_4496]
signal result_stack_value_MUX_uxn_opcodes_h_l465_c2_4496_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l465_c2_4496_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l465_c2_4496_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l465_c2_4496_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l465_c2_4496]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_4496_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_4496_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_4496_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_4496_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l465_c2_4496]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_4496_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_4496_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_4496_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_4496_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l465_c2_4496]
signal has_written_to_t_MUX_uxn_opcodes_h_l465_c2_4496_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l465_c2_4496_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l465_c2_4496_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l465_c2_4496_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l466_c3_f5f5[uxn_opcodes_h_l466_c3_f5f5]
signal printf_uxn_opcodes_h_l466_c3_f5f5_uxn_opcodes_h_l466_c3_f5f5_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l477_c11_76e8]
signal BIN_OP_EQ_uxn_opcodes_h_l477_c11_76e8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l477_c11_76e8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l477_c11_76e8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l480_c7_3628]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_3628_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_3628_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_3628_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_3628_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l477_c7_de57]
signal device_in_result_MUX_uxn_opcodes_h_l477_c7_de57_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l477_c7_de57_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l477_c7_de57_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l477_c7_de57_return_output : device_in_result_t;

-- has_written_to_n_MUX[uxn_opcodes_h_l477_c7_de57]
signal has_written_to_n_MUX_uxn_opcodes_h_l477_c7_de57_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l477_c7_de57_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l477_c7_de57_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l477_c7_de57_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l477_c7_de57]
signal is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_de57_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_de57_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_de57_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_de57_return_output : unsigned(0 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l477_c7_de57]
signal dei_param_MUX_uxn_opcodes_h_l477_c7_de57_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l477_c7_de57_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l477_c7_de57_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l477_c7_de57_return_output : unsigned(7 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l477_c7_de57]
signal current_dei_phase_MUX_uxn_opcodes_h_l477_c7_de57_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l477_c7_de57_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l477_c7_de57_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l477_c7_de57_return_output : unsigned(7 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l477_c7_de57]
signal is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_de57_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_de57_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_de57_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_de57_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l477_c7_de57]
signal t8_MUX_uxn_opcodes_h_l477_c7_de57_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l477_c7_de57_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l477_c7_de57_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l477_c7_de57_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l477_c7_de57]
signal result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_de57_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_de57_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_de57_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_de57_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l477_c7_de57]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_de57_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_de57_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_de57_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_de57_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l477_c7_de57]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_de57_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_de57_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_de57_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_de57_return_output : signed(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l477_c7_de57]
signal result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_de57_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_de57_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_de57_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_de57_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l477_c7_de57]
signal result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_de57_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_de57_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_de57_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_de57_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l477_c7_de57]
signal result_stack_value_MUX_uxn_opcodes_h_l477_c7_de57_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l477_c7_de57_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l477_c7_de57_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l477_c7_de57_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l477_c7_de57]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_de57_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_de57_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_de57_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_de57_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l477_c7_de57]
signal has_written_to_t_MUX_uxn_opcodes_h_l477_c7_de57_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l477_c7_de57_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l477_c7_de57_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l477_c7_de57_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l480_c11_b765]
signal BIN_OP_EQ_uxn_opcodes_h_l480_c11_b765_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l480_c11_b765_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l480_c11_b765_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l485_c1_5d85]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_5d85_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_5d85_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_5d85_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_5d85_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l480_c7_3628]
signal device_in_result_MUX_uxn_opcodes_h_l480_c7_3628_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l480_c7_3628_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l480_c7_3628_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l480_c7_3628_return_output : device_in_result_t;

-- has_written_to_n_MUX[uxn_opcodes_h_l480_c7_3628]
signal has_written_to_n_MUX_uxn_opcodes_h_l480_c7_3628_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l480_c7_3628_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l480_c7_3628_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l480_c7_3628_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l480_c7_3628]
signal is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_3628_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_3628_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_3628_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_3628_return_output : unsigned(0 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l480_c7_3628]
signal dei_param_MUX_uxn_opcodes_h_l480_c7_3628_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l480_c7_3628_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l480_c7_3628_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l480_c7_3628_return_output : unsigned(7 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l480_c7_3628]
signal current_dei_phase_MUX_uxn_opcodes_h_l480_c7_3628_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l480_c7_3628_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l480_c7_3628_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l480_c7_3628_return_output : unsigned(7 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l480_c7_3628]
signal is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_3628_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_3628_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_3628_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_3628_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l480_c7_3628]
signal t8_MUX_uxn_opcodes_h_l480_c7_3628_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l480_c7_3628_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l480_c7_3628_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l480_c7_3628_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l480_c7_3628]
signal result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_3628_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_3628_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_3628_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_3628_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l480_c7_3628]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_3628_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_3628_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_3628_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_3628_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l480_c7_3628]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_3628_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_3628_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_3628_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_3628_return_output : signed(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l480_c7_3628]
signal result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_3628_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_3628_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_3628_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_3628_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l480_c7_3628]
signal result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_3628_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_3628_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_3628_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_3628_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l480_c7_3628]
signal result_stack_value_MUX_uxn_opcodes_h_l480_c7_3628_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l480_c7_3628_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l480_c7_3628_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l480_c7_3628_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l480_c7_3628]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_3628_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_3628_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_3628_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_3628_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l480_c7_3628]
signal has_written_to_t_MUX_uxn_opcodes_h_l480_c7_3628_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l480_c7_3628_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l480_c7_3628_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l480_c7_3628_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l483_c32_7a4b]
signal BIN_OP_AND_uxn_opcodes_h_l483_c32_7a4b_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l483_c32_7a4b_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l483_c32_7a4b_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l483_c32_d526]
signal BIN_OP_GT_uxn_opcodes_h_l483_c32_d526_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l483_c32_d526_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l483_c32_d526_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l483_c32_7b8f]
signal MUX_uxn_opcodes_h_l483_c32_7b8f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l483_c32_7b8f_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l483_c32_7b8f_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l483_c32_7b8f_return_output : signed(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l487_c35_67ee]
signal BIN_OP_PLUS_uxn_opcodes_h_l487_c35_67ee_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l487_c35_67ee_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l487_c35_67ee_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l487_c15_6c4d]
signal MUX_uxn_opcodes_h_l487_c15_6c4d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l487_c15_6c4d_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l487_c15_6c4d_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l487_c15_6c4d_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l488_c49_88fc]
signal UNARY_OP_NOT_uxn_opcodes_h_l488_c49_88fc_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l488_c49_88fc_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l488_c29_4791]
signal BIN_OP_AND_uxn_opcodes_h_l488_c29_4791_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l488_c29_4791_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l488_c29_4791_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l488_c8_04d8]
signal BIN_OP_OR_uxn_opcodes_h_l488_c8_04d8_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l488_c8_04d8_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l488_c8_04d8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l488_c1_b855]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_b855_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_b855_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_b855_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_b855_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l488_c3_7c0a]
signal device_in_result_MUX_uxn_opcodes_h_l488_c3_7c0a_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output : device_in_result_t;

-- has_written_to_n_MUX[uxn_opcodes_h_l488_c3_7c0a]
signal has_written_to_n_MUX_uxn_opcodes_h_l488_c3_7c0a_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l488_c3_7c0a]
signal is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l488_c3_7c0a]
signal current_dei_phase_MUX_uxn_opcodes_h_l488_c3_7c0a_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output : unsigned(7 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l488_c3_7c0a]
signal is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l488_c3_7c0a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_7c0a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l488_c3_7c0a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_7c0a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l488_c3_7c0a]
signal result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_7c0a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l488_c3_7c0a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_7c0a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l488_c3_7c0a]
signal result_stack_value_MUX_uxn_opcodes_h_l488_c3_7c0a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output : unsigned(7 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l488_c3_7c0a]
signal has_written_to_t_MUX_uxn_opcodes_h_l488_c3_7c0a_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output : unsigned(0 downto 0);

-- device_in[uxn_opcodes_h_l489_c23_8633]
signal device_in_uxn_opcodes_h_l489_c23_8633_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_in_uxn_opcodes_h_l489_c23_8633_device_address : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l489_c23_8633_phase : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l489_c23_8633_previous_device_ram_read : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l489_c23_8633_return_output : device_in_result_t;

-- BIN_OP_PLUS[uxn_opcodes_h_l492_c4_05f3]
signal BIN_OP_PLUS_uxn_opcodes_h_l492_c4_05f3_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l492_c4_05f3_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l492_c4_05f3_return_output : unsigned(8 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l493_c9_d129]
signal BIN_OP_AND_uxn_opcodes_h_l493_c9_d129_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l493_c9_d129_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l493_c9_d129_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l493_c4_5d19]
signal is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l493_c4_5d19]
signal is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l495_c11_6170]
signal is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_6170_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_6170_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_6170_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_6170_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l499_c13_8e67]
signal UNARY_OP_NOT_uxn_opcodes_h_l499_c13_8e67_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l499_c13_8e67_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l499_c8_0a36]
signal has_written_to_n_MUX_uxn_opcodes_h_l499_c8_0a36_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l499_c8_0a36_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l499_c8_0a36_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l499_c8_0a36_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l499_c8_0a36]
signal current_dei_phase_MUX_uxn_opcodes_h_l499_c8_0a36_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l499_c8_0a36_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l499_c8_0a36_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l499_c8_0a36_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l499_c8_0a36]
signal result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_0a36_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_0a36_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_0a36_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_0a36_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l499_c8_0a36]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_0a36_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_0a36_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_0a36_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_0a36_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l499_c8_0a36]
signal result_stack_value_MUX_uxn_opcodes_h_l499_c8_0a36_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l499_c8_0a36_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l499_c8_0a36_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l499_c8_0a36_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l499_c8_0a36]
signal result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_0a36_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_0a36_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_0a36_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_0a36_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l499_c8_0a36]
signal has_written_to_t_MUX_uxn_opcodes_h_l499_c8_0a36_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l499_c8_0a36_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l499_c8_0a36_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l499_c8_0a36_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l506_c13_ef22]
signal UNARY_OP_NOT_uxn_opcodes_h_l506_c13_ef22_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l506_c13_ef22_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l506_c8_7fa9]
signal has_written_to_n_MUX_uxn_opcodes_h_l506_c8_7fa9_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l506_c8_7fa9_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l506_c8_7fa9_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l506_c8_7fa9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l506_c8_7fa9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_7fa9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_7fa9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_7fa9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_7fa9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l506_c8_7fa9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_7fa9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_7fa9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_7fa9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_7fa9_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l506_c8_7fa9]
signal result_stack_value_MUX_uxn_opcodes_h_l506_c8_7fa9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l506_c8_7fa9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l506_c8_7fa9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l506_c8_7fa9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l506_c8_7fa9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_7fa9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_7fa9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_7fa9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_7fa9_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l493_l488_DUPLICATE_da27
signal UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l493_l488_DUPLICATE_da27_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l493_l488_DUPLICATE_da27_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_a947( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.device_ram_address := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_value := ref_toks_6;
      base.is_sp_shift := ref_toks_7;
      base.is_device_ram_write := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l465_c6_239c
BIN_OP_EQ_uxn_opcodes_h_l465_c6_239c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l465_c6_239c_left,
BIN_OP_EQ_uxn_opcodes_h_l465_c6_239c_right,
BIN_OP_EQ_uxn_opcodes_h_l465_c6_239c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_6ff4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_6ff4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_6ff4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_6ff4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_6ff4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_6ff4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_de57
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_de57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_de57_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_de57_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_de57_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_de57_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l465_c2_4496
device_in_result_MUX_uxn_opcodes_h_l465_c2_4496 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l465_c2_4496_cond,
device_in_result_MUX_uxn_opcodes_h_l465_c2_4496_iftrue,
device_in_result_MUX_uxn_opcodes_h_l465_c2_4496_iffalse,
device_in_result_MUX_uxn_opcodes_h_l465_c2_4496_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l465_c2_4496
has_written_to_n_MUX_uxn_opcodes_h_l465_c2_4496 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l465_c2_4496_cond,
has_written_to_n_MUX_uxn_opcodes_h_l465_c2_4496_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l465_c2_4496_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l465_c2_4496_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_4496
is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_4496 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_4496_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_4496_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_4496_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_4496_return_output);

-- dei_param_MUX_uxn_opcodes_h_l465_c2_4496
dei_param_MUX_uxn_opcodes_h_l465_c2_4496 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l465_c2_4496_cond,
dei_param_MUX_uxn_opcodes_h_l465_c2_4496_iftrue,
dei_param_MUX_uxn_opcodes_h_l465_c2_4496_iffalse,
dei_param_MUX_uxn_opcodes_h_l465_c2_4496_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l465_c2_4496
current_dei_phase_MUX_uxn_opcodes_h_l465_c2_4496 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l465_c2_4496_cond,
current_dei_phase_MUX_uxn_opcodes_h_l465_c2_4496_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l465_c2_4496_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l465_c2_4496_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_4496
is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_4496 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_4496_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_4496_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_4496_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_4496_return_output);

-- t8_MUX_uxn_opcodes_h_l465_c2_4496
t8_MUX_uxn_opcodes_h_l465_c2_4496 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l465_c2_4496_cond,
t8_MUX_uxn_opcodes_h_l465_c2_4496_iftrue,
t8_MUX_uxn_opcodes_h_l465_c2_4496_iffalse,
t8_MUX_uxn_opcodes_h_l465_c2_4496_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_4496
result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_4496 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_4496_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_4496_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_4496_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_4496_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_4496
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_4496 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_4496_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_4496_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_4496_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_4496_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_4496
result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_4496 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_4496_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_4496_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_4496_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_4496_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_4496
result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_4496 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_4496_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_4496_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_4496_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_4496_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_4496
result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_4496 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_4496_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_4496_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_4496_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_4496_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l465_c2_4496
result_stack_value_MUX_uxn_opcodes_h_l465_c2_4496 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l465_c2_4496_cond,
result_stack_value_MUX_uxn_opcodes_h_l465_c2_4496_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l465_c2_4496_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l465_c2_4496_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_4496
result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_4496 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_4496_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_4496_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_4496_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_4496_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_4496
result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_4496 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_4496_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_4496_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_4496_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_4496_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l465_c2_4496
has_written_to_t_MUX_uxn_opcodes_h_l465_c2_4496 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l465_c2_4496_cond,
has_written_to_t_MUX_uxn_opcodes_h_l465_c2_4496_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l465_c2_4496_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l465_c2_4496_return_output);

-- printf_uxn_opcodes_h_l466_c3_f5f5_uxn_opcodes_h_l466_c3_f5f5
printf_uxn_opcodes_h_l466_c3_f5f5_uxn_opcodes_h_l466_c3_f5f5 : entity work.printf_uxn_opcodes_h_l466_c3_f5f5_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l466_c3_f5f5_uxn_opcodes_h_l466_c3_f5f5_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l477_c11_76e8
BIN_OP_EQ_uxn_opcodes_h_l477_c11_76e8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l477_c11_76e8_left,
BIN_OP_EQ_uxn_opcodes_h_l477_c11_76e8_right,
BIN_OP_EQ_uxn_opcodes_h_l477_c11_76e8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_3628
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_3628 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_3628_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_3628_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_3628_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_3628_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l477_c7_de57
device_in_result_MUX_uxn_opcodes_h_l477_c7_de57 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l477_c7_de57_cond,
device_in_result_MUX_uxn_opcodes_h_l477_c7_de57_iftrue,
device_in_result_MUX_uxn_opcodes_h_l477_c7_de57_iffalse,
device_in_result_MUX_uxn_opcodes_h_l477_c7_de57_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l477_c7_de57
has_written_to_n_MUX_uxn_opcodes_h_l477_c7_de57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l477_c7_de57_cond,
has_written_to_n_MUX_uxn_opcodes_h_l477_c7_de57_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l477_c7_de57_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l477_c7_de57_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_de57
is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_de57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_de57_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_de57_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_de57_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_de57_return_output);

-- dei_param_MUX_uxn_opcodes_h_l477_c7_de57
dei_param_MUX_uxn_opcodes_h_l477_c7_de57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l477_c7_de57_cond,
dei_param_MUX_uxn_opcodes_h_l477_c7_de57_iftrue,
dei_param_MUX_uxn_opcodes_h_l477_c7_de57_iffalse,
dei_param_MUX_uxn_opcodes_h_l477_c7_de57_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l477_c7_de57
current_dei_phase_MUX_uxn_opcodes_h_l477_c7_de57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l477_c7_de57_cond,
current_dei_phase_MUX_uxn_opcodes_h_l477_c7_de57_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l477_c7_de57_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l477_c7_de57_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_de57
is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_de57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_de57_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_de57_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_de57_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_de57_return_output);

-- t8_MUX_uxn_opcodes_h_l477_c7_de57
t8_MUX_uxn_opcodes_h_l477_c7_de57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l477_c7_de57_cond,
t8_MUX_uxn_opcodes_h_l477_c7_de57_iftrue,
t8_MUX_uxn_opcodes_h_l477_c7_de57_iffalse,
t8_MUX_uxn_opcodes_h_l477_c7_de57_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_de57
result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_de57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_de57_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_de57_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_de57_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_de57_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_de57
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_de57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_de57_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_de57_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_de57_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_de57_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_de57
result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_de57 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_de57_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_de57_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_de57_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_de57_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_de57
result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_de57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_de57_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_de57_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_de57_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_de57_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_de57
result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_de57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_de57_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_de57_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_de57_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_de57_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l477_c7_de57
result_stack_value_MUX_uxn_opcodes_h_l477_c7_de57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l477_c7_de57_cond,
result_stack_value_MUX_uxn_opcodes_h_l477_c7_de57_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l477_c7_de57_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l477_c7_de57_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_de57
result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_de57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_de57_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_de57_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_de57_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_de57_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l477_c7_de57
has_written_to_t_MUX_uxn_opcodes_h_l477_c7_de57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l477_c7_de57_cond,
has_written_to_t_MUX_uxn_opcodes_h_l477_c7_de57_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l477_c7_de57_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l477_c7_de57_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l480_c11_b765
BIN_OP_EQ_uxn_opcodes_h_l480_c11_b765 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l480_c11_b765_left,
BIN_OP_EQ_uxn_opcodes_h_l480_c11_b765_right,
BIN_OP_EQ_uxn_opcodes_h_l480_c11_b765_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_5d85
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_5d85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_5d85_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_5d85_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_5d85_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_5d85_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l480_c7_3628
device_in_result_MUX_uxn_opcodes_h_l480_c7_3628 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l480_c7_3628_cond,
device_in_result_MUX_uxn_opcodes_h_l480_c7_3628_iftrue,
device_in_result_MUX_uxn_opcodes_h_l480_c7_3628_iffalse,
device_in_result_MUX_uxn_opcodes_h_l480_c7_3628_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l480_c7_3628
has_written_to_n_MUX_uxn_opcodes_h_l480_c7_3628 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l480_c7_3628_cond,
has_written_to_n_MUX_uxn_opcodes_h_l480_c7_3628_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l480_c7_3628_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l480_c7_3628_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_3628
is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_3628 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_3628_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_3628_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_3628_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_3628_return_output);

-- dei_param_MUX_uxn_opcodes_h_l480_c7_3628
dei_param_MUX_uxn_opcodes_h_l480_c7_3628 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l480_c7_3628_cond,
dei_param_MUX_uxn_opcodes_h_l480_c7_3628_iftrue,
dei_param_MUX_uxn_opcodes_h_l480_c7_3628_iffalse,
dei_param_MUX_uxn_opcodes_h_l480_c7_3628_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l480_c7_3628
current_dei_phase_MUX_uxn_opcodes_h_l480_c7_3628 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l480_c7_3628_cond,
current_dei_phase_MUX_uxn_opcodes_h_l480_c7_3628_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l480_c7_3628_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l480_c7_3628_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_3628
is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_3628 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_3628_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_3628_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_3628_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_3628_return_output);

-- t8_MUX_uxn_opcodes_h_l480_c7_3628
t8_MUX_uxn_opcodes_h_l480_c7_3628 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l480_c7_3628_cond,
t8_MUX_uxn_opcodes_h_l480_c7_3628_iftrue,
t8_MUX_uxn_opcodes_h_l480_c7_3628_iffalse,
t8_MUX_uxn_opcodes_h_l480_c7_3628_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_3628
result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_3628 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_3628_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_3628_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_3628_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_3628_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_3628
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_3628 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_3628_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_3628_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_3628_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_3628_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_3628
result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_3628 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_3628_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_3628_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_3628_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_3628_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_3628
result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_3628 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_3628_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_3628_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_3628_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_3628_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_3628
result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_3628 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_3628_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_3628_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_3628_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_3628_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l480_c7_3628
result_stack_value_MUX_uxn_opcodes_h_l480_c7_3628 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l480_c7_3628_cond,
result_stack_value_MUX_uxn_opcodes_h_l480_c7_3628_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l480_c7_3628_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l480_c7_3628_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_3628
result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_3628 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_3628_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_3628_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_3628_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_3628_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l480_c7_3628
has_written_to_t_MUX_uxn_opcodes_h_l480_c7_3628 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l480_c7_3628_cond,
has_written_to_t_MUX_uxn_opcodes_h_l480_c7_3628_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l480_c7_3628_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l480_c7_3628_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l483_c32_7a4b
BIN_OP_AND_uxn_opcodes_h_l483_c32_7a4b : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l483_c32_7a4b_left,
BIN_OP_AND_uxn_opcodes_h_l483_c32_7a4b_right,
BIN_OP_AND_uxn_opcodes_h_l483_c32_7a4b_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l483_c32_d526
BIN_OP_GT_uxn_opcodes_h_l483_c32_d526 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l483_c32_d526_left,
BIN_OP_GT_uxn_opcodes_h_l483_c32_d526_right,
BIN_OP_GT_uxn_opcodes_h_l483_c32_d526_return_output);

-- MUX_uxn_opcodes_h_l483_c32_7b8f
MUX_uxn_opcodes_h_l483_c32_7b8f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l483_c32_7b8f_cond,
MUX_uxn_opcodes_h_l483_c32_7b8f_iftrue,
MUX_uxn_opcodes_h_l483_c32_7b8f_iffalse,
MUX_uxn_opcodes_h_l483_c32_7b8f_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l487_c35_67ee
BIN_OP_PLUS_uxn_opcodes_h_l487_c35_67ee : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l487_c35_67ee_left,
BIN_OP_PLUS_uxn_opcodes_h_l487_c35_67ee_right,
BIN_OP_PLUS_uxn_opcodes_h_l487_c35_67ee_return_output);

-- MUX_uxn_opcodes_h_l487_c15_6c4d
MUX_uxn_opcodes_h_l487_c15_6c4d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l487_c15_6c4d_cond,
MUX_uxn_opcodes_h_l487_c15_6c4d_iftrue,
MUX_uxn_opcodes_h_l487_c15_6c4d_iffalse,
MUX_uxn_opcodes_h_l487_c15_6c4d_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l488_c49_88fc
UNARY_OP_NOT_uxn_opcodes_h_l488_c49_88fc : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l488_c49_88fc_expr,
UNARY_OP_NOT_uxn_opcodes_h_l488_c49_88fc_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l488_c29_4791
BIN_OP_AND_uxn_opcodes_h_l488_c29_4791 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l488_c29_4791_left,
BIN_OP_AND_uxn_opcodes_h_l488_c29_4791_right,
BIN_OP_AND_uxn_opcodes_h_l488_c29_4791_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l488_c8_04d8
BIN_OP_OR_uxn_opcodes_h_l488_c8_04d8 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l488_c8_04d8_left,
BIN_OP_OR_uxn_opcodes_h_l488_c8_04d8_right,
BIN_OP_OR_uxn_opcodes_h_l488_c8_04d8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_b855
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_b855 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_b855_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_b855_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_b855_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_b855_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l488_c3_7c0a
device_in_result_MUX_uxn_opcodes_h_l488_c3_7c0a : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l488_c3_7c0a_cond,
device_in_result_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue,
device_in_result_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse,
device_in_result_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l488_c3_7c0a
has_written_to_n_MUX_uxn_opcodes_h_l488_c3_7c0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l488_c3_7c0a_cond,
has_written_to_n_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a
is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l488_c3_7c0a
current_dei_phase_MUX_uxn_opcodes_h_l488_c3_7c0a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l488_c3_7c0a_cond,
current_dei_phase_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a
is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_7c0a
result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_7c0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_7c0a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_7c0a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_7c0a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_7c0a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_7c0a
result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_7c0a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_7c0a_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_7c0a
result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_7c0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_7c0a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l488_c3_7c0a
result_stack_value_MUX_uxn_opcodes_h_l488_c3_7c0a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l488_c3_7c0a_cond,
result_stack_value_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l488_c3_7c0a
has_written_to_t_MUX_uxn_opcodes_h_l488_c3_7c0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l488_c3_7c0a_cond,
has_written_to_t_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output);

-- device_in_uxn_opcodes_h_l489_c23_8633
device_in_uxn_opcodes_h_l489_c23_8633 : entity work.device_in_0CLK_5af1a430 port map (
clk,
device_in_uxn_opcodes_h_l489_c23_8633_CLOCK_ENABLE,
device_in_uxn_opcodes_h_l489_c23_8633_device_address,
device_in_uxn_opcodes_h_l489_c23_8633_phase,
device_in_uxn_opcodes_h_l489_c23_8633_previous_device_ram_read,
device_in_uxn_opcodes_h_l489_c23_8633_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l492_c4_05f3
BIN_OP_PLUS_uxn_opcodes_h_l492_c4_05f3 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l492_c4_05f3_left,
BIN_OP_PLUS_uxn_opcodes_h_l492_c4_05f3_right,
BIN_OP_PLUS_uxn_opcodes_h_l492_c4_05f3_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l493_c9_d129
BIN_OP_AND_uxn_opcodes_h_l493_c9_d129 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l493_c9_d129_left,
BIN_OP_AND_uxn_opcodes_h_l493_c9_d129_right,
BIN_OP_AND_uxn_opcodes_h_l493_c9_d129_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19
is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19
is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_6170
is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_6170 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_6170_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_6170_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_6170_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_6170_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l499_c13_8e67
UNARY_OP_NOT_uxn_opcodes_h_l499_c13_8e67 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l499_c13_8e67_expr,
UNARY_OP_NOT_uxn_opcodes_h_l499_c13_8e67_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l499_c8_0a36
has_written_to_n_MUX_uxn_opcodes_h_l499_c8_0a36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l499_c8_0a36_cond,
has_written_to_n_MUX_uxn_opcodes_h_l499_c8_0a36_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l499_c8_0a36_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l499_c8_0a36_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l499_c8_0a36
current_dei_phase_MUX_uxn_opcodes_h_l499_c8_0a36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l499_c8_0a36_cond,
current_dei_phase_MUX_uxn_opcodes_h_l499_c8_0a36_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l499_c8_0a36_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l499_c8_0a36_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_0a36
result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_0a36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_0a36_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_0a36_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_0a36_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_0a36_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_0a36
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_0a36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_0a36_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_0a36_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_0a36_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_0a36_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l499_c8_0a36
result_stack_value_MUX_uxn_opcodes_h_l499_c8_0a36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l499_c8_0a36_cond,
result_stack_value_MUX_uxn_opcodes_h_l499_c8_0a36_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l499_c8_0a36_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l499_c8_0a36_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_0a36
result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_0a36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_0a36_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_0a36_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_0a36_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_0a36_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l499_c8_0a36
has_written_to_t_MUX_uxn_opcodes_h_l499_c8_0a36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l499_c8_0a36_cond,
has_written_to_t_MUX_uxn_opcodes_h_l499_c8_0a36_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l499_c8_0a36_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l499_c8_0a36_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l506_c13_ef22
UNARY_OP_NOT_uxn_opcodes_h_l506_c13_ef22 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l506_c13_ef22_expr,
UNARY_OP_NOT_uxn_opcodes_h_l506_c13_ef22_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l506_c8_7fa9
has_written_to_n_MUX_uxn_opcodes_h_l506_c8_7fa9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l506_c8_7fa9_cond,
has_written_to_n_MUX_uxn_opcodes_h_l506_c8_7fa9_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l506_c8_7fa9_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l506_c8_7fa9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_7fa9
result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_7fa9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_7fa9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_7fa9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_7fa9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_7fa9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_7fa9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_7fa9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_7fa9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_7fa9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_7fa9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_7fa9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l506_c8_7fa9
result_stack_value_MUX_uxn_opcodes_h_l506_c8_7fa9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l506_c8_7fa9_cond,
result_stack_value_MUX_uxn_opcodes_h_l506_c8_7fa9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l506_c8_7fa9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l506_c8_7fa9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_7fa9
result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_7fa9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_7fa9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_7fa9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_7fa9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_7fa9_return_output);

-- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l493_l488_DUPLICATE_da27
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l493_l488_DUPLICATE_da27 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l493_l488_DUPLICATE_da27_expr,
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l493_l488_DUPLICATE_da27_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l465_c6_239c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_6ff4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_de57_return_output,
 device_in_result_MUX_uxn_opcodes_h_l465_c2_4496_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l465_c2_4496_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_4496_return_output,
 dei_param_MUX_uxn_opcodes_h_l465_c2_4496_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l465_c2_4496_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_4496_return_output,
 t8_MUX_uxn_opcodes_h_l465_c2_4496_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_4496_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_4496_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_4496_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_4496_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_4496_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l465_c2_4496_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_4496_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_4496_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l465_c2_4496_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l477_c11_76e8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_3628_return_output,
 device_in_result_MUX_uxn_opcodes_h_l477_c7_de57_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l477_c7_de57_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_de57_return_output,
 dei_param_MUX_uxn_opcodes_h_l477_c7_de57_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l477_c7_de57_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_de57_return_output,
 t8_MUX_uxn_opcodes_h_l477_c7_de57_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_de57_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_de57_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_de57_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_de57_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_de57_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l477_c7_de57_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_de57_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l477_c7_de57_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l480_c11_b765_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_5d85_return_output,
 device_in_result_MUX_uxn_opcodes_h_l480_c7_3628_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l480_c7_3628_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_3628_return_output,
 dei_param_MUX_uxn_opcodes_h_l480_c7_3628_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l480_c7_3628_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_3628_return_output,
 t8_MUX_uxn_opcodes_h_l480_c7_3628_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_3628_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_3628_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_3628_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_3628_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_3628_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l480_c7_3628_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_3628_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l480_c7_3628_return_output,
 BIN_OP_AND_uxn_opcodes_h_l483_c32_7a4b_return_output,
 BIN_OP_GT_uxn_opcodes_h_l483_c32_d526_return_output,
 MUX_uxn_opcodes_h_l483_c32_7b8f_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l487_c35_67ee_return_output,
 MUX_uxn_opcodes_h_l487_c15_6c4d_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l488_c49_88fc_return_output,
 BIN_OP_AND_uxn_opcodes_h_l488_c29_4791_return_output,
 BIN_OP_OR_uxn_opcodes_h_l488_c8_04d8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_b855_return_output,
 device_in_result_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output,
 device_in_uxn_opcodes_h_l489_c23_8633_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l492_c4_05f3_return_output,
 BIN_OP_AND_uxn_opcodes_h_l493_c9_d129_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_6170_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l499_c13_8e67_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l499_c8_0a36_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l499_c8_0a36_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_0a36_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_0a36_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l499_c8_0a36_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_0a36_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l499_c8_0a36_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l506_c13_ef22_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l506_c8_7fa9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_7fa9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_7fa9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l506_c8_7fa9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_7fa9_return_output,
 UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l493_l488_DUPLICATE_da27_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_239c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_239c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_239c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_6ff4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_6ff4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_6ff4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_6ff4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_de57_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_de57_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_de57_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_de57_iffalse : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l465_c2_4496_iftrue : device_in_result_t;
 variable VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l465_c2_4496_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l465_c2_4496_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_de57_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l465_c2_4496_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l465_c2_4496_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l465_c2_4496_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l465_c2_4496_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_de57_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l465_c2_4496_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l465_c2_4496_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_4496_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_4496_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_de57_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_4496_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_4496_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l465_c2_4496_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l465_c2_4496_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_de57_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l465_c2_4496_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l465_c2_4496_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l465_c2_4496_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l471_c3_04cf : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l465_c2_4496_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_de57_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l465_c2_4496_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l465_c2_4496_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_4496_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_4496_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_de57_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_4496_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_4496_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l465_c2_4496_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l465_c2_4496_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l477_c7_de57_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l465_c2_4496_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l465_c2_4496_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_4496_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_4496_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_de57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_4496_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_4496_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_4496_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l472_c3_e133 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_4496_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_de57_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_4496_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_4496_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_4496_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_4496_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_de57_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_4496_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_4496_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_4496_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_4496_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_de57_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_4496_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_4496_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_4496_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_4496_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_de57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_4496_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_4496_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l465_c2_4496_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l465_c2_4496_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l477_c7_de57_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l465_c2_4496_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l465_c2_4496_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_4496_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_4496_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_de57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_4496_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_4496_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_4496_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_4496_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l465_c2_4496_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_4496_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_4496_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l465_c2_4496_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l465_c2_4496_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_de57_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l465_c2_4496_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l465_c2_4496_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l466_c3_f5f5_uxn_opcodes_h_l466_c3_f5f5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_76e8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_76e8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_76e8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_3628_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_3628_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_3628_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_3628_iffalse : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_de57_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_de57_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l480_c7_3628_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_de57_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_de57_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_de57_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l480_c7_3628_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_de57_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_de57_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_de57_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_3628_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_de57_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_de57_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_de57_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l480_c7_3628_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_de57_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_de57_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_de57_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l480_c7_3628_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_de57_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_de57_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_de57_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_3628_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_de57_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l477_c7_de57_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l477_c7_de57_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l480_c7_3628_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l477_c7_de57_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_de57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_de57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_3628_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_de57_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_de57_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l478_c3_29fb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_de57_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_3628_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_de57_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_de57_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_de57_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_3628_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_de57_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_de57_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_de57_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_3628_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_de57_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_de57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_de57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_3628_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_de57_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l477_c7_de57_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l477_c7_de57_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l480_c7_3628_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l477_c7_de57_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_de57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_de57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_3628_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_de57_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_de57_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_de57_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l480_c7_3628_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_de57_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_b765_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_b765_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_b765_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_5d85_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_5d85_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_5d85_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_5d85_iffalse : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l480_c7_3628_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l480_c7_3628_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l480_c7_3628_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l480_c7_3628_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l480_c7_3628_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l480_c7_3628_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_3628_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_3628_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_3628_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l480_c7_3628_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l480_c7_3628_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l480_c7_3628_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l480_c7_3628_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l480_c7_3628_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l480_c7_3628_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_3628_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_3628_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_3628_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l480_c7_3628_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l480_c7_3628_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l480_c7_3628_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_3628_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_3628_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_3628_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_3628_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_3628_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_3628_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_3628_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_3628_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_3628_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_3628_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_3628_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_3628_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_3628_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_3628_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_3628_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l480_c7_3628_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l480_c7_3628_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l480_c7_3628_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_3628_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_3628_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_3628_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l480_c7_3628_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l480_c7_3628_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l480_c7_3628_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l483_c32_7b8f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l483_c32_7b8f_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l483_c32_7b8f_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l483_c32_7a4b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l483_c32_7a4b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l483_c32_7a4b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l483_c32_d526_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l483_c32_d526_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l483_c32_d526_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l483_c32_7b8f_return_output : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l487_c15_6c4d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l487_c15_6c4d_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l487_c15_6c4d_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l487_c35_67ee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l487_c35_67ee_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l487_c35_67ee_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l487_c15_6c4d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_04d8_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l488_c29_4791_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c49_88fc_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c49_88fc_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l488_c29_4791_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l488_c29_4791_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_04d8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_04d8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_b855_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_b855_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_b855_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_b855_iffalse : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l488_c3_7c0a_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l499_c8_0a36_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c3_7c0a_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l492_c4_7186 : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l499_c8_0a36_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c3_7c0a_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_0a36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_7c0a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_0a36_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_7c0a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_7c0a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_0a36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_7c0a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l499_c8_0a36_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l488_c3_7c0a_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l499_c8_0a36_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c3_7c0a_cond : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l489_c23_8633_device_address : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l489_c23_8633_phase : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l489_c23_8633_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l489_c23_8633_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l489_c23_8633_return_output : device_in_result_t;
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l490_c32_c4c7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l492_c4_05f3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l492_c4_05f3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l492_c4_05f3_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l493_c9_d129_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l493_c9_d129_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l493_c9_d129_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_6170_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_6170_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_6170_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_6170_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l499_c13_8e67_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l499_c13_8e67_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l499_c8_0a36_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l499_c8_0a36_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l506_c8_7fa9_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l499_c8_0a36_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l499_c8_0a36_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l500_c4_43ac : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l499_c8_0a36_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l499_c8_0a36_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_0a36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_0a36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_7fa9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_0a36_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_0a36_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l502_c4_bd8e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_0a36_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_7fa9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_0a36_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l499_c8_0a36_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l499_c8_0a36_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l506_c8_7fa9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l499_c8_0a36_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_0a36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_0a36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_7fa9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_0a36_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l499_c8_0a36_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l499_c8_0a36_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l499_c8_0a36_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l506_c13_ef22_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l506_c13_ef22_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l506_c8_7fa9_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l506_c8_7fa9_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l506_c8_7fa9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_7fa9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_7fa9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_7fa9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_7fa9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l507_c4_2311 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_7fa9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_7fa9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l506_c8_7fa9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l506_c8_7fa9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l506_c8_7fa9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_7fa9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_7fa9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_7fa9_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l465_l480_l506_l477_DUPLICATE_91b5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l465_l480_l477_DUPLICATE_6b3c_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l488_l465_l480_l477_DUPLICATE_e591_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l488_l465_l506_l477_l480_DUPLICATE_7e9f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l465_l477_DUPLICATE_124d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l488_l499_l506_l477_l480_DUPLICATE_3bca_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l488_l480_l506_DUPLICATE_a3a6_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l493_l488_DUPLICATE_da27_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l493_l488_DUPLICATE_da27_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l493_l495_DUPLICATE_08ad_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l508_l503_DUPLICATE_bf6d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a947_uxn_opcodes_h_l517_l459_DUPLICATE_2bf4_return_output : opcode_result_t;
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
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l506_c8_7fa9_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_5d85_iftrue := to_unsigned(0, 1);
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_4496_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l507_c4_2311 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_7fa9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l507_c4_2311;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_0a36_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l483_c32_7a4b_right := to_unsigned(128, 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_4496_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue := to_unsigned(0, 1);
     VAR_current_dei_phase_uxn_opcodes_h_l500_c4_43ac := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l499_c8_0a36_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l500_c4_43ac;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l502_c4_bd8e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_0a36_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l502_c4_bd8e;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_6170_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_7fa9_iffalse := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_7fa9_iffalse := to_unsigned(0, 1);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l465_c2_4496_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_239c_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l483_c32_7b8f_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_4496_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l483_c32_7b8f_iffalse := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l499_c8_0a36_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_de57_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_6ff4_iffalse := to_unsigned(0, 1);
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l487_c35_67ee_right := to_unsigned(1, 1);
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l465_c2_4496_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l472_c3_e133 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_4496_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l472_c3_e133;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_3628_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_b765_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_b855_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_3628_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l492_c4_05f3_right := to_unsigned(1, 1);
     VAR_current_dei_phase_uxn_opcodes_h_l471_c3_04cf := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l465_c2_4496_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l471_c3_04cf;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_4496_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l483_c32_d526_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_76e8_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l478_c3_29fb := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_de57_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l478_c3_29fb;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_3628_iffalse := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_de57_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_6ff4_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l492_c4_05f3_left := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_de57_iftrue := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l480_c7_3628_iftrue := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l499_c8_0a36_iffalse := current_dei_phase;
     VAR_device_in_uxn_opcodes_h_l489_c23_8633_phase := current_dei_phase;
     VAR_dei_param_MUX_uxn_opcodes_h_l465_c2_4496_iftrue := dei_param;
     VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_de57_iftrue := dei_param;
     VAR_dei_param_MUX_uxn_opcodes_h_l480_c7_3628_iftrue := dei_param;
     VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_de57_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l480_c7_3628_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse := device_in_result;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l506_c13_ef22_expr := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_de57_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l480_c7_3628_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l499_c8_0a36_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l506_c8_7fa9_iffalse := has_written_to_n;
     VAR_BIN_OP_AND_uxn_opcodes_h_l488_c29_4791_left := has_written_to_t;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l499_c13_8e67_expr := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_de57_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l480_c7_3628_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l499_c8_0a36_iffalse := has_written_to_t;
     VAR_BIN_OP_AND_uxn_opcodes_h_l483_c32_7a4b_left := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l487_c15_6c4d_cond := is_first_dei_done;
     VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l493_l488_DUPLICATE_da27_expr := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_de57_iftrue := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_3628_iftrue := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19_iffalse := is_first_dei_done;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c49_88fc_expr := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_de57_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_3628_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_6170_iffalse := is_second_dei_done;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_239c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_76e8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_b765_left := VAR_phase;
     VAR_device_in_uxn_opcodes_h_l489_c23_8633_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l480_c7_3628_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l487_c35_67ee_left := t8;
     VAR_MUX_uxn_opcodes_h_l487_c15_6c4d_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l465_c2_4496_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l477_c7_de57_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l480_c7_3628_iffalse := t8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l488_l480_l506_DUPLICATE_a3a6 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l488_l480_l506_DUPLICATE_a3a6_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l488_l499_l506_l477_l480_DUPLICATE_3bca LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l488_l499_l506_l477_l480_DUPLICATE_3bca_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l465_l477_DUPLICATE_124d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l465_l477_DUPLICATE_124d_return_output := result.is_sp_shift;

     -- device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6[uxn_opcodes_h_l465_c2_4496] LATENCY=0
     VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l465_c2_4496_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6(
     device_in_result,
     to_unsigned(0, 1));

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l465_l480_l477_DUPLICATE_6b3c LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l465_l480_l477_DUPLICATE_6b3c_return_output := result.sp_relative_shift;

     -- result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l465_c2_4496] LATENCY=0
     VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l465_c2_4496_return_output := result.is_device_ram_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l492_c4_05f3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l492_c4_05f3_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l492_c4_05f3_left;
     BIN_OP_PLUS_uxn_opcodes_h_l492_c4_05f3_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l492_c4_05f3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l492_c4_05f3_return_output := BIN_OP_PLUS_uxn_opcodes_h_l492_c4_05f3_return_output;

     -- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l493_l488_DUPLICATE_da27 LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l493_l488_DUPLICATE_da27_expr <= VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l493_l488_DUPLICATE_da27_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l493_l488_DUPLICATE_da27_return_output := UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l493_l488_DUPLICATE_da27_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l499_c13_8e67] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l499_c13_8e67_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l499_c13_8e67_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l499_c13_8e67_return_output := UNARY_OP_NOT_uxn_opcodes_h_l499_c13_8e67_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l488_l465_l506_l477_l480_DUPLICATE_7e9f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l488_l465_l506_l477_l480_DUPLICATE_7e9f_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l465_l480_l506_l477_DUPLICATE_91b5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l465_l480_l506_l477_DUPLICATE_91b5_return_output := result.is_stack_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l487_c35_67ee] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l487_c35_67ee_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l487_c35_67ee_left;
     BIN_OP_PLUS_uxn_opcodes_h_l487_c35_67ee_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l487_c35_67ee_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l487_c35_67ee_return_output := BIN_OP_PLUS_uxn_opcodes_h_l487_c35_67ee_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l480_c11_b765] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l480_c11_b765_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_b765_left;
     BIN_OP_EQ_uxn_opcodes_h_l480_c11_b765_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_b765_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_b765_return_output := BIN_OP_EQ_uxn_opcodes_h_l480_c11_b765_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l477_c11_76e8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l477_c11_76e8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_76e8_left;
     BIN_OP_EQ_uxn_opcodes_h_l477_c11_76e8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_76e8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_76e8_return_output := BIN_OP_EQ_uxn_opcodes_h_l477_c11_76e8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l465_c6_239c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l465_c6_239c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_239c_left;
     BIN_OP_EQ_uxn_opcodes_h_l465_c6_239c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_239c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_239c_return_output := BIN_OP_EQ_uxn_opcodes_h_l465_c6_239c_return_output;

     -- CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l508_l503_DUPLICATE_bf6d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l508_l503_DUPLICATE_bf6d_return_output := device_in_result.dei_value;

     -- BIN_OP_AND[uxn_opcodes_h_l483_c32_7a4b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l483_c32_7a4b_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l483_c32_7a4b_left;
     BIN_OP_AND_uxn_opcodes_h_l483_c32_7a4b_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l483_c32_7a4b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l483_c32_7a4b_return_output := BIN_OP_AND_uxn_opcodes_h_l483_c32_7a4b_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l488_l465_l480_l477_DUPLICATE_e591 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l488_l465_l480_l477_DUPLICATE_e591_return_output := result.device_ram_address;

     -- UNARY_OP_NOT[uxn_opcodes_h_l506_c13_ef22] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l506_c13_ef22_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l506_c13_ef22_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l506_c13_ef22_return_output := UNARY_OP_NOT_uxn_opcodes_h_l506_c13_ef22_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l488_c49_88fc] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l488_c49_88fc_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c49_88fc_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c49_88fc_return_output := UNARY_OP_NOT_uxn_opcodes_h_l488_c49_88fc_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l483_c32_d526_left := VAR_BIN_OP_AND_uxn_opcodes_h_l483_c32_7a4b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_de57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_239c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_6ff4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_239c_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l465_c2_4496_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_239c_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l465_c2_4496_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_239c_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l465_c2_4496_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_239c_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l465_c2_4496_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_239c_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l465_c2_4496_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_239c_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_4496_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_239c_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_4496_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_239c_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_4496_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_239c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_4496_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_239c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_4496_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_239c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_4496_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_239c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_4496_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_239c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_4496_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_239c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_4496_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_239c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l465_c2_4496_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_239c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l465_c2_4496_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_239c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_3628_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_76e8_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_de57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_76e8_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_de57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_76e8_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_de57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_76e8_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_de57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_76e8_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_de57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_76e8_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_de57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_76e8_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_de57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_76e8_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_de57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_76e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_de57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_76e8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_de57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_76e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_de57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_76e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_de57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_76e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_de57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_76e8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l477_c7_de57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_76e8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l477_c7_de57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_76e8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_5d85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_b765_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l480_c7_3628_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_b765_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l480_c7_3628_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_b765_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l480_c7_3628_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_b765_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l480_c7_3628_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_b765_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l480_c7_3628_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_b765_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_3628_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_b765_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_3628_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_b765_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_3628_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_b765_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_3628_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_b765_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_3628_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_b765_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_3628_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_b765_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_3628_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_b765_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_3628_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_b765_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l480_c7_3628_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_b765_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l480_c7_3628_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_b765_return_output;
     VAR_MUX_uxn_opcodes_h_l487_c15_6c4d_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l487_c35_67ee_return_output, 8);
     VAR_current_dei_phase_uxn_opcodes_h_l492_c4_7186 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l492_c4_05f3_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_4496_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l465_l480_l477_DUPLICATE_6b3c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_de57_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l465_l480_l477_DUPLICATE_6b3c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_3628_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l465_l480_l477_DUPLICATE_6b3c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_de57_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l488_l499_l506_l477_l480_DUPLICATE_3bca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_3628_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l488_l499_l506_l477_l480_DUPLICATE_3bca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l488_l499_l506_l477_l480_DUPLICATE_3bca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_0a36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l488_l499_l506_l477_l480_DUPLICATE_3bca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_7fa9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l488_l499_l506_l477_l480_DUPLICATE_3bca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_4496_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l465_l477_DUPLICATE_124d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_de57_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l465_l477_DUPLICATE_124d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_4496_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l465_l480_l506_l477_DUPLICATE_91b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_de57_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l465_l480_l506_l477_DUPLICATE_91b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_3628_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l465_l480_l506_l477_DUPLICATE_91b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_7fa9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l465_l480_l506_l477_DUPLICATE_91b5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l499_c8_0a36_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l508_l503_DUPLICATE_bf6d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l506_c8_7fa9_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l508_l503_DUPLICATE_bf6d_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_4496_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l488_l465_l480_l477_DUPLICATE_e591_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_de57_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l488_l465_l480_l477_DUPLICATE_e591_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_3628_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l488_l465_l480_l477_DUPLICATE_e591_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l488_l465_l480_l477_DUPLICATE_e591_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_3628_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l488_l480_l506_DUPLICATE_a3a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l488_l480_l506_DUPLICATE_a3a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_7fa9_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l488_l480_l506_DUPLICATE_a3a6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l465_c2_4496_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l488_l465_l506_l477_l480_DUPLICATE_7e9f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l477_c7_de57_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l488_l465_l506_l477_l480_DUPLICATE_7e9f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l480_c7_3628_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l488_l465_l506_l477_l480_DUPLICATE_7e9f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l488_l465_l506_l477_l480_DUPLICATE_7e9f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l506_c8_7fa9_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l488_l465_l506_l477_l480_DUPLICATE_7e9f_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l488_c29_4791_right := VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c49_88fc_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l499_c8_0a36_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l499_c13_8e67_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l499_c8_0a36_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l499_c13_8e67_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l499_c8_0a36_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l499_c13_8e67_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_0a36_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l499_c13_8e67_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_0a36_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l499_c13_8e67_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_0a36_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l499_c13_8e67_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l499_c8_0a36_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l499_c13_8e67_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l506_c8_7fa9_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l506_c13_ef22_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_7fa9_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l506_c13_ef22_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_7fa9_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l506_c13_ef22_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_7fa9_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l506_c13_ef22_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l506_c8_7fa9_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l506_c13_ef22_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l493_c9_d129_left := VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l493_l488_DUPLICATE_da27_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_04d8_left := VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l493_l488_DUPLICATE_da27_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l465_c2_4496_iftrue := VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l465_c2_4496_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_4496_iffalse := VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l465_c2_4496_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l492_c4_7186;
     -- result_stack_value_MUX[uxn_opcodes_h_l506_c8_7fa9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l506_c8_7fa9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l506_c8_7fa9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l506_c8_7fa9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l506_c8_7fa9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l506_c8_7fa9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l506_c8_7fa9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l506_c8_7fa9_return_output := result_stack_value_MUX_uxn_opcodes_h_l506_c8_7fa9_return_output;

     -- t8_MUX[uxn_opcodes_h_l480_c7_3628] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l480_c7_3628_cond <= VAR_t8_MUX_uxn_opcodes_h_l480_c7_3628_cond;
     t8_MUX_uxn_opcodes_h_l480_c7_3628_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l480_c7_3628_iftrue;
     t8_MUX_uxn_opcodes_h_l480_c7_3628_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l480_c7_3628_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l480_c7_3628_return_output := t8_MUX_uxn_opcodes_h_l480_c7_3628_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l488_c29_4791] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l488_c29_4791_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l488_c29_4791_left;
     BIN_OP_AND_uxn_opcodes_h_l488_c29_4791_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l488_c29_4791_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l488_c29_4791_return_output := BIN_OP_AND_uxn_opcodes_h_l488_c29_4791_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l465_c1_6ff4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_6ff4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_6ff4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_6ff4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_6ff4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_6ff4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_6ff4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_6ff4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_6ff4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l477_c7_de57] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_de57_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_de57_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_de57_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_de57_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_de57_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_de57_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_de57_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_de57_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l483_c32_d526] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l483_c32_d526_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l483_c32_d526_left;
     BIN_OP_GT_uxn_opcodes_h_l483_c32_d526_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l483_c32_d526_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l483_c32_d526_return_output := BIN_OP_GT_uxn_opcodes_h_l483_c32_d526_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l499_c8_0a36] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l499_c8_0a36_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l499_c8_0a36_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l499_c8_0a36_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l499_c8_0a36_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l499_c8_0a36_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l499_c8_0a36_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l499_c8_0a36_return_output := has_written_to_t_MUX_uxn_opcodes_h_l499_c8_0a36_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l506_c8_7fa9] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l506_c8_7fa9_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l506_c8_7fa9_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l506_c8_7fa9_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l506_c8_7fa9_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l506_c8_7fa9_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l506_c8_7fa9_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l506_c8_7fa9_return_output := has_written_to_n_MUX_uxn_opcodes_h_l506_c8_7fa9_return_output;

     -- MUX[uxn_opcodes_h_l487_c15_6c4d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l487_c15_6c4d_cond <= VAR_MUX_uxn_opcodes_h_l487_c15_6c4d_cond;
     MUX_uxn_opcodes_h_l487_c15_6c4d_iftrue <= VAR_MUX_uxn_opcodes_h_l487_c15_6c4d_iftrue;
     MUX_uxn_opcodes_h_l487_c15_6c4d_iffalse <= VAR_MUX_uxn_opcodes_h_l487_c15_6c4d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l487_c15_6c4d_return_output := MUX_uxn_opcodes_h_l487_c15_6c4d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l506_c8_7fa9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_7fa9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_7fa9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_7fa9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_7fa9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_7fa9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_7fa9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_7fa9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_7fa9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l506_c8_7fa9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_7fa9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_7fa9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_7fa9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_7fa9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_7fa9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_7fa9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_7fa9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_7fa9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l506_c8_7fa9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_7fa9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_7fa9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_7fa9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_7fa9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_7fa9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_7fa9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_7fa9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_7fa9_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l499_c8_0a36] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l499_c8_0a36_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l499_c8_0a36_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l499_c8_0a36_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l499_c8_0a36_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l499_c8_0a36_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l499_c8_0a36_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l499_c8_0a36_return_output := current_dei_phase_MUX_uxn_opcodes_h_l499_c8_0a36_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l465_c2_4496] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_4496_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_4496_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_4496_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_4496_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_4496_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_4496_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_4496_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_4496_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l480_c7_3628] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_3628_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_3628_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_3628_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_3628_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_3628_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_3628_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_3628_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_3628_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_04d8_right := VAR_BIN_OP_AND_uxn_opcodes_h_l488_c29_4791_return_output;
     VAR_MUX_uxn_opcodes_h_l483_c32_7b8f_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l483_c32_d526_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_3628_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_de57_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l480_c7_3628_iffalse := VAR_MUX_uxn_opcodes_h_l487_c15_6c4d_return_output;
     VAR_device_in_uxn_opcodes_h_l489_c23_8633_device_address := VAR_MUX_uxn_opcodes_h_l487_c15_6c4d_return_output;
     VAR_printf_uxn_opcodes_h_l466_c3_f5f5_uxn_opcodes_h_l466_c3_f5f5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_6ff4_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l499_c8_0a36_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l499_c8_0a36_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l506_c8_7fa9_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l499_c8_0a36_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_0a36_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_7fa9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_de57_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_3628_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_0a36_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_7fa9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_0a36_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_7fa9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l499_c8_0a36_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l506_c8_7fa9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l477_c7_de57_iffalse := VAR_t8_MUX_uxn_opcodes_h_l480_c7_3628_return_output;
     -- dei_param_MUX[uxn_opcodes_h_l480_c7_3628] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l480_c7_3628_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l480_c7_3628_cond;
     dei_param_MUX_uxn_opcodes_h_l480_c7_3628_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l480_c7_3628_iftrue;
     dei_param_MUX_uxn_opcodes_h_l480_c7_3628_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l480_c7_3628_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l480_c7_3628_return_output := dei_param_MUX_uxn_opcodes_h_l480_c7_3628_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l499_c8_0a36] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_0a36_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_0a36_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_0a36_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_0a36_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_0a36_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_0a36_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_0a36_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_0a36_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l499_c8_0a36] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_0a36_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_0a36_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_0a36_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_0a36_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_0a36_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_0a36_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_0a36_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_0a36_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l499_c8_0a36] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_0a36_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_0a36_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_0a36_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_0a36_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_0a36_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_0a36_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_0a36_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_0a36_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l499_c8_0a36] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l499_c8_0a36_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l499_c8_0a36_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l499_c8_0a36_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l499_c8_0a36_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l499_c8_0a36_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l499_c8_0a36_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l499_c8_0a36_return_output := has_written_to_n_MUX_uxn_opcodes_h_l499_c8_0a36_return_output;

     -- MUX[uxn_opcodes_h_l483_c32_7b8f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l483_c32_7b8f_cond <= VAR_MUX_uxn_opcodes_h_l483_c32_7b8f_cond;
     MUX_uxn_opcodes_h_l483_c32_7b8f_iftrue <= VAR_MUX_uxn_opcodes_h_l483_c32_7b8f_iftrue;
     MUX_uxn_opcodes_h_l483_c32_7b8f_iffalse <= VAR_MUX_uxn_opcodes_h_l483_c32_7b8f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l483_c32_7b8f_return_output := MUX_uxn_opcodes_h_l483_c32_7b8f_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l488_c8_04d8] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l488_c8_04d8_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_04d8_left;
     BIN_OP_OR_uxn_opcodes_h_l488_c8_04d8_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_04d8_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_04d8_return_output := BIN_OP_OR_uxn_opcodes_h_l488_c8_04d8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l480_c7_3628] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_3628_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_3628_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_3628_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_3628_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_3628_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_3628_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_3628_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_3628_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l499_c8_0a36] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l499_c8_0a36_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l499_c8_0a36_cond;
     result_stack_value_MUX_uxn_opcodes_h_l499_c8_0a36_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l499_c8_0a36_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l499_c8_0a36_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l499_c8_0a36_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l499_c8_0a36_return_output := result_stack_value_MUX_uxn_opcodes_h_l499_c8_0a36_return_output;

     -- t8_MUX[uxn_opcodes_h_l477_c7_de57] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l477_c7_de57_cond <= VAR_t8_MUX_uxn_opcodes_h_l477_c7_de57_cond;
     t8_MUX_uxn_opcodes_h_l477_c7_de57_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l477_c7_de57_iftrue;
     t8_MUX_uxn_opcodes_h_l477_c7_de57_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l477_c7_de57_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l477_c7_de57_return_output := t8_MUX_uxn_opcodes_h_l477_c7_de57_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l477_c7_de57] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_de57_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_de57_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_de57_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_de57_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_de57_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_de57_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_de57_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_de57_return_output;

     -- printf_uxn_opcodes_h_l466_c3_f5f5[uxn_opcodes_h_l466_c3_f5f5] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l466_c3_f5f5_uxn_opcodes_h_l466_c3_f5f5_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l466_c3_f5f5_uxn_opcodes_h_l466_c3_f5f5_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_b855_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_04d8_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c3_7c0a_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_04d8_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l488_c3_7c0a_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_04d8_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c3_7c0a_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_04d8_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c3_7c0a_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_04d8_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_04d8_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_04d8_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_7c0a_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_04d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_7c0a_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_04d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_7c0a_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_04d8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_7c0a_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_04d8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l488_c3_7c0a_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_04d8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_5d85_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_3628_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_3628_iftrue := VAR_MUX_uxn_opcodes_h_l483_c32_7b8f_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_de57_iffalse := VAR_dei_param_MUX_uxn_opcodes_h_l480_c7_3628_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l499_c8_0a36_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_0a36_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_4496_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_de57_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_0a36_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_0a36_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l499_c8_0a36_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l465_c2_4496_iffalse := VAR_t8_MUX_uxn_opcodes_h_l477_c7_de57_return_output;
     -- has_written_to_n_MUX[uxn_opcodes_h_l488_c3_7c0a] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l488_c3_7c0a_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c3_7c0a_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output := has_written_to_n_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l488_c3_7c0a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l488_c3_7c0a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l488_c3_7c0a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output := result_stack_value_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l485_c1_5d85] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_5d85_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_5d85_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_5d85_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_5d85_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_5d85_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_5d85_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_5d85_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_5d85_return_output;

     -- t8_MUX[uxn_opcodes_h_l465_c2_4496] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l465_c2_4496_cond <= VAR_t8_MUX_uxn_opcodes_h_l465_c2_4496_cond;
     t8_MUX_uxn_opcodes_h_l465_c2_4496_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l465_c2_4496_iftrue;
     t8_MUX_uxn_opcodes_h_l465_c2_4496_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l465_c2_4496_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l465_c2_4496_return_output := t8_MUX_uxn_opcodes_h_l465_c2_4496_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l488_c3_7c0a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_7c0a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_7c0a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l488_c3_7c0a] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l488_c3_7c0a_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c3_7c0a_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output := current_dei_phase_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l488_c3_7c0a] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l488_c3_7c0a_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c3_7c0a_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output := has_written_to_t_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l488_c3_7c0a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_7c0a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_7c0a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l480_c7_3628] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_3628_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_3628_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_3628_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_3628_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_3628_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_3628_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_3628_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_3628_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l488_c3_7c0a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_7c0a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_7c0a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l477_c7_de57] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l477_c7_de57_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_de57_cond;
     dei_param_MUX_uxn_opcodes_h_l477_c7_de57_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_de57_iftrue;
     dei_param_MUX_uxn_opcodes_h_l477_c7_de57_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_de57_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_de57_return_output := dei_param_MUX_uxn_opcodes_h_l477_c7_de57_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l465_c2_4496] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_4496_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_4496_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_4496_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_4496_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_4496_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_4496_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_4496_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_4496_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_b855_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_5d85_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l480_c7_3628_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l465_c2_4496_iffalse := VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_de57_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l480_c7_3628_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l480_c7_3628_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_3628_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_3628_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_de57_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_3628_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_3628_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l480_c7_3628_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l465_c2_4496_return_output;
     -- has_written_to_t_MUX[uxn_opcodes_h_l480_c7_3628] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l480_c7_3628_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l480_c7_3628_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l480_c7_3628_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l480_c7_3628_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l480_c7_3628_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l480_c7_3628_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l480_c7_3628_return_output := has_written_to_t_MUX_uxn_opcodes_h_l480_c7_3628_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l480_c7_3628] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_3628_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_3628_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_3628_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_3628_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_3628_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_3628_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_3628_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_3628_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l480_c7_3628] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_3628_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_3628_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_3628_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_3628_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_3628_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_3628_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_3628_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_3628_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l480_c7_3628] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l480_c7_3628_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l480_c7_3628_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l480_c7_3628_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l480_c7_3628_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l480_c7_3628_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l480_c7_3628_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l480_c7_3628_return_output := current_dei_phase_MUX_uxn_opcodes_h_l480_c7_3628_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l480_c7_3628] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l480_c7_3628_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l480_c7_3628_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l480_c7_3628_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l480_c7_3628_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l480_c7_3628_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l480_c7_3628_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l480_c7_3628_return_output := has_written_to_n_MUX_uxn_opcodes_h_l480_c7_3628_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l488_c1_b855] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_b855_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_b855_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_b855_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_b855_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_b855_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_b855_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_b855_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_b855_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l480_c7_3628] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_3628_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_3628_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_3628_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_3628_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_3628_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_3628_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_3628_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_3628_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l477_c7_de57] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_de57_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_de57_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_de57_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_de57_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_de57_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_de57_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_de57_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_de57_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l465_c2_4496] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l465_c2_4496_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l465_c2_4496_cond;
     dei_param_MUX_uxn_opcodes_h_l465_c2_4496_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l465_c2_4496_iftrue;
     dei_param_MUX_uxn_opcodes_h_l465_c2_4496_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l465_c2_4496_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l465_c2_4496_return_output := dei_param_MUX_uxn_opcodes_h_l465_c2_4496_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l480_c7_3628] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l480_c7_3628_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l480_c7_3628_cond;
     result_stack_value_MUX_uxn_opcodes_h_l480_c7_3628_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l480_c7_3628_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l480_c7_3628_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l480_c7_3628_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l480_c7_3628_return_output := result_stack_value_MUX_uxn_opcodes_h_l480_c7_3628_return_output;

     -- Submodule level 5
     VAR_device_in_uxn_opcodes_h_l489_c23_8633_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_b855_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_de57_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l480_c7_3628_return_output;
     REG_VAR_dei_param := VAR_dei_param_MUX_uxn_opcodes_h_l465_c2_4496_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_de57_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l480_c7_3628_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_de57_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l480_c7_3628_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_de57_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_3628_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_de57_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_3628_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_4496_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_de57_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_de57_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_3628_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l477_c7_de57_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l480_c7_3628_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l477_c7_de57] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_de57_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_de57_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_de57_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_de57_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_de57_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_de57_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_de57_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_de57_return_output;

     -- device_in[uxn_opcodes_h_l489_c23_8633] LATENCY=0
     -- Clock enable
     device_in_uxn_opcodes_h_l489_c23_8633_CLOCK_ENABLE <= VAR_device_in_uxn_opcodes_h_l489_c23_8633_CLOCK_ENABLE;
     -- Inputs
     device_in_uxn_opcodes_h_l489_c23_8633_device_address <= VAR_device_in_uxn_opcodes_h_l489_c23_8633_device_address;
     device_in_uxn_opcodes_h_l489_c23_8633_phase <= VAR_device_in_uxn_opcodes_h_l489_c23_8633_phase;
     device_in_uxn_opcodes_h_l489_c23_8633_previous_device_ram_read <= VAR_device_in_uxn_opcodes_h_l489_c23_8633_previous_device_ram_read;
     -- Outputs
     VAR_device_in_uxn_opcodes_h_l489_c23_8633_return_output := device_in_uxn_opcodes_h_l489_c23_8633_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l477_c7_de57] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_de57_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_de57_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_de57_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_de57_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_de57_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_de57_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_de57_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_de57_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l477_c7_de57] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_de57_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_de57_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_de57_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_de57_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_de57_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_de57_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_de57_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_de57_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l465_c2_4496] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_4496_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_4496_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_4496_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_4496_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_4496_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_4496_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_4496_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_4496_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l477_c7_de57] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l477_c7_de57_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_de57_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l477_c7_de57_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_de57_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l477_c7_de57_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_de57_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_de57_return_output := has_written_to_n_MUX_uxn_opcodes_h_l477_c7_de57_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l477_c7_de57] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l477_c7_de57_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_de57_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l477_c7_de57_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_de57_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l477_c7_de57_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_de57_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_de57_return_output := has_written_to_t_MUX_uxn_opcodes_h_l477_c7_de57_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l477_c7_de57] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l477_c7_de57_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_de57_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l477_c7_de57_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_de57_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l477_c7_de57_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_de57_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_de57_return_output := current_dei_phase_MUX_uxn_opcodes_h_l477_c7_de57_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l477_c7_de57] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l477_c7_de57_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l477_c7_de57_cond;
     result_stack_value_MUX_uxn_opcodes_h_l477_c7_de57_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l477_c7_de57_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l477_c7_de57_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l477_c7_de57_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l477_c7_de57_return_output := result_stack_value_MUX_uxn_opcodes_h_l477_c7_de57_return_output;

     -- Submodule level 6
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l465_c2_4496_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_de57_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue := VAR_device_in_uxn_opcodes_h_l489_c23_8633_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l465_c2_4496_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_de57_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l465_c2_4496_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_de57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_4496_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_de57_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_4496_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_de57_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_4496_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_de57_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l465_c2_4496_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l477_c7_de57_return_output;
     -- has_written_to_n_MUX[uxn_opcodes_h_l465_c2_4496] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l465_c2_4496_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l465_c2_4496_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l465_c2_4496_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l465_c2_4496_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l465_c2_4496_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l465_c2_4496_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l465_c2_4496_return_output := has_written_to_n_MUX_uxn_opcodes_h_l465_c2_4496_return_output;

     -- CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l493_l495_DUPLICATE_08ad LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l493_l495_DUPLICATE_08ad_return_output := VAR_device_in_uxn_opcodes_h_l489_c23_8633_return_output.is_dei_done;

     -- result_stack_value_MUX[uxn_opcodes_h_l465_c2_4496] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l465_c2_4496_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l465_c2_4496_cond;
     result_stack_value_MUX_uxn_opcodes_h_l465_c2_4496_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l465_c2_4496_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l465_c2_4496_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l465_c2_4496_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l465_c2_4496_return_output := result_stack_value_MUX_uxn_opcodes_h_l465_c2_4496_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l465_c2_4496] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l465_c2_4496_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l465_c2_4496_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l465_c2_4496_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l465_c2_4496_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l465_c2_4496_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l465_c2_4496_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l465_c2_4496_return_output := has_written_to_t_MUX_uxn_opcodes_h_l465_c2_4496_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l488_c3_7c0a] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l488_c3_7c0a_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l488_c3_7c0a_cond;
     device_in_result_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output := device_in_result_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l465_c2_4496] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l465_c2_4496_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l465_c2_4496_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l465_c2_4496_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l465_c2_4496_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l465_c2_4496_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l465_c2_4496_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l465_c2_4496_return_output := current_dei_phase_MUX_uxn_opcodes_h_l465_c2_4496_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l465_c2_4496] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_4496_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_4496_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_4496_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_4496_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_4496_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_4496_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_4496_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_4496_return_output;

     -- CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d[uxn_opcodes_h_l490_c32_c4c7] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l490_c32_c4c7_return_output := VAR_device_in_uxn_opcodes_h_l489_c23_8633_return_output.device_ram_address;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l465_c2_4496] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_4496_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_4496_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_4496_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_4496_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_4496_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_4496_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_4496_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_4496_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l465_c2_4496] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_4496_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_4496_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_4496_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_4496_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_4496_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_4496_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_4496_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_4496_return_output;

     -- Submodule level 7
     VAR_BIN_OP_AND_uxn_opcodes_h_l493_c9_d129_right := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l493_l495_DUPLICATE_08ad_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_6170_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l493_l495_DUPLICATE_08ad_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l490_c32_c4c7_return_output;
     REG_VAR_current_dei_phase := VAR_current_dei_phase_MUX_uxn_opcodes_h_l465_c2_4496_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l480_c7_3628_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output;
     REG_VAR_has_written_to_n := VAR_has_written_to_n_MUX_uxn_opcodes_h_l465_c2_4496_return_output;
     REG_VAR_has_written_to_t := VAR_has_written_to_t_MUX_uxn_opcodes_h_l465_c2_4496_return_output;
     -- BIN_OP_AND[uxn_opcodes_h_l493_c9_d129] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l493_c9_d129_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l493_c9_d129_left;
     BIN_OP_AND_uxn_opcodes_h_l493_c9_d129_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l493_c9_d129_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l493_c9_d129_return_output := BIN_OP_AND_uxn_opcodes_h_l493_c9_d129_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l488_c3_7c0a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_7c0a_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_7c0a_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l480_c7_3628] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l480_c7_3628_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l480_c7_3628_cond;
     device_in_result_MUX_uxn_opcodes_h_l480_c7_3628_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l480_c7_3628_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l480_c7_3628_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l480_c7_3628_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l480_c7_3628_return_output := device_in_result_MUX_uxn_opcodes_h_l480_c7_3628_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l495_c11_6170] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_6170_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_6170_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_6170_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_6170_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_6170_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_6170_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_6170_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_6170_return_output;

     -- Submodule level 8
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19_cond := VAR_BIN_OP_AND_uxn_opcodes_h_l493_c9_d129_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19_cond := VAR_BIN_OP_AND_uxn_opcodes_h_l493_c9_d129_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_de57_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l480_c7_3628_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_6170_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_3628_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l480_c7_3628] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_3628_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_3628_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_3628_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_3628_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_3628_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_3628_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_3628_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_3628_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l493_c4_5d19] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l493_c4_5d19] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l477_c7_de57] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l477_c7_de57_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_de57_cond;
     device_in_result_MUX_uxn_opcodes_h_l477_c7_de57_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_de57_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l477_c7_de57_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_de57_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_de57_return_output := device_in_result_MUX_uxn_opcodes_h_l477_c7_de57_return_output;

     -- Submodule level 9
     VAR_device_in_result_MUX_uxn_opcodes_h_l465_c2_4496_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_de57_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5d19_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_de57_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_3628_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l477_c7_de57] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_de57_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_de57_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_de57_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_de57_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_de57_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_de57_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_de57_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_de57_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l488_c3_7c0a] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l465_c2_4496] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l465_c2_4496_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l465_c2_4496_cond;
     device_in_result_MUX_uxn_opcodes_h_l465_c2_4496_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l465_c2_4496_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l465_c2_4496_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l465_c2_4496_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l465_c2_4496_return_output := device_in_result_MUX_uxn_opcodes_h_l465_c2_4496_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l488_c3_7c0a] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output;

     -- Submodule level 10
     REG_VAR_device_in_result := VAR_device_in_result_MUX_uxn_opcodes_h_l465_c2_4496_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_3628_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_3628_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_7c0a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_4496_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_de57_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l465_c2_4496] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_4496_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_4496_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_4496_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_4496_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_4496_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_4496_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_4496_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_4496_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l480_c7_3628] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_3628_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_3628_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_3628_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_3628_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_3628_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_3628_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_3628_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_3628_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l480_c7_3628] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_3628_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_3628_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_3628_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_3628_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_3628_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_3628_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_3628_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_3628_return_output;

     -- Submodule level 11
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_de57_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_3628_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_de57_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_3628_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a947_uxn_opcodes_h_l517_l459_DUPLICATE_2bf4 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a947_uxn_opcodes_h_l517_l459_DUPLICATE_2bf4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a947(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_4496_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_4496_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_4496_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_4496_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_4496_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l465_c2_4496_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_4496_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_4496_return_output);

     -- is_second_dei_done_MUX[uxn_opcodes_h_l477_c7_de57] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_de57_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_de57_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_de57_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_de57_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_de57_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_de57_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_de57_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_de57_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l477_c7_de57] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_de57_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_de57_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_de57_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_de57_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_de57_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_de57_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_de57_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_de57_return_output;

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a947_uxn_opcodes_h_l517_l459_DUPLICATE_2bf4_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a947_uxn_opcodes_h_l517_l459_DUPLICATE_2bf4_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_4496_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_de57_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_4496_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_de57_return_output;
     -- is_second_dei_done_MUX[uxn_opcodes_h_l465_c2_4496] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_4496_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_4496_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_4496_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_4496_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_4496_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_4496_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_4496_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_4496_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l465_c2_4496] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_4496_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_4496_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_4496_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_4496_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_4496_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_4496_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_4496_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_4496_return_output;

     -- Submodule level 13
     REG_VAR_is_first_dei_done := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_4496_return_output;
     REG_VAR_is_second_dei_done := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_4496_return_output;
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
