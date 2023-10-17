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
entity dei2_0CLK_5ef9c585 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end dei2_0CLK_5ef9c585;
architecture arch of dei2_0CLK_5ef9c585 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l462_c6_2daa]
signal BIN_OP_EQ_uxn_opcodes_h_l462_c6_2daa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l462_c6_2daa_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l462_c6_2daa_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l462_c1_df30]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_df30_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_df30_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_df30_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_df30_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l474_c7_c2d1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_c2d1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l462_c2_33e4]
signal is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4_return_output : unsigned(0 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l462_c2_33e4]
signal dei_param_MUX_uxn_opcodes_h_l462_c2_33e4_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l462_c2_33e4_return_output : unsigned(7 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l462_c2_33e4]
signal is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l462_c2_33e4]
signal t8_MUX_uxn_opcodes_h_l462_c2_33e4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l462_c2_33e4_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l462_c2_33e4]
signal result_u8_value_MUX_uxn_opcodes_h_l462_c2_33e4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l462_c2_33e4_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l462_c2_33e4]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_33e4_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_33e4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l462_c2_33e4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_33e4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_33e4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l462_c2_33e4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_33e4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_33e4_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l462_c2_33e4]
signal result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_33e4_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_33e4_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l462_c2_33e4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_33e4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_33e4_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l462_c2_33e4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_33e4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_33e4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l462_c2_33e4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_33e4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_33e4_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l462_c2_33e4]
signal has_written_to_n_MUX_uxn_opcodes_h_l462_c2_33e4_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l462_c2_33e4_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l462_c2_33e4]
signal has_written_to_t_MUX_uxn_opcodes_h_l462_c2_33e4_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l462_c2_33e4_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l462_c2_33e4]
signal current_dei_phase_MUX_uxn_opcodes_h_l462_c2_33e4_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l462_c2_33e4_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l462_c2_33e4]
signal device_in_result_MUX_uxn_opcodes_h_l462_c2_33e4_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l462_c2_33e4_return_output : device_in_result_t;

-- printf_uxn_opcodes_h_l463_c3_cf34[uxn_opcodes_h_l463_c3_cf34]
signal printf_uxn_opcodes_h_l463_c3_cf34_uxn_opcodes_h_l463_c3_cf34_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l474_c11_d96e]
signal BIN_OP_EQ_uxn_opcodes_h_l474_c11_d96e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l474_c11_d96e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l474_c11_d96e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l477_c7_f7d0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f7d0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l474_c7_c2d1]
signal is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output : unsigned(0 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l474_c7_c2d1]
signal dei_param_MUX_uxn_opcodes_h_l474_c7_c2d1_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output : unsigned(7 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l474_c7_c2d1]
signal is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l474_c7_c2d1]
signal t8_MUX_uxn_opcodes_h_l474_c7_c2d1_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l474_c7_c2d1]
signal result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_c2d1_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l474_c7_c2d1]
signal result_u8_value_MUX_uxn_opcodes_h_l474_c7_c2d1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l474_c7_c2d1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_c2d1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l474_c7_c2d1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_c2d1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l474_c7_c2d1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_c2d1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l474_c7_c2d1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_c2d1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l474_c7_c2d1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_c2d1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output : unsigned(3 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l474_c7_c2d1]
signal has_written_to_n_MUX_uxn_opcodes_h_l474_c7_c2d1_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l474_c7_c2d1]
signal has_written_to_t_MUX_uxn_opcodes_h_l474_c7_c2d1_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l474_c7_c2d1]
signal current_dei_phase_MUX_uxn_opcodes_h_l474_c7_c2d1_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l474_c7_c2d1]
signal device_in_result_MUX_uxn_opcodes_h_l474_c7_c2d1_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l477_c11_d0d0]
signal BIN_OP_EQ_uxn_opcodes_h_l477_c11_d0d0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l477_c11_d0d0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l477_c11_d0d0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l482_c1_20eb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_20eb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_20eb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_20eb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_20eb_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l477_c7_f7d0]
signal is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output : unsigned(0 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l477_c7_f7d0]
signal dei_param_MUX_uxn_opcodes_h_l477_c7_f7d0_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output : unsigned(7 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l477_c7_f7d0]
signal is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l477_c7_f7d0]
signal t8_MUX_uxn_opcodes_h_l477_c7_f7d0_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l477_c7_f7d0]
signal result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f7d0_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l477_c7_f7d0]
signal result_u8_value_MUX_uxn_opcodes_h_l477_c7_f7d0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l477_c7_f7d0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f7d0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l477_c7_f7d0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f7d0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l477_c7_f7d0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f7d0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l477_c7_f7d0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f7d0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l477_c7_f7d0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f7d0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output : unsigned(3 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l477_c7_f7d0]
signal has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f7d0_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l477_c7_f7d0]
signal has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f7d0_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l477_c7_f7d0]
signal current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f7d0_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l477_c7_f7d0]
signal device_in_result_MUX_uxn_opcodes_h_l477_c7_f7d0_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output : device_in_result_t;

-- sp_relative_shift[uxn_opcodes_h_l480_c30_100a]
signal sp_relative_shift_uxn_opcodes_h_l480_c30_100a_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l480_c30_100a_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l480_c30_100a_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l480_c30_100a_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l484_c35_44af]
signal BIN_OP_PLUS_uxn_opcodes_h_l484_c35_44af_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l484_c35_44af_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l484_c35_44af_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l484_c15_30ee]
signal MUX_uxn_opcodes_h_l484_c15_30ee_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l484_c15_30ee_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l484_c15_30ee_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l484_c15_30ee_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l485_c49_c299]
signal UNARY_OP_NOT_uxn_opcodes_h_l485_c49_c299_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l485_c49_c299_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l485_c29_cbd7]
signal BIN_OP_AND_uxn_opcodes_h_l485_c29_cbd7_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l485_c29_cbd7_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l485_c29_cbd7_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l485_c8_cb9a]
signal BIN_OP_OR_uxn_opcodes_h_l485_c8_cb9a_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l485_c8_cb9a_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l485_c8_cb9a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l485_c1_1db2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_1db2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_1db2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_1db2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_1db2_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l485_c3_512c]
signal is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_512c_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_512c_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_512c_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_512c_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l485_c3_512c]
signal is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_512c_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_512c_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_512c_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_512c_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l485_c3_512c]
signal result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_512c_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_512c_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_512c_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_512c_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l485_c3_512c]
signal result_u8_value_MUX_uxn_opcodes_h_l485_c3_512c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l485_c3_512c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l485_c3_512c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l485_c3_512c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l485_c3_512c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_512c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_512c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_512c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_512c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l485_c3_512c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_512c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_512c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_512c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_512c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l485_c3_512c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_512c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_512c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_512c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_512c_return_output : unsigned(3 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l485_c3_512c]
signal has_written_to_n_MUX_uxn_opcodes_h_l485_c3_512c_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l485_c3_512c_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l485_c3_512c_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l485_c3_512c_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l485_c3_512c]
signal has_written_to_t_MUX_uxn_opcodes_h_l485_c3_512c_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l485_c3_512c_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l485_c3_512c_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l485_c3_512c_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l485_c3_512c]
signal current_dei_phase_MUX_uxn_opcodes_h_l485_c3_512c_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l485_c3_512c_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l485_c3_512c_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l485_c3_512c_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l485_c3_512c]
signal device_in_result_MUX_uxn_opcodes_h_l485_c3_512c_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l485_c3_512c_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l485_c3_512c_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l485_c3_512c_return_output : device_in_result_t;

-- device_in[uxn_opcodes_h_l486_c23_49e2]
signal device_in_uxn_opcodes_h_l486_c23_49e2_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_in_uxn_opcodes_h_l486_c23_49e2_device_address : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l486_c23_49e2_phase : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l486_c23_49e2_previous_device_ram_read : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l486_c23_49e2_return_output : device_in_result_t;

-- BIN_OP_PLUS[uxn_opcodes_h_l489_c4_0d9e]
signal BIN_OP_PLUS_uxn_opcodes_h_l489_c4_0d9e_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l489_c4_0d9e_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l489_c4_0d9e_return_output : unsigned(8 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l490_c9_fb71]
signal BIN_OP_AND_uxn_opcodes_h_l490_c9_fb71_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l490_c9_fb71_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l490_c9_fb71_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l490_c4_20cb]
signal is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l490_c4_20cb]
signal is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l492_c11_843b]
signal is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_843b_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_843b_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_843b_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_843b_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l496_c13_ec31]
signal UNARY_OP_NOT_uxn_opcodes_h_l496_c13_ec31_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l496_c13_ec31_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l496_c8_d225]
signal result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_d225_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_d225_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_d225_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_d225_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l496_c8_d225]
signal result_u8_value_MUX_uxn_opcodes_h_l496_c8_d225_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l496_c8_d225_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l496_c8_d225_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l496_c8_d225_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l496_c8_d225]
signal result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_d225_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_d225_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_d225_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_d225_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l496_c8_d225]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_d225_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_d225_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_d225_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_d225_return_output : unsigned(3 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l496_c8_d225]
signal has_written_to_n_MUX_uxn_opcodes_h_l496_c8_d225_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l496_c8_d225_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l496_c8_d225_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l496_c8_d225_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l496_c8_d225]
signal has_written_to_t_MUX_uxn_opcodes_h_l496_c8_d225_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l496_c8_d225_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l496_c8_d225_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l496_c8_d225_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l496_c8_d225]
signal current_dei_phase_MUX_uxn_opcodes_h_l496_c8_d225_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l496_c8_d225_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l496_c8_d225_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l496_c8_d225_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l503_c13_4f96]
signal UNARY_OP_NOT_uxn_opcodes_h_l503_c13_4f96_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l503_c13_4f96_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l503_c8_2530]
signal result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_2530_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_2530_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_2530_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_2530_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l503_c8_2530]
signal result_u8_value_MUX_uxn_opcodes_h_l503_c8_2530_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l503_c8_2530_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l503_c8_2530_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l503_c8_2530_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l503_c8_2530]
signal result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_2530_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_2530_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_2530_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_2530_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l503_c8_2530]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_2530_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_2530_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_2530_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_2530_return_output : unsigned(3 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l503_c8_2530]
signal has_written_to_n_MUX_uxn_opcodes_h_l503_c8_2530_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l503_c8_2530_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l503_c8_2530_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l503_c8_2530_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l485_l490_DUPLICATE_3602
signal UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l485_l490_DUPLICATE_3602_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l485_l490_DUPLICATE_3602_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_7ca8( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_device_ram_write := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.device_ram_address := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_stack_write := ref_toks_7;
      base.is_sp_shift := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l462_c6_2daa
BIN_OP_EQ_uxn_opcodes_h_l462_c6_2daa : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l462_c6_2daa_left,
BIN_OP_EQ_uxn_opcodes_h_l462_c6_2daa_right,
BIN_OP_EQ_uxn_opcodes_h_l462_c6_2daa_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_df30
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_df30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_df30_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_df30_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_df30_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_df30_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_c2d1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_c2d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_c2d1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4
is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4_return_output);

-- dei_param_MUX_uxn_opcodes_h_l462_c2_33e4
dei_param_MUX_uxn_opcodes_h_l462_c2_33e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l462_c2_33e4_cond,
dei_param_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue,
dei_param_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse,
dei_param_MUX_uxn_opcodes_h_l462_c2_33e4_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4
is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4_return_output);

-- t8_MUX_uxn_opcodes_h_l462_c2_33e4
t8_MUX_uxn_opcodes_h_l462_c2_33e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l462_c2_33e4_cond,
t8_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue,
t8_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse,
t8_MUX_uxn_opcodes_h_l462_c2_33e4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l462_c2_33e4
result_u8_value_MUX_uxn_opcodes_h_l462_c2_33e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l462_c2_33e4_cond,
result_u8_value_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l462_c2_33e4_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_33e4
result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_33e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_33e4_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_33e4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_33e4
result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_33e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_33e4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_33e4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_33e4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_33e4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_33e4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_33e4_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_33e4
result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_33e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_33e4_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_33e4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_33e4
result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_33e4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_33e4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_33e4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_33e4
result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_33e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_33e4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_33e4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_33e4
result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_33e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_33e4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_33e4_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l462_c2_33e4
has_written_to_n_MUX_uxn_opcodes_h_l462_c2_33e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l462_c2_33e4_cond,
has_written_to_n_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l462_c2_33e4_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l462_c2_33e4
has_written_to_t_MUX_uxn_opcodes_h_l462_c2_33e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l462_c2_33e4_cond,
has_written_to_t_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l462_c2_33e4_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l462_c2_33e4
current_dei_phase_MUX_uxn_opcodes_h_l462_c2_33e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l462_c2_33e4_cond,
current_dei_phase_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l462_c2_33e4_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l462_c2_33e4
device_in_result_MUX_uxn_opcodes_h_l462_c2_33e4 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l462_c2_33e4_cond,
device_in_result_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue,
device_in_result_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse,
device_in_result_MUX_uxn_opcodes_h_l462_c2_33e4_return_output);

-- printf_uxn_opcodes_h_l463_c3_cf34_uxn_opcodes_h_l463_c3_cf34
printf_uxn_opcodes_h_l463_c3_cf34_uxn_opcodes_h_l463_c3_cf34 : entity work.printf_uxn_opcodes_h_l463_c3_cf34_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l463_c3_cf34_uxn_opcodes_h_l463_c3_cf34_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l474_c11_d96e
BIN_OP_EQ_uxn_opcodes_h_l474_c11_d96e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l474_c11_d96e_left,
BIN_OP_EQ_uxn_opcodes_h_l474_c11_d96e_right,
BIN_OP_EQ_uxn_opcodes_h_l474_c11_d96e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f7d0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f7d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f7d0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1
is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output);

-- dei_param_MUX_uxn_opcodes_h_l474_c7_c2d1
dei_param_MUX_uxn_opcodes_h_l474_c7_c2d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l474_c7_c2d1_cond,
dei_param_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue,
dei_param_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse,
dei_param_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1
is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output);

-- t8_MUX_uxn_opcodes_h_l474_c7_c2d1
t8_MUX_uxn_opcodes_h_l474_c7_c2d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l474_c7_c2d1_cond,
t8_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue,
t8_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse,
t8_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_c2d1
result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_c2d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_c2d1_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l474_c7_c2d1
result_u8_value_MUX_uxn_opcodes_h_l474_c7_c2d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l474_c7_c2d1_cond,
result_u8_value_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_c2d1
result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_c2d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_c2d1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_c2d1
result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_c2d1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_c2d1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_c2d1
result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_c2d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_c2d1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_c2d1
result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_c2d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_c2d1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_c2d1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_c2d1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_c2d1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l474_c7_c2d1
has_written_to_n_MUX_uxn_opcodes_h_l474_c7_c2d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l474_c7_c2d1_cond,
has_written_to_n_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l474_c7_c2d1
has_written_to_t_MUX_uxn_opcodes_h_l474_c7_c2d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l474_c7_c2d1_cond,
has_written_to_t_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l474_c7_c2d1
current_dei_phase_MUX_uxn_opcodes_h_l474_c7_c2d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l474_c7_c2d1_cond,
current_dei_phase_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l474_c7_c2d1
device_in_result_MUX_uxn_opcodes_h_l474_c7_c2d1 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l474_c7_c2d1_cond,
device_in_result_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue,
device_in_result_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse,
device_in_result_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l477_c11_d0d0
BIN_OP_EQ_uxn_opcodes_h_l477_c11_d0d0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l477_c11_d0d0_left,
BIN_OP_EQ_uxn_opcodes_h_l477_c11_d0d0_right,
BIN_OP_EQ_uxn_opcodes_h_l477_c11_d0d0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_20eb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_20eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_20eb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_20eb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_20eb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_20eb_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0
is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output);

-- dei_param_MUX_uxn_opcodes_h_l477_c7_f7d0
dei_param_MUX_uxn_opcodes_h_l477_c7_f7d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l477_c7_f7d0_cond,
dei_param_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue,
dei_param_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse,
dei_param_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0
is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output);

-- t8_MUX_uxn_opcodes_h_l477_c7_f7d0
t8_MUX_uxn_opcodes_h_l477_c7_f7d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l477_c7_f7d0_cond,
t8_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue,
t8_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse,
t8_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f7d0
result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f7d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f7d0_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l477_c7_f7d0
result_u8_value_MUX_uxn_opcodes_h_l477_c7_f7d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l477_c7_f7d0_cond,
result_u8_value_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f7d0
result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f7d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f7d0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f7d0
result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f7d0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f7d0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f7d0
result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f7d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f7d0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f7d0
result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f7d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f7d0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f7d0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f7d0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f7d0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f7d0
has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f7d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f7d0_cond,
has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f7d0
has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f7d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f7d0_cond,
has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f7d0
current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f7d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f7d0_cond,
current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l477_c7_f7d0
device_in_result_MUX_uxn_opcodes_h_l477_c7_f7d0 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l477_c7_f7d0_cond,
device_in_result_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue,
device_in_result_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse,
device_in_result_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output);

-- sp_relative_shift_uxn_opcodes_h_l480_c30_100a
sp_relative_shift_uxn_opcodes_h_l480_c30_100a : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l480_c30_100a_ins,
sp_relative_shift_uxn_opcodes_h_l480_c30_100a_x,
sp_relative_shift_uxn_opcodes_h_l480_c30_100a_y,
sp_relative_shift_uxn_opcodes_h_l480_c30_100a_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l484_c35_44af
BIN_OP_PLUS_uxn_opcodes_h_l484_c35_44af : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l484_c35_44af_left,
BIN_OP_PLUS_uxn_opcodes_h_l484_c35_44af_right,
BIN_OP_PLUS_uxn_opcodes_h_l484_c35_44af_return_output);

-- MUX_uxn_opcodes_h_l484_c15_30ee
MUX_uxn_opcodes_h_l484_c15_30ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l484_c15_30ee_cond,
MUX_uxn_opcodes_h_l484_c15_30ee_iftrue,
MUX_uxn_opcodes_h_l484_c15_30ee_iffalse,
MUX_uxn_opcodes_h_l484_c15_30ee_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l485_c49_c299
UNARY_OP_NOT_uxn_opcodes_h_l485_c49_c299 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l485_c49_c299_expr,
UNARY_OP_NOT_uxn_opcodes_h_l485_c49_c299_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l485_c29_cbd7
BIN_OP_AND_uxn_opcodes_h_l485_c29_cbd7 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l485_c29_cbd7_left,
BIN_OP_AND_uxn_opcodes_h_l485_c29_cbd7_right,
BIN_OP_AND_uxn_opcodes_h_l485_c29_cbd7_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l485_c8_cb9a
BIN_OP_OR_uxn_opcodes_h_l485_c8_cb9a : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l485_c8_cb9a_left,
BIN_OP_OR_uxn_opcodes_h_l485_c8_cb9a_right,
BIN_OP_OR_uxn_opcodes_h_l485_c8_cb9a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_1db2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_1db2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_1db2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_1db2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_1db2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_1db2_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_512c
is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_512c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_512c_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_512c_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_512c_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_512c_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_512c
is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_512c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_512c_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_512c_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_512c_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_512c_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_512c
result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_512c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_512c_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_512c_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_512c_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_512c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l485_c3_512c
result_u8_value_MUX_uxn_opcodes_h_l485_c3_512c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l485_c3_512c_cond,
result_u8_value_MUX_uxn_opcodes_h_l485_c3_512c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l485_c3_512c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l485_c3_512c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_512c
result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_512c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_512c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_512c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_512c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_512c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_512c
result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_512c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_512c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_512c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_512c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_512c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_512c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_512c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_512c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_512c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_512c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_512c_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l485_c3_512c
has_written_to_n_MUX_uxn_opcodes_h_l485_c3_512c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l485_c3_512c_cond,
has_written_to_n_MUX_uxn_opcodes_h_l485_c3_512c_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l485_c3_512c_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l485_c3_512c_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l485_c3_512c
has_written_to_t_MUX_uxn_opcodes_h_l485_c3_512c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l485_c3_512c_cond,
has_written_to_t_MUX_uxn_opcodes_h_l485_c3_512c_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l485_c3_512c_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l485_c3_512c_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l485_c3_512c
current_dei_phase_MUX_uxn_opcodes_h_l485_c3_512c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l485_c3_512c_cond,
current_dei_phase_MUX_uxn_opcodes_h_l485_c3_512c_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l485_c3_512c_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l485_c3_512c_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l485_c3_512c
device_in_result_MUX_uxn_opcodes_h_l485_c3_512c : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l485_c3_512c_cond,
device_in_result_MUX_uxn_opcodes_h_l485_c3_512c_iftrue,
device_in_result_MUX_uxn_opcodes_h_l485_c3_512c_iffalse,
device_in_result_MUX_uxn_opcodes_h_l485_c3_512c_return_output);

-- device_in_uxn_opcodes_h_l486_c23_49e2
device_in_uxn_opcodes_h_l486_c23_49e2 : entity work.device_in_0CLK_5af1a430 port map (
clk,
device_in_uxn_opcodes_h_l486_c23_49e2_CLOCK_ENABLE,
device_in_uxn_opcodes_h_l486_c23_49e2_device_address,
device_in_uxn_opcodes_h_l486_c23_49e2_phase,
device_in_uxn_opcodes_h_l486_c23_49e2_previous_device_ram_read,
device_in_uxn_opcodes_h_l486_c23_49e2_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l489_c4_0d9e
BIN_OP_PLUS_uxn_opcodes_h_l489_c4_0d9e : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l489_c4_0d9e_left,
BIN_OP_PLUS_uxn_opcodes_h_l489_c4_0d9e_right,
BIN_OP_PLUS_uxn_opcodes_h_l489_c4_0d9e_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l490_c9_fb71
BIN_OP_AND_uxn_opcodes_h_l490_c9_fb71 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l490_c9_fb71_left,
BIN_OP_AND_uxn_opcodes_h_l490_c9_fb71_right,
BIN_OP_AND_uxn_opcodes_h_l490_c9_fb71_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb
is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb
is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_843b
is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_843b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_843b_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_843b_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_843b_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_843b_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l496_c13_ec31
UNARY_OP_NOT_uxn_opcodes_h_l496_c13_ec31 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l496_c13_ec31_expr,
UNARY_OP_NOT_uxn_opcodes_h_l496_c13_ec31_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_d225
result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_d225 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_d225_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_d225_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_d225_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_d225_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l496_c8_d225
result_u8_value_MUX_uxn_opcodes_h_l496_c8_d225 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l496_c8_d225_cond,
result_u8_value_MUX_uxn_opcodes_h_l496_c8_d225_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l496_c8_d225_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l496_c8_d225_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_d225
result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_d225 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_d225_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_d225_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_d225_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_d225_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_d225
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_d225 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_d225_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_d225_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_d225_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_d225_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l496_c8_d225
has_written_to_n_MUX_uxn_opcodes_h_l496_c8_d225 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l496_c8_d225_cond,
has_written_to_n_MUX_uxn_opcodes_h_l496_c8_d225_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l496_c8_d225_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l496_c8_d225_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l496_c8_d225
has_written_to_t_MUX_uxn_opcodes_h_l496_c8_d225 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l496_c8_d225_cond,
has_written_to_t_MUX_uxn_opcodes_h_l496_c8_d225_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l496_c8_d225_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l496_c8_d225_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l496_c8_d225
current_dei_phase_MUX_uxn_opcodes_h_l496_c8_d225 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l496_c8_d225_cond,
current_dei_phase_MUX_uxn_opcodes_h_l496_c8_d225_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l496_c8_d225_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l496_c8_d225_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l503_c13_4f96
UNARY_OP_NOT_uxn_opcodes_h_l503_c13_4f96 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l503_c13_4f96_expr,
UNARY_OP_NOT_uxn_opcodes_h_l503_c13_4f96_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_2530
result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_2530 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_2530_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_2530_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_2530_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_2530_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l503_c8_2530
result_u8_value_MUX_uxn_opcodes_h_l503_c8_2530 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l503_c8_2530_cond,
result_u8_value_MUX_uxn_opcodes_h_l503_c8_2530_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l503_c8_2530_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l503_c8_2530_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_2530
result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_2530 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_2530_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_2530_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_2530_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_2530_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_2530
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_2530 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_2530_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_2530_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_2530_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_2530_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l503_c8_2530
has_written_to_n_MUX_uxn_opcodes_h_l503_c8_2530 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l503_c8_2530_cond,
has_written_to_n_MUX_uxn_opcodes_h_l503_c8_2530_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l503_c8_2530_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l503_c8_2530_return_output);

-- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l485_l490_DUPLICATE_3602
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l485_l490_DUPLICATE_3602 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l485_l490_DUPLICATE_3602_expr,
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l485_l490_DUPLICATE_3602_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l462_c6_2daa_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_df30_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4_return_output,
 dei_param_MUX_uxn_opcodes_h_l462_c2_33e4_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4_return_output,
 t8_MUX_uxn_opcodes_h_l462_c2_33e4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l462_c2_33e4_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_33e4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_33e4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_33e4_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_33e4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_33e4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_33e4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_33e4_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l462_c2_33e4_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l462_c2_33e4_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l462_c2_33e4_return_output,
 device_in_result_MUX_uxn_opcodes_h_l462_c2_33e4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l474_c11_d96e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output,
 dei_param_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output,
 t8_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output,
 device_in_result_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l477_c11_d0d0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_20eb_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output,
 dei_param_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output,
 t8_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output,
 device_in_result_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output,
 sp_relative_shift_uxn_opcodes_h_l480_c30_100a_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l484_c35_44af_return_output,
 MUX_uxn_opcodes_h_l484_c15_30ee_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l485_c49_c299_return_output,
 BIN_OP_AND_uxn_opcodes_h_l485_c29_cbd7_return_output,
 BIN_OP_OR_uxn_opcodes_h_l485_c8_cb9a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_1db2_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_512c_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_512c_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_512c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l485_c3_512c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_512c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_512c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_512c_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l485_c3_512c_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l485_c3_512c_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l485_c3_512c_return_output,
 device_in_result_MUX_uxn_opcodes_h_l485_c3_512c_return_output,
 device_in_uxn_opcodes_h_l486_c23_49e2_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l489_c4_0d9e_return_output,
 BIN_OP_AND_uxn_opcodes_h_l490_c9_fb71_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_843b_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l496_c13_ec31_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_d225_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l496_c8_d225_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_d225_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_d225_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l496_c8_d225_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l496_c8_d225_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l496_c8_d225_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l503_c13_4f96_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_2530_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l503_c8_2530_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_2530_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_2530_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l503_c8_2530_return_output,
 UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l485_l490_DUPLICATE_3602_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_2daa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_2daa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_2daa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_df30_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_df30_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_df30_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_df30_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_c2d1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l462_c2_33e4_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l462_c2_33e4_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l462_c2_33e4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l462_c2_33e4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l462_c2_33e4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l462_c2_33e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l462_c2_33e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_33e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_33e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_33e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_33e4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l469_c3_fc93 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_33e4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_33e4_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_33e4_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_33e4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_33e4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_33e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_33e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_33e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_33e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_33e4_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l462_c2_33e4_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l462_c2_33e4_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l462_c2_33e4_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l462_c2_33e4_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l468_c3_0d82 : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l462_c2_33e4_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l462_c2_33e4_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue : device_in_result_t;
 variable VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l462_c2_33e4_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l462_c2_33e4_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l462_c2_33e4_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l463_c3_cf34_uxn_opcodes_h_l463_c3_cf34_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_d96e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_d96e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_d96e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f7d0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l474_c7_c2d1_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l474_c7_c2d1_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_c2d1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l474_c7_c2d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_c2d1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_c2d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_c2d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_c2d1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l475_c3_45f2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_c2d1_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l474_c7_c2d1_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l474_c7_c2d1_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l474_c7_c2d1_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l474_c7_c2d1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_d0d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_d0d0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_d0d0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_20eb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_20eb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_20eb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_20eb_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_512c_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_f7d0_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_512c_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l477_c7_f7d0_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_512c_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f7d0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l485_c3_512c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c7_f7d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_512c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f7d0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f7d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_512c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f7d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f7d0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_512c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f7d0_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l485_c3_512c_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f7d0_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l485_c3_512c_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f7d0_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l485_c3_512c_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f7d0_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l485_c3_512c_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_f7d0_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l480_c30_100a_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l480_c30_100a_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l480_c30_100a_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l480_c30_100a_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l484_c15_30ee_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l484_c15_30ee_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l484_c15_30ee_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l484_c35_44af_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l484_c35_44af_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l484_c35_44af_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l484_c15_30ee_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l485_c8_cb9a_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l485_c29_cbd7_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l485_c49_c299_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l485_c49_c299_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l485_c29_cbd7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l485_c29_cbd7_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l485_c8_cb9a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l485_c8_cb9a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_1db2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_1db2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_1db2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_1db2_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_512c_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_512c_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_512c_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_512c_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_512c_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_512c_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_512c_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_512c_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_512c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l485_c3_512c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l485_c3_512c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l496_c8_d225_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l485_c3_512c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_512c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_512c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_d225_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_512c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_512c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_512c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_d225_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_512c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_512c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_512c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_d225_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_512c_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l485_c3_512c_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l485_c3_512c_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l496_c8_d225_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l485_c3_512c_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l485_c3_512c_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l485_c3_512c_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l496_c8_d225_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l485_c3_512c_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l485_c3_512c_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l489_c4_c875 : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l485_c3_512c_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l496_c8_d225_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l485_c3_512c_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l485_c3_512c_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l485_c3_512c_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l485_c3_512c_cond : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l486_c23_49e2_device_address : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l486_c23_49e2_phase : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l486_c23_49e2_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l486_c23_49e2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l486_c23_49e2_return_output : device_in_result_t;
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l487_c32_8fb4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l489_c4_0d9e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l489_c4_0d9e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l489_c4_0d9e_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l490_c9_fb71_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l490_c9_fb71_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l490_c9_fb71_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_843b_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_843b_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_843b_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_843b_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l496_c13_ec31_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l496_c13_ec31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_d225_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_d225_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_2530_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_d225_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l496_c8_d225_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l496_c8_d225_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c8_2530_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l496_c8_d225_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_d225_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_d225_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_2530_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_d225_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_d225_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l499_c4_1d49 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_d225_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_2530_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_d225_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l496_c8_d225_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l496_c8_d225_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l503_c8_2530_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l496_c8_d225_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l496_c8_d225_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l496_c8_d225_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l496_c8_d225_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l496_c8_d225_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l497_c4_cddb : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l496_c8_d225_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l496_c8_d225_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l503_c13_4f96_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l503_c13_4f96_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_2530_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_2530_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_2530_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c8_2530_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c8_2530_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c8_2530_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_2530_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_2530_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_2530_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_2530_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l504_c4_5cd2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_2530_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_2530_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l503_c8_2530_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l503_c8_2530_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l503_c8_2530_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l503_l485_l462_l474_l477_DUPLICATE_ba94_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l474_l477_l462_l485_DUPLICATE_767b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l474_l477_l462_DUPLICATE_7d4a_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l474_l477_l462_l503_DUPLICATE_0776_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l474_l462_DUPLICATE_5028_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l503_l485_l496_l474_l477_DUPLICATE_464a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l503_l477_l485_DUPLICATE_cc48_return_output : unsigned(3 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l485_l490_DUPLICATE_3602_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l485_l490_DUPLICATE_3602_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l490_l492_DUPLICATE_d24e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l500_l505_DUPLICATE_8863_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7ca8_uxn_opcodes_h_l514_l456_DUPLICATE_1e01_return_output : opcode_result_t;
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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_d225_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_2530_iffalse := to_unsigned(1, 1);
     VAR_current_dei_phase_uxn_opcodes_h_l468_c3_0d82 := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l468_c3_0d82;
     VAR_sp_relative_shift_uxn_opcodes_h_l480_c30_100a_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb_iftrue := to_unsigned(1, 1);
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l503_c8_2530_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_1db2_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_d0d0_right := to_unsigned(2, 2);
     VAR_current_dei_phase_uxn_opcodes_h_l497_c4_cddb := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l496_c8_d225_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l497_c4_cddb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_d96e_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_df30_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l484_c35_44af_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_20eb_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse := to_unsigned(0, 1);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l496_c8_d225_iftrue := to_unsigned(1, 1);
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_843b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l489_c4_0d9e_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l504_c4_5cd2 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_2530_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l504_c4_5cd2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_2daa_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_512c_iftrue := to_unsigned(0, 1);
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l475_c3_45f2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l475_c3_45f2;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l480_c30_100a_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_2530_iffalse := to_unsigned(0, 1);
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l469_c3_fc93 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l469_c3_fc93;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l499_c4_1d49 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_d225_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l499_c4_1d49;

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_df30_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l489_c4_0d9e_left := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l496_c8_d225_iffalse := current_dei_phase;
     VAR_device_in_uxn_opcodes_h_l486_c23_49e2_phase := current_dei_phase;
     VAR_dei_param_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue := dei_param;
     VAR_dei_param_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue := dei_param;
     VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue := dei_param;
     VAR_device_in_result_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l485_c3_512c_iffalse := device_in_result;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l503_c13_4f96_expr := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l485_c3_512c_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l496_c8_d225_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l503_c8_2530_iffalse := has_written_to_n;
     VAR_BIN_OP_AND_uxn_opcodes_h_l485_c29_cbd7_left := has_written_to_t;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l496_c13_ec31_expr := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l485_c3_512c_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l496_c8_d225_iffalse := has_written_to_t;
     VAR_sp_relative_shift_uxn_opcodes_h_l480_c30_100a_ins := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l484_c15_30ee_cond := is_first_dei_done;
     VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l485_l490_DUPLICATE_3602_expr := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_512c_iffalse := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb_iffalse := is_first_dei_done;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l485_c49_c299_expr := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_512c_iffalse := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_843b_iffalse := is_second_dei_done;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_2daa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_d96e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_d0d0_left := VAR_phase;
     VAR_device_in_uxn_opcodes_h_l486_c23_49e2_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l484_c35_44af_left := t8;
     VAR_MUX_uxn_opcodes_h_l484_c15_30ee_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse := t8;
     -- BIN_OP_PLUS[uxn_opcodes_h_l489_c4_0d9e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l489_c4_0d9e_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l489_c4_0d9e_left;
     BIN_OP_PLUS_uxn_opcodes_h_l489_c4_0d9e_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l489_c4_0d9e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l489_c4_0d9e_return_output := BIN_OP_PLUS_uxn_opcodes_h_l489_c4_0d9e_return_output;

     -- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l485_l490_DUPLICATE_3602 LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l485_l490_DUPLICATE_3602_expr <= VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l485_l490_DUPLICATE_3602_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l485_l490_DUPLICATE_3602_return_output := UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l485_l490_DUPLICATE_3602_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l474_c11_d96e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l474_c11_d96e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_d96e_left;
     BIN_OP_EQ_uxn_opcodes_h_l474_c11_d96e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_d96e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_d96e_return_output := BIN_OP_EQ_uxn_opcodes_h_l474_c11_d96e_return_output;

     -- result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l462_c2_33e4] LATENCY=0
     VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l462_c2_33e4_return_output := result.is_device_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l462_c6_2daa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l462_c6_2daa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_2daa_left;
     BIN_OP_EQ_uxn_opcodes_h_l462_c6_2daa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_2daa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_2daa_return_output := BIN_OP_EQ_uxn_opcodes_h_l462_c6_2daa_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l474_l477_l462_DUPLICATE_7d4a LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l474_l477_l462_DUPLICATE_7d4a_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l503_l477_l485_DUPLICATE_cc48 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l503_l477_l485_DUPLICATE_cc48_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l500_l505_DUPLICATE_8863 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l500_l505_DUPLICATE_8863_return_output := device_in_result.dei_value;

     -- UNARY_OP_NOT[uxn_opcodes_h_l485_c49_c299] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l485_c49_c299_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l485_c49_c299_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l485_c49_c299_return_output := UNARY_OP_NOT_uxn_opcodes_h_l485_c49_c299_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l474_l477_l462_l503_DUPLICATE_0776 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l474_l477_l462_l503_DUPLICATE_0776_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l503_l485_l462_l474_l477_DUPLICATE_ba94 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l503_l485_l462_l474_l477_DUPLICATE_ba94_return_output := result.u8_value;

     -- UNARY_OP_NOT[uxn_opcodes_h_l503_c13_4f96] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l503_c13_4f96_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l503_c13_4f96_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l503_c13_4f96_return_output := UNARY_OP_NOT_uxn_opcodes_h_l503_c13_4f96_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l477_c11_d0d0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l477_c11_d0d0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_d0d0_left;
     BIN_OP_EQ_uxn_opcodes_h_l477_c11_d0d0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_d0d0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_d0d0_return_output := BIN_OP_EQ_uxn_opcodes_h_l477_c11_d0d0_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l484_c35_44af] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l484_c35_44af_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l484_c35_44af_left;
     BIN_OP_PLUS_uxn_opcodes_h_l484_c35_44af_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l484_c35_44af_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l484_c35_44af_return_output := BIN_OP_PLUS_uxn_opcodes_h_l484_c35_44af_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l474_l462_DUPLICATE_5028 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l474_l462_DUPLICATE_5028_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l503_l485_l496_l474_l477_DUPLICATE_464a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l503_l485_l496_l474_l477_DUPLICATE_464a_return_output := result.is_opc_done;

     -- device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6[uxn_opcodes_h_l462_c2_33e4] LATENCY=0
     VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l462_c2_33e4_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6(
     device_in_result,
     to_unsigned(0, 1));

     -- sp_relative_shift[uxn_opcodes_h_l480_c30_100a] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l480_c30_100a_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l480_c30_100a_ins;
     sp_relative_shift_uxn_opcodes_h_l480_c30_100a_x <= VAR_sp_relative_shift_uxn_opcodes_h_l480_c30_100a_x;
     sp_relative_shift_uxn_opcodes_h_l480_c30_100a_y <= VAR_sp_relative_shift_uxn_opcodes_h_l480_c30_100a_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l480_c30_100a_return_output := sp_relative_shift_uxn_opcodes_h_l480_c30_100a_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l496_c13_ec31] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l496_c13_ec31_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l496_c13_ec31_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l496_c13_ec31_return_output := UNARY_OP_NOT_uxn_opcodes_h_l496_c13_ec31_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l474_l477_l462_l485_DUPLICATE_767b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l474_l477_l462_l485_DUPLICATE_767b_return_output := result.device_ram_address;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_c2d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_2daa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_df30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_2daa_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l462_c2_33e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_2daa_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l462_c2_33e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_2daa_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l462_c2_33e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_2daa_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l462_c2_33e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_2daa_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l462_c2_33e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_2daa_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_2daa_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_2daa_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_33e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_2daa_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_33e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_2daa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_33e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_2daa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_33e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_2daa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_33e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_2daa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_33e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_2daa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_33e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_2daa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l462_c2_33e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_2daa_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l462_c2_33e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l462_c6_2daa_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f7d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_d96e_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l474_c7_c2d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_d96e_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l474_c7_c2d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_d96e_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l474_c7_c2d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_d96e_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l474_c7_c2d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_d96e_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l474_c7_c2d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_d96e_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_d96e_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_d96e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_c2d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_d96e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_c2d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_d96e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_c2d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_d96e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_c2d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_d96e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_c2d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_d96e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_c2d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_d96e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l474_c7_c2d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_d96e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l474_c7_c2d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l474_c11_d96e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_20eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_d0d0_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f7d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_d0d0_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_f7d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_d0d0_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_f7d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_d0d0_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f7d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_d0d0_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f7d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_d0d0_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_d0d0_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_d0d0_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f7d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_d0d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f7d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_d0d0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f7d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_d0d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f7d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_d0d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f7d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_d0d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f7d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_d0d0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c7_f7d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_d0d0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l477_c7_f7d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_d0d0_return_output;
     VAR_MUX_uxn_opcodes_h_l484_c15_30ee_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l484_c35_44af_return_output, 8);
     VAR_current_dei_phase_uxn_opcodes_h_l489_c4_c875 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l489_c4_0d9e_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l474_l477_l462_DUPLICATE_7d4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l474_l477_l462_DUPLICATE_7d4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l474_l477_l462_DUPLICATE_7d4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l503_l485_l496_l474_l477_DUPLICATE_464a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l503_l485_l496_l474_l477_DUPLICATE_464a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_512c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l503_l485_l496_l474_l477_DUPLICATE_464a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_d225_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l503_l485_l496_l474_l477_DUPLICATE_464a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_2530_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l503_l485_l496_l474_l477_DUPLICATE_464a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l474_l462_DUPLICATE_5028_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l474_l462_DUPLICATE_5028_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l474_l477_l462_l503_DUPLICATE_0776_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l474_l477_l462_l503_DUPLICATE_0776_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l474_l477_l462_l503_DUPLICATE_0776_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_2530_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l474_l477_l462_l503_DUPLICATE_0776_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l503_l477_l485_DUPLICATE_cc48_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_512c_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l503_l477_l485_DUPLICATE_cc48_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_2530_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l503_l477_l485_DUPLICATE_cc48_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l496_c8_d225_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l500_l505_DUPLICATE_8863_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c8_2530_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l500_l505_DUPLICATE_8863_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l474_l477_l462_l485_DUPLICATE_767b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l474_l477_l462_l485_DUPLICATE_767b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l474_l477_l462_l485_DUPLICATE_767b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_512c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l474_l477_l462_l485_DUPLICATE_767b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l503_l485_l462_l474_l477_DUPLICATE_ba94_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l503_l485_l462_l474_l477_DUPLICATE_ba94_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l503_l485_l462_l474_l477_DUPLICATE_ba94_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l485_c3_512c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l503_l485_l462_l474_l477_DUPLICATE_ba94_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c8_2530_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l503_l485_l462_l474_l477_DUPLICATE_ba94_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l485_c29_cbd7_right := VAR_UNARY_OP_NOT_uxn_opcodes_h_l485_c49_c299_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l496_c8_d225_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l496_c13_ec31_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l496_c8_d225_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l496_c13_ec31_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l496_c8_d225_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l496_c13_ec31_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_d225_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l496_c13_ec31_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_d225_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l496_c13_ec31_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_d225_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l496_c13_ec31_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l496_c8_d225_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l496_c13_ec31_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l503_c8_2530_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l503_c13_4f96_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_2530_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l503_c13_4f96_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_2530_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l503_c13_4f96_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_2530_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l503_c13_4f96_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c8_2530_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l503_c13_4f96_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l490_c9_fb71_left := VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l485_l490_DUPLICATE_3602_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l485_c8_cb9a_left := VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l485_l490_DUPLICATE_3602_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue := VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l462_c2_33e4_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse := VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l462_c2_33e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l480_c30_100a_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l485_c3_512c_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l489_c4_c875;
     -- current_dei_phase_MUX[uxn_opcodes_h_l496_c8_d225] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l496_c8_d225_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l496_c8_d225_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l496_c8_d225_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l496_c8_d225_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l496_c8_d225_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l496_c8_d225_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l496_c8_d225_return_output := current_dei_phase_MUX_uxn_opcodes_h_l496_c8_d225_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l474_c7_c2d1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_c2d1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_c2d1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l477_c7_f7d0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f7d0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f7d0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l477_c7_f7d0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f7d0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f7d0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l503_c8_2530] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_2530_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_2530_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_2530_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_2530_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_2530_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_2530_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_2530_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_2530_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l485_c29_cbd7] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l485_c29_cbd7_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l485_c29_cbd7_left;
     BIN_OP_AND_uxn_opcodes_h_l485_c29_cbd7_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l485_c29_cbd7_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l485_c29_cbd7_return_output := BIN_OP_AND_uxn_opcodes_h_l485_c29_cbd7_return_output;

     -- MUX[uxn_opcodes_h_l484_c15_30ee] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l484_c15_30ee_cond <= VAR_MUX_uxn_opcodes_h_l484_c15_30ee_cond;
     MUX_uxn_opcodes_h_l484_c15_30ee_iftrue <= VAR_MUX_uxn_opcodes_h_l484_c15_30ee_iftrue;
     MUX_uxn_opcodes_h_l484_c15_30ee_iffalse <= VAR_MUX_uxn_opcodes_h_l484_c15_30ee_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l484_c15_30ee_return_output := MUX_uxn_opcodes_h_l484_c15_30ee_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l496_c8_d225] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l496_c8_d225_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l496_c8_d225_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l496_c8_d225_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l496_c8_d225_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l496_c8_d225_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l496_c8_d225_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l496_c8_d225_return_output := has_written_to_t_MUX_uxn_opcodes_h_l496_c8_d225_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l503_c8_2530] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_2530_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_2530_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_2530_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_2530_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_2530_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_2530_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_2530_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_2530_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l503_c8_2530] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l503_c8_2530_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c8_2530_cond;
     result_u8_value_MUX_uxn_opcodes_h_l503_c8_2530_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c8_2530_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l503_c8_2530_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c8_2530_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c8_2530_return_output := result_u8_value_MUX_uxn_opcodes_h_l503_c8_2530_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l503_c8_2530] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l503_c8_2530_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l503_c8_2530_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l503_c8_2530_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l503_c8_2530_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l503_c8_2530_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l503_c8_2530_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l503_c8_2530_return_output := has_written_to_n_MUX_uxn_opcodes_h_l503_c8_2530_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l503_c8_2530] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_2530_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_2530_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_2530_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_2530_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_2530_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_2530_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_2530_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_2530_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l462_c1_df30] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_df30_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_df30_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_df30_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_df30_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_df30_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_df30_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_df30_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_df30_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l462_c2_33e4] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_33e4_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_33e4_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_33e4_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_33e4_return_output;

     -- t8_MUX[uxn_opcodes_h_l477_c7_f7d0] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l477_c7_f7d0_cond <= VAR_t8_MUX_uxn_opcodes_h_l477_c7_f7d0_cond;
     t8_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue;
     t8_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output := t8_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_opcodes_h_l485_c8_cb9a_right := VAR_BIN_OP_AND_uxn_opcodes_h_l485_c29_cbd7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse := VAR_MUX_uxn_opcodes_h_l484_c15_30ee_return_output;
     VAR_device_in_uxn_opcodes_h_l486_c23_49e2_device_address := VAR_MUX_uxn_opcodes_h_l484_c15_30ee_return_output;
     VAR_printf_uxn_opcodes_h_l463_c3_cf34_uxn_opcodes_h_l463_c3_cf34_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l462_c1_df30_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l485_c3_512c_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l496_c8_d225_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l496_c8_d225_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l503_c8_2530_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l485_c3_512c_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l496_c8_d225_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_d225_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c8_2530_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_d225_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l503_c8_2530_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_d225_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l503_c8_2530_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l496_c8_d225_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c8_2530_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse := VAR_t8_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l496_c8_d225] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l496_c8_d225_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l496_c8_d225_cond;
     result_u8_value_MUX_uxn_opcodes_h_l496_c8_d225_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l496_c8_d225_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l496_c8_d225_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l496_c8_d225_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l496_c8_d225_return_output := result_u8_value_MUX_uxn_opcodes_h_l496_c8_d225_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l496_c8_d225] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_d225_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_d225_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_d225_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_d225_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_d225_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_d225_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_d225_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_d225_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l474_c7_c2d1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_c2d1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_c2d1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l496_c8_d225] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_d225_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_d225_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_d225_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_d225_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_d225_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_d225_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_d225_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_d225_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l477_c7_f7d0] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l477_c7_f7d0_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_f7d0_cond;
     dei_param_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue;
     dei_param_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output := dei_param_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l496_c8_d225] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l496_c8_d225_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l496_c8_d225_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l496_c8_d225_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l496_c8_d225_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l496_c8_d225_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l496_c8_d225_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l496_c8_d225_return_output := has_written_to_n_MUX_uxn_opcodes_h_l496_c8_d225_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l485_c8_cb9a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l485_c8_cb9a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l485_c8_cb9a_left;
     BIN_OP_OR_uxn_opcodes_h_l485_c8_cb9a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l485_c8_cb9a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l485_c8_cb9a_return_output := BIN_OP_OR_uxn_opcodes_h_l485_c8_cb9a_return_output;

     -- t8_MUX[uxn_opcodes_h_l474_c7_c2d1] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l474_c7_c2d1_cond <= VAR_t8_MUX_uxn_opcodes_h_l474_c7_c2d1_cond;
     t8_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue;
     t8_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output := t8_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output;

     -- printf_uxn_opcodes_h_l463_c3_cf34[uxn_opcodes_h_l463_c3_cf34] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l463_c3_cf34_uxn_opcodes_h_l463_c3_cf34_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l463_c3_cf34_uxn_opcodes_h_l463_c3_cf34_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l474_c7_c2d1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_c2d1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_c2d1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l496_c8_d225] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_d225_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_d225_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_d225_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_d225_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_d225_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_d225_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_d225_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_d225_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l477_c7_f7d0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f7d0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f7d0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output;

     -- Submodule level 3
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_1db2_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l485_c8_cb9a_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l485_c3_512c_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l485_c8_cb9a_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l485_c3_512c_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l485_c8_cb9a_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l485_c3_512c_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l485_c8_cb9a_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l485_c3_512c_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l485_c8_cb9a_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_512c_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l485_c8_cb9a_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_512c_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l485_c8_cb9a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_512c_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l485_c8_cb9a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_512c_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l485_c8_cb9a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_512c_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l485_c8_cb9a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_512c_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l485_c8_cb9a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l485_c3_512c_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l485_c8_cb9a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_20eb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse := VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l485_c3_512c_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l496_c8_d225_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_512c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l496_c8_d225_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_512c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l496_c8_d225_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_512c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l496_c8_d225_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l485_c3_512c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l496_c8_d225_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse := VAR_t8_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output;
     -- has_written_to_n_MUX[uxn_opcodes_h_l485_c3_512c] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l485_c3_512c_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l485_c3_512c_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l485_c3_512c_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l485_c3_512c_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l485_c3_512c_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l485_c3_512c_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l485_c3_512c_return_output := has_written_to_n_MUX_uxn_opcodes_h_l485_c3_512c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l485_c3_512c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_512c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_512c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_512c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_512c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_512c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_512c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_512c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_512c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l485_c3_512c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_512c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_512c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_512c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_512c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_512c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_512c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_512c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_512c_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l485_c3_512c] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l485_c3_512c_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l485_c3_512c_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l485_c3_512c_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l485_c3_512c_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l485_c3_512c_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l485_c3_512c_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l485_c3_512c_return_output := has_written_to_t_MUX_uxn_opcodes_h_l485_c3_512c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l462_c2_33e4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_33e4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_33e4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_33e4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_33e4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l485_c3_512c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_512c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_512c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_512c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_512c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_512c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_512c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_512c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_512c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l482_c1_20eb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_20eb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_20eb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_20eb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_20eb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_20eb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_20eb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_20eb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_20eb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l485_c3_512c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l485_c3_512c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l485_c3_512c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l485_c3_512c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l485_c3_512c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l485_c3_512c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l485_c3_512c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l485_c3_512c_return_output := result_u8_value_MUX_uxn_opcodes_h_l485_c3_512c_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l474_c7_c2d1] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l474_c7_c2d1_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l474_c7_c2d1_cond;
     dei_param_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue;
     dei_param_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output := dei_param_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l485_c3_512c] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l485_c3_512c_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l485_c3_512c_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l485_c3_512c_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l485_c3_512c_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l485_c3_512c_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l485_c3_512c_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l485_c3_512c_return_output := current_dei_phase_MUX_uxn_opcodes_h_l485_c3_512c_return_output;

     -- t8_MUX[uxn_opcodes_h_l462_c2_33e4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l462_c2_33e4_cond <= VAR_t8_MUX_uxn_opcodes_h_l462_c2_33e4_cond;
     t8_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue;
     t8_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l462_c2_33e4_return_output := t8_MUX_uxn_opcodes_h_l462_c2_33e4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l462_c2_33e4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_33e4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_33e4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_33e4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_33e4_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_1db2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_20eb_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l485_c3_512c_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse := VAR_dei_param_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l485_c3_512c_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l485_c3_512c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l485_c3_512c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l485_c3_512c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l485_c3_512c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l485_c3_512c_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l462_c2_33e4_return_output;
     -- has_written_to_n_MUX[uxn_opcodes_h_l477_c7_f7d0] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f7d0_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f7d0_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output := has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l485_c1_1db2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_1db2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_1db2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_1db2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_1db2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_1db2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_1db2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_1db2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_1db2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l477_c7_f7d0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f7d0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f7d0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l477_c7_f7d0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f7d0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f7d0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l462_c2_33e4] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l462_c2_33e4_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l462_c2_33e4_cond;
     dei_param_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue;
     dei_param_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l462_c2_33e4_return_output := dei_param_MUX_uxn_opcodes_h_l462_c2_33e4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l477_c7_f7d0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l477_c7_f7d0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c7_f7d0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output := result_u8_value_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l477_c7_f7d0] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f7d0_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f7d0_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output := current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l477_c7_f7d0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f7d0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f7d0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l477_c7_f7d0] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f7d0_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f7d0_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output := has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output;

     -- Submodule level 5
     VAR_device_in_uxn_opcodes_h_l486_c23_49e2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_1db2_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output;
     REG_VAR_dei_param := VAR_dei_param_MUX_uxn_opcodes_h_l462_c2_33e4_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l474_c7_c2d1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_c2d1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_c2d1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output;

     -- device_in[uxn_opcodes_h_l486_c23_49e2] LATENCY=0
     -- Clock enable
     device_in_uxn_opcodes_h_l486_c23_49e2_CLOCK_ENABLE <= VAR_device_in_uxn_opcodes_h_l486_c23_49e2_CLOCK_ENABLE;
     -- Inputs
     device_in_uxn_opcodes_h_l486_c23_49e2_device_address <= VAR_device_in_uxn_opcodes_h_l486_c23_49e2_device_address;
     device_in_uxn_opcodes_h_l486_c23_49e2_phase <= VAR_device_in_uxn_opcodes_h_l486_c23_49e2_phase;
     device_in_uxn_opcodes_h_l486_c23_49e2_previous_device_ram_read <= VAR_device_in_uxn_opcodes_h_l486_c23_49e2_previous_device_ram_read;
     -- Outputs
     VAR_device_in_uxn_opcodes_h_l486_c23_49e2_return_output := device_in_uxn_opcodes_h_l486_c23_49e2_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l474_c7_c2d1] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l474_c7_c2d1_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l474_c7_c2d1_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output := current_dei_phase_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l474_c7_c2d1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_c2d1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_c2d1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l474_c7_c2d1] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l474_c7_c2d1_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l474_c7_c2d1_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output := has_written_to_t_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l474_c7_c2d1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_c2d1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_c2d1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l474_c7_c2d1] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l474_c7_c2d1_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l474_c7_c2d1_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output := has_written_to_n_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l474_c7_c2d1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l474_c7_c2d1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l474_c7_c2d1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output := result_u8_value_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output;

     -- Submodule level 6
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l485_c3_512c_iftrue := VAR_device_in_uxn_opcodes_h_l486_c23_49e2_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output;
     -- device_in_result_MUX[uxn_opcodes_h_l485_c3_512c] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l485_c3_512c_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l485_c3_512c_cond;
     device_in_result_MUX_uxn_opcodes_h_l485_c3_512c_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l485_c3_512c_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l485_c3_512c_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l485_c3_512c_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l485_c3_512c_return_output := device_in_result_MUX_uxn_opcodes_h_l485_c3_512c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l462_c2_33e4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_33e4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_33e4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_33e4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_33e4_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l462_c2_33e4] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l462_c2_33e4_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l462_c2_33e4_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l462_c2_33e4_return_output := has_written_to_n_MUX_uxn_opcodes_h_l462_c2_33e4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l462_c2_33e4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l462_c2_33e4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l462_c2_33e4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l462_c2_33e4_return_output := result_u8_value_MUX_uxn_opcodes_h_l462_c2_33e4_return_output;

     -- CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l490_l492_DUPLICATE_d24e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l490_l492_DUPLICATE_d24e_return_output := VAR_device_in_uxn_opcodes_h_l486_c23_49e2_return_output.is_dei_done;

     -- current_dei_phase_MUX[uxn_opcodes_h_l462_c2_33e4] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l462_c2_33e4_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l462_c2_33e4_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l462_c2_33e4_return_output := current_dei_phase_MUX_uxn_opcodes_h_l462_c2_33e4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l462_c2_33e4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_33e4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_33e4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_33e4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_33e4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l462_c2_33e4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_33e4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_33e4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_33e4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_33e4_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l462_c2_33e4] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l462_c2_33e4_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l462_c2_33e4_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l462_c2_33e4_return_output := has_written_to_t_MUX_uxn_opcodes_h_l462_c2_33e4_return_output;

     -- CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d[uxn_opcodes_h_l487_c32_8fb4] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l487_c32_8fb4_return_output := VAR_device_in_uxn_opcodes_h_l486_c23_49e2_return_output.device_ram_address;

     -- Submodule level 7
     VAR_BIN_OP_AND_uxn_opcodes_h_l490_c9_fb71_right := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l490_l492_DUPLICATE_d24e_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_843b_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l490_l492_DUPLICATE_d24e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_512c_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l487_c32_8fb4_return_output;
     REG_VAR_current_dei_phase := VAR_current_dei_phase_MUX_uxn_opcodes_h_l462_c2_33e4_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l485_c3_512c_return_output;
     REG_VAR_has_written_to_n := VAR_has_written_to_n_MUX_uxn_opcodes_h_l462_c2_33e4_return_output;
     REG_VAR_has_written_to_t := VAR_has_written_to_t_MUX_uxn_opcodes_h_l462_c2_33e4_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l485_c3_512c] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_512c_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_512c_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_512c_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_512c_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_512c_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_512c_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_512c_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_512c_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l477_c7_f7d0] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l477_c7_f7d0_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_f7d0_cond;
     device_in_result_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output := device_in_result_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l490_c9_fb71] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l490_c9_fb71_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l490_c9_fb71_left;
     BIN_OP_AND_uxn_opcodes_h_l490_c9_fb71_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l490_c9_fb71_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l490_c9_fb71_return_output := BIN_OP_AND_uxn_opcodes_h_l490_c9_fb71_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l492_c11_843b] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_843b_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_843b_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_843b_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_843b_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_843b_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_843b_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_843b_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_843b_return_output;

     -- Submodule level 8
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb_cond := VAR_BIN_OP_AND_uxn_opcodes_h_l490_c9_fb71_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb_cond := VAR_BIN_OP_AND_uxn_opcodes_h_l490_c9_fb71_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l492_c11_843b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l485_c3_512c_return_output;
     -- device_in_result_MUX[uxn_opcodes_h_l474_c7_c2d1] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l474_c7_c2d1_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l474_c7_c2d1_cond;
     device_in_result_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output := device_in_result_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l477_c7_f7d0] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f7d0_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f7d0_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l490_c4_20cb] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l490_c4_20cb] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb_return_output;

     -- Submodule level 9
     VAR_device_in_result_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_512c_iftrue := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_512c_iftrue := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l490_c4_20cb_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output;
     -- device_in_result_MUX[uxn_opcodes_h_l462_c2_33e4] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l462_c2_33e4_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l462_c2_33e4_cond;
     device_in_result_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l462_c2_33e4_return_output := device_in_result_MUX_uxn_opcodes_h_l462_c2_33e4_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l485_c3_512c] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_512c_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_512c_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_512c_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_512c_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_512c_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_512c_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_512c_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_512c_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l474_c7_c2d1] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_c2d1_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_c2d1_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l485_c3_512c] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_512c_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_512c_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_512c_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_512c_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_512c_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_512c_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_512c_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_512c_return_output;

     -- Submodule level 10
     REG_VAR_device_in_result := VAR_device_in_result_MUX_uxn_opcodes_h_l462_c2_33e4_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l485_c3_512c_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l485_c3_512c_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output;
     -- is_first_dei_done_MUX[uxn_opcodes_h_l477_c7_f7d0] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l462_c2_33e4] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_33e4_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_33e4_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_33e4_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_33e4_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l477_c7_f7d0] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output;

     -- Submodule level 11
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_f7d0_return_output;
     -- is_second_dei_done_MUX[uxn_opcodes_h_l474_c7_c2d1] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l474_c7_c2d1] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output;

     -- CONST_REF_RD_opcode_result_t_opcode_result_t_7ca8_uxn_opcodes_h_l514_l456_DUPLICATE_1e01 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7ca8_uxn_opcodes_h_l514_l456_DUPLICATE_1e01_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_7ca8(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l462_c2_33e4_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l462_c2_33e4_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l462_c2_33e4_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l462_c2_33e4_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l462_c2_33e4_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l462_c2_33e4_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l462_c2_33e4_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l462_c2_33e4_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7ca8_uxn_opcodes_h_l514_l456_DUPLICATE_1e01_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7ca8_uxn_opcodes_h_l514_l456_DUPLICATE_1e01_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l474_c7_c2d1_return_output;
     -- is_second_dei_done_MUX[uxn_opcodes_h_l462_c2_33e4] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l462_c2_33e4] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4_return_output;

     -- Submodule level 13
     REG_VAR_is_first_dei_done := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4_return_output;
     REG_VAR_is_second_dei_done := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l462_c2_33e4_return_output;
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
