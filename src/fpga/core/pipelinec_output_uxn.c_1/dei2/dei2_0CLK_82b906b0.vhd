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
-- BIN_OP_EQ[uxn_opcodes_h_l435_c6_0a4c]
signal BIN_OP_EQ_uxn_opcodes_h_l435_c6_0a4c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l435_c6_0a4c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l435_c6_0a4c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l435_c1_15a4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_15a4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_15a4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_15a4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_15a4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l447_c7_7a0c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_7a0c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l435_c2_55c1]
signal has_written_to_t_MUX_uxn_opcodes_h_l435_c2_55c1_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l435_c2_55c1_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l435_c2_55c1]
signal device_in_result_MUX_uxn_opcodes_h_l435_c2_55c1_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l435_c2_55c1_return_output : device_in_result_t;

-- is_first_dei_done_MUX[uxn_opcodes_h_l435_c2_55c1]
signal is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l435_c2_55c1]
signal has_written_to_n_MUX_uxn_opcodes_h_l435_c2_55c1_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l435_c2_55c1_return_output : unsigned(0 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l435_c2_55c1]
signal dei_param_MUX_uxn_opcodes_h_l435_c2_55c1_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l435_c2_55c1_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l435_c2_55c1]
signal t8_MUX_uxn_opcodes_h_l435_c2_55c1_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l435_c2_55c1_return_output : unsigned(7 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l435_c2_55c1]
signal is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l435_c2_55c1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_55c1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_55c1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l435_c2_55c1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_55c1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_55c1_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l435_c2_55c1]
signal result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_55c1_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_55c1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l435_c2_55c1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_55c1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_55c1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l435_c2_55c1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_55c1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_55c1_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l435_c2_55c1]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_55c1_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_55c1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l435_c2_55c1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_55c1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_55c1_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l435_c2_55c1]
signal result_u8_value_MUX_uxn_opcodes_h_l435_c2_55c1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l435_c2_55c1_return_output : unsigned(7 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l435_c2_55c1]
signal current_dei_phase_MUX_uxn_opcodes_h_l435_c2_55c1_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l435_c2_55c1_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l436_c3_07f3[uxn_opcodes_h_l436_c3_07f3]
signal printf_uxn_opcodes_h_l436_c3_07f3_uxn_opcodes_h_l436_c3_07f3_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l447_c11_d6b4]
signal BIN_OP_EQ_uxn_opcodes_h_l447_c11_d6b4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l447_c11_d6b4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l447_c11_d6b4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l450_c7_7876]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_7876_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_7876_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_7876_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_7876_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l447_c7_7a0c]
signal has_written_to_t_MUX_uxn_opcodes_h_l447_c7_7a0c_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l447_c7_7a0c]
signal device_in_result_MUX_uxn_opcodes_h_l447_c7_7a0c_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output : device_in_result_t;

-- is_first_dei_done_MUX[uxn_opcodes_h_l447_c7_7a0c]
signal is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l447_c7_7a0c]
signal has_written_to_n_MUX_uxn_opcodes_h_l447_c7_7a0c_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output : unsigned(0 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l447_c7_7a0c]
signal dei_param_MUX_uxn_opcodes_h_l447_c7_7a0c_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l447_c7_7a0c]
signal t8_MUX_uxn_opcodes_h_l447_c7_7a0c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output : unsigned(7 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l447_c7_7a0c]
signal is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l447_c7_7a0c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_7a0c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l447_c7_7a0c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_7a0c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l447_c7_7a0c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_7a0c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l447_c7_7a0c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_7a0c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l447_c7_7a0c]
signal result_u8_value_MUX_uxn_opcodes_h_l447_c7_7a0c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l447_c7_7a0c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_7a0c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output : signed(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l447_c7_7a0c]
signal result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_7a0c_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output : unsigned(7 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l447_c7_7a0c]
signal current_dei_phase_MUX_uxn_opcodes_h_l447_c7_7a0c_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l450_c11_ad37]
signal BIN_OP_EQ_uxn_opcodes_h_l450_c11_ad37_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l450_c11_ad37_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l450_c11_ad37_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l455_c1_ebbe]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_ebbe_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_ebbe_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_ebbe_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_ebbe_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l450_c7_7876]
signal has_written_to_t_MUX_uxn_opcodes_h_l450_c7_7876_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l450_c7_7876_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l450_c7_7876_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l450_c7_7876_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l450_c7_7876]
signal device_in_result_MUX_uxn_opcodes_h_l450_c7_7876_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l450_c7_7876_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l450_c7_7876_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l450_c7_7876_return_output : device_in_result_t;

-- is_first_dei_done_MUX[uxn_opcodes_h_l450_c7_7876]
signal is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_7876_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_7876_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_7876_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_7876_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l450_c7_7876]
signal has_written_to_n_MUX_uxn_opcodes_h_l450_c7_7876_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l450_c7_7876_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l450_c7_7876_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l450_c7_7876_return_output : unsigned(0 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l450_c7_7876]
signal dei_param_MUX_uxn_opcodes_h_l450_c7_7876_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l450_c7_7876_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l450_c7_7876_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l450_c7_7876_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l450_c7_7876]
signal t8_MUX_uxn_opcodes_h_l450_c7_7876_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l450_c7_7876_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l450_c7_7876_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l450_c7_7876_return_output : unsigned(7 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l450_c7_7876]
signal is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_7876_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_7876_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_7876_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_7876_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l450_c7_7876]
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_7876_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_7876_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_7876_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_7876_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l450_c7_7876]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_7876_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_7876_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_7876_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_7876_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l450_c7_7876]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_7876_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_7876_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_7876_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_7876_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l450_c7_7876]
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_7876_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_7876_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_7876_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_7876_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l450_c7_7876]
signal result_u8_value_MUX_uxn_opcodes_h_l450_c7_7876_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l450_c7_7876_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l450_c7_7876_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l450_c7_7876_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l450_c7_7876]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_7876_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_7876_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_7876_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_7876_return_output : signed(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l450_c7_7876]
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_7876_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_7876_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_7876_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_7876_return_output : unsigned(7 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l450_c7_7876]
signal current_dei_phase_MUX_uxn_opcodes_h_l450_c7_7876_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l450_c7_7876_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l450_c7_7876_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l450_c7_7876_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l453_c30_7d85]
signal sp_relative_shift_uxn_opcodes_h_l453_c30_7d85_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l453_c30_7d85_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l453_c30_7d85_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l453_c30_7d85_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l457_c35_a884]
signal BIN_OP_PLUS_uxn_opcodes_h_l457_c35_a884_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l457_c35_a884_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l457_c35_a884_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l457_c15_7f02]
signal MUX_uxn_opcodes_h_l457_c15_7f02_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l457_c15_7f02_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l457_c15_7f02_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l457_c15_7f02_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l458_c49_a9b7]
signal UNARY_OP_NOT_uxn_opcodes_h_l458_c49_a9b7_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l458_c49_a9b7_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l458_c29_93b6]
signal BIN_OP_AND_uxn_opcodes_h_l458_c29_93b6_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l458_c29_93b6_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l458_c29_93b6_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l458_c8_9c54]
signal BIN_OP_OR_uxn_opcodes_h_l458_c8_9c54_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l458_c8_9c54_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l458_c8_9c54_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l458_c1_2456]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_2456_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_2456_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_2456_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_2456_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l458_c3_101a]
signal has_written_to_t_MUX_uxn_opcodes_h_l458_c3_101a_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l458_c3_101a_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l458_c3_101a_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l458_c3_101a_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l458_c3_101a]
signal device_in_result_MUX_uxn_opcodes_h_l458_c3_101a_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l458_c3_101a_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l458_c3_101a_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l458_c3_101a_return_output : device_in_result_t;

-- is_first_dei_done_MUX[uxn_opcodes_h_l458_c3_101a]
signal is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_101a_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_101a_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_101a_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_101a_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l458_c3_101a]
signal has_written_to_n_MUX_uxn_opcodes_h_l458_c3_101a_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l458_c3_101a_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l458_c3_101a_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l458_c3_101a_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l458_c3_101a]
signal is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_101a_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_101a_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_101a_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_101a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l458_c3_101a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_101a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_101a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_101a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_101a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l458_c3_101a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_101a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_101a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_101a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_101a_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l458_c3_101a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_101a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_101a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_101a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_101a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l458_c3_101a]
signal result_u8_value_MUX_uxn_opcodes_h_l458_c3_101a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l458_c3_101a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l458_c3_101a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l458_c3_101a_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l458_c3_101a]
signal result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_101a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_101a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_101a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_101a_return_output : unsigned(7 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l458_c3_101a]
signal current_dei_phase_MUX_uxn_opcodes_h_l458_c3_101a_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l458_c3_101a_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l458_c3_101a_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l458_c3_101a_return_output : unsigned(7 downto 0);

-- device_in[uxn_opcodes_h_l459_c23_d298]
signal device_in_uxn_opcodes_h_l459_c23_d298_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_in_uxn_opcodes_h_l459_c23_d298_device_address : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l459_c23_d298_phase : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l459_c23_d298_previous_device_ram_read : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l459_c23_d298_return_output : device_in_result_t;

-- BIN_OP_PLUS[uxn_opcodes_h_l462_c4_efb0]
signal BIN_OP_PLUS_uxn_opcodes_h_l462_c4_efb0_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l462_c4_efb0_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l462_c4_efb0_return_output : unsigned(8 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l463_c9_b332]
signal BIN_OP_AND_uxn_opcodes_h_l463_c9_b332_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l463_c9_b332_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l463_c9_b332_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l463_c4_6849]
signal is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_6849_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_6849_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_6849_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_6849_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l463_c4_6849]
signal is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_6849_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_6849_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_6849_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_6849_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l465_c11_f009]
signal is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_f009_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_f009_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_f009_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_f009_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l469_c13_275b]
signal UNARY_OP_NOT_uxn_opcodes_h_l469_c13_275b_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l469_c13_275b_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l469_c8_3229]
signal has_written_to_t_MUX_uxn_opcodes_h_l469_c8_3229_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l469_c8_3229_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l469_c8_3229_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l469_c8_3229_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l469_c8_3229]
signal has_written_to_n_MUX_uxn_opcodes_h_l469_c8_3229_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l469_c8_3229_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l469_c8_3229_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l469_c8_3229_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l469_c8_3229]
signal result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_3229_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_3229_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_3229_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_3229_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l469_c8_3229]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_3229_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_3229_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_3229_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_3229_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l469_c8_3229]
signal result_u8_value_MUX_uxn_opcodes_h_l469_c8_3229_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l469_c8_3229_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l469_c8_3229_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l469_c8_3229_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l469_c8_3229]
signal result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_3229_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_3229_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_3229_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_3229_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l469_c8_3229]
signal current_dei_phase_MUX_uxn_opcodes_h_l469_c8_3229_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l469_c8_3229_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l469_c8_3229_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l469_c8_3229_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l476_c13_dae3]
signal UNARY_OP_NOT_uxn_opcodes_h_l476_c13_dae3_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l476_c13_dae3_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l476_c8_a015]
signal has_written_to_n_MUX_uxn_opcodes_h_l476_c8_a015_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l476_c8_a015_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l476_c8_a015_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l476_c8_a015_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l476_c8_a015]
signal result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_a015_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_a015_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_a015_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_a015_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l476_c8_a015]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_a015_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_a015_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_a015_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_a015_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l476_c8_a015]
signal result_u8_value_MUX_uxn_opcodes_h_l476_c8_a015_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l476_c8_a015_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l476_c8_a015_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l476_c8_a015_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l476_c8_a015]
signal result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_a015_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_a015_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_a015_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_a015_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l463_l458_DUPLICATE_4696
signal UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l463_l458_DUPLICATE_4696_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l463_l458_DUPLICATE_4696_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_f08e( ref_toks_0 : opcode_result_t;
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
      base.is_sp_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.device_ram_address := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_device_ram_write := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.u8_value := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l435_c6_0a4c
BIN_OP_EQ_uxn_opcodes_h_l435_c6_0a4c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l435_c6_0a4c_left,
BIN_OP_EQ_uxn_opcodes_h_l435_c6_0a4c_right,
BIN_OP_EQ_uxn_opcodes_h_l435_c6_0a4c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_15a4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_15a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_15a4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_15a4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_15a4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_15a4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_7a0c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_7a0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_7a0c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l435_c2_55c1
has_written_to_t_MUX_uxn_opcodes_h_l435_c2_55c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l435_c2_55c1_cond,
has_written_to_t_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l435_c2_55c1_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l435_c2_55c1
device_in_result_MUX_uxn_opcodes_h_l435_c2_55c1 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l435_c2_55c1_cond,
device_in_result_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue,
device_in_result_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse,
device_in_result_MUX_uxn_opcodes_h_l435_c2_55c1_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1
is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l435_c2_55c1
has_written_to_n_MUX_uxn_opcodes_h_l435_c2_55c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l435_c2_55c1_cond,
has_written_to_n_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l435_c2_55c1_return_output);

-- dei_param_MUX_uxn_opcodes_h_l435_c2_55c1
dei_param_MUX_uxn_opcodes_h_l435_c2_55c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l435_c2_55c1_cond,
dei_param_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue,
dei_param_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse,
dei_param_MUX_uxn_opcodes_h_l435_c2_55c1_return_output);

-- t8_MUX_uxn_opcodes_h_l435_c2_55c1
t8_MUX_uxn_opcodes_h_l435_c2_55c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l435_c2_55c1_cond,
t8_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue,
t8_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse,
t8_MUX_uxn_opcodes_h_l435_c2_55c1_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1
is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_55c1
result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_55c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_55c1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_55c1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_55c1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_55c1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_55c1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_55c1_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_55c1
result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_55c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_55c1_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_55c1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_55c1
result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_55c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_55c1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_55c1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_55c1
result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_55c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_55c1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_55c1_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_55c1
result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_55c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_55c1_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_55c1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_55c1
result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_55c1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_55c1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_55c1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l435_c2_55c1
result_u8_value_MUX_uxn_opcodes_h_l435_c2_55c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l435_c2_55c1_cond,
result_u8_value_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l435_c2_55c1_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l435_c2_55c1
current_dei_phase_MUX_uxn_opcodes_h_l435_c2_55c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l435_c2_55c1_cond,
current_dei_phase_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l435_c2_55c1_return_output);

-- printf_uxn_opcodes_h_l436_c3_07f3_uxn_opcodes_h_l436_c3_07f3
printf_uxn_opcodes_h_l436_c3_07f3_uxn_opcodes_h_l436_c3_07f3 : entity work.printf_uxn_opcodes_h_l436_c3_07f3_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l436_c3_07f3_uxn_opcodes_h_l436_c3_07f3_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l447_c11_d6b4
BIN_OP_EQ_uxn_opcodes_h_l447_c11_d6b4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l447_c11_d6b4_left,
BIN_OP_EQ_uxn_opcodes_h_l447_c11_d6b4_right,
BIN_OP_EQ_uxn_opcodes_h_l447_c11_d6b4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_7876
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_7876 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_7876_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_7876_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_7876_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_7876_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l447_c7_7a0c
has_written_to_t_MUX_uxn_opcodes_h_l447_c7_7a0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l447_c7_7a0c_cond,
has_written_to_t_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l447_c7_7a0c
device_in_result_MUX_uxn_opcodes_h_l447_c7_7a0c : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l447_c7_7a0c_cond,
device_in_result_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue,
device_in_result_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse,
device_in_result_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c
is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l447_c7_7a0c
has_written_to_n_MUX_uxn_opcodes_h_l447_c7_7a0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l447_c7_7a0c_cond,
has_written_to_n_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output);

-- dei_param_MUX_uxn_opcodes_h_l447_c7_7a0c
dei_param_MUX_uxn_opcodes_h_l447_c7_7a0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l447_c7_7a0c_cond,
dei_param_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue,
dei_param_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse,
dei_param_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output);

-- t8_MUX_uxn_opcodes_h_l447_c7_7a0c
t8_MUX_uxn_opcodes_h_l447_c7_7a0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l447_c7_7a0c_cond,
t8_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue,
t8_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse,
t8_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c
is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_7a0c
result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_7a0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_7a0c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_7a0c
result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_7a0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_7a0c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_7a0c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_7a0c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_7a0c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_7a0c
result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_7a0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_7a0c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l447_c7_7a0c
result_u8_value_MUX_uxn_opcodes_h_l447_c7_7a0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l447_c7_7a0c_cond,
result_u8_value_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_7a0c
result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_7a0c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_7a0c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_7a0c
result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_7a0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_7a0c_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l447_c7_7a0c
current_dei_phase_MUX_uxn_opcodes_h_l447_c7_7a0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l447_c7_7a0c_cond,
current_dei_phase_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l450_c11_ad37
BIN_OP_EQ_uxn_opcodes_h_l450_c11_ad37 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l450_c11_ad37_left,
BIN_OP_EQ_uxn_opcodes_h_l450_c11_ad37_right,
BIN_OP_EQ_uxn_opcodes_h_l450_c11_ad37_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_ebbe
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_ebbe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_ebbe_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_ebbe_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_ebbe_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_ebbe_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l450_c7_7876
has_written_to_t_MUX_uxn_opcodes_h_l450_c7_7876 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l450_c7_7876_cond,
has_written_to_t_MUX_uxn_opcodes_h_l450_c7_7876_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l450_c7_7876_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l450_c7_7876_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l450_c7_7876
device_in_result_MUX_uxn_opcodes_h_l450_c7_7876 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l450_c7_7876_cond,
device_in_result_MUX_uxn_opcodes_h_l450_c7_7876_iftrue,
device_in_result_MUX_uxn_opcodes_h_l450_c7_7876_iffalse,
device_in_result_MUX_uxn_opcodes_h_l450_c7_7876_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_7876
is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_7876 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_7876_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_7876_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_7876_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_7876_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l450_c7_7876
has_written_to_n_MUX_uxn_opcodes_h_l450_c7_7876 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l450_c7_7876_cond,
has_written_to_n_MUX_uxn_opcodes_h_l450_c7_7876_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l450_c7_7876_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l450_c7_7876_return_output);

-- dei_param_MUX_uxn_opcodes_h_l450_c7_7876
dei_param_MUX_uxn_opcodes_h_l450_c7_7876 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l450_c7_7876_cond,
dei_param_MUX_uxn_opcodes_h_l450_c7_7876_iftrue,
dei_param_MUX_uxn_opcodes_h_l450_c7_7876_iffalse,
dei_param_MUX_uxn_opcodes_h_l450_c7_7876_return_output);

-- t8_MUX_uxn_opcodes_h_l450_c7_7876
t8_MUX_uxn_opcodes_h_l450_c7_7876 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l450_c7_7876_cond,
t8_MUX_uxn_opcodes_h_l450_c7_7876_iftrue,
t8_MUX_uxn_opcodes_h_l450_c7_7876_iffalse,
t8_MUX_uxn_opcodes_h_l450_c7_7876_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_7876
is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_7876 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_7876_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_7876_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_7876_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_7876_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_7876
result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_7876 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_7876_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_7876_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_7876_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_7876_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_7876
result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_7876 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_7876_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_7876_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_7876_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_7876_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_7876
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_7876 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_7876_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_7876_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_7876_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_7876_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_7876
result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_7876 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_7876_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_7876_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_7876_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_7876_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l450_c7_7876
result_u8_value_MUX_uxn_opcodes_h_l450_c7_7876 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l450_c7_7876_cond,
result_u8_value_MUX_uxn_opcodes_h_l450_c7_7876_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l450_c7_7876_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l450_c7_7876_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_7876
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_7876 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_7876_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_7876_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_7876_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_7876_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_7876
result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_7876 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_7876_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_7876_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_7876_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_7876_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l450_c7_7876
current_dei_phase_MUX_uxn_opcodes_h_l450_c7_7876 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l450_c7_7876_cond,
current_dei_phase_MUX_uxn_opcodes_h_l450_c7_7876_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l450_c7_7876_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l450_c7_7876_return_output);

-- sp_relative_shift_uxn_opcodes_h_l453_c30_7d85
sp_relative_shift_uxn_opcodes_h_l453_c30_7d85 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l453_c30_7d85_ins,
sp_relative_shift_uxn_opcodes_h_l453_c30_7d85_x,
sp_relative_shift_uxn_opcodes_h_l453_c30_7d85_y,
sp_relative_shift_uxn_opcodes_h_l453_c30_7d85_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l457_c35_a884
BIN_OP_PLUS_uxn_opcodes_h_l457_c35_a884 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l457_c35_a884_left,
BIN_OP_PLUS_uxn_opcodes_h_l457_c35_a884_right,
BIN_OP_PLUS_uxn_opcodes_h_l457_c35_a884_return_output);

-- MUX_uxn_opcodes_h_l457_c15_7f02
MUX_uxn_opcodes_h_l457_c15_7f02 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l457_c15_7f02_cond,
MUX_uxn_opcodes_h_l457_c15_7f02_iftrue,
MUX_uxn_opcodes_h_l457_c15_7f02_iffalse,
MUX_uxn_opcodes_h_l457_c15_7f02_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l458_c49_a9b7
UNARY_OP_NOT_uxn_opcodes_h_l458_c49_a9b7 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l458_c49_a9b7_expr,
UNARY_OP_NOT_uxn_opcodes_h_l458_c49_a9b7_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l458_c29_93b6
BIN_OP_AND_uxn_opcodes_h_l458_c29_93b6 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l458_c29_93b6_left,
BIN_OP_AND_uxn_opcodes_h_l458_c29_93b6_right,
BIN_OP_AND_uxn_opcodes_h_l458_c29_93b6_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l458_c8_9c54
BIN_OP_OR_uxn_opcodes_h_l458_c8_9c54 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l458_c8_9c54_left,
BIN_OP_OR_uxn_opcodes_h_l458_c8_9c54_right,
BIN_OP_OR_uxn_opcodes_h_l458_c8_9c54_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_2456
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_2456 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_2456_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_2456_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_2456_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_2456_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l458_c3_101a
has_written_to_t_MUX_uxn_opcodes_h_l458_c3_101a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l458_c3_101a_cond,
has_written_to_t_MUX_uxn_opcodes_h_l458_c3_101a_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l458_c3_101a_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l458_c3_101a_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l458_c3_101a
device_in_result_MUX_uxn_opcodes_h_l458_c3_101a : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l458_c3_101a_cond,
device_in_result_MUX_uxn_opcodes_h_l458_c3_101a_iftrue,
device_in_result_MUX_uxn_opcodes_h_l458_c3_101a_iffalse,
device_in_result_MUX_uxn_opcodes_h_l458_c3_101a_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_101a
is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_101a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_101a_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_101a_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_101a_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_101a_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l458_c3_101a
has_written_to_n_MUX_uxn_opcodes_h_l458_c3_101a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l458_c3_101a_cond,
has_written_to_n_MUX_uxn_opcodes_h_l458_c3_101a_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l458_c3_101a_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l458_c3_101a_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_101a
is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_101a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_101a_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_101a_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_101a_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_101a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_101a
result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_101a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_101a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_101a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_101a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_101a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_101a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_101a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_101a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_101a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_101a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_101a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_101a
result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_101a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_101a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_101a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_101a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_101a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l458_c3_101a
result_u8_value_MUX_uxn_opcodes_h_l458_c3_101a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l458_c3_101a_cond,
result_u8_value_MUX_uxn_opcodes_h_l458_c3_101a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l458_c3_101a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l458_c3_101a_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_101a
result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_101a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_101a_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_101a_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_101a_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_101a_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l458_c3_101a
current_dei_phase_MUX_uxn_opcodes_h_l458_c3_101a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l458_c3_101a_cond,
current_dei_phase_MUX_uxn_opcodes_h_l458_c3_101a_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l458_c3_101a_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l458_c3_101a_return_output);

-- device_in_uxn_opcodes_h_l459_c23_d298
device_in_uxn_opcodes_h_l459_c23_d298 : entity work.device_in_0CLK_b9b05a79 port map (
clk,
device_in_uxn_opcodes_h_l459_c23_d298_CLOCK_ENABLE,
device_in_uxn_opcodes_h_l459_c23_d298_device_address,
device_in_uxn_opcodes_h_l459_c23_d298_phase,
device_in_uxn_opcodes_h_l459_c23_d298_previous_device_ram_read,
device_in_uxn_opcodes_h_l459_c23_d298_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l462_c4_efb0
BIN_OP_PLUS_uxn_opcodes_h_l462_c4_efb0 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l462_c4_efb0_left,
BIN_OP_PLUS_uxn_opcodes_h_l462_c4_efb0_right,
BIN_OP_PLUS_uxn_opcodes_h_l462_c4_efb0_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l463_c9_b332
BIN_OP_AND_uxn_opcodes_h_l463_c9_b332 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l463_c9_b332_left,
BIN_OP_AND_uxn_opcodes_h_l463_c9_b332_right,
BIN_OP_AND_uxn_opcodes_h_l463_c9_b332_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_6849
is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_6849 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_6849_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_6849_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_6849_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_6849_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_6849
is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_6849 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_6849_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_6849_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_6849_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_6849_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_f009
is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_f009 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_f009_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_f009_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_f009_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_f009_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l469_c13_275b
UNARY_OP_NOT_uxn_opcodes_h_l469_c13_275b : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l469_c13_275b_expr,
UNARY_OP_NOT_uxn_opcodes_h_l469_c13_275b_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l469_c8_3229
has_written_to_t_MUX_uxn_opcodes_h_l469_c8_3229 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l469_c8_3229_cond,
has_written_to_t_MUX_uxn_opcodes_h_l469_c8_3229_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l469_c8_3229_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l469_c8_3229_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l469_c8_3229
has_written_to_n_MUX_uxn_opcodes_h_l469_c8_3229 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l469_c8_3229_cond,
has_written_to_n_MUX_uxn_opcodes_h_l469_c8_3229_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l469_c8_3229_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l469_c8_3229_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_3229
result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_3229 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_3229_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_3229_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_3229_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_3229_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_3229
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_3229 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_3229_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_3229_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_3229_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_3229_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l469_c8_3229
result_u8_value_MUX_uxn_opcodes_h_l469_c8_3229 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l469_c8_3229_cond,
result_u8_value_MUX_uxn_opcodes_h_l469_c8_3229_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l469_c8_3229_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l469_c8_3229_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_3229
result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_3229 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_3229_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_3229_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_3229_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_3229_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l469_c8_3229
current_dei_phase_MUX_uxn_opcodes_h_l469_c8_3229 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l469_c8_3229_cond,
current_dei_phase_MUX_uxn_opcodes_h_l469_c8_3229_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l469_c8_3229_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l469_c8_3229_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l476_c13_dae3
UNARY_OP_NOT_uxn_opcodes_h_l476_c13_dae3 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l476_c13_dae3_expr,
UNARY_OP_NOT_uxn_opcodes_h_l476_c13_dae3_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l476_c8_a015
has_written_to_n_MUX_uxn_opcodes_h_l476_c8_a015 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l476_c8_a015_cond,
has_written_to_n_MUX_uxn_opcodes_h_l476_c8_a015_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l476_c8_a015_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l476_c8_a015_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_a015
result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_a015 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_a015_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_a015_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_a015_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_a015_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_a015
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_a015 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_a015_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_a015_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_a015_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_a015_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l476_c8_a015
result_u8_value_MUX_uxn_opcodes_h_l476_c8_a015 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l476_c8_a015_cond,
result_u8_value_MUX_uxn_opcodes_h_l476_c8_a015_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l476_c8_a015_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l476_c8_a015_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_a015
result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_a015 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_a015_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_a015_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_a015_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_a015_return_output);

-- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l463_l458_DUPLICATE_4696
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l463_l458_DUPLICATE_4696 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l463_l458_DUPLICATE_4696_expr,
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l463_l458_DUPLICATE_4696_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l435_c6_0a4c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_15a4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l435_c2_55c1_return_output,
 device_in_result_MUX_uxn_opcodes_h_l435_c2_55c1_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l435_c2_55c1_return_output,
 dei_param_MUX_uxn_opcodes_h_l435_c2_55c1_return_output,
 t8_MUX_uxn_opcodes_h_l435_c2_55c1_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_55c1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_55c1_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_55c1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_55c1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_55c1_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_55c1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_55c1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l435_c2_55c1_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l435_c2_55c1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l447_c11_d6b4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_7876_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output,
 device_in_result_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output,
 dei_param_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output,
 t8_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l450_c11_ad37_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_ebbe_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l450_c7_7876_return_output,
 device_in_result_MUX_uxn_opcodes_h_l450_c7_7876_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_7876_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l450_c7_7876_return_output,
 dei_param_MUX_uxn_opcodes_h_l450_c7_7876_return_output,
 t8_MUX_uxn_opcodes_h_l450_c7_7876_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_7876_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_7876_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_7876_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_7876_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_7876_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l450_c7_7876_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_7876_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_7876_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l450_c7_7876_return_output,
 sp_relative_shift_uxn_opcodes_h_l453_c30_7d85_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l457_c35_a884_return_output,
 MUX_uxn_opcodes_h_l457_c15_7f02_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l458_c49_a9b7_return_output,
 BIN_OP_AND_uxn_opcodes_h_l458_c29_93b6_return_output,
 BIN_OP_OR_uxn_opcodes_h_l458_c8_9c54_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_2456_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l458_c3_101a_return_output,
 device_in_result_MUX_uxn_opcodes_h_l458_c3_101a_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_101a_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l458_c3_101a_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_101a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_101a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_101a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_101a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l458_c3_101a_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_101a_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l458_c3_101a_return_output,
 device_in_uxn_opcodes_h_l459_c23_d298_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l462_c4_efb0_return_output,
 BIN_OP_AND_uxn_opcodes_h_l463_c9_b332_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_6849_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_6849_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_f009_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l469_c13_275b_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l469_c8_3229_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l469_c8_3229_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_3229_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_3229_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l469_c8_3229_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_3229_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l469_c8_3229_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l476_c13_dae3_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l476_c8_a015_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_a015_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_a015_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l476_c8_a015_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_a015_return_output,
 UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l463_l458_DUPLICATE_4696_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_0a4c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_0a4c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_0a4c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_15a4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_15a4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_15a4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_15a4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_7a0c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c2_55c1_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c2_55c1_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue : device_in_result_t;
 variable VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l435_c2_55c1_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l435_c2_55c1_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l435_c2_55c1_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l435_c2_55c1_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l435_c2_55c1_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l435_c2_55c1_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l435_c2_55c1_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l435_c2_55c1_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l435_c2_55c1_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_55c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_55c1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l442_c3_c9d4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_55c1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_55c1_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_55c1_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_55c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_55c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_55c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_55c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_55c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l435_c2_55c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_55c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_55c1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_55c1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_55c1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l435_c2_55c1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l435_c2_55c1_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l441_c3_9be6 : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l435_c2_55c1_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l435_c2_55c1_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l436_c3_07f3_uxn_opcodes_h_l436_c3_07f3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_d6b4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_d6b4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_d6b4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_7876_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_7876_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_7876_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_7876_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_7876_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l447_c7_7a0c_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_7876_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l447_c7_7a0c_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_7876_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c7_7876_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l447_c7_7a0c_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l450_c7_7876_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l447_c7_7a0c_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c7_7876_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l447_c7_7a0c_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_7876_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_7876_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_7a0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_7876_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_7a0c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l448_c3_f733 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_7876_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_7a0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_7876_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_7a0c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c7_7876_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l447_c7_7a0c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_7876_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_7a0c_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_7876_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_7a0c_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c7_7876_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l447_c7_7a0c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_ad37_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_ad37_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_ad37_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_ebbe_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_ebbe_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_ebbe_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_ebbe_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_7876_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_7876_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l458_c3_101a_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_7876_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_7876_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_7876_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l458_c3_101a_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_7876_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_7876_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_7876_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_101a_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_7876_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c7_7876_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c7_7876_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l458_c3_101a_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c7_7876_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l450_c7_7876_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l450_c7_7876_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l450_c7_7876_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c7_7876_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c7_7876_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c7_7876_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_7876_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_7876_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_101a_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_7876_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_7876_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_7876_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_101a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_7876_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_7876_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_7876_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_7876_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_7876_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_7876_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_101a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_7876_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_7876_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_7876_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_101a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_7876_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c7_7876_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c7_7876_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l458_c3_101a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c7_7876_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_7876_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_7876_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_7876_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_7876_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_7876_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_101a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_7876_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c7_7876_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c7_7876_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l458_c3_101a_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c7_7876_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l453_c30_7d85_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l453_c30_7d85_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l453_c30_7d85_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l453_c30_7d85_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l457_c15_7f02_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l457_c15_7f02_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l457_c15_7f02_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l457_c35_a884_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l457_c35_a884_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l457_c35_a884_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l457_c15_7f02_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_9c54_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l458_c29_93b6_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l458_c49_a9b7_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l458_c49_a9b7_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l458_c29_93b6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l458_c29_93b6_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_9c54_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_9c54_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_2456_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_2456_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_2456_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_2456_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l458_c3_101a_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l458_c3_101a_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l469_c8_3229_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l458_c3_101a_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l458_c3_101a_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l458_c3_101a_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l458_c3_101a_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_101a_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_6849_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_101a_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_101a_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l458_c3_101a_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l458_c3_101a_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l469_c8_3229_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l458_c3_101a_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_101a_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_6849_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_101a_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_101a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_101a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_101a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_3229_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_101a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_101a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_101a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_3229_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_101a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_101a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_101a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_3229_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_101a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l458_c3_101a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l458_c3_101a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l469_c8_3229_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l458_c3_101a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_101a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_101a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_101a_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l458_c3_101a_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l462_c4_02f7 : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l458_c3_101a_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l469_c8_3229_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l458_c3_101a_cond : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l459_c23_d298_device_address : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l459_c23_d298_phase : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l459_c23_d298_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l459_c23_d298_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l459_c23_d298_return_output : device_in_result_t;
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l460_c32_6baf_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l462_c4_efb0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l462_c4_efb0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l462_c4_efb0_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l463_c9_b332_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l463_c9_b332_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l463_c9_b332_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_6849_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_6849_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_6849_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_6849_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_6849_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_f009_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_6849_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_f009_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_f009_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_f009_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l469_c13_275b_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l469_c13_275b_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l469_c8_3229_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l469_c8_3229_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l469_c8_3229_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l469_c8_3229_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l469_c8_3229_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_a015_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l469_c8_3229_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_3229_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_3229_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_a015_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_3229_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_3229_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l472_c4_9c58 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_3229_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_a015_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_3229_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l469_c8_3229_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l469_c8_3229_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_a015_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l469_c8_3229_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_3229_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_3229_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_a015_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_3229_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l469_c8_3229_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l470_c4_999d : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l469_c8_3229_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l469_c8_3229_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_dae3_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_dae3_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_a015_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_a015_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_a015_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_a015_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_a015_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_a015_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_a015_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l477_c4_e2da : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_a015_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_a015_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_a015_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_a015_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_a015_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_a015_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_a015_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_a015_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l447_l435_DUPLICATE_d77a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l458_l447_l450_l435_DUPLICATE_b290_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l447_l450_l476_l435_DUPLICATE_385e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l447_l450_l435_DUPLICATE_6297_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l447_l435_l476_l458_l450_DUPLICATE_edf5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l447_l476_l469_l458_l450_DUPLICATE_9938_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l458_l450_l476_DUPLICATE_fad7_return_output : unsigned(3 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l463_l458_DUPLICATE_4696_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l463_l458_DUPLICATE_4696_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l465_l463_DUPLICATE_52c5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l473_l478_DUPLICATE_07cc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f08e_uxn_opcodes_h_l487_l429_DUPLICATE_8530_return_output : opcode_result_t;
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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_2456_iffalse := to_unsigned(0, 1);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l469_c8_3229_iftrue := to_unsigned(1, 1);
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_a015_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_7876_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_15a4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l462_c4_efb0_right := to_unsigned(1, 1);
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_ad37_right := to_unsigned(2, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_7876_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l453_c30_7d85_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_current_dei_phase_uxn_opcodes_h_l470_c4_999d := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l469_c8_3229_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l470_c4_999d;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_f009_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_a015_iffalse := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l472_c4_9c58 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_3229_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l472_c4_9c58;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l448_c3_f733 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l448_c3_f733;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_a015_iffalse := to_unsigned(0, 1);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue := to_unsigned(0, 1);
     VAR_current_dei_phase_uxn_opcodes_h_l441_c3_9be6 := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l441_c3_9be6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_0a4c_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue := to_unsigned(0, 1);
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l442_c3_c9d4 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l442_c3_c9d4;
     VAR_sp_relative_shift_uxn_opcodes_h_l453_c30_7d85_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_101a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_d6b4_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_3229_iftrue := to_unsigned(1, 1);
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_6849_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l457_c35_a884_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_ebbe_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l477_c4_e2da := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_a015_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l477_c4_e2da;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_7876_iffalse := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_15a4_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l462_c4_efb0_left := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c7_7876_iftrue := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l469_c8_3229_iffalse := current_dei_phase;
     VAR_device_in_uxn_opcodes_h_l459_c23_d298_phase := current_dei_phase;
     VAR_dei_param_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue := dei_param;
     VAR_dei_param_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue := dei_param;
     VAR_dei_param_MUX_uxn_opcodes_h_l450_c7_7876_iftrue := dei_param;
     VAR_device_in_result_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_7876_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l458_c3_101a_iffalse := device_in_result;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_dae3_expr := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c7_7876_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l458_c3_101a_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l469_c8_3229_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_a015_iffalse := has_written_to_n;
     VAR_BIN_OP_AND_uxn_opcodes_h_l458_c29_93b6_left := has_written_to_t;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l469_c13_275b_expr := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_7876_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l458_c3_101a_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l469_c8_3229_iffalse := has_written_to_t;
     VAR_sp_relative_shift_uxn_opcodes_h_l453_c30_7d85_ins := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l457_c15_7f02_cond := is_first_dei_done;
     VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l463_l458_DUPLICATE_4696_expr := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_7876_iftrue := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_101a_iffalse := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_6849_iffalse := is_first_dei_done;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l458_c49_a9b7_expr := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_7876_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_101a_iffalse := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_6849_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_f009_iffalse := is_second_dei_done;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_0a4c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_d6b4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_ad37_left := VAR_phase;
     VAR_device_in_uxn_opcodes_h_l459_c23_d298_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l450_c7_7876_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l457_c35_a884_left := t8;
     VAR_MUX_uxn_opcodes_h_l457_c15_7f02_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l450_c7_7876_iffalse := t8;
     -- CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l473_l478_DUPLICATE_07cc LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l473_l478_DUPLICATE_07cc_return_output := device_in_result.dei_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l447_l450_l435_DUPLICATE_6297 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l447_l450_l435_DUPLICATE_6297_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l450_c11_ad37] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l450_c11_ad37_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_ad37_left;
     BIN_OP_EQ_uxn_opcodes_h_l450_c11_ad37_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_ad37_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_ad37_return_output := BIN_OP_EQ_uxn_opcodes_h_l450_c11_ad37_return_output;

     -- result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l435_c2_55c1] LATENCY=0
     VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l435_c2_55c1_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l458_l447_l450_l435_DUPLICATE_b290 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l458_l447_l450_l435_DUPLICATE_b290_return_output := result.device_ram_address;

     -- device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6[uxn_opcodes_h_l435_c2_55c1] LATENCY=0
     VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l435_c2_55c1_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6(
     device_in_result,
     to_unsigned(0, 1));

     -- sp_relative_shift[uxn_opcodes_h_l453_c30_7d85] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l453_c30_7d85_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l453_c30_7d85_ins;
     sp_relative_shift_uxn_opcodes_h_l453_c30_7d85_x <= VAR_sp_relative_shift_uxn_opcodes_h_l453_c30_7d85_x;
     sp_relative_shift_uxn_opcodes_h_l453_c30_7d85_y <= VAR_sp_relative_shift_uxn_opcodes_h_l453_c30_7d85_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l453_c30_7d85_return_output := sp_relative_shift_uxn_opcodes_h_l453_c30_7d85_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l462_c4_efb0] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l462_c4_efb0_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l462_c4_efb0_left;
     BIN_OP_PLUS_uxn_opcodes_h_l462_c4_efb0_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l462_c4_efb0_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l462_c4_efb0_return_output := BIN_OP_PLUS_uxn_opcodes_h_l462_c4_efb0_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l476_c13_dae3] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l476_c13_dae3_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_dae3_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_dae3_return_output := UNARY_OP_NOT_uxn_opcodes_h_l476_c13_dae3_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l457_c35_a884] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l457_c35_a884_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l457_c35_a884_left;
     BIN_OP_PLUS_uxn_opcodes_h_l457_c35_a884_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l457_c35_a884_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l457_c35_a884_return_output := BIN_OP_PLUS_uxn_opcodes_h_l457_c35_a884_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l447_l476_l469_l458_l450_DUPLICATE_9938 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l447_l476_l469_l458_l450_DUPLICATE_9938_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l447_c11_d6b4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l447_c11_d6b4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_d6b4_left;
     BIN_OP_EQ_uxn_opcodes_h_l447_c11_d6b4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_d6b4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_d6b4_return_output := BIN_OP_EQ_uxn_opcodes_h_l447_c11_d6b4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l447_l450_l476_l435_DUPLICATE_385e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l447_l450_l476_l435_DUPLICATE_385e_return_output := result.is_stack_write;

     -- UNARY_OP_NOT[uxn_opcodes_h_l458_c49_a9b7] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l458_c49_a9b7_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l458_c49_a9b7_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l458_c49_a9b7_return_output := UNARY_OP_NOT_uxn_opcodes_h_l458_c49_a9b7_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l447_l435_l476_l458_l450_DUPLICATE_edf5 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l447_l435_l476_l458_l450_DUPLICATE_edf5_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l447_l435_DUPLICATE_d77a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l447_l435_DUPLICATE_d77a_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l435_c6_0a4c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l435_c6_0a4c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_0a4c_left;
     BIN_OP_EQ_uxn_opcodes_h_l435_c6_0a4c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_0a4c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_0a4c_return_output := BIN_OP_EQ_uxn_opcodes_h_l435_c6_0a4c_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l458_l450_l476_DUPLICATE_fad7 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l458_l450_l476_DUPLICATE_fad7_return_output := result.stack_address_sp_offset;

     -- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l463_l458_DUPLICATE_4696 LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l463_l458_DUPLICATE_4696_expr <= VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l463_l458_DUPLICATE_4696_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l463_l458_DUPLICATE_4696_return_output := UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l463_l458_DUPLICATE_4696_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l469_c13_275b] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l469_c13_275b_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l469_c13_275b_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l469_c13_275b_return_output := UNARY_OP_NOT_uxn_opcodes_h_l469_c13_275b_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_7a0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_0a4c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_15a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_0a4c_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l435_c2_55c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_0a4c_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l435_c2_55c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_0a4c_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l435_c2_55c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_0a4c_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l435_c2_55c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_0a4c_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c2_55c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_0a4c_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_0a4c_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_0a4c_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_55c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_0a4c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_55c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_0a4c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_55c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_0a4c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_55c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_0a4c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_55c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_0a4c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_55c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_0a4c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_55c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_0a4c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l435_c2_55c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_0a4c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l435_c2_55c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_0a4c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_7876_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_d6b4_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l447_c7_7a0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_d6b4_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l447_c7_7a0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_d6b4_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l447_c7_7a0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_d6b4_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l447_c7_7a0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_d6b4_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l447_c7_7a0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_d6b4_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_d6b4_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_d6b4_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_7a0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_d6b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_7a0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_d6b4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_7a0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_d6b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_7a0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_d6b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_7a0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_d6b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_7a0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_d6b4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l447_c7_7a0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_d6b4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l447_c7_7a0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_d6b4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_ebbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_ad37_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c7_7876_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_ad37_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l450_c7_7876_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_ad37_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_7876_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_ad37_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c7_7876_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_ad37_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_7876_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_ad37_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_7876_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_ad37_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_7876_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_ad37_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_7876_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_ad37_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_7876_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_ad37_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_7876_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_ad37_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_7876_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_ad37_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_7876_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_ad37_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_7876_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_ad37_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c7_7876_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_ad37_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l450_c7_7876_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_ad37_return_output;
     VAR_MUX_uxn_opcodes_h_l457_c15_7f02_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l457_c35_a884_return_output, 8);
     VAR_current_dei_phase_uxn_opcodes_h_l462_c4_02f7 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l462_c4_efb0_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l447_l450_l435_DUPLICATE_6297_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l447_l450_l435_DUPLICATE_6297_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_7876_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l447_l450_l435_DUPLICATE_6297_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l447_l476_l469_l458_l450_DUPLICATE_9938_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_7876_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l447_l476_l469_l458_l450_DUPLICATE_9938_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_101a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l447_l476_l469_l458_l450_DUPLICATE_9938_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_3229_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l447_l476_l469_l458_l450_DUPLICATE_9938_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_a015_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l447_l476_l469_l458_l450_DUPLICATE_9938_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l447_l435_DUPLICATE_d77a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l447_l435_DUPLICATE_d77a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l447_l450_l476_l435_DUPLICATE_385e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l447_l450_l476_l435_DUPLICATE_385e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_7876_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l447_l450_l476_l435_DUPLICATE_385e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_a015_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l447_l450_l476_l435_DUPLICATE_385e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_7876_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l458_l450_l476_DUPLICATE_fad7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_101a_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l458_l450_l476_DUPLICATE_fad7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_a015_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l458_l450_l476_DUPLICATE_fad7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l469_c8_3229_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l473_l478_DUPLICATE_07cc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_a015_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l473_l478_DUPLICATE_07cc_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l458_l447_l450_l435_DUPLICATE_b290_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l458_l447_l450_l435_DUPLICATE_b290_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_7876_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l458_l447_l450_l435_DUPLICATE_b290_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_101a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l458_l447_l450_l435_DUPLICATE_b290_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l447_l435_l476_l458_l450_DUPLICATE_edf5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l447_l435_l476_l458_l450_DUPLICATE_edf5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c7_7876_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l447_l435_l476_l458_l450_DUPLICATE_edf5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l458_c3_101a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l447_l435_l476_l458_l450_DUPLICATE_edf5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_a015_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l447_l435_l476_l458_l450_DUPLICATE_edf5_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l458_c29_93b6_right := VAR_UNARY_OP_NOT_uxn_opcodes_h_l458_c49_a9b7_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l469_c8_3229_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l469_c13_275b_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l469_c8_3229_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l469_c13_275b_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l469_c8_3229_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l469_c13_275b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_3229_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l469_c13_275b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_3229_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l469_c13_275b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_3229_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l469_c13_275b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l469_c8_3229_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l469_c13_275b_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_a015_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_dae3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_a015_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_dae3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_a015_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_dae3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_a015_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_dae3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_a015_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_dae3_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l463_c9_b332_left := VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l463_l458_DUPLICATE_4696_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_9c54_left := VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l463_l458_DUPLICATE_4696_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue := VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l435_c2_55c1_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse := VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l435_c2_55c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_7876_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l453_c30_7d85_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l458_c3_101a_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l462_c4_02f7;
     -- BIN_OP_AND[uxn_opcodes_h_l458_c29_93b6] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l458_c29_93b6_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l458_c29_93b6_left;
     BIN_OP_AND_uxn_opcodes_h_l458_c29_93b6_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l458_c29_93b6_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l458_c29_93b6_return_output := BIN_OP_AND_uxn_opcodes_h_l458_c29_93b6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l476_c8_a015] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_a015_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_a015_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_a015_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_a015_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_a015_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_a015_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_a015_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_a015_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l476_c8_a015] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_a015_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_a015_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_a015_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_a015_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_a015_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_a015_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_a015_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_a015_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l450_c7_7876] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_7876_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_7876_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_7876_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_7876_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_7876_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_7876_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_7876_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_7876_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l469_c8_3229] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l469_c8_3229_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l469_c8_3229_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l469_c8_3229_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l469_c8_3229_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l469_c8_3229_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l469_c8_3229_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l469_c8_3229_return_output := has_written_to_t_MUX_uxn_opcodes_h_l469_c8_3229_return_output;

     -- t8_MUX[uxn_opcodes_h_l450_c7_7876] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l450_c7_7876_cond <= VAR_t8_MUX_uxn_opcodes_h_l450_c7_7876_cond;
     t8_MUX_uxn_opcodes_h_l450_c7_7876_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l450_c7_7876_iftrue;
     t8_MUX_uxn_opcodes_h_l450_c7_7876_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l450_c7_7876_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l450_c7_7876_return_output := t8_MUX_uxn_opcodes_h_l450_c7_7876_return_output;

     -- MUX[uxn_opcodes_h_l457_c15_7f02] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l457_c15_7f02_cond <= VAR_MUX_uxn_opcodes_h_l457_c15_7f02_cond;
     MUX_uxn_opcodes_h_l457_c15_7f02_iftrue <= VAR_MUX_uxn_opcodes_h_l457_c15_7f02_iftrue;
     MUX_uxn_opcodes_h_l457_c15_7f02_iffalse <= VAR_MUX_uxn_opcodes_h_l457_c15_7f02_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l457_c15_7f02_return_output := MUX_uxn_opcodes_h_l457_c15_7f02_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l476_c8_a015] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l476_c8_a015_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_a015_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l476_c8_a015_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_a015_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l476_c8_a015_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_a015_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_a015_return_output := has_written_to_n_MUX_uxn_opcodes_h_l476_c8_a015_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l435_c2_55c1] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_55c1_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_55c1_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_55c1_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_55c1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l435_c1_15a4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_15a4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_15a4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_15a4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_15a4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_15a4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_15a4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_15a4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_15a4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l476_c8_a015] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_a015_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_a015_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_a015_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_a015_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_a015_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_a015_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_a015_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_a015_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l450_c7_7876] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_7876_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_7876_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_7876_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_7876_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_7876_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_7876_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_7876_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_7876_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l469_c8_3229] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l469_c8_3229_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l469_c8_3229_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l469_c8_3229_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l469_c8_3229_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l469_c8_3229_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l469_c8_3229_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l469_c8_3229_return_output := current_dei_phase_MUX_uxn_opcodes_h_l469_c8_3229_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l447_c7_7a0c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_7a0c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_7a0c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l476_c8_a015] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l476_c8_a015_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_a015_cond;
     result_u8_value_MUX_uxn_opcodes_h_l476_c8_a015_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_a015_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l476_c8_a015_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_a015_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_a015_return_output := result_u8_value_MUX_uxn_opcodes_h_l476_c8_a015_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_9c54_right := VAR_BIN_OP_AND_uxn_opcodes_h_l458_c29_93b6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_7876_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l450_c7_7876_iffalse := VAR_MUX_uxn_opcodes_h_l457_c15_7f02_return_output;
     VAR_device_in_uxn_opcodes_h_l459_c23_d298_device_address := VAR_MUX_uxn_opcodes_h_l457_c15_7f02_return_output;
     VAR_printf_uxn_opcodes_h_l436_c3_07f3_uxn_opcodes_h_l436_c3_07f3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_15a4_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l458_c3_101a_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l469_c8_3229_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l469_c8_3229_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_a015_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l458_c3_101a_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l469_c8_3229_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_3229_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_a015_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_7876_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_3229_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_a015_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_7876_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_3229_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_a015_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l469_c8_3229_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_a015_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse := VAR_t8_MUX_uxn_opcodes_h_l450_c7_7876_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l447_c7_7a0c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_7a0c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_7a0c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l447_c7_7a0c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_7a0c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_7a0c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l450_c7_7876] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_7876_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_7876_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_7876_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_7876_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_7876_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_7876_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_7876_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_7876_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l458_c8_9c54] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l458_c8_9c54_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_9c54_left;
     BIN_OP_OR_uxn_opcodes_h_l458_c8_9c54_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_9c54_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_9c54_return_output := BIN_OP_OR_uxn_opcodes_h_l458_c8_9c54_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l469_c8_3229] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l469_c8_3229_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l469_c8_3229_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l469_c8_3229_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l469_c8_3229_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l469_c8_3229_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l469_c8_3229_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l469_c8_3229_return_output := has_written_to_n_MUX_uxn_opcodes_h_l469_c8_3229_return_output;

     -- t8_MUX[uxn_opcodes_h_l447_c7_7a0c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l447_c7_7a0c_cond <= VAR_t8_MUX_uxn_opcodes_h_l447_c7_7a0c_cond;
     t8_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue;
     t8_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output := t8_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l469_c8_3229] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_3229_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_3229_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_3229_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_3229_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_3229_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_3229_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_3229_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_3229_return_output;

     -- printf_uxn_opcodes_h_l436_c3_07f3[uxn_opcodes_h_l436_c3_07f3] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l436_c3_07f3_uxn_opcodes_h_l436_c3_07f3_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l436_c3_07f3_uxn_opcodes_h_l436_c3_07f3_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_u8_value_MUX[uxn_opcodes_h_l469_c8_3229] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l469_c8_3229_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l469_c8_3229_cond;
     result_u8_value_MUX_uxn_opcodes_h_l469_c8_3229_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l469_c8_3229_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l469_c8_3229_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l469_c8_3229_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l469_c8_3229_return_output := result_u8_value_MUX_uxn_opcodes_h_l469_c8_3229_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l469_c8_3229] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_3229_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_3229_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_3229_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_3229_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_3229_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_3229_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_3229_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_3229_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l469_c8_3229] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_3229_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_3229_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_3229_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_3229_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_3229_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_3229_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_3229_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_3229_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l450_c7_7876] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l450_c7_7876_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l450_c7_7876_cond;
     dei_param_MUX_uxn_opcodes_h_l450_c7_7876_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l450_c7_7876_iftrue;
     dei_param_MUX_uxn_opcodes_h_l450_c7_7876_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l450_c7_7876_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l450_c7_7876_return_output := dei_param_MUX_uxn_opcodes_h_l450_c7_7876_return_output;

     -- Submodule level 3
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_2456_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_9c54_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l458_c3_101a_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_9c54_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l458_c3_101a_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_9c54_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l458_c3_101a_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_9c54_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l458_c3_101a_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_9c54_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_101a_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_9c54_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_101a_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_9c54_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_101a_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_9c54_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_101a_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_9c54_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_101a_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_9c54_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_101a_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_9c54_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l458_c3_101a_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_9c54_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_ebbe_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_7876_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse := VAR_dei_param_MUX_uxn_opcodes_h_l450_c7_7876_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l458_c3_101a_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l469_c8_3229_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_101a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_3229_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_101a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_3229_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_101a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_3229_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l458_c3_101a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l469_c8_3229_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse := VAR_t8_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output;
     -- current_dei_phase_MUX[uxn_opcodes_h_l458_c3_101a] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l458_c3_101a_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l458_c3_101a_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l458_c3_101a_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l458_c3_101a_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l458_c3_101a_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l458_c3_101a_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l458_c3_101a_return_output := current_dei_phase_MUX_uxn_opcodes_h_l458_c3_101a_return_output;

     -- t8_MUX[uxn_opcodes_h_l435_c2_55c1] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l435_c2_55c1_cond <= VAR_t8_MUX_uxn_opcodes_h_l435_c2_55c1_cond;
     t8_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue;
     t8_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l435_c2_55c1_return_output := t8_MUX_uxn_opcodes_h_l435_c2_55c1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l455_c1_ebbe] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_ebbe_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_ebbe_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_ebbe_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_ebbe_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_ebbe_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_ebbe_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_ebbe_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_ebbe_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l435_c2_55c1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_55c1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_55c1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_55c1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_55c1_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l458_c3_101a] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l458_c3_101a_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l458_c3_101a_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l458_c3_101a_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l458_c3_101a_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l458_c3_101a_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l458_c3_101a_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l458_c3_101a_return_output := has_written_to_t_MUX_uxn_opcodes_h_l458_c3_101a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l458_c3_101a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l458_c3_101a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l458_c3_101a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l458_c3_101a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l458_c3_101a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l458_c3_101a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l458_c3_101a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l458_c3_101a_return_output := result_u8_value_MUX_uxn_opcodes_h_l458_c3_101a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l458_c3_101a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_101a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_101a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_101a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_101a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_101a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_101a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_101a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_101a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l458_c3_101a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_101a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_101a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_101a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_101a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_101a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_101a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_101a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_101a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l435_c2_55c1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_55c1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_55c1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_55c1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_55c1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l458_c3_101a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_101a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_101a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_101a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_101a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_101a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_101a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_101a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_101a_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l447_c7_7a0c] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l447_c7_7a0c_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l447_c7_7a0c_cond;
     dei_param_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue;
     dei_param_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output := dei_param_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l458_c3_101a] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l458_c3_101a_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l458_c3_101a_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l458_c3_101a_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l458_c3_101a_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l458_c3_101a_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l458_c3_101a_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l458_c3_101a_return_output := has_written_to_n_MUX_uxn_opcodes_h_l458_c3_101a_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_2456_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_ebbe_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c7_7876_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l458_c3_101a_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse := VAR_dei_param_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c7_7876_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l458_c3_101a_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_7876_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l458_c3_101a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_7876_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_101a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_7876_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_101a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_7876_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_101a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c7_7876_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l458_c3_101a_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l435_c2_55c1_return_output;
     -- has_written_to_t_MUX[uxn_opcodes_h_l450_c7_7876] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l450_c7_7876_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_7876_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l450_c7_7876_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_7876_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l450_c7_7876_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_7876_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_7876_return_output := has_written_to_t_MUX_uxn_opcodes_h_l450_c7_7876_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l450_c7_7876] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_7876_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_7876_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_7876_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_7876_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_7876_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_7876_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_7876_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_7876_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l458_c1_2456] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_2456_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_2456_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_2456_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_2456_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_2456_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_2456_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_2456_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_2456_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l450_c7_7876] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l450_c7_7876_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c7_7876_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l450_c7_7876_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c7_7876_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l450_c7_7876_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c7_7876_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c7_7876_return_output := current_dei_phase_MUX_uxn_opcodes_h_l450_c7_7876_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l450_c7_7876] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_7876_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_7876_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_7876_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_7876_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_7876_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_7876_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_7876_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_7876_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l450_c7_7876] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_7876_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_7876_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_7876_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_7876_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_7876_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_7876_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_7876_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_7876_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l450_c7_7876] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l450_c7_7876_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c7_7876_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l450_c7_7876_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c7_7876_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l450_c7_7876_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c7_7876_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c7_7876_return_output := has_written_to_n_MUX_uxn_opcodes_h_l450_c7_7876_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l435_c2_55c1] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l435_c2_55c1_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l435_c2_55c1_cond;
     dei_param_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue;
     dei_param_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l435_c2_55c1_return_output := dei_param_MUX_uxn_opcodes_h_l435_c2_55c1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l450_c7_7876] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l450_c7_7876_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c7_7876_cond;
     result_u8_value_MUX_uxn_opcodes_h_l450_c7_7876_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c7_7876_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l450_c7_7876_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c7_7876_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c7_7876_return_output := result_u8_value_MUX_uxn_opcodes_h_l450_c7_7876_return_output;

     -- Submodule level 5
     VAR_device_in_uxn_opcodes_h_l459_c23_d298_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_2456_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c7_7876_return_output;
     REG_VAR_dei_param := VAR_dei_param_MUX_uxn_opcodes_h_l435_c2_55c1_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c7_7876_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_7876_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_7876_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_7876_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_7876_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c7_7876_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l447_c7_7a0c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l447_c7_7a0c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l447_c7_7a0c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output := result_u8_value_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l447_c7_7a0c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_7a0c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_7a0c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l447_c7_7a0c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_7a0c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_7a0c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l447_c7_7a0c] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l447_c7_7a0c_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l447_c7_7a0c_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output := has_written_to_n_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output;

     -- device_in[uxn_opcodes_h_l459_c23_d298] LATENCY=0
     -- Clock enable
     device_in_uxn_opcodes_h_l459_c23_d298_CLOCK_ENABLE <= VAR_device_in_uxn_opcodes_h_l459_c23_d298_CLOCK_ENABLE;
     -- Inputs
     device_in_uxn_opcodes_h_l459_c23_d298_device_address <= VAR_device_in_uxn_opcodes_h_l459_c23_d298_device_address;
     device_in_uxn_opcodes_h_l459_c23_d298_phase <= VAR_device_in_uxn_opcodes_h_l459_c23_d298_phase;
     device_in_uxn_opcodes_h_l459_c23_d298_previous_device_ram_read <= VAR_device_in_uxn_opcodes_h_l459_c23_d298_previous_device_ram_read;
     -- Outputs
     VAR_device_in_uxn_opcodes_h_l459_c23_d298_return_output := device_in_uxn_opcodes_h_l459_c23_d298_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l447_c7_7a0c] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l447_c7_7a0c_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l447_c7_7a0c_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output := current_dei_phase_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l447_c7_7a0c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_7a0c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_7a0c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l447_c7_7a0c] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l447_c7_7a0c_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l447_c7_7a0c_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output := has_written_to_t_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output;

     -- Submodule level 6
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l458_c3_101a_iftrue := VAR_device_in_uxn_opcodes_h_l459_c23_d298_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output;
     -- CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l465_l463_DUPLICATE_52c5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l465_l463_DUPLICATE_52c5_return_output := VAR_device_in_uxn_opcodes_h_l459_c23_d298_return_output.is_dei_done;

     -- result_u8_value_MUX[uxn_opcodes_h_l435_c2_55c1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l435_c2_55c1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l435_c2_55c1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l435_c2_55c1_return_output := result_u8_value_MUX_uxn_opcodes_h_l435_c2_55c1_return_output;

     -- CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d[uxn_opcodes_h_l460_c32_6baf] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l460_c32_6baf_return_output := VAR_device_in_uxn_opcodes_h_l459_c23_d298_return_output.device_ram_address;

     -- current_dei_phase_MUX[uxn_opcodes_h_l435_c2_55c1] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l435_c2_55c1_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l435_c2_55c1_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l435_c2_55c1_return_output := current_dei_phase_MUX_uxn_opcodes_h_l435_c2_55c1_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l435_c2_55c1] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l435_c2_55c1_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c2_55c1_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c2_55c1_return_output := has_written_to_t_MUX_uxn_opcodes_h_l435_c2_55c1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l435_c2_55c1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_55c1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_55c1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_55c1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_55c1_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l435_c2_55c1] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l435_c2_55c1_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l435_c2_55c1_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l435_c2_55c1_return_output := has_written_to_n_MUX_uxn_opcodes_h_l435_c2_55c1_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l458_c3_101a] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l458_c3_101a_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l458_c3_101a_cond;
     device_in_result_MUX_uxn_opcodes_h_l458_c3_101a_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l458_c3_101a_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l458_c3_101a_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l458_c3_101a_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l458_c3_101a_return_output := device_in_result_MUX_uxn_opcodes_h_l458_c3_101a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l435_c2_55c1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_55c1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_55c1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_55c1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_55c1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l435_c2_55c1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_55c1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_55c1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_55c1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_55c1_return_output;

     -- Submodule level 7
     VAR_BIN_OP_AND_uxn_opcodes_h_l463_c9_b332_right := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l465_l463_DUPLICATE_52c5_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_f009_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l465_l463_DUPLICATE_52c5_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_101a_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l460_c32_6baf_return_output;
     REG_VAR_current_dei_phase := VAR_current_dei_phase_MUX_uxn_opcodes_h_l435_c2_55c1_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_7876_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l458_c3_101a_return_output;
     REG_VAR_has_written_to_n := VAR_has_written_to_n_MUX_uxn_opcodes_h_l435_c2_55c1_return_output;
     REG_VAR_has_written_to_t := VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c2_55c1_return_output;
     -- is_second_dei_done_MUX[uxn_opcodes_h_l465_c11_f009] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_f009_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_f009_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_f009_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_f009_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_f009_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_f009_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_f009_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_f009_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l450_c7_7876] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l450_c7_7876_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_7876_cond;
     device_in_result_MUX_uxn_opcodes_h_l450_c7_7876_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_7876_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l450_c7_7876_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_7876_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_7876_return_output := device_in_result_MUX_uxn_opcodes_h_l450_c7_7876_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l458_c3_101a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_101a_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_101a_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_101a_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_101a_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_101a_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_101a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_101a_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_101a_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l463_c9_b332] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l463_c9_b332_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l463_c9_b332_left;
     BIN_OP_AND_uxn_opcodes_h_l463_c9_b332_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l463_c9_b332_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l463_c9_b332_return_output := BIN_OP_AND_uxn_opcodes_h_l463_c9_b332_return_output;

     -- Submodule level 8
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_6849_cond := VAR_BIN_OP_AND_uxn_opcodes_h_l463_c9_b332_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_6849_cond := VAR_BIN_OP_AND_uxn_opcodes_h_l463_c9_b332_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_7876_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_6849_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_f009_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_7876_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_101a_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l450_c7_7876] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_7876_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_7876_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_7876_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_7876_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_7876_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_7876_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_7876_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_7876_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l463_c4_6849] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_6849_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_6849_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_6849_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_6849_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_6849_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_6849_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_6849_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_6849_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l463_c4_6849] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_6849_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_6849_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_6849_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_6849_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_6849_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_6849_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_6849_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_6849_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l447_c7_7a0c] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l447_c7_7a0c_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l447_c7_7a0c_cond;
     device_in_result_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output := device_in_result_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output;

     -- Submodule level 9
     VAR_device_in_result_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_101a_iftrue := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_6849_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_101a_iftrue := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_6849_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_7876_return_output;
     -- device_in_result_MUX[uxn_opcodes_h_l435_c2_55c1] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l435_c2_55c1_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l435_c2_55c1_cond;
     device_in_result_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l435_c2_55c1_return_output := device_in_result_MUX_uxn_opcodes_h_l435_c2_55c1_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l458_c3_101a] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_101a_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_101a_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_101a_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_101a_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_101a_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_101a_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_101a_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_101a_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l458_c3_101a] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_101a_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_101a_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_101a_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_101a_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_101a_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_101a_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_101a_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_101a_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l447_c7_7a0c] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_7a0c_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_7a0c_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output;

     -- Submodule level 10
     REG_VAR_device_in_result := VAR_device_in_result_MUX_uxn_opcodes_h_l435_c2_55c1_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_7876_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_101a_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_7876_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_101a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output;
     -- is_second_dei_done_MUX[uxn_opcodes_h_l450_c7_7876] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_7876_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_7876_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_7876_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_7876_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_7876_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_7876_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_7876_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_7876_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l450_c7_7876] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_7876_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_7876_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_7876_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_7876_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_7876_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_7876_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_7876_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_7876_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l435_c2_55c1] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_55c1_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_55c1_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_55c1_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_55c1_return_output;

     -- Submodule level 11
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_7876_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_7876_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_f08e_uxn_opcodes_h_l487_l429_DUPLICATE_8530 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f08e_uxn_opcodes_h_l487_l429_DUPLICATE_8530_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_f08e(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_55c1_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_55c1_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_55c1_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_55c1_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_55c1_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_55c1_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_55c1_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l435_c2_55c1_return_output);

     -- is_second_dei_done_MUX[uxn_opcodes_h_l447_c7_7a0c] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l447_c7_7a0c] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output;

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f08e_uxn_opcodes_h_l487_l429_DUPLICATE_8530_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f08e_uxn_opcodes_h_l487_l429_DUPLICATE_8530_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_7a0c_return_output;
     -- is_second_dei_done_MUX[uxn_opcodes_h_l435_c2_55c1] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l435_c2_55c1] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1_return_output;

     -- Submodule level 13
     REG_VAR_is_first_dei_done := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1_return_output;
     REG_VAR_is_second_dei_done := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_55c1_return_output;
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
