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
-- BIN_OP_EQ[uxn_opcodes_h_l488_c6_4fdc]
signal BIN_OP_EQ_uxn_opcodes_h_l488_c6_4fdc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l488_c6_4fdc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l488_c6_4fdc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l488_c1_9084]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_9084_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_9084_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_9084_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_9084_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l500_c7_f9d7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f9d7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l488_c2_70ac]
signal t8_MUX_uxn_opcodes_h_l488_c2_70ac_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l488_c2_70ac_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l488_c2_70ac]
signal device_in_result_MUX_uxn_opcodes_h_l488_c2_70ac_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l488_c2_70ac_return_output : device_in_result_t;

-- is_first_dei_done_MUX[uxn_opcodes_h_l488_c2_70ac]
signal is_first_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l488_c2_70ac]
signal current_dei_phase_MUX_uxn_opcodes_h_l488_c2_70ac_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l488_c2_70ac_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l488_c2_70ac]
signal result_is_stack_read_MUX_uxn_opcodes_h_l488_c2_70ac_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l488_c2_70ac_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l488_c2_70ac]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c2_70ac_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c2_70ac_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l488_c2_70ac]
signal result_stack_value_MUX_uxn_opcodes_h_l488_c2_70ac_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l488_c2_70ac_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l488_c2_70ac]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l488_c2_70ac_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l488_c2_70ac_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l488_c2_70ac]
signal result_is_opc_done_MUX_uxn_opcodes_h_l488_c2_70ac_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l488_c2_70ac_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l488_c2_70ac]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c2_70ac_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c2_70ac_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l488_c2_70ac]
signal result_device_ram_address_MUX_uxn_opcodes_h_l488_c2_70ac_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l488_c2_70ac_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l488_c2_70ac]
signal result_is_stack_write_MUX_uxn_opcodes_h_l488_c2_70ac_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l488_c2_70ac_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l488_c2_70ac]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c2_70ac_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c2_70ac_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l488_c2_70ac]
signal is_second_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l488_c2_70ac]
signal has_written_to_t_MUX_uxn_opcodes_h_l488_c2_70ac_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l488_c2_70ac_return_output : unsigned(0 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l488_c2_70ac]
signal dei_param_MUX_uxn_opcodes_h_l488_c2_70ac_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l488_c2_70ac_return_output : unsigned(7 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l488_c2_70ac]
signal has_written_to_n_MUX_uxn_opcodes_h_l488_c2_70ac_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l488_c2_70ac_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l489_c3_f538[uxn_opcodes_h_l489_c3_f538]
signal printf_uxn_opcodes_h_l489_c3_f538_uxn_opcodes_h_l489_c3_f538_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l500_c11_a70b]
signal BIN_OP_EQ_uxn_opcodes_h_l500_c11_a70b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l500_c11_a70b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l500_c11_a70b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l503_c7_ff80]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_ff80_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_ff80_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l500_c7_f9d7]
signal t8_MUX_uxn_opcodes_h_l500_c7_f9d7_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l500_c7_f9d7]
signal device_in_result_MUX_uxn_opcodes_h_l500_c7_f9d7_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output : device_in_result_t;

-- is_first_dei_done_MUX[uxn_opcodes_h_l500_c7_f9d7]
signal is_first_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l500_c7_f9d7]
signal current_dei_phase_MUX_uxn_opcodes_h_l500_c7_f9d7_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l500_c7_f9d7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_f9d7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l500_c7_f9d7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f9d7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l500_c7_f9d7]
signal result_stack_value_MUX_uxn_opcodes_h_l500_c7_f9d7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l500_c7_f9d7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f9d7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l500_c7_f9d7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f9d7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l500_c7_f9d7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f9d7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l500_c7_f9d7]
signal result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f9d7_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l500_c7_f9d7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l500_c7_f9d7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l500_c7_f9d7]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_f9d7_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l500_c7_f9d7]
signal is_second_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l500_c7_f9d7]
signal has_written_to_t_MUX_uxn_opcodes_h_l500_c7_f9d7_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output : unsigned(0 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l500_c7_f9d7]
signal dei_param_MUX_uxn_opcodes_h_l500_c7_f9d7_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output : unsigned(7 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l500_c7_f9d7]
signal has_written_to_n_MUX_uxn_opcodes_h_l500_c7_f9d7_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l503_c11_e623]
signal BIN_OP_EQ_uxn_opcodes_h_l503_c11_e623_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l503_c11_e623_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l503_c11_e623_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l509_c1_8e6f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l509_c1_8e6f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l509_c1_8e6f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l509_c1_8e6f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l509_c1_8e6f_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l503_c7_ff80]
signal t8_MUX_uxn_opcodes_h_l503_c7_ff80_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l503_c7_ff80_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l503_c7_ff80]
signal device_in_result_MUX_uxn_opcodes_h_l503_c7_ff80_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l503_c7_ff80_return_output : device_in_result_t;

-- is_first_dei_done_MUX[uxn_opcodes_h_l503_c7_ff80]
signal is_first_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l503_c7_ff80]
signal current_dei_phase_MUX_uxn_opcodes_h_l503_c7_ff80_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l503_c7_ff80_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l503_c7_ff80]
signal result_is_stack_read_MUX_uxn_opcodes_h_l503_c7_ff80_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l503_c7_ff80_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l503_c7_ff80]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_ff80_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_ff80_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l503_c7_ff80]
signal result_stack_value_MUX_uxn_opcodes_h_l503_c7_ff80_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l503_c7_ff80_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l503_c7_ff80]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_ff80_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_ff80_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l503_c7_ff80]
signal result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_ff80_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_ff80_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l503_c7_ff80]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c7_ff80_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c7_ff80_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l503_c7_ff80]
signal result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_ff80_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_ff80_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l503_c7_ff80]
signal result_is_stack_write_MUX_uxn_opcodes_h_l503_c7_ff80_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l503_c7_ff80_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l503_c7_ff80]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l503_c7_ff80_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l503_c7_ff80_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l503_c7_ff80]
signal is_second_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l503_c7_ff80]
signal has_written_to_t_MUX_uxn_opcodes_h_l503_c7_ff80_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l503_c7_ff80_return_output : unsigned(0 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l503_c7_ff80]
signal dei_param_MUX_uxn_opcodes_h_l503_c7_ff80_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l503_c7_ff80_return_output : unsigned(7 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l503_c7_ff80]
signal has_written_to_n_MUX_uxn_opcodes_h_l503_c7_ff80_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l503_c7_ff80_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l507_c32_8613]
signal BIN_OP_AND_uxn_opcodes_h_l507_c32_8613_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l507_c32_8613_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l507_c32_8613_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l507_c32_ed00]
signal BIN_OP_GT_uxn_opcodes_h_l507_c32_ed00_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l507_c32_ed00_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l507_c32_ed00_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l507_c32_457f]
signal MUX_uxn_opcodes_h_l507_c32_457f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l507_c32_457f_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l507_c32_457f_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l507_c32_457f_return_output : signed(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l511_c35_923b]
signal BIN_OP_PLUS_uxn_opcodes_h_l511_c35_923b_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l511_c35_923b_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l511_c35_923b_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l511_c15_bbdd]
signal MUX_uxn_opcodes_h_l511_c15_bbdd_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l511_c15_bbdd_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l511_c15_bbdd_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l511_c15_bbdd_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l512_c49_f457]
signal UNARY_OP_NOT_uxn_opcodes_h_l512_c49_f457_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l512_c49_f457_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l512_c29_bdd8]
signal BIN_OP_AND_uxn_opcodes_h_l512_c29_bdd8_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l512_c29_bdd8_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l512_c29_bdd8_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l512_c8_fd1f]
signal BIN_OP_OR_uxn_opcodes_h_l512_c8_fd1f_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l512_c8_fd1f_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l512_c8_fd1f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l512_c1_0e06]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l512_c1_0e06_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l512_c1_0e06_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l512_c1_0e06_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l512_c1_0e06_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l512_c3_007a]
signal device_in_result_MUX_uxn_opcodes_h_l512_c3_007a_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l512_c3_007a_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l512_c3_007a_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l512_c3_007a_return_output : device_in_result_t;

-- is_first_dei_done_MUX[uxn_opcodes_h_l512_c3_007a]
signal is_first_dei_done_MUX_uxn_opcodes_h_l512_c3_007a_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l512_c3_007a_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l512_c3_007a_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l512_c3_007a_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l512_c3_007a]
signal current_dei_phase_MUX_uxn_opcodes_h_l512_c3_007a_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l512_c3_007a_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l512_c3_007a_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l512_c3_007a_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l512_c3_007a]
signal result_device_ram_address_MUX_uxn_opcodes_h_l512_c3_007a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l512_c3_007a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l512_c3_007a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l512_c3_007a_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l512_c3_007a]
signal result_stack_value_MUX_uxn_opcodes_h_l512_c3_007a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l512_c3_007a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l512_c3_007a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l512_c3_007a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l512_c3_007a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l512_c3_007a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l512_c3_007a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l512_c3_007a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l512_c3_007a_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l512_c3_007a]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l512_c3_007a_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l512_c3_007a_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l512_c3_007a_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l512_c3_007a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l512_c3_007a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l512_c3_007a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l512_c3_007a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l512_c3_007a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l512_c3_007a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l512_c3_007a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c3_007a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c3_007a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c3_007a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c3_007a_return_output : unsigned(7 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l512_c3_007a]
signal is_second_dei_done_MUX_uxn_opcodes_h_l512_c3_007a_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l512_c3_007a_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l512_c3_007a_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l512_c3_007a_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l512_c3_007a]
signal has_written_to_t_MUX_uxn_opcodes_h_l512_c3_007a_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l512_c3_007a_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l512_c3_007a_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l512_c3_007a_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l512_c3_007a]
signal has_written_to_n_MUX_uxn_opcodes_h_l512_c3_007a_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l512_c3_007a_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l512_c3_007a_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l512_c3_007a_return_output : unsigned(0 downto 0);

-- device_in[uxn_opcodes_h_l513_c23_1a00]
signal device_in_uxn_opcodes_h_l513_c23_1a00_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_in_uxn_opcodes_h_l513_c23_1a00_device_address : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l513_c23_1a00_phase : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l513_c23_1a00_previous_device_ram_read : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l513_c23_1a00_return_output : device_in_result_t;

-- BIN_OP_PLUS[uxn_opcodes_h_l517_c4_b0da]
signal BIN_OP_PLUS_uxn_opcodes_h_l517_c4_b0da_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l517_c4_b0da_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l517_c4_b0da_return_output : unsigned(8 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l518_c9_9baf]
signal BIN_OP_AND_uxn_opcodes_h_l518_c9_9baf_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l518_c9_9baf_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l518_c9_9baf_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l518_c4_7119]
signal is_first_dei_done_MUX_uxn_opcodes_h_l518_c4_7119_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l518_c4_7119_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l518_c4_7119_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l518_c4_7119_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l518_c4_7119]
signal is_second_dei_done_MUX_uxn_opcodes_h_l518_c4_7119_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l518_c4_7119_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l518_c4_7119_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l518_c4_7119_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l520_c11_f4ba]
signal is_second_dei_done_MUX_uxn_opcodes_h_l520_c11_f4ba_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l520_c11_f4ba_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l520_c11_f4ba_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l520_c11_f4ba_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l524_c13_052d]
signal UNARY_OP_NOT_uxn_opcodes_h_l524_c13_052d_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l524_c13_052d_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l524_c8_0f19]
signal current_dei_phase_MUX_uxn_opcodes_h_l524_c8_0f19_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l524_c8_0f19_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l524_c8_0f19_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l524_c8_0f19_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l524_c8_0f19]
signal result_is_stack_write_MUX_uxn_opcodes_h_l524_c8_0f19_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l524_c8_0f19_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l524_c8_0f19_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l524_c8_0f19_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l524_c8_0f19]
signal result_stack_value_MUX_uxn_opcodes_h_l524_c8_0f19_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l524_c8_0f19_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l524_c8_0f19_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l524_c8_0f19_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l524_c8_0f19]
signal result_is_opc_done_MUX_uxn_opcodes_h_l524_c8_0f19_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l524_c8_0f19_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l524_c8_0f19_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l524_c8_0f19_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l524_c8_0f19]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l524_c8_0f19_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l524_c8_0f19_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l524_c8_0f19_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l524_c8_0f19_return_output : unsigned(7 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l524_c8_0f19]
signal has_written_to_t_MUX_uxn_opcodes_h_l524_c8_0f19_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l524_c8_0f19_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l524_c8_0f19_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l524_c8_0f19_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l524_c8_0f19]
signal has_written_to_n_MUX_uxn_opcodes_h_l524_c8_0f19_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l524_c8_0f19_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l524_c8_0f19_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l524_c8_0f19_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l531_c13_56e4]
signal UNARY_OP_NOT_uxn_opcodes_h_l531_c13_56e4_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l531_c13_56e4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l531_c8_64f0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l531_c8_64f0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l531_c8_64f0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l531_c8_64f0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l531_c8_64f0_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l531_c8_64f0]
signal result_stack_value_MUX_uxn_opcodes_h_l531_c8_64f0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l531_c8_64f0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l531_c8_64f0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l531_c8_64f0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l531_c8_64f0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l531_c8_64f0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l531_c8_64f0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l531_c8_64f0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l531_c8_64f0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l531_c8_64f0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c8_64f0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c8_64f0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c8_64f0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c8_64f0_return_output : unsigned(7 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l531_c8_64f0]
signal has_written_to_n_MUX_uxn_opcodes_h_l531_c8_64f0_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l531_c8_64f0_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l531_c8_64f0_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l531_c8_64f0_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l512_l518_DUPLICATE_c6e6
signal UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l512_l518_DUPLICATE_c6e6_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l512_l518_DUPLICATE_c6e6_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_17a0( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_read := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.stack_value := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.device_ram_address := ref_toks_7;
      base.is_stack_write := ref_toks_8;
      base.is_device_ram_read := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l488_c6_4fdc
BIN_OP_EQ_uxn_opcodes_h_l488_c6_4fdc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l488_c6_4fdc_left,
BIN_OP_EQ_uxn_opcodes_h_l488_c6_4fdc_right,
BIN_OP_EQ_uxn_opcodes_h_l488_c6_4fdc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_9084
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_9084 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_9084_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_9084_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_9084_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_9084_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f9d7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f9d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f9d7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output);

-- t8_MUX_uxn_opcodes_h_l488_c2_70ac
t8_MUX_uxn_opcodes_h_l488_c2_70ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l488_c2_70ac_cond,
t8_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue,
t8_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse,
t8_MUX_uxn_opcodes_h_l488_c2_70ac_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l488_c2_70ac
device_in_result_MUX_uxn_opcodes_h_l488_c2_70ac : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l488_c2_70ac_cond,
device_in_result_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue,
device_in_result_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse,
device_in_result_MUX_uxn_opcodes_h_l488_c2_70ac_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac
is_first_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l488_c2_70ac
current_dei_phase_MUX_uxn_opcodes_h_l488_c2_70ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l488_c2_70ac_cond,
current_dei_phase_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l488_c2_70ac_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l488_c2_70ac
result_is_stack_read_MUX_uxn_opcodes_h_l488_c2_70ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l488_c2_70ac_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l488_c2_70ac_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c2_70ac
result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c2_70ac : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c2_70ac_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c2_70ac_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l488_c2_70ac
result_stack_value_MUX_uxn_opcodes_h_l488_c2_70ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l488_c2_70ac_cond,
result_stack_value_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l488_c2_70ac_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l488_c2_70ac
result_is_sp_shift_MUX_uxn_opcodes_h_l488_c2_70ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l488_c2_70ac_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l488_c2_70ac_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l488_c2_70ac
result_is_opc_done_MUX_uxn_opcodes_h_l488_c2_70ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l488_c2_70ac_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l488_c2_70ac_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c2_70ac
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c2_70ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c2_70ac_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c2_70ac_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l488_c2_70ac
result_device_ram_address_MUX_uxn_opcodes_h_l488_c2_70ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l488_c2_70ac_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l488_c2_70ac_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l488_c2_70ac
result_is_stack_write_MUX_uxn_opcodes_h_l488_c2_70ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l488_c2_70ac_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l488_c2_70ac_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c2_70ac
result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c2_70ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c2_70ac_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c2_70ac_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac
is_second_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l488_c2_70ac
has_written_to_t_MUX_uxn_opcodes_h_l488_c2_70ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l488_c2_70ac_cond,
has_written_to_t_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l488_c2_70ac_return_output);

-- dei_param_MUX_uxn_opcodes_h_l488_c2_70ac
dei_param_MUX_uxn_opcodes_h_l488_c2_70ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l488_c2_70ac_cond,
dei_param_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue,
dei_param_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse,
dei_param_MUX_uxn_opcodes_h_l488_c2_70ac_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l488_c2_70ac
has_written_to_n_MUX_uxn_opcodes_h_l488_c2_70ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l488_c2_70ac_cond,
has_written_to_n_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l488_c2_70ac_return_output);

-- printf_uxn_opcodes_h_l489_c3_f538_uxn_opcodes_h_l489_c3_f538
printf_uxn_opcodes_h_l489_c3_f538_uxn_opcodes_h_l489_c3_f538 : entity work.printf_uxn_opcodes_h_l489_c3_f538_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l489_c3_f538_uxn_opcodes_h_l489_c3_f538_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l500_c11_a70b
BIN_OP_EQ_uxn_opcodes_h_l500_c11_a70b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l500_c11_a70b_left,
BIN_OP_EQ_uxn_opcodes_h_l500_c11_a70b_right,
BIN_OP_EQ_uxn_opcodes_h_l500_c11_a70b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_ff80
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_ff80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_ff80_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_ff80_return_output);

-- t8_MUX_uxn_opcodes_h_l500_c7_f9d7
t8_MUX_uxn_opcodes_h_l500_c7_f9d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l500_c7_f9d7_cond,
t8_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue,
t8_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse,
t8_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l500_c7_f9d7
device_in_result_MUX_uxn_opcodes_h_l500_c7_f9d7 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l500_c7_f9d7_cond,
device_in_result_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue,
device_in_result_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse,
device_in_result_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7
is_first_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l500_c7_f9d7
current_dei_phase_MUX_uxn_opcodes_h_l500_c7_f9d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l500_c7_f9d7_cond,
current_dei_phase_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_f9d7
result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_f9d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_f9d7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f9d7
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f9d7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f9d7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l500_c7_f9d7
result_stack_value_MUX_uxn_opcodes_h_l500_c7_f9d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l500_c7_f9d7_cond,
result_stack_value_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f9d7
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f9d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f9d7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f9d7
result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f9d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f9d7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f9d7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f9d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f9d7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f9d7
result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f9d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f9d7_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l500_c7_f9d7
result_is_stack_write_MUX_uxn_opcodes_h_l500_c7_f9d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l500_c7_f9d7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_f9d7
result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_f9d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_f9d7_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7
is_second_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l500_c7_f9d7
has_written_to_t_MUX_uxn_opcodes_h_l500_c7_f9d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l500_c7_f9d7_cond,
has_written_to_t_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output);

-- dei_param_MUX_uxn_opcodes_h_l500_c7_f9d7
dei_param_MUX_uxn_opcodes_h_l500_c7_f9d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l500_c7_f9d7_cond,
dei_param_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue,
dei_param_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse,
dei_param_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l500_c7_f9d7
has_written_to_n_MUX_uxn_opcodes_h_l500_c7_f9d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l500_c7_f9d7_cond,
has_written_to_n_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l503_c11_e623
BIN_OP_EQ_uxn_opcodes_h_l503_c11_e623 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l503_c11_e623_left,
BIN_OP_EQ_uxn_opcodes_h_l503_c11_e623_right,
BIN_OP_EQ_uxn_opcodes_h_l503_c11_e623_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l509_c1_8e6f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l509_c1_8e6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l509_c1_8e6f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l509_c1_8e6f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l509_c1_8e6f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l509_c1_8e6f_return_output);

-- t8_MUX_uxn_opcodes_h_l503_c7_ff80
t8_MUX_uxn_opcodes_h_l503_c7_ff80 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l503_c7_ff80_cond,
t8_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue,
t8_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse,
t8_MUX_uxn_opcodes_h_l503_c7_ff80_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l503_c7_ff80
device_in_result_MUX_uxn_opcodes_h_l503_c7_ff80 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l503_c7_ff80_cond,
device_in_result_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue,
device_in_result_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse,
device_in_result_MUX_uxn_opcodes_h_l503_c7_ff80_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80
is_first_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l503_c7_ff80
current_dei_phase_MUX_uxn_opcodes_h_l503_c7_ff80 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l503_c7_ff80_cond,
current_dei_phase_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l503_c7_ff80_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l503_c7_ff80
result_is_stack_read_MUX_uxn_opcodes_h_l503_c7_ff80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l503_c7_ff80_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l503_c7_ff80_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_ff80
result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_ff80 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_ff80_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_ff80_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l503_c7_ff80
result_stack_value_MUX_uxn_opcodes_h_l503_c7_ff80 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l503_c7_ff80_cond,
result_stack_value_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l503_c7_ff80_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_ff80
result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_ff80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_ff80_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_ff80_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_ff80
result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_ff80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_ff80_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_ff80_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c7_ff80
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c7_ff80 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c7_ff80_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c7_ff80_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_ff80
result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_ff80 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_ff80_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_ff80_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l503_c7_ff80
result_is_stack_write_MUX_uxn_opcodes_h_l503_c7_ff80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l503_c7_ff80_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l503_c7_ff80_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l503_c7_ff80
result_is_device_ram_read_MUX_uxn_opcodes_h_l503_c7_ff80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l503_c7_ff80_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l503_c7_ff80_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80
is_second_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l503_c7_ff80
has_written_to_t_MUX_uxn_opcodes_h_l503_c7_ff80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l503_c7_ff80_cond,
has_written_to_t_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l503_c7_ff80_return_output);

-- dei_param_MUX_uxn_opcodes_h_l503_c7_ff80
dei_param_MUX_uxn_opcodes_h_l503_c7_ff80 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l503_c7_ff80_cond,
dei_param_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue,
dei_param_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse,
dei_param_MUX_uxn_opcodes_h_l503_c7_ff80_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l503_c7_ff80
has_written_to_n_MUX_uxn_opcodes_h_l503_c7_ff80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l503_c7_ff80_cond,
has_written_to_n_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l503_c7_ff80_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l507_c32_8613
BIN_OP_AND_uxn_opcodes_h_l507_c32_8613 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l507_c32_8613_left,
BIN_OP_AND_uxn_opcodes_h_l507_c32_8613_right,
BIN_OP_AND_uxn_opcodes_h_l507_c32_8613_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l507_c32_ed00
BIN_OP_GT_uxn_opcodes_h_l507_c32_ed00 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l507_c32_ed00_left,
BIN_OP_GT_uxn_opcodes_h_l507_c32_ed00_right,
BIN_OP_GT_uxn_opcodes_h_l507_c32_ed00_return_output);

-- MUX_uxn_opcodes_h_l507_c32_457f
MUX_uxn_opcodes_h_l507_c32_457f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l507_c32_457f_cond,
MUX_uxn_opcodes_h_l507_c32_457f_iftrue,
MUX_uxn_opcodes_h_l507_c32_457f_iffalse,
MUX_uxn_opcodes_h_l507_c32_457f_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l511_c35_923b
BIN_OP_PLUS_uxn_opcodes_h_l511_c35_923b : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l511_c35_923b_left,
BIN_OP_PLUS_uxn_opcodes_h_l511_c35_923b_right,
BIN_OP_PLUS_uxn_opcodes_h_l511_c35_923b_return_output);

-- MUX_uxn_opcodes_h_l511_c15_bbdd
MUX_uxn_opcodes_h_l511_c15_bbdd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l511_c15_bbdd_cond,
MUX_uxn_opcodes_h_l511_c15_bbdd_iftrue,
MUX_uxn_opcodes_h_l511_c15_bbdd_iffalse,
MUX_uxn_opcodes_h_l511_c15_bbdd_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l512_c49_f457
UNARY_OP_NOT_uxn_opcodes_h_l512_c49_f457 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l512_c49_f457_expr,
UNARY_OP_NOT_uxn_opcodes_h_l512_c49_f457_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l512_c29_bdd8
BIN_OP_AND_uxn_opcodes_h_l512_c29_bdd8 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l512_c29_bdd8_left,
BIN_OP_AND_uxn_opcodes_h_l512_c29_bdd8_right,
BIN_OP_AND_uxn_opcodes_h_l512_c29_bdd8_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l512_c8_fd1f
BIN_OP_OR_uxn_opcodes_h_l512_c8_fd1f : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l512_c8_fd1f_left,
BIN_OP_OR_uxn_opcodes_h_l512_c8_fd1f_right,
BIN_OP_OR_uxn_opcodes_h_l512_c8_fd1f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l512_c1_0e06
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l512_c1_0e06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l512_c1_0e06_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l512_c1_0e06_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l512_c1_0e06_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l512_c1_0e06_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l512_c3_007a
device_in_result_MUX_uxn_opcodes_h_l512_c3_007a : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l512_c3_007a_cond,
device_in_result_MUX_uxn_opcodes_h_l512_c3_007a_iftrue,
device_in_result_MUX_uxn_opcodes_h_l512_c3_007a_iffalse,
device_in_result_MUX_uxn_opcodes_h_l512_c3_007a_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l512_c3_007a
is_first_dei_done_MUX_uxn_opcodes_h_l512_c3_007a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l512_c3_007a_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l512_c3_007a_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l512_c3_007a_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l512_c3_007a_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l512_c3_007a
current_dei_phase_MUX_uxn_opcodes_h_l512_c3_007a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l512_c3_007a_cond,
current_dei_phase_MUX_uxn_opcodes_h_l512_c3_007a_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l512_c3_007a_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l512_c3_007a_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l512_c3_007a
result_device_ram_address_MUX_uxn_opcodes_h_l512_c3_007a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l512_c3_007a_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l512_c3_007a_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l512_c3_007a_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l512_c3_007a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l512_c3_007a
result_stack_value_MUX_uxn_opcodes_h_l512_c3_007a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l512_c3_007a_cond,
result_stack_value_MUX_uxn_opcodes_h_l512_c3_007a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l512_c3_007a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l512_c3_007a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l512_c3_007a
result_is_stack_write_MUX_uxn_opcodes_h_l512_c3_007a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l512_c3_007a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l512_c3_007a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l512_c3_007a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l512_c3_007a_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l512_c3_007a
result_is_device_ram_read_MUX_uxn_opcodes_h_l512_c3_007a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l512_c3_007a_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l512_c3_007a_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l512_c3_007a_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l512_c3_007a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l512_c3_007a
result_is_opc_done_MUX_uxn_opcodes_h_l512_c3_007a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l512_c3_007a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l512_c3_007a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l512_c3_007a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l512_c3_007a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c3_007a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c3_007a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c3_007a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c3_007a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c3_007a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c3_007a_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l512_c3_007a
is_second_dei_done_MUX_uxn_opcodes_h_l512_c3_007a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l512_c3_007a_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l512_c3_007a_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l512_c3_007a_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l512_c3_007a_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l512_c3_007a
has_written_to_t_MUX_uxn_opcodes_h_l512_c3_007a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l512_c3_007a_cond,
has_written_to_t_MUX_uxn_opcodes_h_l512_c3_007a_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l512_c3_007a_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l512_c3_007a_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l512_c3_007a
has_written_to_n_MUX_uxn_opcodes_h_l512_c3_007a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l512_c3_007a_cond,
has_written_to_n_MUX_uxn_opcodes_h_l512_c3_007a_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l512_c3_007a_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l512_c3_007a_return_output);

-- device_in_uxn_opcodes_h_l513_c23_1a00
device_in_uxn_opcodes_h_l513_c23_1a00 : entity work.device_in_0CLK_5af1a430 port map (
clk,
device_in_uxn_opcodes_h_l513_c23_1a00_CLOCK_ENABLE,
device_in_uxn_opcodes_h_l513_c23_1a00_device_address,
device_in_uxn_opcodes_h_l513_c23_1a00_phase,
device_in_uxn_opcodes_h_l513_c23_1a00_previous_device_ram_read,
device_in_uxn_opcodes_h_l513_c23_1a00_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l517_c4_b0da
BIN_OP_PLUS_uxn_opcodes_h_l517_c4_b0da : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l517_c4_b0da_left,
BIN_OP_PLUS_uxn_opcodes_h_l517_c4_b0da_right,
BIN_OP_PLUS_uxn_opcodes_h_l517_c4_b0da_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l518_c9_9baf
BIN_OP_AND_uxn_opcodes_h_l518_c9_9baf : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l518_c9_9baf_left,
BIN_OP_AND_uxn_opcodes_h_l518_c9_9baf_right,
BIN_OP_AND_uxn_opcodes_h_l518_c9_9baf_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l518_c4_7119
is_first_dei_done_MUX_uxn_opcodes_h_l518_c4_7119 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l518_c4_7119_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l518_c4_7119_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l518_c4_7119_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l518_c4_7119_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l518_c4_7119
is_second_dei_done_MUX_uxn_opcodes_h_l518_c4_7119 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l518_c4_7119_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l518_c4_7119_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l518_c4_7119_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l518_c4_7119_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l520_c11_f4ba
is_second_dei_done_MUX_uxn_opcodes_h_l520_c11_f4ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l520_c11_f4ba_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l520_c11_f4ba_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l520_c11_f4ba_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l520_c11_f4ba_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l524_c13_052d
UNARY_OP_NOT_uxn_opcodes_h_l524_c13_052d : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l524_c13_052d_expr,
UNARY_OP_NOT_uxn_opcodes_h_l524_c13_052d_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l524_c8_0f19
current_dei_phase_MUX_uxn_opcodes_h_l524_c8_0f19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l524_c8_0f19_cond,
current_dei_phase_MUX_uxn_opcodes_h_l524_c8_0f19_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l524_c8_0f19_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l524_c8_0f19_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l524_c8_0f19
result_is_stack_write_MUX_uxn_opcodes_h_l524_c8_0f19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l524_c8_0f19_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l524_c8_0f19_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l524_c8_0f19_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l524_c8_0f19_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l524_c8_0f19
result_stack_value_MUX_uxn_opcodes_h_l524_c8_0f19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l524_c8_0f19_cond,
result_stack_value_MUX_uxn_opcodes_h_l524_c8_0f19_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l524_c8_0f19_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l524_c8_0f19_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l524_c8_0f19
result_is_opc_done_MUX_uxn_opcodes_h_l524_c8_0f19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l524_c8_0f19_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l524_c8_0f19_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l524_c8_0f19_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l524_c8_0f19_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l524_c8_0f19
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l524_c8_0f19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l524_c8_0f19_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l524_c8_0f19_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l524_c8_0f19_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l524_c8_0f19_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l524_c8_0f19
has_written_to_t_MUX_uxn_opcodes_h_l524_c8_0f19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l524_c8_0f19_cond,
has_written_to_t_MUX_uxn_opcodes_h_l524_c8_0f19_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l524_c8_0f19_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l524_c8_0f19_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l524_c8_0f19
has_written_to_n_MUX_uxn_opcodes_h_l524_c8_0f19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l524_c8_0f19_cond,
has_written_to_n_MUX_uxn_opcodes_h_l524_c8_0f19_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l524_c8_0f19_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l524_c8_0f19_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l531_c13_56e4
UNARY_OP_NOT_uxn_opcodes_h_l531_c13_56e4 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l531_c13_56e4_expr,
UNARY_OP_NOT_uxn_opcodes_h_l531_c13_56e4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l531_c8_64f0
result_is_stack_write_MUX_uxn_opcodes_h_l531_c8_64f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l531_c8_64f0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l531_c8_64f0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l531_c8_64f0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l531_c8_64f0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l531_c8_64f0
result_stack_value_MUX_uxn_opcodes_h_l531_c8_64f0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l531_c8_64f0_cond,
result_stack_value_MUX_uxn_opcodes_h_l531_c8_64f0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l531_c8_64f0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l531_c8_64f0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l531_c8_64f0
result_is_opc_done_MUX_uxn_opcodes_h_l531_c8_64f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l531_c8_64f0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l531_c8_64f0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l531_c8_64f0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l531_c8_64f0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c8_64f0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c8_64f0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c8_64f0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c8_64f0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c8_64f0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c8_64f0_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l531_c8_64f0
has_written_to_n_MUX_uxn_opcodes_h_l531_c8_64f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l531_c8_64f0_cond,
has_written_to_n_MUX_uxn_opcodes_h_l531_c8_64f0_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l531_c8_64f0_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l531_c8_64f0_return_output);

-- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l512_l518_DUPLICATE_c6e6
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l512_l518_DUPLICATE_c6e6 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l512_l518_DUPLICATE_c6e6_expr,
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l512_l518_DUPLICATE_c6e6_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l488_c6_4fdc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_9084_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output,
 t8_MUX_uxn_opcodes_h_l488_c2_70ac_return_output,
 device_in_result_MUX_uxn_opcodes_h_l488_c2_70ac_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l488_c2_70ac_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l488_c2_70ac_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c2_70ac_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l488_c2_70ac_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l488_c2_70ac_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l488_c2_70ac_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c2_70ac_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l488_c2_70ac_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l488_c2_70ac_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c2_70ac_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l488_c2_70ac_return_output,
 dei_param_MUX_uxn_opcodes_h_l488_c2_70ac_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l488_c2_70ac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l500_c11_a70b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_ff80_return_output,
 t8_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output,
 device_in_result_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output,
 dei_param_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l503_c11_e623_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l509_c1_8e6f_return_output,
 t8_MUX_uxn_opcodes_h_l503_c7_ff80_return_output,
 device_in_result_MUX_uxn_opcodes_h_l503_c7_ff80_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l503_c7_ff80_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l503_c7_ff80_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_ff80_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l503_c7_ff80_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_ff80_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_ff80_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c7_ff80_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_ff80_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l503_c7_ff80_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l503_c7_ff80_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l503_c7_ff80_return_output,
 dei_param_MUX_uxn_opcodes_h_l503_c7_ff80_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l503_c7_ff80_return_output,
 BIN_OP_AND_uxn_opcodes_h_l507_c32_8613_return_output,
 BIN_OP_GT_uxn_opcodes_h_l507_c32_ed00_return_output,
 MUX_uxn_opcodes_h_l507_c32_457f_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l511_c35_923b_return_output,
 MUX_uxn_opcodes_h_l511_c15_bbdd_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l512_c49_f457_return_output,
 BIN_OP_AND_uxn_opcodes_h_l512_c29_bdd8_return_output,
 BIN_OP_OR_uxn_opcodes_h_l512_c8_fd1f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l512_c1_0e06_return_output,
 device_in_result_MUX_uxn_opcodes_h_l512_c3_007a_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l512_c3_007a_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l512_c3_007a_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l512_c3_007a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l512_c3_007a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l512_c3_007a_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l512_c3_007a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l512_c3_007a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c3_007a_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l512_c3_007a_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l512_c3_007a_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l512_c3_007a_return_output,
 device_in_uxn_opcodes_h_l513_c23_1a00_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l517_c4_b0da_return_output,
 BIN_OP_AND_uxn_opcodes_h_l518_c9_9baf_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l518_c4_7119_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l518_c4_7119_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l520_c11_f4ba_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l524_c13_052d_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l524_c8_0f19_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l524_c8_0f19_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l524_c8_0f19_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l524_c8_0f19_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l524_c8_0f19_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l524_c8_0f19_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l524_c8_0f19_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l531_c13_56e4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l531_c8_64f0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l531_c8_64f0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l531_c8_64f0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c8_64f0_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l531_c8_64f0_return_output,
 UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l512_l518_DUPLICATE_c6e6_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c6_4fdc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c6_4fdc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c6_4fdc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_9084_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_9084_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_9084_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_9084_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f9d7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l488_c2_70ac_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l488_c2_70ac_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue : device_in_result_t;
 variable VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l488_c2_70ac_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l488_c2_70ac_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l488_c2_70ac_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l494_c3_7dd4 : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c2_70ac_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c2_70ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l488_c2_70ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l488_c2_70ac_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c2_70ac_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c2_70ac_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l488_c2_70ac_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l488_c2_70ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l488_c2_70ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l488_c2_70ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c2_70ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c2_70ac_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l496_c3_f2bc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c2_70ac_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c2_70ac_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c2_70ac_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c2_70ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c2_70ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c2_70ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c2_70ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c2_70ac_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c2_70ac_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c2_70ac_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l488_c2_70ac_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l488_c2_70ac_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c2_70ac_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c2_70ac_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l489_c3_f538_uxn_opcodes_h_l489_c3_f538_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_a70b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_a70b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_a70b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_ff80_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_ff80_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l503_c7_ff80_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l500_c7_f9d7_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l503_c7_ff80_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l500_c7_f9d7_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l503_c7_ff80_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l500_c7_f9d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l503_c7_ff80_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_f9d7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_ff80_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f9d7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l503_c7_ff80_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l500_c7_f9d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_ff80_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f9d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_ff80_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f9d7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l501_c3_c769 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c7_ff80_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f9d7_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_ff80_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f9d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l503_c7_ff80_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l500_c7_f9d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l503_c7_ff80_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_f9d7_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l503_c7_ff80_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l500_c7_f9d7_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l503_c7_ff80_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l500_c7_f9d7_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l503_c7_ff80_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l500_c7_f9d7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_e623_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_e623_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_e623_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l509_c1_8e6f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l509_c1_8e6f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l509_c1_8e6f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l509_c1_8e6f_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l503_c7_ff80_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l512_c3_007a_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l503_c7_ff80_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l512_c3_007a_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l512_c3_007a_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l503_c7_ff80_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l503_c7_ff80_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_ff80_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l512_c3_007a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l503_c7_ff80_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_ff80_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l512_c3_007a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_ff80_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c3_007a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c7_ff80_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l512_c3_007a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_ff80_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l512_c3_007a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l503_c7_ff80_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l512_c3_007a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l503_c7_ff80_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l512_c3_007a_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l512_c3_007a_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l503_c7_ff80_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l503_c7_ff80_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l512_c3_007a_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l503_c7_ff80_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l507_c32_457f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l507_c32_457f_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l507_c32_457f_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l507_c32_8613_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l507_c32_8613_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l507_c32_8613_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l507_c32_ed00_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l507_c32_ed00_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l507_c32_ed00_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l507_c32_457f_return_output : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l511_c15_bbdd_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l511_c15_bbdd_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l511_c15_bbdd_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l511_c35_923b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l511_c35_923b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l511_c35_923b_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l511_c15_bbdd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l512_c8_fd1f_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l512_c29_bdd8_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l512_c49_f457_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l512_c49_f457_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l512_c29_bdd8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l512_c29_bdd8_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l512_c8_fd1f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l512_c8_fd1f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l512_c1_0e06_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l512_c1_0e06_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l512_c1_0e06_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l512_c1_0e06_iffalse : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l512_c3_007a_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l512_c3_007a_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l512_c3_007a_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l512_c3_007a_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l518_c4_7119_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l512_c3_007a_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l512_c3_007a_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l512_c3_007a_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l517_c4_cc22 : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l512_c3_007a_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l524_c8_0f19_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l512_c3_007a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l512_c3_007a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l512_c3_007a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l512_c3_007a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l512_c3_007a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l512_c3_007a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l524_c8_0f19_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l512_c3_007a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l512_c3_007a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l512_c3_007a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l524_c8_0f19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l512_c3_007a_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l512_c3_007a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l512_c3_007a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l512_c3_007a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l512_c3_007a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l512_c3_007a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l524_c8_0f19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l512_c3_007a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c3_007a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c3_007a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l524_c8_0f19_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c3_007a_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l512_c3_007a_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l518_c4_7119_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l512_c3_007a_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l512_c3_007a_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l512_c3_007a_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l512_c3_007a_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l524_c8_0f19_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l512_c3_007a_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l512_c3_007a_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l512_c3_007a_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l524_c8_0f19_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l512_c3_007a_cond : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l513_c23_1a00_device_address : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l513_c23_1a00_phase : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l513_c23_1a00_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l513_c23_1a00_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l513_c23_1a00_return_output : device_in_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l514_c32_15fa_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l515_c32_d5b3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l517_c4_b0da_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l517_c4_b0da_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l517_c4_b0da_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l518_c9_9baf_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l518_c9_9baf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l518_c9_9baf_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l518_c4_7119_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l518_c4_7119_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l518_c4_7119_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l518_c4_7119_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l518_c4_7119_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l520_c11_f4ba_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l518_c4_7119_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l520_c11_f4ba_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l520_c11_f4ba_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l520_c11_f4ba_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l524_c13_052d_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l524_c13_052d_return_output : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l524_c8_0f19_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l525_c4_faf2 : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l524_c8_0f19_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l524_c8_0f19_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l524_c8_0f19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l524_c8_0f19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l531_c8_64f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l524_c8_0f19_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l524_c8_0f19_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l524_c8_0f19_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l531_c8_64f0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l524_c8_0f19_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l524_c8_0f19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l524_c8_0f19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l531_c8_64f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l524_c8_0f19_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l524_c8_0f19_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l527_c4_be96 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l524_c8_0f19_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c8_64f0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l524_c8_0f19_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l524_c8_0f19_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l524_c8_0f19_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l524_c8_0f19_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l524_c8_0f19_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l524_c8_0f19_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l531_c8_64f0_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l524_c8_0f19_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l531_c13_56e4_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l531_c13_56e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l531_c8_64f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l531_c8_64f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l531_c8_64f0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l531_c8_64f0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l531_c8_64f0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l531_c8_64f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l531_c8_64f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l531_c8_64f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l531_c8_64f0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c8_64f0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l533_c4_47a4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c8_64f0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c8_64f0_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l531_c8_64f0_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l531_c8_64f0_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l531_c8_64f0_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l488_l500_l503_DUPLICATE_0689_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l512_l503_l500_l488_l531_DUPLICATE_8cd5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l488_l500_DUPLICATE_a8db_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l488_l512_l500_l503_DUPLICATE_0c09_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l488_l500_l503_DUPLICATE_5696_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l488_l512_l500_l503_DUPLICATE_1102_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l500_l503_DUPLICATE_aec7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l524_l512_l503_l500_l531_DUPLICATE_1df4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l512_l503_l531_DUPLICATE_0a4b_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l512_l518_DUPLICATE_c6e6_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l512_l518_DUPLICATE_c6e6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l518_l520_DUPLICATE_62ec_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l528_l534_DUPLICATE_89d2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_17a0_uxn_opcodes_h_l482_l543_DUPLICATE_7ceb_return_output : opcode_result_t;
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
     VAR_BIN_OP_GT_uxn_opcodes_h_l507_c32_ed00_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l524_c8_0f19_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_9084_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l531_c8_64f0_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue := to_unsigned(0, 1);
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue := to_unsigned(0, 1);
     VAR_current_dei_phase_uxn_opcodes_h_l525_c4_faf2 := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l524_c8_0f19_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l525_c4_faf2;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l512_c3_007a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l517_c4_b0da_right := to_unsigned(1, 1);
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue := to_unsigned(0, 1);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l524_c8_0f19_iftrue := to_unsigned(1, 1);
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l520_c11_f4ba_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l501_c3_c769 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l501_c3_c769;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l531_c8_64f0_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l512_c1_0e06_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l533_c4_47a4 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c8_64f0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l533_c4_47a4;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l531_c8_64f0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l511_c35_923b_right := to_unsigned(1, 1);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l507_c32_457f_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l527_c4_be96 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l524_c8_0f19_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l527_c4_be96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_e623_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l507_c32_8613_right := to_unsigned(128, 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue := to_unsigned(1, 1);
     VAR_current_dei_phase_uxn_opcodes_h_l494_c3_7dd4 := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l494_c3_7dd4;
     VAR_MUX_uxn_opcodes_h_l507_c32_457f_iffalse := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_a70b_right := to_unsigned(1, 1);
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l518_c4_7119_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l496_c3_f2bc := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l496_c3_f2bc;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l509_c1_8e6f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c6_4fdc_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l531_c8_64f0_iffalse := to_unsigned(1, 1);
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_9084_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l517_c4_b0da_left := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l524_c8_0f19_iffalse := current_dei_phase;
     VAR_device_in_uxn_opcodes_h_l513_c23_1a00_phase := current_dei_phase;
     VAR_dei_param_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue := dei_param;
     VAR_dei_param_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue := dei_param;
     VAR_dei_param_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue := dei_param;
     VAR_device_in_result_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l512_c3_007a_iffalse := device_in_result;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l531_c13_56e4_expr := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l512_c3_007a_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l524_c8_0f19_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l531_c8_64f0_iffalse := has_written_to_n;
     VAR_BIN_OP_AND_uxn_opcodes_h_l512_c29_bdd8_left := has_written_to_t;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l524_c13_052d_expr := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l512_c3_007a_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l524_c8_0f19_iffalse := has_written_to_t;
     VAR_BIN_OP_AND_uxn_opcodes_h_l507_c32_8613_left := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l511_c15_bbdd_cond := is_first_dei_done;
     VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l512_l518_DUPLICATE_c6e6_expr := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l512_c3_007a_iffalse := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l518_c4_7119_iffalse := is_first_dei_done;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l512_c49_f457_expr := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l512_c3_007a_iffalse := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l518_c4_7119_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l520_c11_f4ba_iffalse := is_second_dei_done;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c6_4fdc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_a70b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_e623_left := VAR_phase;
     VAR_device_in_uxn_opcodes_h_l513_c23_1a00_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l511_c35_923b_left := t8;
     VAR_MUX_uxn_opcodes_h_l511_c15_bbdd_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l488_l500_DUPLICATE_a8db LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l488_l500_DUPLICATE_a8db_return_output := result.is_sp_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l507_c32_8613] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l507_c32_8613_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l507_c32_8613_left;
     BIN_OP_AND_uxn_opcodes_h_l507_c32_8613_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l507_c32_8613_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l507_c32_8613_return_output := BIN_OP_AND_uxn_opcodes_h_l507_c32_8613_return_output;

     -- CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l528_l534_DUPLICATE_89d2 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l528_l534_DUPLICATE_89d2_return_output := device_in_result.dei_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l524_l512_l503_l500_l531_DUPLICATE_1df4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l524_l512_l503_l500_l531_DUPLICATE_1df4_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l500_l503_DUPLICATE_aec7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l500_l503_DUPLICATE_aec7_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l488_l500_l503_DUPLICATE_5696 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l488_l500_l503_DUPLICATE_5696_return_output := result.is_stack_write;

     -- device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6[uxn_opcodes_h_l488_c2_70ac] LATENCY=0
     VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l488_c2_70ac_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6(
     device_in_result,
     to_unsigned(0, 1));

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l512_l503_l531_DUPLICATE_0a4b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l512_l503_l531_DUPLICATE_0a4b_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l512_l503_l500_l488_l531_DUPLICATE_8cd5 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l512_l503_l500_l488_l531_DUPLICATE_8cd5_return_output := result.stack_value;

     -- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l512_l518_DUPLICATE_c6e6 LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l512_l518_DUPLICATE_c6e6_expr <= VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l512_l518_DUPLICATE_c6e6_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l512_l518_DUPLICATE_c6e6_return_output := UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l512_l518_DUPLICATE_c6e6_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l531_c13_56e4] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l531_c13_56e4_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l531_c13_56e4_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l531_c13_56e4_return_output := UNARY_OP_NOT_uxn_opcodes_h_l531_c13_56e4_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l488_l500_l503_DUPLICATE_0689 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l488_l500_l503_DUPLICATE_0689_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l503_c11_e623] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l503_c11_e623_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_e623_left;
     BIN_OP_EQ_uxn_opcodes_h_l503_c11_e623_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_e623_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_e623_return_output := BIN_OP_EQ_uxn_opcodes_h_l503_c11_e623_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l488_l512_l500_l503_DUPLICATE_0c09 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l488_l512_l500_l503_DUPLICATE_0c09_return_output := result.device_ram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l488_l512_l500_l503_DUPLICATE_1102 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l488_l512_l500_l503_DUPLICATE_1102_return_output := result.is_device_ram_read;

     -- BIN_OP_PLUS[uxn_opcodes_h_l511_c35_923b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l511_c35_923b_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l511_c35_923b_left;
     BIN_OP_PLUS_uxn_opcodes_h_l511_c35_923b_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l511_c35_923b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l511_c35_923b_return_output := BIN_OP_PLUS_uxn_opcodes_h_l511_c35_923b_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l512_c49_f457] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l512_c49_f457_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l512_c49_f457_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l512_c49_f457_return_output := UNARY_OP_NOT_uxn_opcodes_h_l512_c49_f457_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l500_c11_a70b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l500_c11_a70b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_a70b_left;
     BIN_OP_EQ_uxn_opcodes_h_l500_c11_a70b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_a70b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_a70b_return_output := BIN_OP_EQ_uxn_opcodes_h_l500_c11_a70b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l488_c6_4fdc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l488_c6_4fdc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c6_4fdc_left;
     BIN_OP_EQ_uxn_opcodes_h_l488_c6_4fdc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c6_4fdc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c6_4fdc_return_output := BIN_OP_EQ_uxn_opcodes_h_l488_c6_4fdc_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l517_c4_b0da] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l517_c4_b0da_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l517_c4_b0da_left;
     BIN_OP_PLUS_uxn_opcodes_h_l517_c4_b0da_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l517_c4_b0da_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l517_c4_b0da_return_output := BIN_OP_PLUS_uxn_opcodes_h_l517_c4_b0da_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l524_c13_052d] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l524_c13_052d_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l524_c13_052d_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l524_c13_052d_return_output := UNARY_OP_NOT_uxn_opcodes_h_l524_c13_052d_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l507_c32_ed00_left := VAR_BIN_OP_AND_uxn_opcodes_h_l507_c32_8613_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f9d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c6_4fdc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_9084_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c6_4fdc_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c2_70ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c6_4fdc_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l488_c2_70ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c6_4fdc_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l488_c2_70ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c6_4fdc_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c2_70ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c6_4fdc_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c2_70ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c6_4fdc_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c6_4fdc_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c6_4fdc_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c2_70ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c6_4fdc_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c2_70ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c6_4fdc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c2_70ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c6_4fdc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l488_c2_70ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c6_4fdc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l488_c2_70ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c6_4fdc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c2_70ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c6_4fdc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c2_70ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c6_4fdc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c2_70ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c6_4fdc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l488_c2_70ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c6_4fdc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l488_c2_70ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l488_c6_4fdc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_ff80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_a70b_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l500_c7_f9d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_a70b_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l500_c7_f9d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_a70b_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l500_c7_f9d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_a70b_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l500_c7_f9d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_a70b_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l500_c7_f9d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_a70b_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_a70b_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_a70b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f9d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_a70b_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_f9d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_a70b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f9d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_a70b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f9d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_a70b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_f9d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_a70b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l500_c7_f9d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_a70b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f9d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_a70b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f9d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_a70b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l500_c7_f9d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_a70b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l500_c7_f9d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_a70b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l509_c1_8e6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_e623_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l503_c7_ff80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_e623_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l503_c7_ff80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_e623_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l503_c7_ff80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_e623_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l503_c7_ff80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_e623_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l503_c7_ff80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_e623_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_e623_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_e623_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_ff80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_e623_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l503_c7_ff80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_e623_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_ff80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_e623_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_ff80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_e623_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l503_c7_ff80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_e623_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l503_c7_ff80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_e623_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_ff80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_e623_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c7_ff80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_e623_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l503_c7_ff80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_e623_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l503_c7_ff80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_e623_return_output;
     VAR_MUX_uxn_opcodes_h_l511_c15_bbdd_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l511_c35_923b_return_output, 8);
     VAR_current_dei_phase_uxn_opcodes_h_l517_c4_cc22 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l517_c4_b0da_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l488_l500_l503_DUPLICATE_0689_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l488_l500_l503_DUPLICATE_0689_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l488_l500_l503_DUPLICATE_0689_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l488_l512_l500_l503_DUPLICATE_1102_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l488_l512_l500_l503_DUPLICATE_1102_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l488_l512_l500_l503_DUPLICATE_1102_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l512_c3_007a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l488_l512_l500_l503_DUPLICATE_1102_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l524_l512_l503_l500_l531_DUPLICATE_1df4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l524_l512_l503_l500_l531_DUPLICATE_1df4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l512_c3_007a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l524_l512_l503_l500_l531_DUPLICATE_1df4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l524_c8_0f19_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l524_l512_l503_l500_l531_DUPLICATE_1df4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l531_c8_64f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l524_l512_l503_l500_l531_DUPLICATE_1df4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l488_l500_DUPLICATE_a8db_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l488_l500_DUPLICATE_a8db_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l500_l503_DUPLICATE_aec7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l500_l503_DUPLICATE_aec7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l488_l500_l503_DUPLICATE_5696_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l488_l500_l503_DUPLICATE_5696_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l488_l500_l503_DUPLICATE_5696_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l524_c8_0f19_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l528_l534_DUPLICATE_89d2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l531_c8_64f0_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l528_l534_DUPLICATE_89d2_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l488_l512_l500_l503_DUPLICATE_0c09_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l488_l512_l500_l503_DUPLICATE_0c09_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l488_l512_l500_l503_DUPLICATE_0c09_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l512_c3_007a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l488_l512_l500_l503_DUPLICATE_0c09_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l512_l503_l531_DUPLICATE_0a4b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c3_007a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l512_l503_l531_DUPLICATE_0a4b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c8_64f0_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l512_l503_l531_DUPLICATE_0a4b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l512_l503_l500_l488_l531_DUPLICATE_8cd5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l512_l503_l500_l488_l531_DUPLICATE_8cd5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l512_l503_l500_l488_l531_DUPLICATE_8cd5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l512_c3_007a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l512_l503_l500_l488_l531_DUPLICATE_8cd5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l531_c8_64f0_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l512_l503_l500_l488_l531_DUPLICATE_8cd5_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l512_c29_bdd8_right := VAR_UNARY_OP_NOT_uxn_opcodes_h_l512_c49_f457_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l524_c8_0f19_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l524_c13_052d_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l524_c8_0f19_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l524_c13_052d_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l524_c8_0f19_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l524_c13_052d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l524_c8_0f19_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l524_c13_052d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l524_c8_0f19_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l524_c13_052d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l524_c8_0f19_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l524_c13_052d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l524_c8_0f19_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l524_c13_052d_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l531_c8_64f0_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l531_c13_56e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l531_c8_64f0_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l531_c13_56e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l531_c8_64f0_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l531_c13_56e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c8_64f0_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l531_c13_56e4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l531_c8_64f0_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l531_c13_56e4_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l518_c9_9baf_left := VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l512_l518_DUPLICATE_c6e6_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l512_c8_fd1f_left := VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l512_l518_DUPLICATE_c6e6_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue := VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l488_c2_70ac_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l512_c3_007a_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l517_c4_cc22;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l503_c7_ff80] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l503_c7_ff80_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l503_c7_ff80_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l503_c7_ff80_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l503_c7_ff80_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l531_c8_64f0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l531_c8_64f0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l531_c8_64f0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l531_c8_64f0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l531_c8_64f0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l531_c8_64f0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l531_c8_64f0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l531_c8_64f0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l531_c8_64f0_return_output;

     -- t8_MUX[uxn_opcodes_h_l503_c7_ff80] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l503_c7_ff80_cond <= VAR_t8_MUX_uxn_opcodes_h_l503_c7_ff80_cond;
     t8_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue;
     t8_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l503_c7_ff80_return_output := t8_MUX_uxn_opcodes_h_l503_c7_ff80_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l512_c29_bdd8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l512_c29_bdd8_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l512_c29_bdd8_left;
     BIN_OP_AND_uxn_opcodes_h_l512_c29_bdd8_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l512_c29_bdd8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l512_c29_bdd8_return_output := BIN_OP_AND_uxn_opcodes_h_l512_c29_bdd8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l503_c7_ff80] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_ff80_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_ff80_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_ff80_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_ff80_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l531_c8_64f0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l531_c8_64f0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l531_c8_64f0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l531_c8_64f0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l531_c8_64f0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l531_c8_64f0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l531_c8_64f0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l531_c8_64f0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l531_c8_64f0_return_output;

     -- MUX[uxn_opcodes_h_l511_c15_bbdd] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l511_c15_bbdd_cond <= VAR_MUX_uxn_opcodes_h_l511_c15_bbdd_cond;
     MUX_uxn_opcodes_h_l511_c15_bbdd_iftrue <= VAR_MUX_uxn_opcodes_h_l511_c15_bbdd_iftrue;
     MUX_uxn_opcodes_h_l511_c15_bbdd_iffalse <= VAR_MUX_uxn_opcodes_h_l511_c15_bbdd_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l511_c15_bbdd_return_output := MUX_uxn_opcodes_h_l511_c15_bbdd_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l531_c8_64f0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l531_c8_64f0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l531_c8_64f0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l531_c8_64f0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l531_c8_64f0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l531_c8_64f0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l531_c8_64f0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l531_c8_64f0_return_output := result_stack_value_MUX_uxn_opcodes_h_l531_c8_64f0_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l531_c8_64f0] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l531_c8_64f0_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l531_c8_64f0_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l531_c8_64f0_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l531_c8_64f0_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l531_c8_64f0_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l531_c8_64f0_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l531_c8_64f0_return_output := has_written_to_n_MUX_uxn_opcodes_h_l531_c8_64f0_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l524_c8_0f19] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l524_c8_0f19_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l524_c8_0f19_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l524_c8_0f19_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l524_c8_0f19_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l524_c8_0f19_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l524_c8_0f19_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l524_c8_0f19_return_output := current_dei_phase_MUX_uxn_opcodes_h_l524_c8_0f19_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l524_c8_0f19] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l524_c8_0f19_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l524_c8_0f19_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l524_c8_0f19_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l524_c8_0f19_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l524_c8_0f19_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l524_c8_0f19_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l524_c8_0f19_return_output := has_written_to_t_MUX_uxn_opcodes_h_l524_c8_0f19_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l507_c32_ed00] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l507_c32_ed00_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l507_c32_ed00_left;
     BIN_OP_GT_uxn_opcodes_h_l507_c32_ed00_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l507_c32_ed00_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l507_c32_ed00_return_output := BIN_OP_GT_uxn_opcodes_h_l507_c32_ed00_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l531_c8_64f0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c8_64f0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c8_64f0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c8_64f0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c8_64f0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c8_64f0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c8_64f0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c8_64f0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c8_64f0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l488_c1_9084] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_9084_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_9084_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_9084_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_9084_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_9084_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_9084_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_9084_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_9084_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l500_c7_f9d7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f9d7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f9d7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_opcodes_h_l512_c8_fd1f_right := VAR_BIN_OP_AND_uxn_opcodes_h_l512_c29_bdd8_return_output;
     VAR_MUX_uxn_opcodes_h_l507_c32_457f_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l507_c32_ed00_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse := VAR_MUX_uxn_opcodes_h_l511_c15_bbdd_return_output;
     VAR_device_in_uxn_opcodes_h_l513_c23_1a00_device_address := VAR_MUX_uxn_opcodes_h_l511_c15_bbdd_return_output;
     VAR_printf_uxn_opcodes_h_l489_c3_f538_uxn_opcodes_h_l489_c3_f538_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_9084_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l512_c3_007a_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l524_c8_0f19_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l524_c8_0f19_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l531_c8_64f0_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l512_c3_007a_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l524_c8_0f19_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l524_c8_0f19_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l531_c8_64f0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_ff80_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l503_c7_ff80_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l524_c8_0f19_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l531_c8_64f0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l524_c8_0f19_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c8_64f0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l524_c8_0f19_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l531_c8_64f0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse := VAR_t8_MUX_uxn_opcodes_h_l503_c7_ff80_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l500_c7_f9d7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f9d7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f9d7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l503_c7_ff80] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_ff80_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_ff80_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_ff80_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_ff80_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l512_c8_fd1f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l512_c8_fd1f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l512_c8_fd1f_left;
     BIN_OP_OR_uxn_opcodes_h_l512_c8_fd1f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l512_c8_fd1f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l512_c8_fd1f_return_output := BIN_OP_OR_uxn_opcodes_h_l512_c8_fd1f_return_output;

     -- printf_uxn_opcodes_h_l489_c3_f538[uxn_opcodes_h_l489_c3_f538] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l489_c3_f538_uxn_opcodes_h_l489_c3_f538_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l489_c3_f538_uxn_opcodes_h_l489_c3_f538_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- has_written_to_n_MUX[uxn_opcodes_h_l524_c8_0f19] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l524_c8_0f19_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l524_c8_0f19_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l524_c8_0f19_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l524_c8_0f19_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l524_c8_0f19_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l524_c8_0f19_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l524_c8_0f19_return_output := has_written_to_n_MUX_uxn_opcodes_h_l524_c8_0f19_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l524_c8_0f19] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l524_c8_0f19_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l524_c8_0f19_cond;
     result_stack_value_MUX_uxn_opcodes_h_l524_c8_0f19_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l524_c8_0f19_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l524_c8_0f19_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l524_c8_0f19_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l524_c8_0f19_return_output := result_stack_value_MUX_uxn_opcodes_h_l524_c8_0f19_return_output;

     -- t8_MUX[uxn_opcodes_h_l500_c7_f9d7] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l500_c7_f9d7_cond <= VAR_t8_MUX_uxn_opcodes_h_l500_c7_f9d7_cond;
     t8_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue;
     t8_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output := t8_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output;

     -- MUX[uxn_opcodes_h_l507_c32_457f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l507_c32_457f_cond <= VAR_MUX_uxn_opcodes_h_l507_c32_457f_cond;
     MUX_uxn_opcodes_h_l507_c32_457f_iftrue <= VAR_MUX_uxn_opcodes_h_l507_c32_457f_iftrue;
     MUX_uxn_opcodes_h_l507_c32_457f_iffalse <= VAR_MUX_uxn_opcodes_h_l507_c32_457f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l507_c32_457f_return_output := MUX_uxn_opcodes_h_l507_c32_457f_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l503_c7_ff80] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l503_c7_ff80_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l503_c7_ff80_cond;
     dei_param_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue;
     dei_param_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l503_c7_ff80_return_output := dei_param_MUX_uxn_opcodes_h_l503_c7_ff80_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l500_c7_f9d7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_f9d7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_f9d7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l524_c8_0f19] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l524_c8_0f19_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l524_c8_0f19_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l524_c8_0f19_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l524_c8_0f19_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l524_c8_0f19_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l524_c8_0f19_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l524_c8_0f19_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l524_c8_0f19_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l524_c8_0f19] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l524_c8_0f19_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l524_c8_0f19_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l524_c8_0f19_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l524_c8_0f19_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l524_c8_0f19_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l524_c8_0f19_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l524_c8_0f19_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l524_c8_0f19_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l524_c8_0f19] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l524_c8_0f19_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l524_c8_0f19_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l524_c8_0f19_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l524_c8_0f19_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l524_c8_0f19_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l524_c8_0f19_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l524_c8_0f19_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l524_c8_0f19_return_output;

     -- Submodule level 3
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l512_c1_0e06_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l512_c8_fd1f_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l512_c3_007a_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l512_c8_fd1f_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l512_c3_007a_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l512_c8_fd1f_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l512_c3_007a_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l512_c8_fd1f_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l512_c3_007a_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l512_c8_fd1f_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l512_c3_007a_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l512_c8_fd1f_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l512_c3_007a_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l512_c8_fd1f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l512_c3_007a_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l512_c8_fd1f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l512_c3_007a_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l512_c8_fd1f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l512_c3_007a_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l512_c8_fd1f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l512_c3_007a_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l512_c8_fd1f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c3_007a_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l512_c8_fd1f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l512_c3_007a_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l512_c8_fd1f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l509_c1_8e6f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_ff80_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue := VAR_MUX_uxn_opcodes_h_l507_c32_457f_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse := VAR_dei_param_MUX_uxn_opcodes_h_l503_c7_ff80_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l512_c3_007a_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l524_c8_0f19_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l512_c3_007a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l524_c8_0f19_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l512_c3_007a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l524_c8_0f19_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c3_007a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l524_c8_0f19_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l512_c3_007a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l524_c8_0f19_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse := VAR_t8_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output;
     -- dei_param_MUX[uxn_opcodes_h_l500_c7_f9d7] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l500_c7_f9d7_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l500_c7_f9d7_cond;
     dei_param_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue;
     dei_param_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output := dei_param_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l512_c3_007a] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l512_c3_007a_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l512_c3_007a_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l512_c3_007a_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l512_c3_007a_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l512_c3_007a_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l512_c3_007a_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l512_c3_007a_return_output := has_written_to_t_MUX_uxn_opcodes_h_l512_c3_007a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l503_c7_ff80] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_ff80_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_ff80_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_ff80_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_ff80_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l509_c1_8e6f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l509_c1_8e6f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l509_c1_8e6f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l509_c1_8e6f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l509_c1_8e6f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l509_c1_8e6f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l509_c1_8e6f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l509_c1_8e6f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l509_c1_8e6f_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l512_c3_007a] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l512_c3_007a_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l512_c3_007a_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l512_c3_007a_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l512_c3_007a_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l512_c3_007a_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l512_c3_007a_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l512_c3_007a_return_output := has_written_to_n_MUX_uxn_opcodes_h_l512_c3_007a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l512_c3_007a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l512_c3_007a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l512_c3_007a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l512_c3_007a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l512_c3_007a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l512_c3_007a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l512_c3_007a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l512_c3_007a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l512_c3_007a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l488_c2_70ac] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l488_c2_70ac_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l488_c2_70ac_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l488_c2_70ac_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l488_c2_70ac_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l512_c3_007a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l512_c3_007a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l512_c3_007a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l512_c3_007a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l512_c3_007a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l512_c3_007a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l512_c3_007a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l512_c3_007a_return_output := result_stack_value_MUX_uxn_opcodes_h_l512_c3_007a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l512_c3_007a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l512_c3_007a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l512_c3_007a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l512_c3_007a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l512_c3_007a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l512_c3_007a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l512_c3_007a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l512_c3_007a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l512_c3_007a_return_output;

     -- t8_MUX[uxn_opcodes_h_l488_c2_70ac] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l488_c2_70ac_cond <= VAR_t8_MUX_uxn_opcodes_h_l488_c2_70ac_cond;
     t8_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue;
     t8_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l488_c2_70ac_return_output := t8_MUX_uxn_opcodes_h_l488_c2_70ac_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l512_c3_007a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c3_007a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c3_007a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c3_007a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c3_007a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c3_007a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c3_007a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c3_007a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c3_007a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l488_c2_70ac] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l488_c2_70ac_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l488_c2_70ac_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l488_c2_70ac_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l488_c2_70ac_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l512_c3_007a] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l512_c3_007a_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l512_c3_007a_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l512_c3_007a_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l512_c3_007a_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l512_c3_007a_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l512_c3_007a_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l512_c3_007a_return_output := current_dei_phase_MUX_uxn_opcodes_h_l512_c3_007a_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l512_c1_0e06_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l509_c1_8e6f_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l512_c3_007a_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse := VAR_dei_param_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l512_c3_007a_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l512_c3_007a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l512_c3_007a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l512_c3_007a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_ff80_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l512_c3_007a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l512_c3_007a_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l488_c2_70ac_return_output;
     -- has_written_to_t_MUX[uxn_opcodes_h_l503_c7_ff80] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l503_c7_ff80_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l503_c7_ff80_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l503_c7_ff80_return_output := has_written_to_t_MUX_uxn_opcodes_h_l503_c7_ff80_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l503_c7_ff80] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l503_c7_ff80_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l503_c7_ff80_cond;
     result_stack_value_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l503_c7_ff80_return_output := result_stack_value_MUX_uxn_opcodes_h_l503_c7_ff80_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l503_c7_ff80] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l503_c7_ff80_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l503_c7_ff80_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l503_c7_ff80_return_output := current_dei_phase_MUX_uxn_opcodes_h_l503_c7_ff80_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l503_c7_ff80] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_ff80_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_ff80_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_ff80_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_ff80_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l488_c2_70ac] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l488_c2_70ac_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l488_c2_70ac_cond;
     dei_param_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue;
     dei_param_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l488_c2_70ac_return_output := dei_param_MUX_uxn_opcodes_h_l488_c2_70ac_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l503_c7_ff80] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l503_c7_ff80_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l503_c7_ff80_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l503_c7_ff80_return_output := has_written_to_n_MUX_uxn_opcodes_h_l503_c7_ff80_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l512_c1_0e06] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l512_c1_0e06_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l512_c1_0e06_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l512_c1_0e06_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l512_c1_0e06_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l512_c1_0e06_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l512_c1_0e06_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l512_c1_0e06_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l512_c1_0e06_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l503_c7_ff80] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c7_ff80_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c7_ff80_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c7_ff80_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c7_ff80_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l500_c7_f9d7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f9d7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f9d7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l503_c7_ff80] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l503_c7_ff80_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l503_c7_ff80_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l503_c7_ff80_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l503_c7_ff80_return_output;

     -- Submodule level 5
     VAR_device_in_uxn_opcodes_h_l513_c23_1a00_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l512_c1_0e06_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l503_c7_ff80_return_output;
     REG_VAR_dei_param := VAR_dei_param_MUX_uxn_opcodes_h_l488_c2_70ac_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l503_c7_ff80_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l503_c7_ff80_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_ff80_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l503_c7_ff80_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c7_ff80_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l503_c7_ff80_return_output;
     -- has_written_to_t_MUX[uxn_opcodes_h_l500_c7_f9d7] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l500_c7_f9d7_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l500_c7_f9d7_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output := has_written_to_t_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output;

     -- device_in[uxn_opcodes_h_l513_c23_1a00] LATENCY=0
     -- Clock enable
     device_in_uxn_opcodes_h_l513_c23_1a00_CLOCK_ENABLE <= VAR_device_in_uxn_opcodes_h_l513_c23_1a00_CLOCK_ENABLE;
     -- Inputs
     device_in_uxn_opcodes_h_l513_c23_1a00_device_address <= VAR_device_in_uxn_opcodes_h_l513_c23_1a00_device_address;
     device_in_uxn_opcodes_h_l513_c23_1a00_phase <= VAR_device_in_uxn_opcodes_h_l513_c23_1a00_phase;
     device_in_uxn_opcodes_h_l513_c23_1a00_previous_device_ram_read <= VAR_device_in_uxn_opcodes_h_l513_c23_1a00_previous_device_ram_read;
     -- Outputs
     VAR_device_in_uxn_opcodes_h_l513_c23_1a00_return_output := device_in_uxn_opcodes_h_l513_c23_1a00_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l500_c7_f9d7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l500_c7_f9d7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l500_c7_f9d7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output := result_stack_value_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l500_c7_f9d7] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l500_c7_f9d7_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l500_c7_f9d7_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output := has_written_to_n_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l500_c7_f9d7] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l500_c7_f9d7_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l500_c7_f9d7_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output := current_dei_phase_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l500_c7_f9d7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f9d7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f9d7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l500_c7_f9d7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l500_c7_f9d7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l500_c7_f9d7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l488_c2_70ac] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c2_70ac_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c2_70ac_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c2_70ac_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c2_70ac_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l500_c7_f9d7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f9d7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f9d7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output;

     -- Submodule level 6
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l512_c3_007a_iftrue := VAR_device_in_uxn_opcodes_h_l513_c23_1a00_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output;
     -- has_written_to_t_MUX[uxn_opcodes_h_l488_c2_70ac] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l488_c2_70ac_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c2_70ac_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c2_70ac_return_output := has_written_to_t_MUX_uxn_opcodes_h_l488_c2_70ac_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l488_c2_70ac] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l488_c2_70ac_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c2_70ac_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c2_70ac_return_output := current_dei_phase_MUX_uxn_opcodes_h_l488_c2_70ac_return_output;

     -- CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d[uxn_opcodes_h_l515_c32_d5b3] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l515_c32_d5b3_return_output := VAR_device_in_uxn_opcodes_h_l513_c23_1a00_return_output.device_ram_address;

     -- device_in_result_MUX[uxn_opcodes_h_l512_c3_007a] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l512_c3_007a_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l512_c3_007a_cond;
     device_in_result_MUX_uxn_opcodes_h_l512_c3_007a_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l512_c3_007a_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l512_c3_007a_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l512_c3_007a_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l512_c3_007a_return_output := device_in_result_MUX_uxn_opcodes_h_l512_c3_007a_return_output;

     -- CONST_REF_RD_uint1_t_device_in_result_t_is_device_ram_read_d41d[uxn_opcodes_h_l514_c32_15fa] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l514_c32_15fa_return_output := VAR_device_in_uxn_opcodes_h_l513_c23_1a00_return_output.is_device_ram_read;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l488_c2_70ac] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l488_c2_70ac_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c2_70ac_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c2_70ac_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l488_c2_70ac_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l488_c2_70ac] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c2_70ac_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c2_70ac_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c2_70ac_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c2_70ac_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l488_c2_70ac] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l488_c2_70ac_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l488_c2_70ac_cond;
     result_stack_value_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l488_c2_70ac_return_output := result_stack_value_MUX_uxn_opcodes_h_l488_c2_70ac_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l488_c2_70ac] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l488_c2_70ac_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c2_70ac_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c2_70ac_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l488_c2_70ac_return_output;

     -- CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l518_l520_DUPLICATE_62ec LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l518_l520_DUPLICATE_62ec_return_output := VAR_device_in_uxn_opcodes_h_l513_c23_1a00_return_output.is_dei_done;

     -- has_written_to_n_MUX[uxn_opcodes_h_l488_c2_70ac] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l488_c2_70ac_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c2_70ac_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c2_70ac_return_output := has_written_to_n_MUX_uxn_opcodes_h_l488_c2_70ac_return_output;

     -- Submodule level 7
     VAR_BIN_OP_AND_uxn_opcodes_h_l518_c9_9baf_right := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l518_l520_DUPLICATE_62ec_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l520_c11_f4ba_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l518_l520_DUPLICATE_62ec_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l512_c3_007a_iftrue := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l514_c32_15fa_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l512_c3_007a_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l515_c32_d5b3_return_output;
     REG_VAR_current_dei_phase := VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c2_70ac_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l512_c3_007a_return_output;
     REG_VAR_has_written_to_n := VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c2_70ac_return_output;
     REG_VAR_has_written_to_t := VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c2_70ac_return_output;
     -- is_second_dei_done_MUX[uxn_opcodes_h_l520_c11_f4ba] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l520_c11_f4ba_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l520_c11_f4ba_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l520_c11_f4ba_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l520_c11_f4ba_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l520_c11_f4ba_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l520_c11_f4ba_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l520_c11_f4ba_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l520_c11_f4ba_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l503_c7_ff80] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l503_c7_ff80_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l503_c7_ff80_cond;
     device_in_result_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l503_c7_ff80_return_output := device_in_result_MUX_uxn_opcodes_h_l503_c7_ff80_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l512_c3_007a] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l512_c3_007a_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l512_c3_007a_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l512_c3_007a_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l512_c3_007a_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l512_c3_007a_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l512_c3_007a_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l512_c3_007a_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l512_c3_007a_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l518_c9_9baf] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l518_c9_9baf_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l518_c9_9baf_left;
     BIN_OP_AND_uxn_opcodes_h_l518_c9_9baf_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l518_c9_9baf_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l518_c9_9baf_return_output := BIN_OP_AND_uxn_opcodes_h_l518_c9_9baf_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l512_c3_007a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l512_c3_007a_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l512_c3_007a_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l512_c3_007a_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l512_c3_007a_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l512_c3_007a_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l512_c3_007a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l512_c3_007a_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l512_c3_007a_return_output;

     -- Submodule level 8
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l518_c4_7119_cond := VAR_BIN_OP_AND_uxn_opcodes_h_l518_c9_9baf_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l518_c4_7119_cond := VAR_BIN_OP_AND_uxn_opcodes_h_l518_c9_9baf_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l503_c7_ff80_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l518_c4_7119_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l520_c11_f4ba_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l512_c3_007a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l512_c3_007a_return_output;
     -- is_first_dei_done_MUX[uxn_opcodes_h_l518_c4_7119] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l518_c4_7119_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l518_c4_7119_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l518_c4_7119_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l518_c4_7119_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l518_c4_7119_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l518_c4_7119_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l518_c4_7119_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l518_c4_7119_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l500_c7_f9d7] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l500_c7_f9d7_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l500_c7_f9d7_cond;
     device_in_result_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output := device_in_result_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l503_c7_ff80] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l503_c7_ff80_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l503_c7_ff80_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l503_c7_ff80_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l503_c7_ff80_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l503_c7_ff80] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_ff80_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_ff80_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_ff80_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_ff80_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l518_c4_7119] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l518_c4_7119_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l518_c4_7119_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l518_c4_7119_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l518_c4_7119_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l518_c4_7119_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l518_c4_7119_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l518_c4_7119_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l518_c4_7119_return_output;

     -- Submodule level 9
     VAR_device_in_result_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l512_c3_007a_iftrue := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l518_c4_7119_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l512_c3_007a_iftrue := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l518_c4_7119_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_ff80_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l503_c7_ff80_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l500_c7_f9d7] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f9d7_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f9d7_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l500_c7_f9d7] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_f9d7_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_f9d7_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l512_c3_007a] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l512_c3_007a_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l512_c3_007a_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l512_c3_007a_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l512_c3_007a_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l512_c3_007a_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l512_c3_007a_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l512_c3_007a_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l512_c3_007a_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l512_c3_007a] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l512_c3_007a_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l512_c3_007a_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l512_c3_007a_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l512_c3_007a_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l512_c3_007a_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l512_c3_007a_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l512_c3_007a_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l512_c3_007a_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l488_c2_70ac] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l488_c2_70ac_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l488_c2_70ac_cond;
     device_in_result_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l488_c2_70ac_return_output := device_in_result_MUX_uxn_opcodes_h_l488_c2_70ac_return_output;

     -- Submodule level 10
     REG_VAR_device_in_result := VAR_device_in_result_MUX_uxn_opcodes_h_l488_c2_70ac_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l512_c3_007a_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l512_c3_007a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output;
     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l488_c2_70ac] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c2_70ac_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c2_70ac_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c2_70ac_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c2_70ac_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l503_c7_ff80] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l503_c7_ff80] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l488_c2_70ac] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l488_c2_70ac_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c2_70ac_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c2_70ac_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l488_c2_70ac_return_output;

     -- Submodule level 11
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l503_c7_ff80_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_17a0_uxn_opcodes_h_l482_l543_DUPLICATE_7ceb LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_17a0_uxn_opcodes_h_l482_l543_DUPLICATE_7ceb_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_17a0(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l488_c2_70ac_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l488_c2_70ac_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l488_c2_70ac_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l488_c2_70ac_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c2_70ac_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c2_70ac_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c2_70ac_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c2_70ac_return_output,
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l488_c2_70ac_return_output);

     -- is_second_dei_done_MUX[uxn_opcodes_h_l500_c7_f9d7] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l500_c7_f9d7] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output;

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_17a0_uxn_opcodes_h_l482_l543_DUPLICATE_7ceb_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_17a0_uxn_opcodes_h_l482_l543_DUPLICATE_7ceb_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l500_c7_f9d7_return_output;
     -- is_second_dei_done_MUX[uxn_opcodes_h_l488_c2_70ac] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l488_c2_70ac] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac_return_output;

     -- Submodule level 13
     REG_VAR_is_first_dei_done := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac_return_output;
     REG_VAR_is_second_dei_done := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c2_70ac_return_output;
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
