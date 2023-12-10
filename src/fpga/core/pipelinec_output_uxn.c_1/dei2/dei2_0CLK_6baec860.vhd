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
-- Submodules: 76
entity dei2_0CLK_6baec860 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end dei2_0CLK_6baec860;
architecture arch of dei2_0CLK_6baec860 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l443_c6_59d1]
signal BIN_OP_EQ_uxn_opcodes_h_l443_c6_59d1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l443_c6_59d1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l443_c6_59d1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l457_c7_90fa]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c7_90fa_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c7_90fa_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l443_c2_967a]
signal is_second_dei_done_MUX_uxn_opcodes_h_l443_c2_967a_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l443_c2_967a_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l443_c2_967a_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l443_c2_967a_return_output : unsigned(0 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l443_c2_967a]
signal dei_param_MUX_uxn_opcodes_h_l443_c2_967a_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l443_c2_967a_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l443_c2_967a_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l443_c2_967a_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l443_c2_967a]
signal result_u8_value_MUX_uxn_opcodes_h_l443_c2_967a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l443_c2_967a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l443_c2_967a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l443_c2_967a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l443_c2_967a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l443_c2_967a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l443_c2_967a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l443_c2_967a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l443_c2_967a_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l443_c2_967a]
signal result_device_ram_address_MUX_uxn_opcodes_h_l443_c2_967a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l443_c2_967a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l443_c2_967a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l443_c2_967a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l443_c2_967a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l443_c2_967a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l443_c2_967a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l443_c2_967a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l443_c2_967a_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l443_c2_967a]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l443_c2_967a_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l443_c2_967a_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l443_c2_967a_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l443_c2_967a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l443_c2_967a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c2_967a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c2_967a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c2_967a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c2_967a_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l443_c2_967a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l443_c2_967a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l443_c2_967a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l443_c2_967a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l443_c2_967a_return_output : signed(3 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l443_c2_967a]
signal has_written_to_n_MUX_uxn_opcodes_h_l443_c2_967a_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l443_c2_967a_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l443_c2_967a_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l443_c2_967a_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l443_c2_967a]
signal is_first_dei_done_MUX_uxn_opcodes_h_l443_c2_967a_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l443_c2_967a_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l443_c2_967a_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l443_c2_967a_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l443_c2_967a]
signal current_dei_phase_MUX_uxn_opcodes_h_l443_c2_967a_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l443_c2_967a_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l443_c2_967a_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l443_c2_967a_return_output : unsigned(7 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l443_c2_967a]
signal has_written_to_t_MUX_uxn_opcodes_h_l443_c2_967a_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l443_c2_967a_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l443_c2_967a_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l443_c2_967a_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l443_c2_967a]
signal device_in_result_MUX_uxn_opcodes_h_l443_c2_967a_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l443_c2_967a_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l443_c2_967a_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l443_c2_967a_return_output : device_in_result_t;

-- t8_MUX[uxn_opcodes_h_l443_c2_967a]
signal t8_MUX_uxn_opcodes_h_l443_c2_967a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l443_c2_967a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l443_c2_967a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l443_c2_967a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l457_c11_436f]
signal BIN_OP_EQ_uxn_opcodes_h_l457_c11_436f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l457_c11_436f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l457_c11_436f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l461_c1_63af]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_63af_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_63af_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_63af_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_63af_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l457_c7_90fa]
signal is_second_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa_return_output : unsigned(0 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l457_c7_90fa]
signal dei_param_MUX_uxn_opcodes_h_l457_c7_90fa_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l457_c7_90fa_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l457_c7_90fa]
signal result_u8_value_MUX_uxn_opcodes_h_l457_c7_90fa_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l457_c7_90fa_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l457_c7_90fa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l457_c7_90fa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l457_c7_90fa_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l457_c7_90fa]
signal result_device_ram_address_MUX_uxn_opcodes_h_l457_c7_90fa_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l457_c7_90fa_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l457_c7_90fa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l457_c7_90fa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l457_c7_90fa_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l457_c7_90fa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l457_c7_90fa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l457_c7_90fa_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l457_c7_90fa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c7_90fa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c7_90fa_return_output : unsigned(3 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l457_c7_90fa]
signal has_written_to_n_MUX_uxn_opcodes_h_l457_c7_90fa_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l457_c7_90fa_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l457_c7_90fa]
signal is_first_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l457_c7_90fa]
signal current_dei_phase_MUX_uxn_opcodes_h_l457_c7_90fa_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l457_c7_90fa_return_output : unsigned(7 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l457_c7_90fa]
signal has_written_to_t_MUX_uxn_opcodes_h_l457_c7_90fa_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l457_c7_90fa_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l457_c7_90fa]
signal device_in_result_MUX_uxn_opcodes_h_l457_c7_90fa_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l457_c7_90fa_return_output : device_in_result_t;

-- t8_MUX[uxn_opcodes_h_l457_c7_90fa]
signal t8_MUX_uxn_opcodes_h_l457_c7_90fa_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l457_c7_90fa_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l459_c30_a165]
signal sp_relative_shift_uxn_opcodes_h_l459_c30_a165_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l459_c30_a165_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l459_c30_a165_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l459_c30_a165_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l463_c9_e6c7]
signal BIN_OP_EQ_uxn_opcodes_h_l463_c9_e6c7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l463_c9_e6c7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l463_c9_e6c7_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l463_c9_5d1b]
signal MUX_uxn_opcodes_h_l463_c9_5d1b_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l463_c9_5d1b_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l463_c9_5d1b_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l463_c9_5d1b_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l464_c35_fa01]
signal BIN_OP_PLUS_uxn_opcodes_h_l464_c35_fa01_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l464_c35_fa01_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l464_c35_fa01_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l464_c15_5226]
signal MUX_uxn_opcodes_h_l464_c15_5226_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l464_c15_5226_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l464_c15_5226_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l464_c15_5226_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l465_c49_72c0]
signal UNARY_OP_NOT_uxn_opcodes_h_l465_c49_72c0_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l465_c49_72c0_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l465_c29_f1a8]
signal BIN_OP_AND_uxn_opcodes_h_l465_c29_f1a8_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l465_c29_f1a8_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l465_c29_f1a8_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l465_c8_6c46]
signal BIN_OP_OR_uxn_opcodes_h_l465_c8_6c46_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l465_c8_6c46_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l465_c8_6c46_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l465_c1_4770]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_4770_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_4770_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_4770_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_4770_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l465_c3_62b2]
signal is_second_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l465_c3_62b2]
signal result_u8_value_MUX_uxn_opcodes_h_l465_c3_62b2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l465_c3_62b2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l465_c3_62b2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l465_c3_62b2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l465_c3_62b2_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l465_c3_62b2]
signal result_device_ram_address_MUX_uxn_opcodes_h_l465_c3_62b2_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l465_c3_62b2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l465_c3_62b2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l465_c3_62b2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l465_c3_62b2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l465_c3_62b2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c3_62b2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c3_62b2_return_output : unsigned(3 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l465_c3_62b2]
signal has_written_to_n_MUX_uxn_opcodes_h_l465_c3_62b2_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l465_c3_62b2_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l465_c3_62b2]
signal is_first_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l465_c3_62b2]
signal current_dei_phase_MUX_uxn_opcodes_h_l465_c3_62b2_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l465_c3_62b2_return_output : unsigned(7 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l465_c3_62b2]
signal has_written_to_t_MUX_uxn_opcodes_h_l465_c3_62b2_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l465_c3_62b2_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l465_c3_62b2]
signal device_in_result_MUX_uxn_opcodes_h_l465_c3_62b2_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l465_c3_62b2_return_output : device_in_result_t;

-- device_in[uxn_opcodes_h_l466_c23_2073]
signal device_in_uxn_opcodes_h_l466_c23_2073_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_in_uxn_opcodes_h_l466_c23_2073_device_address : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l466_c23_2073_phase : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l466_c23_2073_previous_device_ram_read : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l466_c23_2073_return_output : device_in_result_t;

-- BIN_OP_PLUS[uxn_opcodes_h_l469_c4_f2ca]
signal BIN_OP_PLUS_uxn_opcodes_h_l469_c4_f2ca_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l469_c4_f2ca_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l469_c4_f2ca_return_output : unsigned(8 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l470_c9_35cf]
signal BIN_OP_AND_uxn_opcodes_h_l470_c9_35cf_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l470_c9_35cf_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l470_c9_35cf_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l470_c4_666a]
signal is_second_dei_done_MUX_uxn_opcodes_h_l470_c4_666a_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l470_c4_666a_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l470_c4_666a_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l470_c4_666a_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l470_c4_666a]
signal is_first_dei_done_MUX_uxn_opcodes_h_l470_c4_666a_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l470_c4_666a_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l470_c4_666a_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l470_c4_666a_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l472_c11_5722]
signal is_second_dei_done_MUX_uxn_opcodes_h_l472_c11_5722_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l472_c11_5722_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l472_c11_5722_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l472_c11_5722_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l476_c13_e654]
signal UNARY_OP_NOT_uxn_opcodes_h_l476_c13_e654_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l476_c13_e654_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l476_c8_e46e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_e46e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_e46e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_e46e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_e46e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l476_c8_e46e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_e46e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_e46e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_e46e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_e46e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l476_c8_e46e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_e46e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_e46e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_e46e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_e46e_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l476_c8_e46e]
signal result_u8_value_MUX_uxn_opcodes_h_l476_c8_e46e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l476_c8_e46e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l476_c8_e46e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l476_c8_e46e_return_output : unsigned(7 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l476_c8_e46e]
signal has_written_to_n_MUX_uxn_opcodes_h_l476_c8_e46e_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l476_c8_e46e_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l476_c8_e46e_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l476_c8_e46e_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l476_c8_e46e]
signal current_dei_phase_MUX_uxn_opcodes_h_l476_c8_e46e_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l476_c8_e46e_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l476_c8_e46e_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l476_c8_e46e_return_output : unsigned(7 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l476_c8_e46e]
signal has_written_to_t_MUX_uxn_opcodes_h_l476_c8_e46e_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l476_c8_e46e_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l476_c8_e46e_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l476_c8_e46e_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l483_c13_6de8]
signal UNARY_OP_NOT_uxn_opcodes_h_l483_c13_6de8_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l483_c13_6de8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l483_c8_6e0e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l483_c8_6e0e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l483_c8_6e0e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l483_c8_6e0e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l483_c8_6e0e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l483_c8_6e0e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l483_c8_6e0e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l483_c8_6e0e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l483_c8_6e0e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l483_c8_6e0e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l483_c8_6e0e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c8_6e0e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c8_6e0e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c8_6e0e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c8_6e0e_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l483_c8_6e0e]
signal result_u8_value_MUX_uxn_opcodes_h_l483_c8_6e0e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l483_c8_6e0e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l483_c8_6e0e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l483_c8_6e0e_return_output : unsigned(7 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l483_c8_6e0e]
signal has_written_to_n_MUX_uxn_opcodes_h_l483_c8_6e0e_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l483_c8_6e0e_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l483_c8_6e0e_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l483_c8_6e0e_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l465_l470_DUPLICATE_3cd5
signal UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l465_l470_DUPLICATE_3cd5_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l465_l470_DUPLICATE_3cd5_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_ed08( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.device_ram_address := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_device_ram_write := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l443_c6_59d1
BIN_OP_EQ_uxn_opcodes_h_l443_c6_59d1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l443_c6_59d1_left,
BIN_OP_EQ_uxn_opcodes_h_l443_c6_59d1_right,
BIN_OP_EQ_uxn_opcodes_h_l443_c6_59d1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c7_90fa
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c7_90fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c7_90fa_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c7_90fa_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l443_c2_967a
is_second_dei_done_MUX_uxn_opcodes_h_l443_c2_967a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l443_c2_967a_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l443_c2_967a_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l443_c2_967a_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l443_c2_967a_return_output);

-- dei_param_MUX_uxn_opcodes_h_l443_c2_967a
dei_param_MUX_uxn_opcodes_h_l443_c2_967a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l443_c2_967a_cond,
dei_param_MUX_uxn_opcodes_h_l443_c2_967a_iftrue,
dei_param_MUX_uxn_opcodes_h_l443_c2_967a_iffalse,
dei_param_MUX_uxn_opcodes_h_l443_c2_967a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l443_c2_967a
result_u8_value_MUX_uxn_opcodes_h_l443_c2_967a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l443_c2_967a_cond,
result_u8_value_MUX_uxn_opcodes_h_l443_c2_967a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l443_c2_967a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l443_c2_967a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l443_c2_967a
result_is_stack_write_MUX_uxn_opcodes_h_l443_c2_967a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l443_c2_967a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l443_c2_967a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l443_c2_967a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l443_c2_967a_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l443_c2_967a
result_device_ram_address_MUX_uxn_opcodes_h_l443_c2_967a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l443_c2_967a_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l443_c2_967a_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l443_c2_967a_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l443_c2_967a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l443_c2_967a
result_is_opc_done_MUX_uxn_opcodes_h_l443_c2_967a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l443_c2_967a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l443_c2_967a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l443_c2_967a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l443_c2_967a_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l443_c2_967a
result_is_device_ram_write_MUX_uxn_opcodes_h_l443_c2_967a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l443_c2_967a_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l443_c2_967a_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l443_c2_967a_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l443_c2_967a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c2_967a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c2_967a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c2_967a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c2_967a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c2_967a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c2_967a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l443_c2_967a
result_sp_relative_shift_MUX_uxn_opcodes_h_l443_c2_967a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l443_c2_967a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l443_c2_967a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l443_c2_967a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l443_c2_967a_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l443_c2_967a
has_written_to_n_MUX_uxn_opcodes_h_l443_c2_967a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l443_c2_967a_cond,
has_written_to_n_MUX_uxn_opcodes_h_l443_c2_967a_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l443_c2_967a_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l443_c2_967a_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l443_c2_967a
is_first_dei_done_MUX_uxn_opcodes_h_l443_c2_967a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l443_c2_967a_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l443_c2_967a_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l443_c2_967a_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l443_c2_967a_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l443_c2_967a
current_dei_phase_MUX_uxn_opcodes_h_l443_c2_967a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l443_c2_967a_cond,
current_dei_phase_MUX_uxn_opcodes_h_l443_c2_967a_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l443_c2_967a_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l443_c2_967a_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l443_c2_967a
has_written_to_t_MUX_uxn_opcodes_h_l443_c2_967a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l443_c2_967a_cond,
has_written_to_t_MUX_uxn_opcodes_h_l443_c2_967a_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l443_c2_967a_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l443_c2_967a_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l443_c2_967a
device_in_result_MUX_uxn_opcodes_h_l443_c2_967a : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l443_c2_967a_cond,
device_in_result_MUX_uxn_opcodes_h_l443_c2_967a_iftrue,
device_in_result_MUX_uxn_opcodes_h_l443_c2_967a_iffalse,
device_in_result_MUX_uxn_opcodes_h_l443_c2_967a_return_output);

-- t8_MUX_uxn_opcodes_h_l443_c2_967a
t8_MUX_uxn_opcodes_h_l443_c2_967a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l443_c2_967a_cond,
t8_MUX_uxn_opcodes_h_l443_c2_967a_iftrue,
t8_MUX_uxn_opcodes_h_l443_c2_967a_iffalse,
t8_MUX_uxn_opcodes_h_l443_c2_967a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l457_c11_436f
BIN_OP_EQ_uxn_opcodes_h_l457_c11_436f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l457_c11_436f_left,
BIN_OP_EQ_uxn_opcodes_h_l457_c11_436f_right,
BIN_OP_EQ_uxn_opcodes_h_l457_c11_436f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_63af
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_63af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_63af_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_63af_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_63af_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_63af_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa
is_second_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa_return_output);

-- dei_param_MUX_uxn_opcodes_h_l457_c7_90fa
dei_param_MUX_uxn_opcodes_h_l457_c7_90fa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l457_c7_90fa_cond,
dei_param_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue,
dei_param_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse,
dei_param_MUX_uxn_opcodes_h_l457_c7_90fa_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l457_c7_90fa
result_u8_value_MUX_uxn_opcodes_h_l457_c7_90fa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l457_c7_90fa_cond,
result_u8_value_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l457_c7_90fa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l457_c7_90fa
result_is_stack_write_MUX_uxn_opcodes_h_l457_c7_90fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l457_c7_90fa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l457_c7_90fa_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l457_c7_90fa
result_device_ram_address_MUX_uxn_opcodes_h_l457_c7_90fa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l457_c7_90fa_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l457_c7_90fa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l457_c7_90fa
result_is_opc_done_MUX_uxn_opcodes_h_l457_c7_90fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l457_c7_90fa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l457_c7_90fa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l457_c7_90fa
result_sp_relative_shift_MUX_uxn_opcodes_h_l457_c7_90fa : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l457_c7_90fa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l457_c7_90fa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c7_90fa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c7_90fa : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c7_90fa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c7_90fa_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l457_c7_90fa
has_written_to_n_MUX_uxn_opcodes_h_l457_c7_90fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l457_c7_90fa_cond,
has_written_to_n_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l457_c7_90fa_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa
is_first_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l457_c7_90fa
current_dei_phase_MUX_uxn_opcodes_h_l457_c7_90fa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l457_c7_90fa_cond,
current_dei_phase_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l457_c7_90fa_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l457_c7_90fa
has_written_to_t_MUX_uxn_opcodes_h_l457_c7_90fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l457_c7_90fa_cond,
has_written_to_t_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l457_c7_90fa_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l457_c7_90fa
device_in_result_MUX_uxn_opcodes_h_l457_c7_90fa : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l457_c7_90fa_cond,
device_in_result_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue,
device_in_result_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse,
device_in_result_MUX_uxn_opcodes_h_l457_c7_90fa_return_output);

-- t8_MUX_uxn_opcodes_h_l457_c7_90fa
t8_MUX_uxn_opcodes_h_l457_c7_90fa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l457_c7_90fa_cond,
t8_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue,
t8_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse,
t8_MUX_uxn_opcodes_h_l457_c7_90fa_return_output);

-- sp_relative_shift_uxn_opcodes_h_l459_c30_a165
sp_relative_shift_uxn_opcodes_h_l459_c30_a165 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l459_c30_a165_ins,
sp_relative_shift_uxn_opcodes_h_l459_c30_a165_x,
sp_relative_shift_uxn_opcodes_h_l459_c30_a165_y,
sp_relative_shift_uxn_opcodes_h_l459_c30_a165_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l463_c9_e6c7
BIN_OP_EQ_uxn_opcodes_h_l463_c9_e6c7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l463_c9_e6c7_left,
BIN_OP_EQ_uxn_opcodes_h_l463_c9_e6c7_right,
BIN_OP_EQ_uxn_opcodes_h_l463_c9_e6c7_return_output);

-- MUX_uxn_opcodes_h_l463_c9_5d1b
MUX_uxn_opcodes_h_l463_c9_5d1b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l463_c9_5d1b_cond,
MUX_uxn_opcodes_h_l463_c9_5d1b_iftrue,
MUX_uxn_opcodes_h_l463_c9_5d1b_iffalse,
MUX_uxn_opcodes_h_l463_c9_5d1b_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l464_c35_fa01
BIN_OP_PLUS_uxn_opcodes_h_l464_c35_fa01 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l464_c35_fa01_left,
BIN_OP_PLUS_uxn_opcodes_h_l464_c35_fa01_right,
BIN_OP_PLUS_uxn_opcodes_h_l464_c35_fa01_return_output);

-- MUX_uxn_opcodes_h_l464_c15_5226
MUX_uxn_opcodes_h_l464_c15_5226 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l464_c15_5226_cond,
MUX_uxn_opcodes_h_l464_c15_5226_iftrue,
MUX_uxn_opcodes_h_l464_c15_5226_iffalse,
MUX_uxn_opcodes_h_l464_c15_5226_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l465_c49_72c0
UNARY_OP_NOT_uxn_opcodes_h_l465_c49_72c0 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l465_c49_72c0_expr,
UNARY_OP_NOT_uxn_opcodes_h_l465_c49_72c0_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l465_c29_f1a8
BIN_OP_AND_uxn_opcodes_h_l465_c29_f1a8 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l465_c29_f1a8_left,
BIN_OP_AND_uxn_opcodes_h_l465_c29_f1a8_right,
BIN_OP_AND_uxn_opcodes_h_l465_c29_f1a8_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l465_c8_6c46
BIN_OP_OR_uxn_opcodes_h_l465_c8_6c46 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l465_c8_6c46_left,
BIN_OP_OR_uxn_opcodes_h_l465_c8_6c46_right,
BIN_OP_OR_uxn_opcodes_h_l465_c8_6c46_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_4770
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_4770 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_4770_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_4770_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_4770_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_4770_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2
is_second_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l465_c3_62b2
result_u8_value_MUX_uxn_opcodes_h_l465_c3_62b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l465_c3_62b2_cond,
result_u8_value_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l465_c3_62b2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l465_c3_62b2
result_is_stack_write_MUX_uxn_opcodes_h_l465_c3_62b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l465_c3_62b2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l465_c3_62b2_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l465_c3_62b2
result_device_ram_address_MUX_uxn_opcodes_h_l465_c3_62b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l465_c3_62b2_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l465_c3_62b2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l465_c3_62b2
result_is_opc_done_MUX_uxn_opcodes_h_l465_c3_62b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l465_c3_62b2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l465_c3_62b2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c3_62b2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c3_62b2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c3_62b2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c3_62b2_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l465_c3_62b2
has_written_to_n_MUX_uxn_opcodes_h_l465_c3_62b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l465_c3_62b2_cond,
has_written_to_n_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l465_c3_62b2_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2
is_first_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l465_c3_62b2
current_dei_phase_MUX_uxn_opcodes_h_l465_c3_62b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l465_c3_62b2_cond,
current_dei_phase_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l465_c3_62b2_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l465_c3_62b2
has_written_to_t_MUX_uxn_opcodes_h_l465_c3_62b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l465_c3_62b2_cond,
has_written_to_t_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l465_c3_62b2_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l465_c3_62b2
device_in_result_MUX_uxn_opcodes_h_l465_c3_62b2 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l465_c3_62b2_cond,
device_in_result_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue,
device_in_result_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse,
device_in_result_MUX_uxn_opcodes_h_l465_c3_62b2_return_output);

-- device_in_uxn_opcodes_h_l466_c23_2073
device_in_uxn_opcodes_h_l466_c23_2073 : entity work.device_in_0CLK_85463cfa port map (
clk,
device_in_uxn_opcodes_h_l466_c23_2073_CLOCK_ENABLE,
device_in_uxn_opcodes_h_l466_c23_2073_device_address,
device_in_uxn_opcodes_h_l466_c23_2073_phase,
device_in_uxn_opcodes_h_l466_c23_2073_previous_device_ram_read,
device_in_uxn_opcodes_h_l466_c23_2073_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l469_c4_f2ca
BIN_OP_PLUS_uxn_opcodes_h_l469_c4_f2ca : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l469_c4_f2ca_left,
BIN_OP_PLUS_uxn_opcodes_h_l469_c4_f2ca_right,
BIN_OP_PLUS_uxn_opcodes_h_l469_c4_f2ca_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l470_c9_35cf
BIN_OP_AND_uxn_opcodes_h_l470_c9_35cf : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l470_c9_35cf_left,
BIN_OP_AND_uxn_opcodes_h_l470_c9_35cf_right,
BIN_OP_AND_uxn_opcodes_h_l470_c9_35cf_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l470_c4_666a
is_second_dei_done_MUX_uxn_opcodes_h_l470_c4_666a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l470_c4_666a_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l470_c4_666a_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l470_c4_666a_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l470_c4_666a_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l470_c4_666a
is_first_dei_done_MUX_uxn_opcodes_h_l470_c4_666a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l470_c4_666a_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l470_c4_666a_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l470_c4_666a_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l470_c4_666a_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l472_c11_5722
is_second_dei_done_MUX_uxn_opcodes_h_l472_c11_5722 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l472_c11_5722_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l472_c11_5722_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l472_c11_5722_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l472_c11_5722_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l476_c13_e654
UNARY_OP_NOT_uxn_opcodes_h_l476_c13_e654 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l476_c13_e654_expr,
UNARY_OP_NOT_uxn_opcodes_h_l476_c13_e654_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_e46e
result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_e46e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_e46e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_e46e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_e46e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_e46e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_e46e
result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_e46e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_e46e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_e46e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_e46e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_e46e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_e46e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_e46e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_e46e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_e46e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_e46e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_e46e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l476_c8_e46e
result_u8_value_MUX_uxn_opcodes_h_l476_c8_e46e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l476_c8_e46e_cond,
result_u8_value_MUX_uxn_opcodes_h_l476_c8_e46e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l476_c8_e46e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l476_c8_e46e_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l476_c8_e46e
has_written_to_n_MUX_uxn_opcodes_h_l476_c8_e46e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l476_c8_e46e_cond,
has_written_to_n_MUX_uxn_opcodes_h_l476_c8_e46e_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l476_c8_e46e_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l476_c8_e46e_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l476_c8_e46e
current_dei_phase_MUX_uxn_opcodes_h_l476_c8_e46e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l476_c8_e46e_cond,
current_dei_phase_MUX_uxn_opcodes_h_l476_c8_e46e_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l476_c8_e46e_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l476_c8_e46e_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l476_c8_e46e
has_written_to_t_MUX_uxn_opcodes_h_l476_c8_e46e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l476_c8_e46e_cond,
has_written_to_t_MUX_uxn_opcodes_h_l476_c8_e46e_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l476_c8_e46e_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l476_c8_e46e_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l483_c13_6de8
UNARY_OP_NOT_uxn_opcodes_h_l483_c13_6de8 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l483_c13_6de8_expr,
UNARY_OP_NOT_uxn_opcodes_h_l483_c13_6de8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l483_c8_6e0e
result_is_opc_done_MUX_uxn_opcodes_h_l483_c8_6e0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l483_c8_6e0e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l483_c8_6e0e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l483_c8_6e0e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l483_c8_6e0e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l483_c8_6e0e
result_is_stack_write_MUX_uxn_opcodes_h_l483_c8_6e0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l483_c8_6e0e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l483_c8_6e0e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l483_c8_6e0e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l483_c8_6e0e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c8_6e0e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c8_6e0e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c8_6e0e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c8_6e0e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c8_6e0e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c8_6e0e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l483_c8_6e0e
result_u8_value_MUX_uxn_opcodes_h_l483_c8_6e0e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l483_c8_6e0e_cond,
result_u8_value_MUX_uxn_opcodes_h_l483_c8_6e0e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l483_c8_6e0e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l483_c8_6e0e_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l483_c8_6e0e
has_written_to_n_MUX_uxn_opcodes_h_l483_c8_6e0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l483_c8_6e0e_cond,
has_written_to_n_MUX_uxn_opcodes_h_l483_c8_6e0e_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l483_c8_6e0e_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l483_c8_6e0e_return_output);

-- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l465_l470_DUPLICATE_3cd5
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l465_l470_DUPLICATE_3cd5 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l465_l470_DUPLICATE_3cd5_expr,
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l465_l470_DUPLICATE_3cd5_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l443_c6_59d1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c7_90fa_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l443_c2_967a_return_output,
 dei_param_MUX_uxn_opcodes_h_l443_c2_967a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l443_c2_967a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l443_c2_967a_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l443_c2_967a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l443_c2_967a_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l443_c2_967a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c2_967a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l443_c2_967a_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l443_c2_967a_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l443_c2_967a_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l443_c2_967a_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l443_c2_967a_return_output,
 device_in_result_MUX_uxn_opcodes_h_l443_c2_967a_return_output,
 t8_MUX_uxn_opcodes_h_l443_c2_967a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l457_c11_436f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_63af_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa_return_output,
 dei_param_MUX_uxn_opcodes_h_l457_c7_90fa_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l457_c7_90fa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l457_c7_90fa_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l457_c7_90fa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l457_c7_90fa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l457_c7_90fa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c7_90fa_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l457_c7_90fa_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l457_c7_90fa_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l457_c7_90fa_return_output,
 device_in_result_MUX_uxn_opcodes_h_l457_c7_90fa_return_output,
 t8_MUX_uxn_opcodes_h_l457_c7_90fa_return_output,
 sp_relative_shift_uxn_opcodes_h_l459_c30_a165_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l463_c9_e6c7_return_output,
 MUX_uxn_opcodes_h_l463_c9_5d1b_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l464_c35_fa01_return_output,
 MUX_uxn_opcodes_h_l464_c15_5226_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l465_c49_72c0_return_output,
 BIN_OP_AND_uxn_opcodes_h_l465_c29_f1a8_return_output,
 BIN_OP_OR_uxn_opcodes_h_l465_c8_6c46_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_4770_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l465_c3_62b2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l465_c3_62b2_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l465_c3_62b2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l465_c3_62b2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c3_62b2_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l465_c3_62b2_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l465_c3_62b2_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l465_c3_62b2_return_output,
 device_in_result_MUX_uxn_opcodes_h_l465_c3_62b2_return_output,
 device_in_uxn_opcodes_h_l466_c23_2073_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l469_c4_f2ca_return_output,
 BIN_OP_AND_uxn_opcodes_h_l470_c9_35cf_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l470_c4_666a_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l470_c4_666a_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l472_c11_5722_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l476_c13_e654_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_e46e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_e46e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_e46e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l476_c8_e46e_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l476_c8_e46e_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l476_c8_e46e_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l476_c8_e46e_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l483_c13_6de8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l483_c8_6e0e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l483_c8_6e0e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c8_6e0e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l483_c8_6e0e_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l483_c8_6e0e_return_output,
 UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l465_l470_DUPLICATE_3cd5_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c6_59d1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c6_59d1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c6_59d1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c7_90fa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c7_90fa_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l443_c2_967a_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l443_c2_967a_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l443_c2_967a_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l443_c2_967a_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l443_c2_967a_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l443_c2_967a_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l457_c7_90fa_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l443_c2_967a_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l443_c2_967a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l443_c2_967a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l443_c2_967a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l457_c7_90fa_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l443_c2_967a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l443_c2_967a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l443_c2_967a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l443_c2_967a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l457_c7_90fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l443_c2_967a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l443_c2_967a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l443_c2_967a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l443_c2_967a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l457_c7_90fa_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l443_c2_967a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l443_c2_967a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l443_c2_967a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l443_c2_967a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l457_c7_90fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l443_c2_967a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l443_c2_967a_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l443_c2_967a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l443_c2_967a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l443_c2_967a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l443_c2_967a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l443_c2_967a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c2_967a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l452_c3_d894 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c2_967a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c7_90fa_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c2_967a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c2_967a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l443_c2_967a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_TRUE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l443_c2_967a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l443_c2_967a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l457_c7_90fa_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l443_c2_967a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l443_c2_967a_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l443_c2_967a_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l443_c2_967a_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l457_c7_90fa_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l443_c2_967a_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l443_c2_967a_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l443_c2_967a_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l443_c2_967a_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l443_c2_967a_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l443_c2_967a_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l443_c2_967a_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l451_c3_f811 : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l443_c2_967a_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l457_c7_90fa_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l443_c2_967a_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l443_c2_967a_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l443_c2_967a_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l443_c2_967a_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l457_c7_90fa_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l443_c2_967a_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l443_c2_967a_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l443_c2_967a_iftrue : device_in_result_t;
 variable VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l443_c2_967a_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l443_c2_967a_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l457_c7_90fa_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l443_c2_967a_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l443_c2_967a_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l443_c2_967a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l443_c2_967a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l457_c7_90fa_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l443_c2_967a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l443_c2_967a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c11_436f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c11_436f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c11_436f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_63af_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_63af_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_63af_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_63af_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l457_c7_90fa_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l465_c3_62b2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l457_c7_90fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l465_c3_62b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l457_c7_90fa_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l465_c3_62b2_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l457_c7_90fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l465_c3_62b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l457_c7_90fa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l462_c3_e6c8 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l457_c7_90fa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c3_62b2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c7_90fa_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l465_c3_62b2_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l457_c7_90fa_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l465_c3_62b2_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l457_c7_90fa_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l465_c3_62b2_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l457_c7_90fa_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l465_c3_62b2_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l457_c7_90fa_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l457_c7_90fa_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l459_c30_a165_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l459_c30_a165_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l459_c30_a165_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l459_c30_a165_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l463_c9_5d1b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c9_e6c7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c9_e6c7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c9_e6c7_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l463_c9_5d1b_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l463_c9_5d1b_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l463_c9_5d1b_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l464_c15_5226_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l464_c15_5226_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l464_c15_5226_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l464_c35_fa01_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l464_c35_fa01_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l464_c35_fa01_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l464_c15_5226_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l465_c8_6c46_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l465_c29_f1a8_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l465_c49_72c0_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l465_c49_72c0_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l465_c29_f1a8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l465_c29_f1a8_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l465_c8_6c46_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l465_c8_6c46_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_4770_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_4770_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_4770_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_4770_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l470_c4_666a_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_e46e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l465_c3_62b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_e46e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l465_c3_62b2_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l465_c3_62b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_e46e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l465_c3_62b2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_e46e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c3_62b2_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_e46e_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l465_c3_62b2_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l470_c4_666a_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l469_c4_65fc : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l476_c8_e46e_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l465_c3_62b2_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l476_c8_e46e_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l465_c3_62b2_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l465_c3_62b2_cond : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l466_c23_2073_device_address : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l466_c23_2073_phase : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l466_c23_2073_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l466_c23_2073_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l466_c23_2073_return_output : device_in_result_t;
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l467_c32_1578_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l469_c4_f2ca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l469_c4_f2ca_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l469_c4_f2ca_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l470_c9_35cf_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l470_c9_35cf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l470_c9_35cf_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l470_c4_666a_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l470_c4_666a_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l472_c11_5722_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l470_c4_666a_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l470_c4_666a_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l470_c4_666a_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l470_c4_666a_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l472_c11_5722_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l472_c11_5722_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l472_c11_5722_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_e654_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_e654_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_e46e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_e46e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l483_c8_6e0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_e46e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_e46e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_e46e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l483_c8_6e0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_e46e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_e46e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l479_c4_cfad : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_e46e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c8_6e0e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_e46e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_e46e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_e46e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l483_c8_6e0e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_e46e_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_e46e_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_e46e_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l483_c8_6e0e_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_e46e_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l476_c8_e46e_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l477_c4_cec2 : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l476_c8_e46e_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l476_c8_e46e_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l476_c8_e46e_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l476_c8_e46e_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l476_c8_e46e_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l483_c13_6de8_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l483_c13_6de8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l483_c8_6e0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l483_c8_6e0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l483_c8_6e0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l483_c8_6e0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l483_c8_6e0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l483_c8_6e0e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c8_6e0e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l484_c4_9f47 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c8_6e0e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c8_6e0e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l483_c8_6e0e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l483_c8_6e0e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l483_c8_6e0e_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l483_c8_6e0e_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l483_c8_6e0e_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l483_c8_6e0e_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l465_l443_l457_l483_DUPLICATE_f1b9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l443_l457_l483_DUPLICATE_c123_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l465_l443_l457_DUPLICATE_575e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l465_l476_l457_l483_DUPLICATE_edde_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l465_l457_l483_DUPLICATE_20f9_return_output : unsigned(3 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l465_l470_DUPLICATE_3cd5_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l465_l470_DUPLICATE_3cd5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l472_l470_DUPLICATE_155c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l480_l485_DUPLICATE_ee45_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ed08_uxn_opcodes_h_l437_l494_DUPLICATE_8bb3_return_output : opcode_result_t;
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
     VAR_current_dei_phase_uxn_opcodes_h_l477_c4_cec2 := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l476_c8_e46e_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l477_c4_cec2;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_63af_iftrue := to_unsigned(0, 1);
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l483_c8_6e0e_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l459_c30_a165_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l469_c4_f2ca_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l483_c8_6e0e_iffalse := to_unsigned(0, 1);
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l443_c2_967a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c6_59d1_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l462_c3_e6c8 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse := VAR_result_sp_relative_shift_uxn_opcodes_h_l462_c3_e6c8;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l452_c3_d894 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c2_967a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l452_c3_d894;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c11_436f_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l464_c35_fa01_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_e46e_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l483_c8_6e0e_iffalse := to_unsigned(1, 1);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l476_c8_e46e_iftrue := to_unsigned(1, 1);
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l443_c2_967a_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l443_c2_967a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_4770_iffalse := to_unsigned(0, 1);
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l443_c2_967a_iftrue := to_unsigned(0, 1);
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l470_c4_666a_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l459_c30_a165_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l443_c2_967a_iftrue := to_unsigned(0, 1);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l443_c2_967a_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue := to_unsigned(0, 1);
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l472_c11_5722_iftrue := to_unsigned(1, 1);
     VAR_current_dei_phase_uxn_opcodes_h_l451_c3_f811 := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l443_c2_967a_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l451_c3_f811;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l484_c4_9f47 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c8_6e0e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l484_c4_9f47;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c9_e6c7_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l479_c4_cfad := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_e46e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l479_c4_cfad;

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l469_c4_f2ca_left := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l476_c8_e46e_iffalse := current_dei_phase;
     VAR_device_in_uxn_opcodes_h_l466_c23_2073_phase := current_dei_phase;
     VAR_dei_param_MUX_uxn_opcodes_h_l443_c2_967a_iftrue := dei_param;
     VAR_dei_param_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue := dei_param;
     VAR_device_in_result_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse := device_in_result;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l483_c13_6de8_expr := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_e46e_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l483_c8_6e0e_iffalse := has_written_to_n;
     VAR_BIN_OP_AND_uxn_opcodes_h_l465_c29_f1a8_left := has_written_to_t;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_e654_expr := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l476_c8_e46e_iffalse := has_written_to_t;
     VAR_sp_relative_shift_uxn_opcodes_h_l459_c30_a165_ins := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l464_c15_5226_cond := is_first_dei_done;
     VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l465_l470_DUPLICATE_3cd5_expr := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l470_c4_666a_iffalse := is_first_dei_done;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l465_c49_72c0_expr := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l470_c4_666a_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l472_c11_5722_iffalse := is_second_dei_done;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c6_59d1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c11_436f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c9_e6c7_left := VAR_phase;
     VAR_device_in_uxn_opcodes_h_l466_c23_2073_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_MUX_uxn_opcodes_h_l463_c9_5d1b_iftrue := VAR_previous_stack_read;
     VAR_MUX_uxn_opcodes_h_l463_c9_5d1b_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l443_c2_967a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue := t8;
     -- device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6[uxn_opcodes_h_l443_c2_967a] LATENCY=0
     VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l443_c2_967a_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6(
     device_in_result,
     to_unsigned(0, 1));

     -- BIN_OP_EQ[uxn_opcodes_h_l463_c9_e6c7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l463_c9_e6c7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c9_e6c7_left;
     BIN_OP_EQ_uxn_opcodes_h_l463_c9_e6c7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c9_e6c7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c9_e6c7_return_output := BIN_OP_EQ_uxn_opcodes_h_l463_c9_e6c7_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l459_c30_a165] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l459_c30_a165_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l459_c30_a165_ins;
     sp_relative_shift_uxn_opcodes_h_l459_c30_a165_x <= VAR_sp_relative_shift_uxn_opcodes_h_l459_c30_a165_x;
     sp_relative_shift_uxn_opcodes_h_l459_c30_a165_y <= VAR_sp_relative_shift_uxn_opcodes_h_l459_c30_a165_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l459_c30_a165_return_output := sp_relative_shift_uxn_opcodes_h_l459_c30_a165_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l443_l457_l483_DUPLICATE_c123 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l443_l457_l483_DUPLICATE_c123_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l465_l476_l457_l483_DUPLICATE_edde LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l465_l476_l457_l483_DUPLICATE_edde_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l480_l485_DUPLICATE_ee45 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l480_l485_DUPLICATE_ee45_return_output := device_in_result.dei_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l457_c11_436f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l457_c11_436f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c11_436f_left;
     BIN_OP_EQ_uxn_opcodes_h_l457_c11_436f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c11_436f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c11_436f_return_output := BIN_OP_EQ_uxn_opcodes_h_l457_c11_436f_return_output;

     -- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l465_l470_DUPLICATE_3cd5 LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l465_l470_DUPLICATE_3cd5_expr <= VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l465_l470_DUPLICATE_3cd5_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l465_l470_DUPLICATE_3cd5_return_output := UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l465_l470_DUPLICATE_3cd5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l443_c6_59d1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l443_c6_59d1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c6_59d1_left;
     BIN_OP_EQ_uxn_opcodes_h_l443_c6_59d1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c6_59d1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c6_59d1_return_output := BIN_OP_EQ_uxn_opcodes_h_l443_c6_59d1_return_output;

     -- result_sp_relative_shift_TRUE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l443_c2_967a] LATENCY=0
     VAR_result_sp_relative_shift_TRUE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l443_c2_967a_return_output := result.sp_relative_shift;

     -- result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l443_c2_967a] LATENCY=0
     VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l443_c2_967a_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l465_l457_l483_DUPLICATE_20f9 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l465_l457_l483_DUPLICATE_20f9_return_output := result.stack_address_sp_offset;

     -- UNARY_OP_NOT[uxn_opcodes_h_l476_c13_e654] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l476_c13_e654_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_e654_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_e654_return_output := UNARY_OP_NOT_uxn_opcodes_h_l476_c13_e654_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l483_c13_6de8] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l483_c13_6de8_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l483_c13_6de8_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l483_c13_6de8_return_output := UNARY_OP_NOT_uxn_opcodes_h_l483_c13_6de8_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l465_c49_72c0] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l465_c49_72c0_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l465_c49_72c0_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l465_c49_72c0_return_output := UNARY_OP_NOT_uxn_opcodes_h_l465_c49_72c0_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l469_c4_f2ca] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l469_c4_f2ca_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l469_c4_f2ca_left;
     BIN_OP_PLUS_uxn_opcodes_h_l469_c4_f2ca_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l469_c4_f2ca_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l469_c4_f2ca_return_output := BIN_OP_PLUS_uxn_opcodes_h_l469_c4_f2ca_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l465_l443_l457_l483_DUPLICATE_f1b9 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l465_l443_l457_l483_DUPLICATE_f1b9_return_output := result.u8_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l465_l443_l457_DUPLICATE_575e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l465_l443_l457_DUPLICATE_575e_return_output := result.device_ram_address;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c7_90fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c6_59d1_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l443_c2_967a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c6_59d1_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l443_c2_967a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c6_59d1_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l443_c2_967a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c6_59d1_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l443_c2_967a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c6_59d1_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l443_c2_967a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c6_59d1_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l443_c2_967a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c6_59d1_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l443_c2_967a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c6_59d1_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l443_c2_967a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c6_59d1_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l443_c2_967a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c6_59d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l443_c2_967a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c6_59d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l443_c2_967a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c6_59d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l443_c2_967a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c6_59d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c2_967a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c6_59d1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l443_c2_967a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c6_59d1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l443_c2_967a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c6_59d1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_63af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c11_436f_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l457_c7_90fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c11_436f_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l457_c7_90fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c11_436f_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l457_c7_90fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c11_436f_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l457_c7_90fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c11_436f_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l457_c7_90fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c11_436f_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c11_436f_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c11_436f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l457_c7_90fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c11_436f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l457_c7_90fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c11_436f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l457_c7_90fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c11_436f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l457_c7_90fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c11_436f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c7_90fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c11_436f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l457_c7_90fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c11_436f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l457_c7_90fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l457_c11_436f_return_output;
     VAR_MUX_uxn_opcodes_h_l463_c9_5d1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c9_e6c7_return_output;
     VAR_current_dei_phase_uxn_opcodes_h_l469_c4_65fc := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l469_c4_f2ca_return_output, 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l465_l476_l457_l483_DUPLICATE_edde_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l465_l476_l457_l483_DUPLICATE_edde_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_e46e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l465_l476_l457_l483_DUPLICATE_edde_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l483_c8_6e0e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l465_l476_l457_l483_DUPLICATE_edde_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l443_c2_967a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l443_l457_l483_DUPLICATE_c123_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l443_l457_l483_DUPLICATE_c123_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l483_c8_6e0e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l443_l457_l483_DUPLICATE_c123_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l465_l457_l483_DUPLICATE_20f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l465_l457_l483_DUPLICATE_20f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c8_6e0e_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l465_l457_l483_DUPLICATE_20f9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_e46e_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l480_l485_DUPLICATE_ee45_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l483_c8_6e0e_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l480_l485_DUPLICATE_ee45_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l443_c2_967a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l465_l443_l457_DUPLICATE_575e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l465_l443_l457_DUPLICATE_575e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l465_l443_l457_DUPLICATE_575e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l443_c2_967a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l465_l443_l457_l483_DUPLICATE_f1b9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l465_l443_l457_l483_DUPLICATE_f1b9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l465_l443_l457_l483_DUPLICATE_f1b9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l483_c8_6e0e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l465_l443_l457_l483_DUPLICATE_f1b9_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l465_c29_f1a8_right := VAR_UNARY_OP_NOT_uxn_opcodes_h_l465_c49_72c0_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l476_c8_e46e_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_e654_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_e46e_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_e654_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l476_c8_e46e_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_e654_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_e46e_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_e654_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_e46e_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_e654_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_e46e_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_e654_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_e46e_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_e654_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l483_c8_6e0e_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l483_c13_6de8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l483_c8_6e0e_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l483_c13_6de8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l483_c8_6e0e_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l483_c13_6de8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c8_6e0e_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l483_c13_6de8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l483_c8_6e0e_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l483_c13_6de8_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l470_c9_35cf_left := VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l465_l470_DUPLICATE_3cd5_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l465_c8_6c46_left := VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l465_l470_DUPLICATE_3cd5_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l443_c2_967a_iftrue := VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l443_c2_967a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l443_c2_967a_iffalse := VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l443_c2_967a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l443_c2_967a_iftrue := VAR_result_sp_relative_shift_TRUE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l443_c2_967a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l459_c30_a165_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l469_c4_65fc;
     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l443_c2_967a] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l443_c2_967a_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l443_c2_967a_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l443_c2_967a_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l443_c2_967a_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l443_c2_967a_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l443_c2_967a_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l443_c2_967a_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l443_c2_967a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l483_c8_6e0e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c8_6e0e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c8_6e0e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c8_6e0e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c8_6e0e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c8_6e0e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c8_6e0e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c8_6e0e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c8_6e0e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l483_c8_6e0e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l483_c8_6e0e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l483_c8_6e0e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l483_c8_6e0e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l483_c8_6e0e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l483_c8_6e0e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l483_c8_6e0e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l483_c8_6e0e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l483_c8_6e0e_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l483_c8_6e0e] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l483_c8_6e0e_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l483_c8_6e0e_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l483_c8_6e0e_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l483_c8_6e0e_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l483_c8_6e0e_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l483_c8_6e0e_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l483_c8_6e0e_return_output := has_written_to_n_MUX_uxn_opcodes_h_l483_c8_6e0e_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l465_c29_f1a8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l465_c29_f1a8_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l465_c29_f1a8_left;
     BIN_OP_AND_uxn_opcodes_h_l465_c29_f1a8_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l465_c29_f1a8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l465_c29_f1a8_return_output := BIN_OP_AND_uxn_opcodes_h_l465_c29_f1a8_return_output;

     -- MUX[uxn_opcodes_h_l463_c9_5d1b] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l463_c9_5d1b_cond <= VAR_MUX_uxn_opcodes_h_l463_c9_5d1b_cond;
     MUX_uxn_opcodes_h_l463_c9_5d1b_iftrue <= VAR_MUX_uxn_opcodes_h_l463_c9_5d1b_iftrue;
     MUX_uxn_opcodes_h_l463_c9_5d1b_iffalse <= VAR_MUX_uxn_opcodes_h_l463_c9_5d1b_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l463_c9_5d1b_return_output := MUX_uxn_opcodes_h_l463_c9_5d1b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l483_c8_6e0e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l483_c8_6e0e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l483_c8_6e0e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l483_c8_6e0e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l483_c8_6e0e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l483_c8_6e0e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l483_c8_6e0e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l483_c8_6e0e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l483_c8_6e0e_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l476_c8_e46e] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l476_c8_e46e_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l476_c8_e46e_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l476_c8_e46e_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l476_c8_e46e_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l476_c8_e46e_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l476_c8_e46e_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l476_c8_e46e_return_output := has_written_to_t_MUX_uxn_opcodes_h_l476_c8_e46e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l457_c7_90fa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l457_c7_90fa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l457_c7_90fa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l457_c7_90fa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l457_c7_90fa_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l476_c8_e46e] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l476_c8_e46e_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l476_c8_e46e_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l476_c8_e46e_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l476_c8_e46e_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l476_c8_e46e_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l476_c8_e46e_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l476_c8_e46e_return_output := current_dei_phase_MUX_uxn_opcodes_h_l476_c8_e46e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l457_c7_90fa] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c7_90fa_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c7_90fa_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c7_90fa_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c7_90fa_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l483_c8_6e0e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l483_c8_6e0e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l483_c8_6e0e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l483_c8_6e0e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l483_c8_6e0e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l483_c8_6e0e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l483_c8_6e0e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l483_c8_6e0e_return_output := result_u8_value_MUX_uxn_opcodes_h_l483_c8_6e0e_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_opcodes_h_l465_c8_6c46_right := VAR_BIN_OP_AND_uxn_opcodes_h_l465_c29_f1a8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_63af_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l457_c7_90fa_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l464_c35_fa01_left := VAR_MUX_uxn_opcodes_h_l463_c9_5d1b_return_output;
     VAR_MUX_uxn_opcodes_h_l464_c15_5226_iffalse := VAR_MUX_uxn_opcodes_h_l463_c9_5d1b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse := VAR_MUX_uxn_opcodes_h_l463_c9_5d1b_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l476_c8_e46e_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_e46e_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l483_c8_6e0e_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l476_c8_e46e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_e46e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l483_c8_6e0e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_e46e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l483_c8_6e0e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l443_c2_967a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l457_c7_90fa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_e46e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c8_6e0e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_e46e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l483_c8_6e0e_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l464_c35_fa01] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l464_c35_fa01_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l464_c35_fa01_left;
     BIN_OP_PLUS_uxn_opcodes_h_l464_c35_fa01_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l464_c35_fa01_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l464_c35_fa01_return_output := BIN_OP_PLUS_uxn_opcodes_h_l464_c35_fa01_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l465_c8_6c46] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l465_c8_6c46_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l465_c8_6c46_left;
     BIN_OP_OR_uxn_opcodes_h_l465_c8_6c46_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l465_c8_6c46_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l465_c8_6c46_return_output := BIN_OP_OR_uxn_opcodes_h_l465_c8_6c46_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l443_c2_967a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l443_c2_967a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l443_c2_967a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l443_c2_967a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l443_c2_967a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l443_c2_967a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l443_c2_967a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l443_c2_967a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l443_c2_967a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l476_c8_e46e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l476_c8_e46e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_e46e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l476_c8_e46e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_e46e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l476_c8_e46e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_e46e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_e46e_return_output := result_u8_value_MUX_uxn_opcodes_h_l476_c8_e46e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l476_c8_e46e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_e46e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_e46e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_e46e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_e46e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_e46e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_e46e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_e46e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_e46e_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l476_c8_e46e] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l476_c8_e46e_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_e46e_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l476_c8_e46e_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_e46e_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l476_c8_e46e_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_e46e_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_e46e_return_output := has_written_to_n_MUX_uxn_opcodes_h_l476_c8_e46e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l476_c8_e46e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_e46e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_e46e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_e46e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_e46e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_e46e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_e46e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_e46e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_e46e_return_output;

     -- t8_MUX[uxn_opcodes_h_l457_c7_90fa] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l457_c7_90fa_cond <= VAR_t8_MUX_uxn_opcodes_h_l457_c7_90fa_cond;
     t8_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue;
     t8_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l457_c7_90fa_return_output := t8_MUX_uxn_opcodes_h_l457_c7_90fa_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l461_c1_63af] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_63af_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_63af_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_63af_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_63af_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_63af_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_63af_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_63af_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_63af_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l476_c8_e46e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_e46e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_e46e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_e46e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_e46e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_e46e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_e46e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_e46e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_e46e_return_output;

     -- Submodule level 3
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_4770_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l465_c8_6c46_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l465_c3_62b2_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l465_c8_6c46_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l465_c3_62b2_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l465_c8_6c46_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l465_c3_62b2_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l465_c8_6c46_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l465_c3_62b2_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l465_c8_6c46_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l465_c8_6c46_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l465_c8_6c46_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l465_c3_62b2_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l465_c8_6c46_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l465_c3_62b2_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l465_c8_6c46_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l465_c3_62b2_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l465_c8_6c46_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c3_62b2_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l465_c8_6c46_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l465_c3_62b2_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l465_c8_6c46_return_output;
     VAR_MUX_uxn_opcodes_h_l464_c15_5226_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l464_c35_fa01_return_output, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_4770_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_63af_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_e46e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_e46e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_e46e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_e46e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_e46e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l443_c2_967a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l457_c7_90fa_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l465_c3_62b2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l465_c3_62b2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l465_c3_62b2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l465_c3_62b2_return_output := result_u8_value_MUX_uxn_opcodes_h_l465_c3_62b2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l465_c3_62b2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l465_c3_62b2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l465_c3_62b2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l465_c3_62b2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l465_c3_62b2_return_output;

     -- t8_MUX[uxn_opcodes_h_l443_c2_967a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l443_c2_967a_cond <= VAR_t8_MUX_uxn_opcodes_h_l443_c2_967a_cond;
     t8_MUX_uxn_opcodes_h_l443_c2_967a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l443_c2_967a_iftrue;
     t8_MUX_uxn_opcodes_h_l443_c2_967a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l443_c2_967a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l443_c2_967a_return_output := t8_MUX_uxn_opcodes_h_l443_c2_967a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l465_c3_62b2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c3_62b2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c3_62b2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c3_62b2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c3_62b2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l465_c1_4770] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_4770_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_4770_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_4770_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_4770_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_4770_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_4770_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_4770_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_4770_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l465_c3_62b2] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l465_c3_62b2_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l465_c3_62b2_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l465_c3_62b2_return_output := has_written_to_t_MUX_uxn_opcodes_h_l465_c3_62b2_return_output;

     -- MUX[uxn_opcodes_h_l464_c15_5226] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l464_c15_5226_cond <= VAR_MUX_uxn_opcodes_h_l464_c15_5226_cond;
     MUX_uxn_opcodes_h_l464_c15_5226_iftrue <= VAR_MUX_uxn_opcodes_h_l464_c15_5226_iftrue;
     MUX_uxn_opcodes_h_l464_c15_5226_iffalse <= VAR_MUX_uxn_opcodes_h_l464_c15_5226_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l464_c15_5226_return_output := MUX_uxn_opcodes_h_l464_c15_5226_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l465_c3_62b2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l465_c3_62b2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l465_c3_62b2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l465_c3_62b2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l465_c3_62b2_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l465_c3_62b2] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l465_c3_62b2_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l465_c3_62b2_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l465_c3_62b2_return_output := has_written_to_n_MUX_uxn_opcodes_h_l465_c3_62b2_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l465_c3_62b2] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l465_c3_62b2_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l465_c3_62b2_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l465_c3_62b2_return_output := current_dei_phase_MUX_uxn_opcodes_h_l465_c3_62b2_return_output;

     -- Submodule level 4
     VAR_dei_param_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse := VAR_MUX_uxn_opcodes_h_l464_c15_5226_return_output;
     VAR_device_in_uxn_opcodes_h_l466_c23_2073_device_address := VAR_MUX_uxn_opcodes_h_l464_c15_5226_return_output;
     VAR_device_in_uxn_opcodes_h_l466_c23_2073_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_4770_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l465_c3_62b2_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l465_c3_62b2_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l465_c3_62b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l465_c3_62b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l465_c3_62b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c3_62b2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l465_c3_62b2_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l443_c2_967a_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l457_c7_90fa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c7_90fa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c7_90fa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c7_90fa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c7_90fa_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l457_c7_90fa] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l457_c7_90fa_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l457_c7_90fa_cond;
     dei_param_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue;
     dei_param_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l457_c7_90fa_return_output := dei_param_MUX_uxn_opcodes_h_l457_c7_90fa_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l457_c7_90fa] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l457_c7_90fa_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l457_c7_90fa_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l457_c7_90fa_return_output := has_written_to_t_MUX_uxn_opcodes_h_l457_c7_90fa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l457_c7_90fa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l457_c7_90fa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l457_c7_90fa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l457_c7_90fa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l457_c7_90fa_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l457_c7_90fa] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l457_c7_90fa_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l457_c7_90fa_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l457_c7_90fa_return_output := current_dei_phase_MUX_uxn_opcodes_h_l457_c7_90fa_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l457_c7_90fa] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l457_c7_90fa_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l457_c7_90fa_cond;
     result_u8_value_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l457_c7_90fa_return_output := result_u8_value_MUX_uxn_opcodes_h_l457_c7_90fa_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l457_c7_90fa] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l457_c7_90fa_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l457_c7_90fa_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l457_c7_90fa_return_output := has_written_to_n_MUX_uxn_opcodes_h_l457_c7_90fa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l457_c7_90fa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l457_c7_90fa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l457_c7_90fa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l457_c7_90fa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l457_c7_90fa_return_output;

     -- device_in[uxn_opcodes_h_l466_c23_2073] LATENCY=0
     -- Clock enable
     device_in_uxn_opcodes_h_l466_c23_2073_CLOCK_ENABLE <= VAR_device_in_uxn_opcodes_h_l466_c23_2073_CLOCK_ENABLE;
     -- Inputs
     device_in_uxn_opcodes_h_l466_c23_2073_device_address <= VAR_device_in_uxn_opcodes_h_l466_c23_2073_device_address;
     device_in_uxn_opcodes_h_l466_c23_2073_phase <= VAR_device_in_uxn_opcodes_h_l466_c23_2073_phase;
     device_in_uxn_opcodes_h_l466_c23_2073_previous_device_ram_read <= VAR_device_in_uxn_opcodes_h_l466_c23_2073_previous_device_ram_read;
     -- Outputs
     VAR_device_in_uxn_opcodes_h_l466_c23_2073_return_output := device_in_uxn_opcodes_h_l466_c23_2073_return_output;

     -- Submodule level 5
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l443_c2_967a_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l457_c7_90fa_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l443_c2_967a_iffalse := VAR_dei_param_MUX_uxn_opcodes_h_l457_c7_90fa_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue := VAR_device_in_uxn_opcodes_h_l466_c23_2073_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l443_c2_967a_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l457_c7_90fa_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l443_c2_967a_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l457_c7_90fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l443_c2_967a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l457_c7_90fa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l443_c2_967a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l457_c7_90fa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c2_967a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l457_c7_90fa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l443_c2_967a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l457_c7_90fa_return_output;
     -- dei_param_MUX[uxn_opcodes_h_l443_c2_967a] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l443_c2_967a_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l443_c2_967a_cond;
     dei_param_MUX_uxn_opcodes_h_l443_c2_967a_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l443_c2_967a_iftrue;
     dei_param_MUX_uxn_opcodes_h_l443_c2_967a_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l443_c2_967a_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l443_c2_967a_return_output := dei_param_MUX_uxn_opcodes_h_l443_c2_967a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l443_c2_967a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l443_c2_967a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l443_c2_967a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l443_c2_967a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l443_c2_967a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l443_c2_967a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l443_c2_967a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l443_c2_967a_return_output := result_u8_value_MUX_uxn_opcodes_h_l443_c2_967a_return_output;

     -- CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d[uxn_opcodes_h_l467_c32_1578] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l467_c32_1578_return_output := VAR_device_in_uxn_opcodes_h_l466_c23_2073_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l472_l470_DUPLICATE_155c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l472_l470_DUPLICATE_155c_return_output := VAR_device_in_uxn_opcodes_h_l466_c23_2073_return_output.is_dei_done;

     -- has_written_to_n_MUX[uxn_opcodes_h_l443_c2_967a] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l443_c2_967a_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l443_c2_967a_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l443_c2_967a_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l443_c2_967a_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l443_c2_967a_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l443_c2_967a_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l443_c2_967a_return_output := has_written_to_n_MUX_uxn_opcodes_h_l443_c2_967a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l443_c2_967a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l443_c2_967a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l443_c2_967a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l443_c2_967a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l443_c2_967a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l443_c2_967a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l443_c2_967a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l443_c2_967a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l443_c2_967a_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l465_c3_62b2] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l465_c3_62b2_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l465_c3_62b2_cond;
     device_in_result_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l465_c3_62b2_return_output := device_in_result_MUX_uxn_opcodes_h_l465_c3_62b2_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l443_c2_967a] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l443_c2_967a_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l443_c2_967a_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l443_c2_967a_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l443_c2_967a_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l443_c2_967a_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l443_c2_967a_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l443_c2_967a_return_output := current_dei_phase_MUX_uxn_opcodes_h_l443_c2_967a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l443_c2_967a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c2_967a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c2_967a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c2_967a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c2_967a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c2_967a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c2_967a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c2_967a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c2_967a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l443_c2_967a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l443_c2_967a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l443_c2_967a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l443_c2_967a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l443_c2_967a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l443_c2_967a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l443_c2_967a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l443_c2_967a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l443_c2_967a_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l443_c2_967a] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l443_c2_967a_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l443_c2_967a_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l443_c2_967a_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l443_c2_967a_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l443_c2_967a_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l443_c2_967a_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l443_c2_967a_return_output := has_written_to_t_MUX_uxn_opcodes_h_l443_c2_967a_return_output;

     -- Submodule level 6
     VAR_BIN_OP_AND_uxn_opcodes_h_l470_c9_35cf_right := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l472_l470_DUPLICATE_155c_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l472_c11_5722_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l472_l470_DUPLICATE_155c_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l467_c32_1578_return_output;
     REG_VAR_current_dei_phase := VAR_current_dei_phase_MUX_uxn_opcodes_h_l443_c2_967a_return_output;
     REG_VAR_dei_param := VAR_dei_param_MUX_uxn_opcodes_h_l443_c2_967a_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l465_c3_62b2_return_output;
     REG_VAR_has_written_to_n := VAR_has_written_to_n_MUX_uxn_opcodes_h_l443_c2_967a_return_output;
     REG_VAR_has_written_to_t := VAR_has_written_to_t_MUX_uxn_opcodes_h_l443_c2_967a_return_output;
     -- BIN_OP_AND[uxn_opcodes_h_l470_c9_35cf] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l470_c9_35cf_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l470_c9_35cf_left;
     BIN_OP_AND_uxn_opcodes_h_l470_c9_35cf_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l470_c9_35cf_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l470_c9_35cf_return_output := BIN_OP_AND_uxn_opcodes_h_l470_c9_35cf_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l472_c11_5722] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l472_c11_5722_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l472_c11_5722_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l472_c11_5722_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l472_c11_5722_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l472_c11_5722_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l472_c11_5722_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l472_c11_5722_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l472_c11_5722_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l457_c7_90fa] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l457_c7_90fa_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l457_c7_90fa_cond;
     device_in_result_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l457_c7_90fa_return_output := device_in_result_MUX_uxn_opcodes_h_l457_c7_90fa_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l465_c3_62b2] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l465_c3_62b2_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l465_c3_62b2_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l465_c3_62b2_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l465_c3_62b2_return_output;

     -- Submodule level 7
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l470_c4_666a_cond := VAR_BIN_OP_AND_uxn_opcodes_h_l470_c9_35cf_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l470_c4_666a_cond := VAR_BIN_OP_AND_uxn_opcodes_h_l470_c9_35cf_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l443_c2_967a_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l457_c7_90fa_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l470_c4_666a_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l472_c11_5722_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l465_c3_62b2_return_output;
     -- is_second_dei_done_MUX[uxn_opcodes_h_l470_c4_666a] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l470_c4_666a_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l470_c4_666a_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l470_c4_666a_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l470_c4_666a_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l470_c4_666a_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l470_c4_666a_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l470_c4_666a_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l470_c4_666a_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l443_c2_967a] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l443_c2_967a_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l443_c2_967a_cond;
     device_in_result_MUX_uxn_opcodes_h_l443_c2_967a_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l443_c2_967a_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l443_c2_967a_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l443_c2_967a_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l443_c2_967a_return_output := device_in_result_MUX_uxn_opcodes_h_l443_c2_967a_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l470_c4_666a] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l470_c4_666a_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l470_c4_666a_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l470_c4_666a_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l470_c4_666a_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l470_c4_666a_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l470_c4_666a_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l470_c4_666a_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l470_c4_666a_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l457_c7_90fa] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l457_c7_90fa_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l457_c7_90fa_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l457_c7_90fa_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l457_c7_90fa_return_output;

     -- Submodule level 8
     REG_VAR_device_in_result := VAR_device_in_result_MUX_uxn_opcodes_h_l443_c2_967a_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l470_c4_666a_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l470_c4_666a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l443_c2_967a_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l457_c7_90fa_return_output;
     -- is_second_dei_done_MUX[uxn_opcodes_h_l465_c3_62b2] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l443_c2_967a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l443_c2_967a_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l443_c2_967a_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l443_c2_967a_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l443_c2_967a_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l443_c2_967a_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l443_c2_967a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l443_c2_967a_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l443_c2_967a_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l465_c3_62b2] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2_return_output;

     -- Submodule level 9
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c3_62b2_return_output;
     -- is_first_dei_done_MUX[uxn_opcodes_h_l457_c7_90fa] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l457_c7_90fa] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa_return_output;

     -- CONST_REF_RD_opcode_result_t_opcode_result_t_ed08_uxn_opcodes_h_l437_l494_DUPLICATE_8bb3 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ed08_uxn_opcodes_h_l437_l494_DUPLICATE_8bb3_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_ed08(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l443_c2_967a_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l443_c2_967a_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l443_c2_967a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l443_c2_967a_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l443_c2_967a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c2_967a_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l443_c2_967a_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ed08_uxn_opcodes_h_l437_l494_DUPLICATE_8bb3_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ed08_uxn_opcodes_h_l437_l494_DUPLICATE_8bb3_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l443_c2_967a_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l443_c2_967a_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l457_c7_90fa_return_output;
     -- is_first_dei_done_MUX[uxn_opcodes_h_l443_c2_967a] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l443_c2_967a_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l443_c2_967a_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l443_c2_967a_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l443_c2_967a_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l443_c2_967a_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l443_c2_967a_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l443_c2_967a_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l443_c2_967a_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l443_c2_967a] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l443_c2_967a_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l443_c2_967a_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l443_c2_967a_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l443_c2_967a_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l443_c2_967a_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l443_c2_967a_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l443_c2_967a_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l443_c2_967a_return_output;

     -- Submodule level 11
     REG_VAR_is_first_dei_done := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l443_c2_967a_return_output;
     REG_VAR_is_second_dei_done := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l443_c2_967a_return_output;
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
