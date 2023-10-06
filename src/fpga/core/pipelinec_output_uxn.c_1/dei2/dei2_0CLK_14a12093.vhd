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
-- BIN_OP_EQ[uxn_opcodes_h_l502_c6_344b]
signal BIN_OP_EQ_uxn_opcodes_h_l502_c6_344b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l502_c6_344b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l502_c6_344b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l502_c1_058e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l502_c1_058e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l502_c1_058e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l502_c1_058e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l502_c1_058e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l514_c7_269f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l514_c7_269f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l514_c7_269f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l514_c7_269f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l514_c7_269f_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l502_c2_6fce]
signal is_first_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l502_c2_6fce]
signal has_written_to_t_MUX_uxn_opcodes_h_l502_c2_6fce_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l502_c2_6fce_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l502_c2_6fce]
signal has_written_to_n_MUX_uxn_opcodes_h_l502_c2_6fce_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l502_c2_6fce_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l502_c2_6fce]
signal device_in_result_MUX_uxn_opcodes_h_l502_c2_6fce_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l502_c2_6fce_return_output : device_in_result_t;

-- dei_param_MUX[uxn_opcodes_h_l502_c2_6fce]
signal dei_param_MUX_uxn_opcodes_h_l502_c2_6fce_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l502_c2_6fce_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l502_c2_6fce]
signal t8_MUX_uxn_opcodes_h_l502_c2_6fce_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l502_c2_6fce_return_output : unsigned(7 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l502_c2_6fce]
signal current_dei_phase_MUX_uxn_opcodes_h_l502_c2_6fce_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l502_c2_6fce_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l502_c2_6fce]
signal result_stack_value_MUX_uxn_opcodes_h_l502_c2_6fce_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l502_c2_6fce_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l502_c2_6fce]
signal result_is_stack_write_MUX_uxn_opcodes_h_l502_c2_6fce_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l502_c2_6fce_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l502_c2_6fce]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l502_c2_6fce_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l502_c2_6fce_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l502_c2_6fce]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l502_c2_6fce_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l502_c2_6fce_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l502_c2_6fce]
signal result_device_ram_address_MUX_uxn_opcodes_h_l502_c2_6fce_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l502_c2_6fce_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l502_c2_6fce]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l502_c2_6fce_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l502_c2_6fce_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l502_c2_6fce]
signal result_is_opc_done_MUX_uxn_opcodes_h_l502_c2_6fce_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l502_c2_6fce_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l502_c2_6fce]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l502_c2_6fce_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l502_c2_6fce_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l502_c2_6fce]
signal result_is_stack_read_MUX_uxn_opcodes_h_l502_c2_6fce_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l502_c2_6fce_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l502_c2_6fce]
signal is_second_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l503_c3_4235[uxn_opcodes_h_l503_c3_4235]
signal printf_uxn_opcodes_h_l503_c3_4235_uxn_opcodes_h_l503_c3_4235_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l514_c11_0dca]
signal BIN_OP_EQ_uxn_opcodes_h_l514_c11_0dca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l514_c11_0dca_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l514_c11_0dca_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l517_c7_b7f4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c7_b7f4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l514_c7_269f]
signal is_first_dei_done_MUX_uxn_opcodes_h_l514_c7_269f_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l514_c7_269f_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l514_c7_269f_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l514_c7_269f_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l514_c7_269f]
signal has_written_to_t_MUX_uxn_opcodes_h_l514_c7_269f_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l514_c7_269f_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l514_c7_269f_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l514_c7_269f_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l514_c7_269f]
signal has_written_to_n_MUX_uxn_opcodes_h_l514_c7_269f_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l514_c7_269f_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l514_c7_269f_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l514_c7_269f_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l514_c7_269f]
signal device_in_result_MUX_uxn_opcodes_h_l514_c7_269f_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l514_c7_269f_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l514_c7_269f_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l514_c7_269f_return_output : device_in_result_t;

-- dei_param_MUX[uxn_opcodes_h_l514_c7_269f]
signal dei_param_MUX_uxn_opcodes_h_l514_c7_269f_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l514_c7_269f_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l514_c7_269f_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l514_c7_269f_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l514_c7_269f]
signal t8_MUX_uxn_opcodes_h_l514_c7_269f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l514_c7_269f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l514_c7_269f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l514_c7_269f_return_output : unsigned(7 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l514_c7_269f]
signal current_dei_phase_MUX_uxn_opcodes_h_l514_c7_269f_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l514_c7_269f_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l514_c7_269f_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l514_c7_269f_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l514_c7_269f]
signal result_stack_value_MUX_uxn_opcodes_h_l514_c7_269f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l514_c7_269f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l514_c7_269f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l514_c7_269f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l514_c7_269f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l514_c7_269f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l514_c7_269f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l514_c7_269f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l514_c7_269f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l514_c7_269f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l514_c7_269f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l514_c7_269f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l514_c7_269f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l514_c7_269f_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l514_c7_269f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l514_c7_269f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l514_c7_269f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l514_c7_269f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l514_c7_269f_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l514_c7_269f]
signal result_device_ram_address_MUX_uxn_opcodes_h_l514_c7_269f_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l514_c7_269f_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l514_c7_269f_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l514_c7_269f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l514_c7_269f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l514_c7_269f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l514_c7_269f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l514_c7_269f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l514_c7_269f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l514_c7_269f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l514_c7_269f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l514_c7_269f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l514_c7_269f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l514_c7_269f_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l514_c7_269f]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l514_c7_269f_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l514_c7_269f_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l514_c7_269f_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l514_c7_269f_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l514_c7_269f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l514_c7_269f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l514_c7_269f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l514_c7_269f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l514_c7_269f_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l514_c7_269f]
signal is_second_dei_done_MUX_uxn_opcodes_h_l514_c7_269f_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l514_c7_269f_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l514_c7_269f_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l514_c7_269f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l517_c11_4641]
signal BIN_OP_EQ_uxn_opcodes_h_l517_c11_4641_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l517_c11_4641_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l517_c11_4641_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l523_c1_98cd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l523_c1_98cd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l523_c1_98cd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l523_c1_98cd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l523_c1_98cd_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l517_c7_b7f4]
signal is_first_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l517_c7_b7f4]
signal has_written_to_t_MUX_uxn_opcodes_h_l517_c7_b7f4_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l517_c7_b7f4]
signal has_written_to_n_MUX_uxn_opcodes_h_l517_c7_b7f4_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l517_c7_b7f4]
signal device_in_result_MUX_uxn_opcodes_h_l517_c7_b7f4_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output : device_in_result_t;

-- dei_param_MUX[uxn_opcodes_h_l517_c7_b7f4]
signal dei_param_MUX_uxn_opcodes_h_l517_c7_b7f4_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l517_c7_b7f4]
signal t8_MUX_uxn_opcodes_h_l517_c7_b7f4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output : unsigned(7 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l517_c7_b7f4]
signal current_dei_phase_MUX_uxn_opcodes_h_l517_c7_b7f4_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l517_c7_b7f4]
signal result_stack_value_MUX_uxn_opcodes_h_l517_c7_b7f4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l517_c7_b7f4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l517_c7_b7f4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l517_c7_b7f4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l517_c7_b7f4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l517_c7_b7f4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l517_c7_b7f4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l517_c7_b7f4]
signal result_device_ram_address_MUX_uxn_opcodes_h_l517_c7_b7f4_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l517_c7_b7f4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l517_c7_b7f4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l517_c7_b7f4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l517_c7_b7f4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l517_c7_b7f4]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l517_c7_b7f4_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l517_c7_b7f4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l517_c7_b7f4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l517_c7_b7f4]
signal is_second_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l521_c32_8004]
signal BIN_OP_AND_uxn_opcodes_h_l521_c32_8004_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l521_c32_8004_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l521_c32_8004_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l521_c32_c00c]
signal BIN_OP_GT_uxn_opcodes_h_l521_c32_c00c_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l521_c32_c00c_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l521_c32_c00c_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l521_c32_1c84]
signal MUX_uxn_opcodes_h_l521_c32_1c84_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l521_c32_1c84_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l521_c32_1c84_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l521_c32_1c84_return_output : signed(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l525_c35_74a9]
signal BIN_OP_PLUS_uxn_opcodes_h_l525_c35_74a9_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l525_c35_74a9_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l525_c35_74a9_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l525_c15_bab8]
signal MUX_uxn_opcodes_h_l525_c15_bab8_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l525_c15_bab8_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l525_c15_bab8_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l525_c15_bab8_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l526_c49_d2d3]
signal UNARY_OP_NOT_uxn_opcodes_h_l526_c49_d2d3_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l526_c49_d2d3_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l526_c29_27ff]
signal BIN_OP_AND_uxn_opcodes_h_l526_c29_27ff_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l526_c29_27ff_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l526_c29_27ff_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l526_c8_afdd]
signal BIN_OP_OR_uxn_opcodes_h_l526_c8_afdd_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l526_c8_afdd_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l526_c8_afdd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l526_c1_531d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l526_c1_531d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l526_c1_531d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l526_c1_531d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l526_c1_531d_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l526_c3_114c]
signal is_first_dei_done_MUX_uxn_opcodes_h_l526_c3_114c_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l526_c3_114c_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l526_c3_114c_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l526_c3_114c_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l526_c3_114c]
signal has_written_to_t_MUX_uxn_opcodes_h_l526_c3_114c_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l526_c3_114c_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l526_c3_114c_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l526_c3_114c_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l526_c3_114c]
signal has_written_to_n_MUX_uxn_opcodes_h_l526_c3_114c_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l526_c3_114c_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l526_c3_114c_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l526_c3_114c_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l526_c3_114c]
signal device_in_result_MUX_uxn_opcodes_h_l526_c3_114c_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l526_c3_114c_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l526_c3_114c_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l526_c3_114c_return_output : device_in_result_t;

-- current_dei_phase_MUX[uxn_opcodes_h_l526_c3_114c]
signal current_dei_phase_MUX_uxn_opcodes_h_l526_c3_114c_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l526_c3_114c_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l526_c3_114c_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l526_c3_114c_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l526_c3_114c]
signal result_stack_value_MUX_uxn_opcodes_h_l526_c3_114c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l526_c3_114c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l526_c3_114c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l526_c3_114c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l526_c3_114c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l526_c3_114c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l526_c3_114c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l526_c3_114c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l526_c3_114c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l526_c3_114c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l526_c3_114c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l526_c3_114c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l526_c3_114c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l526_c3_114c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l526_c3_114c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l526_c3_114c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l526_c3_114c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l526_c3_114c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l526_c3_114c_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l526_c3_114c]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l526_c3_114c_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l526_c3_114c_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l526_c3_114c_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l526_c3_114c_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l526_c3_114c]
signal result_device_ram_address_MUX_uxn_opcodes_h_l526_c3_114c_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l526_c3_114c_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l526_c3_114c_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l526_c3_114c_return_output : unsigned(7 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l526_c3_114c]
signal is_second_dei_done_MUX_uxn_opcodes_h_l526_c3_114c_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l526_c3_114c_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l526_c3_114c_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l526_c3_114c_return_output : unsigned(0 downto 0);

-- device_in[uxn_opcodes_h_l527_c23_827b]
signal device_in_uxn_opcodes_h_l527_c23_827b_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_in_uxn_opcodes_h_l527_c23_827b_device_address : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l527_c23_827b_phase : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l527_c23_827b_previous_device_ram_read : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l527_c23_827b_return_output : device_in_result_t;

-- BIN_OP_PLUS[uxn_opcodes_h_l531_c4_d6d1]
signal BIN_OP_PLUS_uxn_opcodes_h_l531_c4_d6d1_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l531_c4_d6d1_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l531_c4_d6d1_return_output : unsigned(8 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l532_c9_04ad]
signal BIN_OP_AND_uxn_opcodes_h_l532_c9_04ad_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l532_c9_04ad_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l532_c9_04ad_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l532_c4_cc86]
signal is_first_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l532_c4_cc86]
signal is_second_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l534_c11_bbca]
signal is_second_dei_done_MUX_uxn_opcodes_h_l534_c11_bbca_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l534_c11_bbca_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l534_c11_bbca_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l534_c11_bbca_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l538_c13_3759]
signal UNARY_OP_NOT_uxn_opcodes_h_l538_c13_3759_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l538_c13_3759_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l538_c8_3dcc]
signal has_written_to_t_MUX_uxn_opcodes_h_l538_c8_3dcc_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l538_c8_3dcc_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l538_c8_3dcc_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l538_c8_3dcc_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l538_c8_3dcc]
signal has_written_to_n_MUX_uxn_opcodes_h_l538_c8_3dcc_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l538_c8_3dcc_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l538_c8_3dcc_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l538_c8_3dcc_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l538_c8_3dcc]
signal current_dei_phase_MUX_uxn_opcodes_h_l538_c8_3dcc_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l538_c8_3dcc_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l538_c8_3dcc_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l538_c8_3dcc_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l538_c8_3dcc]
signal result_stack_value_MUX_uxn_opcodes_h_l538_c8_3dcc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l538_c8_3dcc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l538_c8_3dcc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l538_c8_3dcc_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l538_c8_3dcc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l538_c8_3dcc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l538_c8_3dcc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l538_c8_3dcc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l538_c8_3dcc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l538_c8_3dcc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l538_c8_3dcc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l538_c8_3dcc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l538_c8_3dcc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l538_c8_3dcc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l538_c8_3dcc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l538_c8_3dcc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l538_c8_3dcc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l538_c8_3dcc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l538_c8_3dcc_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l545_c13_b40a]
signal UNARY_OP_NOT_uxn_opcodes_h_l545_c13_b40a_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l545_c13_b40a_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l545_c8_a065]
signal has_written_to_n_MUX_uxn_opcodes_h_l545_c8_a065_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l545_c8_a065_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l545_c8_a065_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l545_c8_a065_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l545_c8_a065]
signal result_stack_value_MUX_uxn_opcodes_h_l545_c8_a065_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l545_c8_a065_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l545_c8_a065_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l545_c8_a065_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l545_c8_a065]
signal result_is_opc_done_MUX_uxn_opcodes_h_l545_c8_a065_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l545_c8_a065_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l545_c8_a065_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l545_c8_a065_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l545_c8_a065]
signal result_is_stack_write_MUX_uxn_opcodes_h_l545_c8_a065_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l545_c8_a065_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l545_c8_a065_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l545_c8_a065_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l545_c8_a065]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c8_a065_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c8_a065_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c8_a065_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c8_a065_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l526_l532_DUPLICATE_08bb
signal UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l526_l532_DUPLICATE_08bb_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l526_l532_DUPLICATE_08bb_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_febe( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
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
      base.stack_value := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.device_ram_address := ref_toks_5;
      base.is_sp_shift := ref_toks_6;
      base.is_opc_done := ref_toks_7;
      base.is_device_ram_read := ref_toks_8;
      base.is_stack_read := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l502_c6_344b
BIN_OP_EQ_uxn_opcodes_h_l502_c6_344b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l502_c6_344b_left,
BIN_OP_EQ_uxn_opcodes_h_l502_c6_344b_right,
BIN_OP_EQ_uxn_opcodes_h_l502_c6_344b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l502_c1_058e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l502_c1_058e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l502_c1_058e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l502_c1_058e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l502_c1_058e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l502_c1_058e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l514_c7_269f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l514_c7_269f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l514_c7_269f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l514_c7_269f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l514_c7_269f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l514_c7_269f_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce
is_first_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l502_c2_6fce
has_written_to_t_MUX_uxn_opcodes_h_l502_c2_6fce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l502_c2_6fce_cond,
has_written_to_t_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l502_c2_6fce_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l502_c2_6fce
has_written_to_n_MUX_uxn_opcodes_h_l502_c2_6fce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l502_c2_6fce_cond,
has_written_to_n_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l502_c2_6fce_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l502_c2_6fce
device_in_result_MUX_uxn_opcodes_h_l502_c2_6fce : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l502_c2_6fce_cond,
device_in_result_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue,
device_in_result_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse,
device_in_result_MUX_uxn_opcodes_h_l502_c2_6fce_return_output);

-- dei_param_MUX_uxn_opcodes_h_l502_c2_6fce
dei_param_MUX_uxn_opcodes_h_l502_c2_6fce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l502_c2_6fce_cond,
dei_param_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue,
dei_param_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse,
dei_param_MUX_uxn_opcodes_h_l502_c2_6fce_return_output);

-- t8_MUX_uxn_opcodes_h_l502_c2_6fce
t8_MUX_uxn_opcodes_h_l502_c2_6fce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l502_c2_6fce_cond,
t8_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue,
t8_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse,
t8_MUX_uxn_opcodes_h_l502_c2_6fce_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l502_c2_6fce
current_dei_phase_MUX_uxn_opcodes_h_l502_c2_6fce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l502_c2_6fce_cond,
current_dei_phase_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l502_c2_6fce_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l502_c2_6fce
result_stack_value_MUX_uxn_opcodes_h_l502_c2_6fce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l502_c2_6fce_cond,
result_stack_value_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l502_c2_6fce_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l502_c2_6fce
result_is_stack_write_MUX_uxn_opcodes_h_l502_c2_6fce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l502_c2_6fce_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l502_c2_6fce_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l502_c2_6fce
result_sp_relative_shift_MUX_uxn_opcodes_h_l502_c2_6fce : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l502_c2_6fce_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l502_c2_6fce_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l502_c2_6fce
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l502_c2_6fce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l502_c2_6fce_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l502_c2_6fce_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l502_c2_6fce
result_device_ram_address_MUX_uxn_opcodes_h_l502_c2_6fce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l502_c2_6fce_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l502_c2_6fce_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l502_c2_6fce
result_is_sp_shift_MUX_uxn_opcodes_h_l502_c2_6fce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l502_c2_6fce_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l502_c2_6fce_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l502_c2_6fce
result_is_opc_done_MUX_uxn_opcodes_h_l502_c2_6fce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l502_c2_6fce_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l502_c2_6fce_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l502_c2_6fce
result_is_device_ram_read_MUX_uxn_opcodes_h_l502_c2_6fce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l502_c2_6fce_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l502_c2_6fce_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l502_c2_6fce
result_is_stack_read_MUX_uxn_opcodes_h_l502_c2_6fce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l502_c2_6fce_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l502_c2_6fce_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce
is_second_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce_return_output);

-- printf_uxn_opcodes_h_l503_c3_4235_uxn_opcodes_h_l503_c3_4235
printf_uxn_opcodes_h_l503_c3_4235_uxn_opcodes_h_l503_c3_4235 : entity work.printf_uxn_opcodes_h_l503_c3_4235_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l503_c3_4235_uxn_opcodes_h_l503_c3_4235_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l514_c11_0dca
BIN_OP_EQ_uxn_opcodes_h_l514_c11_0dca : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l514_c11_0dca_left,
BIN_OP_EQ_uxn_opcodes_h_l514_c11_0dca_right,
BIN_OP_EQ_uxn_opcodes_h_l514_c11_0dca_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c7_b7f4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c7_b7f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c7_b7f4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l514_c7_269f
is_first_dei_done_MUX_uxn_opcodes_h_l514_c7_269f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l514_c7_269f_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l514_c7_269f_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l514_c7_269f_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l514_c7_269f_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l514_c7_269f
has_written_to_t_MUX_uxn_opcodes_h_l514_c7_269f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l514_c7_269f_cond,
has_written_to_t_MUX_uxn_opcodes_h_l514_c7_269f_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l514_c7_269f_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l514_c7_269f_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l514_c7_269f
has_written_to_n_MUX_uxn_opcodes_h_l514_c7_269f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l514_c7_269f_cond,
has_written_to_n_MUX_uxn_opcodes_h_l514_c7_269f_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l514_c7_269f_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l514_c7_269f_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l514_c7_269f
device_in_result_MUX_uxn_opcodes_h_l514_c7_269f : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l514_c7_269f_cond,
device_in_result_MUX_uxn_opcodes_h_l514_c7_269f_iftrue,
device_in_result_MUX_uxn_opcodes_h_l514_c7_269f_iffalse,
device_in_result_MUX_uxn_opcodes_h_l514_c7_269f_return_output);

-- dei_param_MUX_uxn_opcodes_h_l514_c7_269f
dei_param_MUX_uxn_opcodes_h_l514_c7_269f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l514_c7_269f_cond,
dei_param_MUX_uxn_opcodes_h_l514_c7_269f_iftrue,
dei_param_MUX_uxn_opcodes_h_l514_c7_269f_iffalse,
dei_param_MUX_uxn_opcodes_h_l514_c7_269f_return_output);

-- t8_MUX_uxn_opcodes_h_l514_c7_269f
t8_MUX_uxn_opcodes_h_l514_c7_269f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l514_c7_269f_cond,
t8_MUX_uxn_opcodes_h_l514_c7_269f_iftrue,
t8_MUX_uxn_opcodes_h_l514_c7_269f_iffalse,
t8_MUX_uxn_opcodes_h_l514_c7_269f_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l514_c7_269f
current_dei_phase_MUX_uxn_opcodes_h_l514_c7_269f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l514_c7_269f_cond,
current_dei_phase_MUX_uxn_opcodes_h_l514_c7_269f_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l514_c7_269f_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l514_c7_269f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l514_c7_269f
result_stack_value_MUX_uxn_opcodes_h_l514_c7_269f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l514_c7_269f_cond,
result_stack_value_MUX_uxn_opcodes_h_l514_c7_269f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l514_c7_269f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l514_c7_269f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l514_c7_269f
result_is_stack_write_MUX_uxn_opcodes_h_l514_c7_269f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l514_c7_269f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l514_c7_269f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l514_c7_269f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l514_c7_269f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l514_c7_269f
result_sp_relative_shift_MUX_uxn_opcodes_h_l514_c7_269f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l514_c7_269f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l514_c7_269f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l514_c7_269f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l514_c7_269f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l514_c7_269f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l514_c7_269f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l514_c7_269f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l514_c7_269f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l514_c7_269f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l514_c7_269f_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l514_c7_269f
result_device_ram_address_MUX_uxn_opcodes_h_l514_c7_269f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l514_c7_269f_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l514_c7_269f_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l514_c7_269f_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l514_c7_269f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l514_c7_269f
result_is_sp_shift_MUX_uxn_opcodes_h_l514_c7_269f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l514_c7_269f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l514_c7_269f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l514_c7_269f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l514_c7_269f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l514_c7_269f
result_is_opc_done_MUX_uxn_opcodes_h_l514_c7_269f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l514_c7_269f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l514_c7_269f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l514_c7_269f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l514_c7_269f_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l514_c7_269f
result_is_device_ram_read_MUX_uxn_opcodes_h_l514_c7_269f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l514_c7_269f_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l514_c7_269f_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l514_c7_269f_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l514_c7_269f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l514_c7_269f
result_is_stack_read_MUX_uxn_opcodes_h_l514_c7_269f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l514_c7_269f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l514_c7_269f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l514_c7_269f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l514_c7_269f_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l514_c7_269f
is_second_dei_done_MUX_uxn_opcodes_h_l514_c7_269f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l514_c7_269f_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l514_c7_269f_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l514_c7_269f_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l514_c7_269f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l517_c11_4641
BIN_OP_EQ_uxn_opcodes_h_l517_c11_4641 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l517_c11_4641_left,
BIN_OP_EQ_uxn_opcodes_h_l517_c11_4641_right,
BIN_OP_EQ_uxn_opcodes_h_l517_c11_4641_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l523_c1_98cd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l523_c1_98cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l523_c1_98cd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l523_c1_98cd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l523_c1_98cd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l523_c1_98cd_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4
is_first_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l517_c7_b7f4
has_written_to_t_MUX_uxn_opcodes_h_l517_c7_b7f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l517_c7_b7f4_cond,
has_written_to_t_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l517_c7_b7f4
has_written_to_n_MUX_uxn_opcodes_h_l517_c7_b7f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l517_c7_b7f4_cond,
has_written_to_n_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l517_c7_b7f4
device_in_result_MUX_uxn_opcodes_h_l517_c7_b7f4 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l517_c7_b7f4_cond,
device_in_result_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue,
device_in_result_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse,
device_in_result_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output);

-- dei_param_MUX_uxn_opcodes_h_l517_c7_b7f4
dei_param_MUX_uxn_opcodes_h_l517_c7_b7f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l517_c7_b7f4_cond,
dei_param_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue,
dei_param_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse,
dei_param_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output);

-- t8_MUX_uxn_opcodes_h_l517_c7_b7f4
t8_MUX_uxn_opcodes_h_l517_c7_b7f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l517_c7_b7f4_cond,
t8_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue,
t8_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse,
t8_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l517_c7_b7f4
current_dei_phase_MUX_uxn_opcodes_h_l517_c7_b7f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l517_c7_b7f4_cond,
current_dei_phase_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l517_c7_b7f4
result_stack_value_MUX_uxn_opcodes_h_l517_c7_b7f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l517_c7_b7f4_cond,
result_stack_value_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l517_c7_b7f4
result_is_stack_write_MUX_uxn_opcodes_h_l517_c7_b7f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l517_c7_b7f4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l517_c7_b7f4
result_sp_relative_shift_MUX_uxn_opcodes_h_l517_c7_b7f4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l517_c7_b7f4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l517_c7_b7f4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l517_c7_b7f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l517_c7_b7f4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l517_c7_b7f4
result_device_ram_address_MUX_uxn_opcodes_h_l517_c7_b7f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l517_c7_b7f4_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l517_c7_b7f4
result_is_sp_shift_MUX_uxn_opcodes_h_l517_c7_b7f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l517_c7_b7f4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l517_c7_b7f4
result_is_opc_done_MUX_uxn_opcodes_h_l517_c7_b7f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l517_c7_b7f4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l517_c7_b7f4
result_is_device_ram_read_MUX_uxn_opcodes_h_l517_c7_b7f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l517_c7_b7f4_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l517_c7_b7f4
result_is_stack_read_MUX_uxn_opcodes_h_l517_c7_b7f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l517_c7_b7f4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4
is_second_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l521_c32_8004
BIN_OP_AND_uxn_opcodes_h_l521_c32_8004 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l521_c32_8004_left,
BIN_OP_AND_uxn_opcodes_h_l521_c32_8004_right,
BIN_OP_AND_uxn_opcodes_h_l521_c32_8004_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l521_c32_c00c
BIN_OP_GT_uxn_opcodes_h_l521_c32_c00c : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l521_c32_c00c_left,
BIN_OP_GT_uxn_opcodes_h_l521_c32_c00c_right,
BIN_OP_GT_uxn_opcodes_h_l521_c32_c00c_return_output);

-- MUX_uxn_opcodes_h_l521_c32_1c84
MUX_uxn_opcodes_h_l521_c32_1c84 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l521_c32_1c84_cond,
MUX_uxn_opcodes_h_l521_c32_1c84_iftrue,
MUX_uxn_opcodes_h_l521_c32_1c84_iffalse,
MUX_uxn_opcodes_h_l521_c32_1c84_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l525_c35_74a9
BIN_OP_PLUS_uxn_opcodes_h_l525_c35_74a9 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l525_c35_74a9_left,
BIN_OP_PLUS_uxn_opcodes_h_l525_c35_74a9_right,
BIN_OP_PLUS_uxn_opcodes_h_l525_c35_74a9_return_output);

-- MUX_uxn_opcodes_h_l525_c15_bab8
MUX_uxn_opcodes_h_l525_c15_bab8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l525_c15_bab8_cond,
MUX_uxn_opcodes_h_l525_c15_bab8_iftrue,
MUX_uxn_opcodes_h_l525_c15_bab8_iffalse,
MUX_uxn_opcodes_h_l525_c15_bab8_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l526_c49_d2d3
UNARY_OP_NOT_uxn_opcodes_h_l526_c49_d2d3 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l526_c49_d2d3_expr,
UNARY_OP_NOT_uxn_opcodes_h_l526_c49_d2d3_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l526_c29_27ff
BIN_OP_AND_uxn_opcodes_h_l526_c29_27ff : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l526_c29_27ff_left,
BIN_OP_AND_uxn_opcodes_h_l526_c29_27ff_right,
BIN_OP_AND_uxn_opcodes_h_l526_c29_27ff_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l526_c8_afdd
BIN_OP_OR_uxn_opcodes_h_l526_c8_afdd : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l526_c8_afdd_left,
BIN_OP_OR_uxn_opcodes_h_l526_c8_afdd_right,
BIN_OP_OR_uxn_opcodes_h_l526_c8_afdd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l526_c1_531d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l526_c1_531d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l526_c1_531d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l526_c1_531d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l526_c1_531d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l526_c1_531d_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l526_c3_114c
is_first_dei_done_MUX_uxn_opcodes_h_l526_c3_114c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l526_c3_114c_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l526_c3_114c_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l526_c3_114c_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l526_c3_114c_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l526_c3_114c
has_written_to_t_MUX_uxn_opcodes_h_l526_c3_114c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l526_c3_114c_cond,
has_written_to_t_MUX_uxn_opcodes_h_l526_c3_114c_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l526_c3_114c_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l526_c3_114c_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l526_c3_114c
has_written_to_n_MUX_uxn_opcodes_h_l526_c3_114c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l526_c3_114c_cond,
has_written_to_n_MUX_uxn_opcodes_h_l526_c3_114c_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l526_c3_114c_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l526_c3_114c_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l526_c3_114c
device_in_result_MUX_uxn_opcodes_h_l526_c3_114c : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l526_c3_114c_cond,
device_in_result_MUX_uxn_opcodes_h_l526_c3_114c_iftrue,
device_in_result_MUX_uxn_opcodes_h_l526_c3_114c_iffalse,
device_in_result_MUX_uxn_opcodes_h_l526_c3_114c_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l526_c3_114c
current_dei_phase_MUX_uxn_opcodes_h_l526_c3_114c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l526_c3_114c_cond,
current_dei_phase_MUX_uxn_opcodes_h_l526_c3_114c_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l526_c3_114c_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l526_c3_114c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l526_c3_114c
result_stack_value_MUX_uxn_opcodes_h_l526_c3_114c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l526_c3_114c_cond,
result_stack_value_MUX_uxn_opcodes_h_l526_c3_114c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l526_c3_114c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l526_c3_114c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l526_c3_114c
result_is_stack_write_MUX_uxn_opcodes_h_l526_c3_114c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l526_c3_114c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l526_c3_114c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l526_c3_114c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l526_c3_114c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l526_c3_114c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l526_c3_114c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l526_c3_114c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l526_c3_114c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l526_c3_114c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l526_c3_114c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l526_c3_114c
result_is_opc_done_MUX_uxn_opcodes_h_l526_c3_114c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l526_c3_114c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l526_c3_114c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l526_c3_114c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l526_c3_114c_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l526_c3_114c
result_is_device_ram_read_MUX_uxn_opcodes_h_l526_c3_114c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l526_c3_114c_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l526_c3_114c_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l526_c3_114c_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l526_c3_114c_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l526_c3_114c
result_device_ram_address_MUX_uxn_opcodes_h_l526_c3_114c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l526_c3_114c_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l526_c3_114c_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l526_c3_114c_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l526_c3_114c_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l526_c3_114c
is_second_dei_done_MUX_uxn_opcodes_h_l526_c3_114c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l526_c3_114c_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l526_c3_114c_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l526_c3_114c_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l526_c3_114c_return_output);

-- device_in_uxn_opcodes_h_l527_c23_827b
device_in_uxn_opcodes_h_l527_c23_827b : entity work.device_in_0CLK_5af1a430 port map (
clk,
device_in_uxn_opcodes_h_l527_c23_827b_CLOCK_ENABLE,
device_in_uxn_opcodes_h_l527_c23_827b_device_address,
device_in_uxn_opcodes_h_l527_c23_827b_phase,
device_in_uxn_opcodes_h_l527_c23_827b_previous_device_ram_read,
device_in_uxn_opcodes_h_l527_c23_827b_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l531_c4_d6d1
BIN_OP_PLUS_uxn_opcodes_h_l531_c4_d6d1 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l531_c4_d6d1_left,
BIN_OP_PLUS_uxn_opcodes_h_l531_c4_d6d1_right,
BIN_OP_PLUS_uxn_opcodes_h_l531_c4_d6d1_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l532_c9_04ad
BIN_OP_AND_uxn_opcodes_h_l532_c9_04ad : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l532_c9_04ad_left,
BIN_OP_AND_uxn_opcodes_h_l532_c9_04ad_right,
BIN_OP_AND_uxn_opcodes_h_l532_c9_04ad_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86
is_first_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86
is_second_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l534_c11_bbca
is_second_dei_done_MUX_uxn_opcodes_h_l534_c11_bbca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l534_c11_bbca_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l534_c11_bbca_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l534_c11_bbca_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l534_c11_bbca_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l538_c13_3759
UNARY_OP_NOT_uxn_opcodes_h_l538_c13_3759 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l538_c13_3759_expr,
UNARY_OP_NOT_uxn_opcodes_h_l538_c13_3759_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l538_c8_3dcc
has_written_to_t_MUX_uxn_opcodes_h_l538_c8_3dcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l538_c8_3dcc_cond,
has_written_to_t_MUX_uxn_opcodes_h_l538_c8_3dcc_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l538_c8_3dcc_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l538_c8_3dcc_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l538_c8_3dcc
has_written_to_n_MUX_uxn_opcodes_h_l538_c8_3dcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l538_c8_3dcc_cond,
has_written_to_n_MUX_uxn_opcodes_h_l538_c8_3dcc_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l538_c8_3dcc_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l538_c8_3dcc_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l538_c8_3dcc
current_dei_phase_MUX_uxn_opcodes_h_l538_c8_3dcc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l538_c8_3dcc_cond,
current_dei_phase_MUX_uxn_opcodes_h_l538_c8_3dcc_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l538_c8_3dcc_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l538_c8_3dcc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l538_c8_3dcc
result_stack_value_MUX_uxn_opcodes_h_l538_c8_3dcc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l538_c8_3dcc_cond,
result_stack_value_MUX_uxn_opcodes_h_l538_c8_3dcc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l538_c8_3dcc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l538_c8_3dcc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l538_c8_3dcc
result_is_opc_done_MUX_uxn_opcodes_h_l538_c8_3dcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l538_c8_3dcc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l538_c8_3dcc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l538_c8_3dcc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l538_c8_3dcc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l538_c8_3dcc
result_is_stack_write_MUX_uxn_opcodes_h_l538_c8_3dcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l538_c8_3dcc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l538_c8_3dcc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l538_c8_3dcc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l538_c8_3dcc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l538_c8_3dcc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l538_c8_3dcc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l538_c8_3dcc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l538_c8_3dcc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l538_c8_3dcc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l538_c8_3dcc_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l545_c13_b40a
UNARY_OP_NOT_uxn_opcodes_h_l545_c13_b40a : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l545_c13_b40a_expr,
UNARY_OP_NOT_uxn_opcodes_h_l545_c13_b40a_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l545_c8_a065
has_written_to_n_MUX_uxn_opcodes_h_l545_c8_a065 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l545_c8_a065_cond,
has_written_to_n_MUX_uxn_opcodes_h_l545_c8_a065_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l545_c8_a065_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l545_c8_a065_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l545_c8_a065
result_stack_value_MUX_uxn_opcodes_h_l545_c8_a065 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l545_c8_a065_cond,
result_stack_value_MUX_uxn_opcodes_h_l545_c8_a065_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l545_c8_a065_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l545_c8_a065_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l545_c8_a065
result_is_opc_done_MUX_uxn_opcodes_h_l545_c8_a065 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l545_c8_a065_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l545_c8_a065_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l545_c8_a065_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l545_c8_a065_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l545_c8_a065
result_is_stack_write_MUX_uxn_opcodes_h_l545_c8_a065 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l545_c8_a065_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l545_c8_a065_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l545_c8_a065_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l545_c8_a065_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c8_a065
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c8_a065 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c8_a065_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c8_a065_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c8_a065_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c8_a065_return_output);

-- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l526_l532_DUPLICATE_08bb
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l526_l532_DUPLICATE_08bb : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l526_l532_DUPLICATE_08bb_expr,
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l526_l532_DUPLICATE_08bb_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l502_c6_344b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l502_c1_058e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l514_c7_269f_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l502_c2_6fce_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l502_c2_6fce_return_output,
 device_in_result_MUX_uxn_opcodes_h_l502_c2_6fce_return_output,
 dei_param_MUX_uxn_opcodes_h_l502_c2_6fce_return_output,
 t8_MUX_uxn_opcodes_h_l502_c2_6fce_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l502_c2_6fce_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l502_c2_6fce_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l502_c2_6fce_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l502_c2_6fce_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l502_c2_6fce_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l502_c2_6fce_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l502_c2_6fce_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l502_c2_6fce_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l502_c2_6fce_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l502_c2_6fce_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l514_c11_0dca_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l514_c7_269f_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l514_c7_269f_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l514_c7_269f_return_output,
 device_in_result_MUX_uxn_opcodes_h_l514_c7_269f_return_output,
 dei_param_MUX_uxn_opcodes_h_l514_c7_269f_return_output,
 t8_MUX_uxn_opcodes_h_l514_c7_269f_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l514_c7_269f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l514_c7_269f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l514_c7_269f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l514_c7_269f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l514_c7_269f_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l514_c7_269f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l514_c7_269f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l514_c7_269f_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l514_c7_269f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l514_c7_269f_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l514_c7_269f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l517_c11_4641_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l523_c1_98cd_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output,
 device_in_result_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output,
 dei_param_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output,
 t8_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output,
 BIN_OP_AND_uxn_opcodes_h_l521_c32_8004_return_output,
 BIN_OP_GT_uxn_opcodes_h_l521_c32_c00c_return_output,
 MUX_uxn_opcodes_h_l521_c32_1c84_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l525_c35_74a9_return_output,
 MUX_uxn_opcodes_h_l525_c15_bab8_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l526_c49_d2d3_return_output,
 BIN_OP_AND_uxn_opcodes_h_l526_c29_27ff_return_output,
 BIN_OP_OR_uxn_opcodes_h_l526_c8_afdd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l526_c1_531d_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l526_c3_114c_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l526_c3_114c_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l526_c3_114c_return_output,
 device_in_result_MUX_uxn_opcodes_h_l526_c3_114c_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l526_c3_114c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l526_c3_114c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l526_c3_114c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l526_c3_114c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l526_c3_114c_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l526_c3_114c_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l526_c3_114c_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l526_c3_114c_return_output,
 device_in_uxn_opcodes_h_l527_c23_827b_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l531_c4_d6d1_return_output,
 BIN_OP_AND_uxn_opcodes_h_l532_c9_04ad_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l534_c11_bbca_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l538_c13_3759_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l538_c8_3dcc_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l538_c8_3dcc_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l538_c8_3dcc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l538_c8_3dcc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l538_c8_3dcc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l538_c8_3dcc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l538_c8_3dcc_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l545_c13_b40a_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l545_c8_a065_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l545_c8_a065_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l545_c8_a065_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l545_c8_a065_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c8_a065_return_output,
 UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l526_l532_DUPLICATE_08bb_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l502_c6_344b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l502_c6_344b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l502_c6_344b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l502_c1_058e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l502_c1_058e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l502_c1_058e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l502_c1_058e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l514_c7_269f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l514_c7_269f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l514_c7_269f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l514_c7_269f_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l514_c7_269f_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l514_c7_269f_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l502_c2_6fce_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l502_c2_6fce_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l514_c7_269f_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l502_c2_6fce_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l502_c2_6fce_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue : device_in_result_t;
 variable VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l502_c2_6fce_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l514_c7_269f_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l502_c2_6fce_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l502_c2_6fce_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l514_c7_269f_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l502_c2_6fce_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l502_c2_6fce_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l514_c7_269f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l502_c2_6fce_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l502_c2_6fce_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l508_c3_33b0 : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l514_c7_269f_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l502_c2_6fce_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l502_c2_6fce_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l514_c7_269f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l502_c2_6fce_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l502_c2_6fce_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l514_c7_269f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l502_c2_6fce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l502_c2_6fce_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l514_c7_269f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l502_c2_6fce_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l502_c2_6fce_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l510_c3_628e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l514_c7_269f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l502_c2_6fce_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l502_c2_6fce_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l514_c7_269f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l502_c2_6fce_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l502_c2_6fce_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l514_c7_269f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l502_c2_6fce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l502_c2_6fce_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l514_c7_269f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l502_c2_6fce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l502_c2_6fce_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l514_c7_269f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l502_c2_6fce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l502_c2_6fce_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l514_c7_269f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l502_c2_6fce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l502_c2_6fce_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l514_c7_269f_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l503_c3_4235_uxn_opcodes_h_l503_c3_4235_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c11_0dca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c11_0dca_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c11_0dca_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c7_b7f4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l514_c7_269f_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l514_c7_269f_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l514_c7_269f_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l514_c7_269f_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l514_c7_269f_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l514_c7_269f_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l514_c7_269f_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l514_c7_269f_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l514_c7_269f_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l514_c7_269f_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l514_c7_269f_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l514_c7_269f_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l514_c7_269f_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l514_c7_269f_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l514_c7_269f_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l514_c7_269f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l514_c7_269f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l514_c7_269f_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l514_c7_269f_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l514_c7_269f_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l514_c7_269f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l514_c7_269f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l514_c7_269f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l514_c7_269f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l514_c7_269f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l514_c7_269f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l514_c7_269f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l514_c7_269f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l514_c7_269f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l514_c7_269f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l514_c7_269f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l515_c3_2406 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l514_c7_269f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l514_c7_269f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l514_c7_269f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l514_c7_269f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l514_c7_269f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l514_c7_269f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l514_c7_269f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l514_c7_269f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l514_c7_269f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l514_c7_269f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l514_c7_269f_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l514_c7_269f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l514_c7_269f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l514_c7_269f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l514_c7_269f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l514_c7_269f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l514_c7_269f_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l514_c7_269f_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l514_c7_269f_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l514_c7_269f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l517_c11_4641_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l517_c11_4641_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l517_c11_4641_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l523_c1_98cd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l523_c1_98cd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l523_c1_98cd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l523_c1_98cd_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l526_c3_114c_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l526_c3_114c_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l517_c7_b7f4_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l526_c3_114c_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l517_c7_b7f4_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l526_c3_114c_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l517_c7_b7f4_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l517_c7_b7f4_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l517_c7_b7f4_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l526_c3_114c_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l517_c7_b7f4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l526_c3_114c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l517_c7_b7f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l526_c3_114c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l517_c7_b7f4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l517_c7_b7f4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l526_c3_114c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l517_c7_b7f4_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l526_c3_114c_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l517_c7_b7f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l517_c7_b7f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l526_c3_114c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l517_c7_b7f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l526_c3_114c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l517_c7_b7f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l517_c7_b7f4_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l526_c3_114c_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l521_c32_1c84_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l521_c32_1c84_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l521_c32_1c84_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l521_c32_8004_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l521_c32_8004_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l521_c32_8004_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l521_c32_c00c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l521_c32_c00c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l521_c32_c00c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l521_c32_1c84_return_output : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l525_c15_bab8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l525_c15_bab8_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l525_c15_bab8_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l525_c35_74a9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l525_c35_74a9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l525_c35_74a9_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l525_c15_bab8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l526_c8_afdd_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l526_c29_27ff_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l526_c49_d2d3_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l526_c49_d2d3_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l526_c29_27ff_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l526_c29_27ff_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l526_c8_afdd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l526_c8_afdd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l526_c1_531d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l526_c1_531d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l526_c1_531d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l526_c1_531d_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l526_c3_114c_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l526_c3_114c_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l526_c3_114c_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l526_c3_114c_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l526_c3_114c_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l538_c8_3dcc_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l526_c3_114c_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l526_c3_114c_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l526_c3_114c_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l538_c8_3dcc_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l526_c3_114c_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l526_c3_114c_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l526_c3_114c_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l526_c3_114c_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l526_c3_114c_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l531_c4_6ae8 : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l526_c3_114c_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l538_c8_3dcc_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l526_c3_114c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l526_c3_114c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l526_c3_114c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l538_c8_3dcc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l526_c3_114c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l526_c3_114c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l526_c3_114c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l538_c8_3dcc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l526_c3_114c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l526_c3_114c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l526_c3_114c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l538_c8_3dcc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l526_c3_114c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l526_c3_114c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l526_c3_114c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l538_c8_3dcc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l526_c3_114c_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l526_c3_114c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l526_c3_114c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l526_c3_114c_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l526_c3_114c_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l526_c3_114c_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l526_c3_114c_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l526_c3_114c_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l526_c3_114c_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l526_c3_114c_cond : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l527_c23_827b_device_address : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l527_c23_827b_phase : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l527_c23_827b_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l527_c23_827b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l527_c23_827b_return_output : device_in_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l528_c32_e802_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l529_c32_288e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l531_c4_d6d1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l531_c4_d6d1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l531_c4_d6d1_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l532_c9_04ad_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l532_c9_04ad_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l532_c9_04ad_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l534_c11_bbca_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l534_c11_bbca_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l534_c11_bbca_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l534_c11_bbca_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l538_c13_3759_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l538_c13_3759_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l538_c8_3dcc_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l538_c8_3dcc_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l538_c8_3dcc_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l538_c8_3dcc_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l538_c8_3dcc_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l545_c8_a065_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l538_c8_3dcc_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l538_c8_3dcc_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l539_c4_0763 : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l538_c8_3dcc_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l538_c8_3dcc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l538_c8_3dcc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l538_c8_3dcc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l545_c8_a065_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l538_c8_3dcc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l538_c8_3dcc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l538_c8_3dcc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l545_c8_a065_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l538_c8_3dcc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l538_c8_3dcc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l538_c8_3dcc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l545_c8_a065_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l538_c8_3dcc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l538_c8_3dcc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l541_c4_cb7d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l538_c8_3dcc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c8_a065_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l538_c8_3dcc_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l545_c13_b40a_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l545_c13_b40a_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l545_c8_a065_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l545_c8_a065_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l545_c8_a065_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l545_c8_a065_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l545_c8_a065_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l545_c8_a065_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l545_c8_a065_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l545_c8_a065_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l545_c8_a065_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l545_c8_a065_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l545_c8_a065_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l545_c8_a065_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c8_a065_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l547_c4_e4a0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c8_a065_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c8_a065_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l517_l514_l502_l545_l526_DUPLICATE_39a4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l517_l502_l514_DUPLICATE_5f54_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l517_l502_l514_DUPLICATE_8c61_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l517_l502_l526_l514_DUPLICATE_bc29_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l502_l514_DUPLICATE_4897_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l517_l502_l526_l514_DUPLICATE_e427_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l517_l514_l545_l538_l526_DUPLICATE_3542_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l517_l514_DUPLICATE_3914_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l517_l545_l526_DUPLICATE_4073_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l526_l532_DUPLICATE_08bb_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l526_l532_DUPLICATE_08bb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l532_l534_DUPLICATE_d3fb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l548_l542_DUPLICATE_7ecd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_febe_uxn_opcodes_h_l557_l496_DUPLICATE_6405_return_output : opcode_result_t;
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
     VAR_MUX_uxn_opcodes_h_l521_c32_1c84_iffalse := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l523_c1_98cd_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l545_c8_a065_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue := to_unsigned(0, 1);
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l514_c7_269f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l502_c1_058e_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l525_c35_74a9_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l538_c8_3dcc_iftrue := to_unsigned(1, 1);
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l545_c8_a065_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l515_c3_2406 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l514_c7_269f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l515_c3_2406;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l545_c8_a065_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l531_c4_d6d1_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l541_c4_cb7d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l538_c8_3dcc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l541_c4_cb7d;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l526_c1_531d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l547_c4_e4a0 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c8_a065_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l547_c4_e4a0;
     VAR_current_dei_phase_uxn_opcodes_h_l508_c3_33b0 := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l508_c3_33b0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l502_c6_344b_right := to_unsigned(0, 1);
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l534_c11_bbca_iftrue := to_unsigned(1, 1);
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l521_c32_c00c_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l521_c32_1c84_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c11_0dca_right := to_unsigned(1, 1);
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l545_c8_a065_iftrue := to_unsigned(1, 1);
     VAR_current_dei_phase_uxn_opcodes_h_l539_c4_0763 := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l538_c8_3dcc_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l539_c4_0763;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l510_c3_628e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l510_c3_628e;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l521_c32_8004_right := to_unsigned(128, 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l526_c3_114c_iftrue := to_unsigned(0, 1);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l538_c8_3dcc_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l517_c11_4641_right := to_unsigned(2, 2);
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l514_c7_269f_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l502_c1_058e_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l531_c4_d6d1_left := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l514_c7_269f_iftrue := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l538_c8_3dcc_iffalse := current_dei_phase;
     VAR_device_in_uxn_opcodes_h_l527_c23_827b_phase := current_dei_phase;
     VAR_dei_param_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue := dei_param;
     VAR_dei_param_MUX_uxn_opcodes_h_l514_c7_269f_iftrue := dei_param;
     VAR_dei_param_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue := dei_param;
     VAR_device_in_result_MUX_uxn_opcodes_h_l514_c7_269f_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l526_c3_114c_iffalse := device_in_result;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l545_c13_b40a_expr := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l514_c7_269f_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l526_c3_114c_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l538_c8_3dcc_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l545_c8_a065_iffalse := has_written_to_n;
     VAR_BIN_OP_AND_uxn_opcodes_h_l526_c29_27ff_left := has_written_to_t;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l538_c13_3759_expr := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l514_c7_269f_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l526_c3_114c_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l538_c8_3dcc_iffalse := has_written_to_t;
     VAR_BIN_OP_AND_uxn_opcodes_h_l521_c32_8004_left := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l525_c15_bab8_cond := is_first_dei_done;
     VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l526_l532_DUPLICATE_08bb_expr := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l514_c7_269f_iftrue := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l526_c3_114c_iffalse := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86_iffalse := is_first_dei_done;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l526_c49_d2d3_expr := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l514_c7_269f_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l526_c3_114c_iffalse := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l534_c11_bbca_iffalse := is_second_dei_done;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l502_c6_344b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c11_0dca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l517_c11_4641_left := VAR_phase;
     VAR_device_in_uxn_opcodes_h_l527_c23_827b_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l525_c35_74a9_left := t8;
     VAR_MUX_uxn_opcodes_h_l525_c15_bab8_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l514_c7_269f_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l517_c11_4641] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l517_c11_4641_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l517_c11_4641_left;
     BIN_OP_EQ_uxn_opcodes_h_l517_c11_4641_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l517_c11_4641_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l517_c11_4641_return_output := BIN_OP_EQ_uxn_opcodes_h_l517_c11_4641_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l545_c13_b40a] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l545_c13_b40a_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l545_c13_b40a_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l545_c13_b40a_return_output := UNARY_OP_NOT_uxn_opcodes_h_l545_c13_b40a_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l531_c4_d6d1] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l531_c4_d6d1_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l531_c4_d6d1_left;
     BIN_OP_PLUS_uxn_opcodes_h_l531_c4_d6d1_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l531_c4_d6d1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l531_c4_d6d1_return_output := BIN_OP_PLUS_uxn_opcodes_h_l531_c4_d6d1_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l517_l514_l502_l545_l526_DUPLICATE_39a4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l517_l514_l502_l545_l526_DUPLICATE_39a4_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l514_c11_0dca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l514_c11_0dca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c11_0dca_left;
     BIN_OP_EQ_uxn_opcodes_h_l514_c11_0dca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c11_0dca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c11_0dca_return_output := BIN_OP_EQ_uxn_opcodes_h_l514_c11_0dca_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l517_l545_l526_DUPLICATE_4073 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l517_l545_l526_DUPLICATE_4073_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l517_l502_l526_l514_DUPLICATE_e427 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l517_l502_l526_l514_DUPLICATE_e427_return_output := result.is_device_ram_read;

     -- CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l548_l542_DUPLICATE_7ecd LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l548_l542_DUPLICATE_7ecd_return_output := device_in_result.dei_value;

     -- UNARY_OP_NOT[uxn_opcodes_h_l526_c49_d2d3] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l526_c49_d2d3_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l526_c49_d2d3_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l526_c49_d2d3_return_output := UNARY_OP_NOT_uxn_opcodes_h_l526_c49_d2d3_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l502_l514_DUPLICATE_4897 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l502_l514_DUPLICATE_4897_return_output := result.is_sp_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l521_c32_8004] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l521_c32_8004_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l521_c32_8004_left;
     BIN_OP_AND_uxn_opcodes_h_l521_c32_8004_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l521_c32_8004_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l521_c32_8004_return_output := BIN_OP_AND_uxn_opcodes_h_l521_c32_8004_return_output;

     -- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l526_l532_DUPLICATE_08bb LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l526_l532_DUPLICATE_08bb_expr <= VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l526_l532_DUPLICATE_08bb_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l526_l532_DUPLICATE_08bb_return_output := UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l526_l532_DUPLICATE_08bb_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l517_l502_l526_l514_DUPLICATE_bc29 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l517_l502_l526_l514_DUPLICATE_bc29_return_output := result.device_ram_address;

     -- BIN_OP_PLUS[uxn_opcodes_h_l525_c35_74a9] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l525_c35_74a9_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l525_c35_74a9_left;
     BIN_OP_PLUS_uxn_opcodes_h_l525_c35_74a9_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l525_c35_74a9_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l525_c35_74a9_return_output := BIN_OP_PLUS_uxn_opcodes_h_l525_c35_74a9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l517_l514_l545_l538_l526_DUPLICATE_3542 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l517_l514_l545_l538_l526_DUPLICATE_3542_return_output := result.is_opc_done;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l517_l502_l514_DUPLICATE_8c61 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l517_l502_l514_DUPLICATE_8c61_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l517_l502_l514_DUPLICATE_5f54 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l517_l502_l514_DUPLICATE_5f54_return_output := result.is_stack_write;

     -- UNARY_OP_NOT[uxn_opcodes_h_l538_c13_3759] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l538_c13_3759_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l538_c13_3759_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l538_c13_3759_return_output := UNARY_OP_NOT_uxn_opcodes_h_l538_c13_3759_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l517_l514_DUPLICATE_3914 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l517_l514_DUPLICATE_3914_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l502_c6_344b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l502_c6_344b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l502_c6_344b_left;
     BIN_OP_EQ_uxn_opcodes_h_l502_c6_344b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l502_c6_344b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l502_c6_344b_return_output := BIN_OP_EQ_uxn_opcodes_h_l502_c6_344b_return_output;

     -- device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6[uxn_opcodes_h_l502_c2_6fce] LATENCY=0
     VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l502_c2_6fce_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6(
     device_in_result,
     to_unsigned(0, 1));

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l521_c32_c00c_left := VAR_BIN_OP_AND_uxn_opcodes_h_l521_c32_8004_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l514_c7_269f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l502_c6_344b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l502_c1_058e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l502_c6_344b_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l502_c2_6fce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l502_c6_344b_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l502_c2_6fce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l502_c6_344b_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l502_c2_6fce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l502_c6_344b_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l502_c2_6fce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l502_c6_344b_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l502_c2_6fce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l502_c6_344b_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l502_c6_344b_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l502_c6_344b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l502_c2_6fce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l502_c6_344b_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l502_c2_6fce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l502_c6_344b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l502_c2_6fce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l502_c6_344b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l502_c2_6fce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l502_c6_344b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l502_c2_6fce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l502_c6_344b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l502_c2_6fce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l502_c6_344b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l502_c2_6fce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l502_c6_344b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l502_c2_6fce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l502_c6_344b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l502_c2_6fce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l502_c6_344b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l502_c2_6fce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l502_c6_344b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c7_b7f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c11_0dca_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l514_c7_269f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c11_0dca_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l514_c7_269f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c11_0dca_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l514_c7_269f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c11_0dca_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l514_c7_269f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c11_0dca_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l514_c7_269f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c11_0dca_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l514_c7_269f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c11_0dca_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l514_c7_269f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c11_0dca_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l514_c7_269f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c11_0dca_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l514_c7_269f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c11_0dca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l514_c7_269f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c11_0dca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l514_c7_269f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c11_0dca_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l514_c7_269f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c11_0dca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l514_c7_269f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c11_0dca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l514_c7_269f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c11_0dca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l514_c7_269f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c11_0dca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l514_c7_269f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c11_0dca_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l514_c7_269f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c11_0dca_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l523_c1_98cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l517_c11_4641_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l517_c7_b7f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l517_c11_4641_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l517_c7_b7f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l517_c11_4641_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l517_c7_b7f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l517_c11_4641_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l517_c7_b7f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l517_c11_4641_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l517_c7_b7f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l517_c11_4641_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l517_c11_4641_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l517_c11_4641_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l517_c7_b7f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l517_c11_4641_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l517_c7_b7f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l517_c11_4641_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l517_c7_b7f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l517_c11_4641_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l517_c7_b7f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l517_c11_4641_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l517_c7_b7f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l517_c11_4641_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l517_c7_b7f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l517_c11_4641_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l517_c7_b7f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l517_c11_4641_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l517_c7_b7f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l517_c11_4641_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l517_c7_b7f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l517_c11_4641_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l517_c7_b7f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l517_c11_4641_return_output;
     VAR_MUX_uxn_opcodes_h_l525_c15_bab8_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l525_c35_74a9_return_output, 8);
     VAR_current_dei_phase_uxn_opcodes_h_l531_c4_6ae8 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l531_c4_d6d1_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l517_l502_l514_DUPLICATE_8c61_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l514_c7_269f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l517_l502_l514_DUPLICATE_8c61_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l517_l502_l514_DUPLICATE_8c61_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l517_l502_l526_l514_DUPLICATE_e427_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l514_c7_269f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l517_l502_l526_l514_DUPLICATE_e427_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l517_l502_l526_l514_DUPLICATE_e427_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l526_c3_114c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l517_l502_l526_l514_DUPLICATE_e427_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l514_c7_269f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l517_l514_l545_l538_l526_DUPLICATE_3542_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l517_l514_l545_l538_l526_DUPLICATE_3542_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l526_c3_114c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l517_l514_l545_l538_l526_DUPLICATE_3542_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l538_c8_3dcc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l517_l514_l545_l538_l526_DUPLICATE_3542_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l545_c8_a065_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l517_l514_l545_l538_l526_DUPLICATE_3542_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l502_l514_DUPLICATE_4897_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l514_c7_269f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l502_l514_DUPLICATE_4897_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l514_c7_269f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l517_l514_DUPLICATE_3914_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l517_l514_DUPLICATE_3914_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l517_l502_l514_DUPLICATE_5f54_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l514_c7_269f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l517_l502_l514_DUPLICATE_5f54_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l517_l502_l514_DUPLICATE_5f54_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l538_c8_3dcc_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l548_l542_DUPLICATE_7ecd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l545_c8_a065_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l548_l542_DUPLICATE_7ecd_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l517_l502_l526_l514_DUPLICATE_bc29_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l514_c7_269f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l517_l502_l526_l514_DUPLICATE_bc29_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l517_l502_l526_l514_DUPLICATE_bc29_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l526_c3_114c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l517_l502_l526_l514_DUPLICATE_bc29_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l517_l545_l526_DUPLICATE_4073_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l526_c3_114c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l517_l545_l526_DUPLICATE_4073_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c8_a065_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l517_l545_l526_DUPLICATE_4073_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l517_l514_l502_l545_l526_DUPLICATE_39a4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l514_c7_269f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l517_l514_l502_l545_l526_DUPLICATE_39a4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l517_l514_l502_l545_l526_DUPLICATE_39a4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l526_c3_114c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l517_l514_l502_l545_l526_DUPLICATE_39a4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l545_c8_a065_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l517_l514_l502_l545_l526_DUPLICATE_39a4_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l526_c29_27ff_right := VAR_UNARY_OP_NOT_uxn_opcodes_h_l526_c49_d2d3_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l538_c8_3dcc_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l538_c13_3759_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l538_c8_3dcc_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l538_c13_3759_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l538_c8_3dcc_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l538_c13_3759_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l538_c8_3dcc_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l538_c13_3759_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l538_c8_3dcc_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l538_c13_3759_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l538_c8_3dcc_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l538_c13_3759_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l538_c8_3dcc_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l538_c13_3759_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l545_c8_a065_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l545_c13_b40a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l545_c8_a065_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l545_c13_b40a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l545_c8_a065_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l545_c13_b40a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c8_a065_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l545_c13_b40a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l545_c8_a065_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l545_c13_b40a_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l532_c9_04ad_left := VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l526_l532_DUPLICATE_08bb_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l526_c8_afdd_left := VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l526_l532_DUPLICATE_08bb_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue := VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l502_c2_6fce_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l526_c3_114c_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l531_c4_6ae8;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l545_c8_a065] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l545_c8_a065_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l545_c8_a065_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l545_c8_a065_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l545_c8_a065_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l545_c8_a065_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l545_c8_a065_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l545_c8_a065_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l545_c8_a065_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l545_c8_a065] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l545_c8_a065_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l545_c8_a065_cond;
     result_stack_value_MUX_uxn_opcodes_h_l545_c8_a065_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l545_c8_a065_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l545_c8_a065_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l545_c8_a065_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l545_c8_a065_return_output := result_stack_value_MUX_uxn_opcodes_h_l545_c8_a065_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l517_c7_b7f4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l517_c7_b7f4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l517_c7_b7f4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l526_c29_27ff] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l526_c29_27ff_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l526_c29_27ff_left;
     BIN_OP_AND_uxn_opcodes_h_l526_c29_27ff_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l526_c29_27ff_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l526_c29_27ff_return_output := BIN_OP_AND_uxn_opcodes_h_l526_c29_27ff_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l521_c32_c00c] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l521_c32_c00c_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l521_c32_c00c_left;
     BIN_OP_GT_uxn_opcodes_h_l521_c32_c00c_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l521_c32_c00c_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l521_c32_c00c_return_output := BIN_OP_GT_uxn_opcodes_h_l521_c32_c00c_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l538_c8_3dcc] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l538_c8_3dcc_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l538_c8_3dcc_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l538_c8_3dcc_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l538_c8_3dcc_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l538_c8_3dcc_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l538_c8_3dcc_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l538_c8_3dcc_return_output := has_written_to_t_MUX_uxn_opcodes_h_l538_c8_3dcc_return_output;

     -- MUX[uxn_opcodes_h_l525_c15_bab8] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l525_c15_bab8_cond <= VAR_MUX_uxn_opcodes_h_l525_c15_bab8_cond;
     MUX_uxn_opcodes_h_l525_c15_bab8_iftrue <= VAR_MUX_uxn_opcodes_h_l525_c15_bab8_iftrue;
     MUX_uxn_opcodes_h_l525_c15_bab8_iffalse <= VAR_MUX_uxn_opcodes_h_l525_c15_bab8_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l525_c15_bab8_return_output := MUX_uxn_opcodes_h_l525_c15_bab8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l514_c7_269f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l514_c7_269f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l514_c7_269f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l514_c7_269f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l514_c7_269f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l514_c7_269f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l514_c7_269f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l514_c7_269f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l514_c7_269f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l502_c1_058e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l502_c1_058e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l502_c1_058e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l502_c1_058e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l502_c1_058e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l502_c1_058e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l502_c1_058e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l502_c1_058e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l502_c1_058e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l517_c7_b7f4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l517_c7_b7f4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l517_c7_b7f4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l545_c8_a065] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l545_c8_a065_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l545_c8_a065_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l545_c8_a065_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l545_c8_a065_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l545_c8_a065_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l545_c8_a065_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l545_c8_a065_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l545_c8_a065_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l538_c8_3dcc] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l538_c8_3dcc_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l538_c8_3dcc_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l538_c8_3dcc_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l538_c8_3dcc_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l538_c8_3dcc_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l538_c8_3dcc_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l538_c8_3dcc_return_output := current_dei_phase_MUX_uxn_opcodes_h_l538_c8_3dcc_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l545_c8_a065] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l545_c8_a065_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l545_c8_a065_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l545_c8_a065_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l545_c8_a065_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l545_c8_a065_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l545_c8_a065_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l545_c8_a065_return_output := has_written_to_n_MUX_uxn_opcodes_h_l545_c8_a065_return_output;

     -- t8_MUX[uxn_opcodes_h_l517_c7_b7f4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l517_c7_b7f4_cond <= VAR_t8_MUX_uxn_opcodes_h_l517_c7_b7f4_cond;
     t8_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue;
     t8_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output := t8_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l545_c8_a065] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c8_a065_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c8_a065_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c8_a065_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c8_a065_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c8_a065_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c8_a065_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c8_a065_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c8_a065_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_opcodes_h_l526_c8_afdd_right := VAR_BIN_OP_AND_uxn_opcodes_h_l526_c29_27ff_return_output;
     VAR_MUX_uxn_opcodes_h_l521_c32_1c84_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l521_c32_c00c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l514_c7_269f_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse := VAR_MUX_uxn_opcodes_h_l525_c15_bab8_return_output;
     VAR_device_in_uxn_opcodes_h_l527_c23_827b_device_address := VAR_MUX_uxn_opcodes_h_l525_c15_bab8_return_output;
     VAR_printf_uxn_opcodes_h_l503_c3_4235_uxn_opcodes_h_l503_c3_4235_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l502_c1_058e_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l526_c3_114c_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l538_c8_3dcc_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l538_c8_3dcc_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l545_c8_a065_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l526_c3_114c_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l538_c8_3dcc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l538_c8_3dcc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l545_c8_a065_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l514_c7_269f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l514_c7_269f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l538_c8_3dcc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l545_c8_a065_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l538_c8_3dcc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l545_c8_a065_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l538_c8_3dcc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l545_c8_a065_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l514_c7_269f_iffalse := VAR_t8_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l514_c7_269f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l514_c7_269f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l514_c7_269f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l514_c7_269f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l514_c7_269f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l514_c7_269f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l514_c7_269f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l514_c7_269f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l514_c7_269f_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l526_c8_afdd] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l526_c8_afdd_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l526_c8_afdd_left;
     BIN_OP_OR_uxn_opcodes_h_l526_c8_afdd_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l526_c8_afdd_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l526_c8_afdd_return_output := BIN_OP_OR_uxn_opcodes_h_l526_c8_afdd_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l538_c8_3dcc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l538_c8_3dcc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l538_c8_3dcc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l538_c8_3dcc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l538_c8_3dcc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l538_c8_3dcc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l538_c8_3dcc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l538_c8_3dcc_return_output := result_stack_value_MUX_uxn_opcodes_h_l538_c8_3dcc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l538_c8_3dcc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l538_c8_3dcc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l538_c8_3dcc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l538_c8_3dcc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l538_c8_3dcc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l538_c8_3dcc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l538_c8_3dcc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l538_c8_3dcc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l538_c8_3dcc_return_output;

     -- MUX[uxn_opcodes_h_l521_c32_1c84] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l521_c32_1c84_cond <= VAR_MUX_uxn_opcodes_h_l521_c32_1c84_cond;
     MUX_uxn_opcodes_h_l521_c32_1c84_iftrue <= VAR_MUX_uxn_opcodes_h_l521_c32_1c84_iftrue;
     MUX_uxn_opcodes_h_l521_c32_1c84_iffalse <= VAR_MUX_uxn_opcodes_h_l521_c32_1c84_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l521_c32_1c84_return_output := MUX_uxn_opcodes_h_l521_c32_1c84_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l538_c8_3dcc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l538_c8_3dcc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l538_c8_3dcc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l538_c8_3dcc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l538_c8_3dcc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l538_c8_3dcc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l538_c8_3dcc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l538_c8_3dcc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l538_c8_3dcc_return_output;

     -- printf_uxn_opcodes_h_l503_c3_4235[uxn_opcodes_h_l503_c3_4235] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l503_c3_4235_uxn_opcodes_h_l503_c3_4235_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l503_c3_4235_uxn_opcodes_h_l503_c3_4235_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- dei_param_MUX[uxn_opcodes_h_l517_c7_b7f4] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l517_c7_b7f4_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l517_c7_b7f4_cond;
     dei_param_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue;
     dei_param_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output := dei_param_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l514_c7_269f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l514_c7_269f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l514_c7_269f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l514_c7_269f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l514_c7_269f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l514_c7_269f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l514_c7_269f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l514_c7_269f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l514_c7_269f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l538_c8_3dcc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l538_c8_3dcc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l538_c8_3dcc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l538_c8_3dcc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l538_c8_3dcc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l538_c8_3dcc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l538_c8_3dcc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l538_c8_3dcc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l538_c8_3dcc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l517_c7_b7f4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c7_b7f4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c7_b7f4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output;

     -- t8_MUX[uxn_opcodes_h_l514_c7_269f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l514_c7_269f_cond <= VAR_t8_MUX_uxn_opcodes_h_l514_c7_269f_cond;
     t8_MUX_uxn_opcodes_h_l514_c7_269f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l514_c7_269f_iftrue;
     t8_MUX_uxn_opcodes_h_l514_c7_269f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l514_c7_269f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l514_c7_269f_return_output := t8_MUX_uxn_opcodes_h_l514_c7_269f_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l538_c8_3dcc] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l538_c8_3dcc_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l538_c8_3dcc_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l538_c8_3dcc_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l538_c8_3dcc_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l538_c8_3dcc_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l538_c8_3dcc_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l538_c8_3dcc_return_output := has_written_to_n_MUX_uxn_opcodes_h_l538_c8_3dcc_return_output;

     -- Submodule level 3
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l526_c1_531d_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l526_c8_afdd_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l526_c3_114c_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l526_c8_afdd_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l526_c3_114c_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l526_c8_afdd_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l526_c3_114c_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l526_c8_afdd_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l526_c3_114c_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l526_c8_afdd_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l526_c3_114c_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l526_c8_afdd_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l526_c3_114c_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l526_c8_afdd_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l526_c3_114c_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l526_c8_afdd_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l526_c3_114c_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l526_c8_afdd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l526_c3_114c_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l526_c8_afdd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l526_c3_114c_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l526_c8_afdd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l526_c3_114c_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l526_c8_afdd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l526_c3_114c_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l526_c8_afdd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l523_c1_98cd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue := VAR_MUX_uxn_opcodes_h_l521_c32_1c84_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l514_c7_269f_iffalse := VAR_dei_param_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l526_c3_114c_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l538_c8_3dcc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l526_c3_114c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l538_c8_3dcc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l514_c7_269f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l514_c7_269f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l526_c3_114c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l538_c8_3dcc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l526_c3_114c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l538_c8_3dcc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l526_c3_114c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l538_c8_3dcc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse := VAR_t8_MUX_uxn_opcodes_h_l514_c7_269f_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l526_c3_114c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l526_c3_114c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l526_c3_114c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l526_c3_114c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l526_c3_114c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l526_c3_114c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l526_c3_114c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l526_c3_114c_return_output := result_stack_value_MUX_uxn_opcodes_h_l526_c3_114c_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l526_c3_114c] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l526_c3_114c_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l526_c3_114c_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l526_c3_114c_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l526_c3_114c_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l526_c3_114c_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l526_c3_114c_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l526_c3_114c_return_output := current_dei_phase_MUX_uxn_opcodes_h_l526_c3_114c_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l526_c3_114c] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l526_c3_114c_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l526_c3_114c_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l526_c3_114c_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l526_c3_114c_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l526_c3_114c_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l526_c3_114c_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l526_c3_114c_return_output := has_written_to_n_MUX_uxn_opcodes_h_l526_c3_114c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l502_c2_6fce] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l502_c2_6fce_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l502_c2_6fce_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l502_c2_6fce_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l502_c2_6fce_return_output;

     -- t8_MUX[uxn_opcodes_h_l502_c2_6fce] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l502_c2_6fce_cond <= VAR_t8_MUX_uxn_opcodes_h_l502_c2_6fce_cond;
     t8_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue;
     t8_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l502_c2_6fce_return_output := t8_MUX_uxn_opcodes_h_l502_c2_6fce_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l514_c7_269f] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l514_c7_269f_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l514_c7_269f_cond;
     dei_param_MUX_uxn_opcodes_h_l514_c7_269f_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l514_c7_269f_iftrue;
     dei_param_MUX_uxn_opcodes_h_l514_c7_269f_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l514_c7_269f_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l514_c7_269f_return_output := dei_param_MUX_uxn_opcodes_h_l514_c7_269f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l502_c2_6fce] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l502_c2_6fce_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l502_c2_6fce_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l502_c2_6fce_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l502_c2_6fce_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l523_c1_98cd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l523_c1_98cd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l523_c1_98cd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l523_c1_98cd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l523_c1_98cd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l523_c1_98cd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l523_c1_98cd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l523_c1_98cd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l523_c1_98cd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l526_c3_114c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l526_c3_114c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l526_c3_114c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l526_c3_114c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l526_c3_114c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l526_c3_114c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l526_c3_114c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l526_c3_114c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l526_c3_114c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l526_c3_114c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l526_c3_114c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l526_c3_114c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l526_c3_114c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l526_c3_114c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l526_c3_114c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l526_c3_114c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l526_c3_114c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l526_c3_114c_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l526_c3_114c] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l526_c3_114c_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l526_c3_114c_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l526_c3_114c_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l526_c3_114c_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l526_c3_114c_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l526_c3_114c_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l526_c3_114c_return_output := has_written_to_t_MUX_uxn_opcodes_h_l526_c3_114c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l517_c7_b7f4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l517_c7_b7f4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l517_c7_b7f4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l526_c3_114c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l526_c3_114c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l526_c3_114c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l526_c3_114c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l526_c3_114c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l526_c3_114c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l526_c3_114c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l526_c3_114c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l526_c3_114c_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l526_c1_531d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l523_c1_98cd_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l526_c3_114c_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse := VAR_dei_param_MUX_uxn_opcodes_h_l514_c7_269f_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l526_c3_114c_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l526_c3_114c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l526_c3_114c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l526_c3_114c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l514_c7_269f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l526_c3_114c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l526_c3_114c_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l502_c2_6fce_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l517_c7_b7f4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l517_c7_b7f4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l517_c7_b7f4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l517_c7_b7f4] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l517_c7_b7f4_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l517_c7_b7f4_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output := current_dei_phase_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l517_c7_b7f4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l517_c7_b7f4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l517_c7_b7f4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l517_c7_b7f4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l517_c7_b7f4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l517_c7_b7f4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output := result_stack_value_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l502_c2_6fce] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l502_c2_6fce_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l502_c2_6fce_cond;
     dei_param_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue;
     dei_param_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l502_c2_6fce_return_output := dei_param_MUX_uxn_opcodes_h_l502_c2_6fce_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l517_c7_b7f4] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l517_c7_b7f4_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l517_c7_b7f4_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output := has_written_to_n_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l514_c7_269f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l514_c7_269f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l514_c7_269f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l514_c7_269f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l514_c7_269f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l514_c7_269f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l514_c7_269f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l514_c7_269f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l514_c7_269f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l526_c1_531d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l526_c1_531d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l526_c1_531d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l526_c1_531d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l526_c1_531d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l526_c1_531d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l526_c1_531d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l526_c1_531d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l526_c1_531d_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l517_c7_b7f4] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l517_c7_b7f4_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l517_c7_b7f4_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output := has_written_to_t_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l517_c7_b7f4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l517_c7_b7f4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l517_c7_b7f4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output;

     -- Submodule level 5
     VAR_device_in_uxn_opcodes_h_l527_c23_827b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l526_c1_531d_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l514_c7_269f_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output;
     REG_VAR_dei_param := VAR_dei_param_MUX_uxn_opcodes_h_l502_c2_6fce_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l514_c7_269f_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l514_c7_269f_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l514_c7_269f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l514_c7_269f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l514_c7_269f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l514_c7_269f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l514_c7_269f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output;
     -- current_dei_phase_MUX[uxn_opcodes_h_l514_c7_269f] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l514_c7_269f_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l514_c7_269f_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l514_c7_269f_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l514_c7_269f_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l514_c7_269f_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l514_c7_269f_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l514_c7_269f_return_output := current_dei_phase_MUX_uxn_opcodes_h_l514_c7_269f_return_output;

     -- device_in[uxn_opcodes_h_l527_c23_827b] LATENCY=0
     -- Clock enable
     device_in_uxn_opcodes_h_l527_c23_827b_CLOCK_ENABLE <= VAR_device_in_uxn_opcodes_h_l527_c23_827b_CLOCK_ENABLE;
     -- Inputs
     device_in_uxn_opcodes_h_l527_c23_827b_device_address <= VAR_device_in_uxn_opcodes_h_l527_c23_827b_device_address;
     device_in_uxn_opcodes_h_l527_c23_827b_phase <= VAR_device_in_uxn_opcodes_h_l527_c23_827b_phase;
     device_in_uxn_opcodes_h_l527_c23_827b_previous_device_ram_read <= VAR_device_in_uxn_opcodes_h_l527_c23_827b_previous_device_ram_read;
     -- Outputs
     VAR_device_in_uxn_opcodes_h_l527_c23_827b_return_output := device_in_uxn_opcodes_h_l527_c23_827b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l514_c7_269f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l514_c7_269f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l514_c7_269f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l514_c7_269f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l514_c7_269f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l514_c7_269f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l514_c7_269f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l514_c7_269f_return_output := result_stack_value_MUX_uxn_opcodes_h_l514_c7_269f_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l514_c7_269f] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l514_c7_269f_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l514_c7_269f_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l514_c7_269f_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l514_c7_269f_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l514_c7_269f_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l514_c7_269f_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l514_c7_269f_return_output := has_written_to_t_MUX_uxn_opcodes_h_l514_c7_269f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l514_c7_269f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l514_c7_269f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l514_c7_269f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l514_c7_269f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l514_c7_269f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l514_c7_269f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l514_c7_269f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l514_c7_269f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l514_c7_269f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l502_c2_6fce] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l502_c2_6fce_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l502_c2_6fce_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l502_c2_6fce_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l502_c2_6fce_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l514_c7_269f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l514_c7_269f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l514_c7_269f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l514_c7_269f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l514_c7_269f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l514_c7_269f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l514_c7_269f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l514_c7_269f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l514_c7_269f_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l514_c7_269f] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l514_c7_269f_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l514_c7_269f_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l514_c7_269f_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l514_c7_269f_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l514_c7_269f_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l514_c7_269f_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l514_c7_269f_return_output := has_written_to_n_MUX_uxn_opcodes_h_l514_c7_269f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l514_c7_269f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l514_c7_269f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l514_c7_269f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l514_c7_269f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l514_c7_269f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l514_c7_269f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l514_c7_269f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l514_c7_269f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l514_c7_269f_return_output;

     -- Submodule level 6
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l514_c7_269f_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l526_c3_114c_iftrue := VAR_device_in_uxn_opcodes_h_l527_c23_827b_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l514_c7_269f_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l514_c7_269f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l514_c7_269f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l514_c7_269f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l514_c7_269f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l514_c7_269f_return_output;
     -- device_in_result_MUX[uxn_opcodes_h_l526_c3_114c] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l526_c3_114c_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l526_c3_114c_cond;
     device_in_result_MUX_uxn_opcodes_h_l526_c3_114c_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l526_c3_114c_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l526_c3_114c_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l526_c3_114c_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l526_c3_114c_return_output := device_in_result_MUX_uxn_opcodes_h_l526_c3_114c_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l502_c2_6fce] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l502_c2_6fce_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l502_c2_6fce_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l502_c2_6fce_return_output := has_written_to_t_MUX_uxn_opcodes_h_l502_c2_6fce_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l502_c2_6fce] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l502_c2_6fce_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l502_c2_6fce_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l502_c2_6fce_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l502_c2_6fce_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l502_c2_6fce] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l502_c2_6fce_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l502_c2_6fce_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l502_c2_6fce_return_output := has_written_to_n_MUX_uxn_opcodes_h_l502_c2_6fce_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l502_c2_6fce] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l502_c2_6fce_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l502_c2_6fce_cond;
     result_stack_value_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l502_c2_6fce_return_output := result_stack_value_MUX_uxn_opcodes_h_l502_c2_6fce_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l502_c2_6fce] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l502_c2_6fce_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l502_c2_6fce_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l502_c2_6fce_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l502_c2_6fce_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l502_c2_6fce] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l502_c2_6fce_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l502_c2_6fce_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l502_c2_6fce_return_output := current_dei_phase_MUX_uxn_opcodes_h_l502_c2_6fce_return_output;

     -- CONST_REF_RD_uint1_t_device_in_result_t_is_device_ram_read_d41d[uxn_opcodes_h_l528_c32_e802] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l528_c32_e802_return_output := VAR_device_in_uxn_opcodes_h_l527_c23_827b_return_output.is_device_ram_read;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l502_c2_6fce] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l502_c2_6fce_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l502_c2_6fce_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l502_c2_6fce_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l502_c2_6fce_return_output;

     -- CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d[uxn_opcodes_h_l529_c32_288e] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l529_c32_288e_return_output := VAR_device_in_uxn_opcodes_h_l527_c23_827b_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l532_l534_DUPLICATE_d3fb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l532_l534_DUPLICATE_d3fb_return_output := VAR_device_in_uxn_opcodes_h_l527_c23_827b_return_output.is_dei_done;

     -- Submodule level 7
     VAR_BIN_OP_AND_uxn_opcodes_h_l532_c9_04ad_right := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l532_l534_DUPLICATE_d3fb_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l534_c11_bbca_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l532_l534_DUPLICATE_d3fb_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l526_c3_114c_iftrue := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l528_c32_e802_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l526_c3_114c_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l529_c32_288e_return_output;
     REG_VAR_current_dei_phase := VAR_current_dei_phase_MUX_uxn_opcodes_h_l502_c2_6fce_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l526_c3_114c_return_output;
     REG_VAR_has_written_to_n := VAR_has_written_to_n_MUX_uxn_opcodes_h_l502_c2_6fce_return_output;
     REG_VAR_has_written_to_t := VAR_has_written_to_t_MUX_uxn_opcodes_h_l502_c2_6fce_return_output;
     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l526_c3_114c] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l526_c3_114c_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l526_c3_114c_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l526_c3_114c_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l526_c3_114c_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l526_c3_114c_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l526_c3_114c_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l526_c3_114c_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l526_c3_114c_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l532_c9_04ad] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l532_c9_04ad_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l532_c9_04ad_left;
     BIN_OP_AND_uxn_opcodes_h_l532_c9_04ad_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l532_c9_04ad_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l532_c9_04ad_return_output := BIN_OP_AND_uxn_opcodes_h_l532_c9_04ad_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l534_c11_bbca] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l534_c11_bbca_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l534_c11_bbca_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l534_c11_bbca_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l534_c11_bbca_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l534_c11_bbca_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l534_c11_bbca_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l534_c11_bbca_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l534_c11_bbca_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l526_c3_114c] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l526_c3_114c_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l526_c3_114c_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l526_c3_114c_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l526_c3_114c_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l526_c3_114c_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l526_c3_114c_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l526_c3_114c_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l526_c3_114c_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l517_c7_b7f4] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l517_c7_b7f4_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l517_c7_b7f4_cond;
     device_in_result_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output := device_in_result_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output;

     -- Submodule level 8
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86_cond := VAR_BIN_OP_AND_uxn_opcodes_h_l532_c9_04ad_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86_cond := VAR_BIN_OP_AND_uxn_opcodes_h_l532_c9_04ad_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l514_c7_269f_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l534_c11_bbca_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l526_c3_114c_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l526_c3_114c_return_output;
     -- is_first_dei_done_MUX[uxn_opcodes_h_l532_c4_cc86] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l517_c7_b7f4] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l517_c7_b7f4_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l517_c7_b7f4_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l517_c7_b7f4] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l517_c7_b7f4_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l517_c7_b7f4_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l514_c7_269f] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l514_c7_269f_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l514_c7_269f_cond;
     device_in_result_MUX_uxn_opcodes_h_l514_c7_269f_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l514_c7_269f_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l514_c7_269f_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l514_c7_269f_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l514_c7_269f_return_output := device_in_result_MUX_uxn_opcodes_h_l514_c7_269f_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l532_c4_cc86] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86_return_output;

     -- Submodule level 9
     VAR_device_in_result_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l514_c7_269f_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l526_c3_114c_iftrue := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l526_c3_114c_iftrue := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l532_c4_cc86_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l514_c7_269f_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l514_c7_269f_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l514_c7_269f] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l514_c7_269f_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l514_c7_269f_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l514_c7_269f_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l514_c7_269f_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l514_c7_269f_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l514_c7_269f_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l514_c7_269f_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l514_c7_269f_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l502_c2_6fce] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l502_c2_6fce_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l502_c2_6fce_cond;
     device_in_result_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l502_c2_6fce_return_output := device_in_result_MUX_uxn_opcodes_h_l502_c2_6fce_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l514_c7_269f] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l514_c7_269f_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l514_c7_269f_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l514_c7_269f_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l514_c7_269f_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l514_c7_269f_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l514_c7_269f_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l514_c7_269f_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l514_c7_269f_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l526_c3_114c] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l526_c3_114c_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l526_c3_114c_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l526_c3_114c_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l526_c3_114c_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l526_c3_114c_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l526_c3_114c_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l526_c3_114c_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l526_c3_114c_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l526_c3_114c] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l526_c3_114c_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l526_c3_114c_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l526_c3_114c_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l526_c3_114c_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l526_c3_114c_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l526_c3_114c_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l526_c3_114c_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l526_c3_114c_return_output;

     -- Submodule level 10
     REG_VAR_device_in_result := VAR_device_in_result_MUX_uxn_opcodes_h_l502_c2_6fce_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l526_c3_114c_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l526_c3_114c_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l514_c7_269f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l514_c7_269f_return_output;
     -- is_first_dei_done_MUX[uxn_opcodes_h_l517_c7_b7f4] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l502_c2_6fce] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l502_c2_6fce_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l502_c2_6fce_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l502_c2_6fce_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l502_c2_6fce_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l517_c7_b7f4] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l502_c2_6fce] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l502_c2_6fce_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l502_c2_6fce_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l502_c2_6fce_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l502_c2_6fce_return_output;

     -- Submodule level 11
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l514_c7_269f_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l514_c7_269f_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l517_c7_b7f4_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_febe_uxn_opcodes_h_l557_l496_DUPLICATE_6405 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_febe_uxn_opcodes_h_l557_l496_DUPLICATE_6405_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_febe(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l502_c2_6fce_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l502_c2_6fce_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l502_c2_6fce_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l502_c2_6fce_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l502_c2_6fce_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l502_c2_6fce_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l502_c2_6fce_return_output,
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l502_c2_6fce_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l502_c2_6fce_return_output);

     -- is_first_dei_done_MUX[uxn_opcodes_h_l514_c7_269f] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l514_c7_269f_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l514_c7_269f_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l514_c7_269f_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l514_c7_269f_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l514_c7_269f_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l514_c7_269f_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l514_c7_269f_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l514_c7_269f_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l514_c7_269f] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l514_c7_269f_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l514_c7_269f_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l514_c7_269f_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l514_c7_269f_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l514_c7_269f_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l514_c7_269f_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l514_c7_269f_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l514_c7_269f_return_output;

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_febe_uxn_opcodes_h_l557_l496_DUPLICATE_6405_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_febe_uxn_opcodes_h_l557_l496_DUPLICATE_6405_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l514_c7_269f_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l514_c7_269f_return_output;
     -- is_first_dei_done_MUX[uxn_opcodes_h_l502_c2_6fce] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l502_c2_6fce] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce_return_output;

     -- Submodule level 13
     REG_VAR_is_first_dei_done := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce_return_output;
     REG_VAR_is_second_dei_done := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l502_c2_6fce_return_output;
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
