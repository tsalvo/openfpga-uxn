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
-- Submodules: 80
entity dei2_0CLK_5016892b is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end dei2_0CLK_5016892b;
architecture arch of dei2_0CLK_5016892b is
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
-- BIN_OP_EQ[uxn_opcodes_h_l455_c6_9525]
signal BIN_OP_EQ_uxn_opcodes_h_l455_c6_9525_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l455_c6_9525_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l455_c6_9525_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l475_c7_b19f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_b19f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_b19f_return_output : unsigned(0 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l455_c2_ea0e]
signal dei_param_MUX_uxn_opcodes_h_l455_c2_ea0e_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output : unsigned(7 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l455_c2_ea0e]
signal has_written_to_t_MUX_uxn_opcodes_h_l455_c2_ea0e_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l455_c2_ea0e]
signal device_in_result_MUX_uxn_opcodes_h_l455_c2_ea0e_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output : device_in_result_t;

-- t8_MUX[uxn_opcodes_h_l455_c2_ea0e]
signal t8_MUX_uxn_opcodes_h_l455_c2_ea0e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output : unsigned(7 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l455_c2_ea0e]
signal is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l455_c2_ea0e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_ea0e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l455_c2_ea0e]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_ea0e_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l455_c2_ea0e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l455_c2_ea0e]
signal result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_ea0e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l455_c2_ea0e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_ea0e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l455_c2_ea0e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_ea0e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l455_c2_ea0e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_ea0e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l455_c2_ea0e]
signal result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l455_c2_ea0e]
signal result_u8_value_MUX_uxn_opcodes_h_l455_c2_ea0e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l455_c2_ea0e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_ea0e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output : unsigned(3 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l455_c2_ea0e]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l455_c2_ea0e]
signal current_dei_phase_MUX_uxn_opcodes_h_l455_c2_ea0e_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output : unsigned(7 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l455_c2_ea0e]
signal has_written_to_n_MUX_uxn_opcodes_h_l455_c2_ea0e_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l455_c2_ea0e]
signal is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l475_c11_7afe]
signal BIN_OP_EQ_uxn_opcodes_h_l475_c11_7afe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l475_c11_7afe_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l475_c11_7afe_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l478_c1_59b9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_59b9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_59b9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_59b9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_59b9_return_output : unsigned(0 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l475_c7_b19f]
signal dei_param_MUX_uxn_opcodes_h_l475_c7_b19f_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l475_c7_b19f_return_output : unsigned(7 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l475_c7_b19f]
signal has_written_to_t_MUX_uxn_opcodes_h_l475_c7_b19f_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l475_c7_b19f_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l475_c7_b19f]
signal device_in_result_MUX_uxn_opcodes_h_l475_c7_b19f_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l475_c7_b19f_return_output : device_in_result_t;

-- t8_MUX[uxn_opcodes_h_l475_c7_b19f]
signal t8_MUX_uxn_opcodes_h_l475_c7_b19f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l475_c7_b19f_return_output : unsigned(7 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l475_c7_b19f]
signal is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l475_c7_b19f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_b19f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_b19f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l475_c7_b19f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_b19f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_b19f_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l475_c7_b19f]
signal result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_b19f_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_b19f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l475_c7_b19f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_b19f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_b19f_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l475_c7_b19f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_b19f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_b19f_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l475_c7_b19f]
signal result_u8_value_MUX_uxn_opcodes_h_l475_c7_b19f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l475_c7_b19f_return_output : unsigned(7 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l475_c7_b19f]
signal current_dei_phase_MUX_uxn_opcodes_h_l475_c7_b19f_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l475_c7_b19f_return_output : unsigned(7 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l475_c7_b19f]
signal has_written_to_n_MUX_uxn_opcodes_h_l475_c7_b19f_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l475_c7_b19f_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l475_c7_b19f]
signal is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l476_c30_fe7b]
signal sp_relative_shift_uxn_opcodes_h_l476_c30_fe7b_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l476_c30_fe7b_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l476_c30_fe7b_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l476_c30_fe7b_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l480_c9_db30]
signal BIN_OP_EQ_uxn_opcodes_h_l480_c9_db30_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l480_c9_db30_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l480_c9_db30_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l480_c9_271b]
signal MUX_uxn_opcodes_h_l480_c9_271b_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l480_c9_271b_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l480_c9_271b_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l480_c9_271b_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l481_c35_3087]
signal BIN_OP_PLUS_uxn_opcodes_h_l481_c35_3087_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l481_c35_3087_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l481_c35_3087_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l481_c15_7f1f]
signal MUX_uxn_opcodes_h_l481_c15_7f1f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l481_c15_7f1f_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l481_c15_7f1f_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l481_c15_7f1f_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l482_c49_9d08]
signal UNARY_OP_NOT_uxn_opcodes_h_l482_c49_9d08_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l482_c49_9d08_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l482_c29_f1e5]
signal BIN_OP_AND_uxn_opcodes_h_l482_c29_f1e5_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l482_c29_f1e5_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l482_c29_f1e5_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l482_c8_d82a]
signal BIN_OP_OR_uxn_opcodes_h_l482_c8_d82a_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l482_c8_d82a_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l482_c8_d82a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l482_c1_08b4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_08b4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_08b4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_08b4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_08b4_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l482_c3_624d]
signal has_written_to_t_MUX_uxn_opcodes_h_l482_c3_624d_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l482_c3_624d_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l482_c3_624d_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l482_c3_624d_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l482_c3_624d]
signal device_in_result_MUX_uxn_opcodes_h_l482_c3_624d_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l482_c3_624d_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l482_c3_624d_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l482_c3_624d_return_output : device_in_result_t;

-- is_first_dei_done_MUX[uxn_opcodes_h_l482_c3_624d]
signal is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_624d_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_624d_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_624d_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_624d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l482_c3_624d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_624d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_624d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_624d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_624d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l482_c3_624d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_624d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_624d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_624d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_624d_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l482_c3_624d]
signal result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_624d_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_624d_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_624d_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_624d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l482_c3_624d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_624d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_624d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_624d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_624d_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l482_c3_624d]
signal result_u8_value_MUX_uxn_opcodes_h_l482_c3_624d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l482_c3_624d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l482_c3_624d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l482_c3_624d_return_output : unsigned(7 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l482_c3_624d]
signal current_dei_phase_MUX_uxn_opcodes_h_l482_c3_624d_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l482_c3_624d_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l482_c3_624d_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l482_c3_624d_return_output : unsigned(7 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l482_c3_624d]
signal has_written_to_n_MUX_uxn_opcodes_h_l482_c3_624d_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l482_c3_624d_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l482_c3_624d_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l482_c3_624d_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l482_c3_624d]
signal is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_624d_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_624d_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_624d_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_624d_return_output : unsigned(0 downto 0);

-- device_in[uxn_opcodes_h_l483_c23_bd44]
signal device_in_uxn_opcodes_h_l483_c23_bd44_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_in_uxn_opcodes_h_l483_c23_bd44_device_address : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l483_c23_bd44_phase : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l483_c23_bd44_previous_device_ram_read : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l483_c23_bd44_return_output : device_in_result_t;

-- BIN_OP_PLUS[uxn_opcodes_h_l486_c4_3413]
signal BIN_OP_PLUS_uxn_opcodes_h_l486_c4_3413_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l486_c4_3413_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l486_c4_3413_return_output : unsigned(8 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l487_c9_ecb0]
signal BIN_OP_AND_uxn_opcodes_h_l487_c9_ecb0_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l487_c9_ecb0_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l487_c9_ecb0_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l487_c4_3e8e]
signal is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l487_c4_3e8e]
signal is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l489_c11_0cae]
signal is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0cae_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0cae_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0cae_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0cae_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l493_c13_7753]
signal UNARY_OP_NOT_uxn_opcodes_h_l493_c13_7753_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l493_c13_7753_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l493_c8_2d9b]
signal has_written_to_t_MUX_uxn_opcodes_h_l493_c8_2d9b_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l493_c8_2d9b_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l493_c8_2d9b_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l493_c8_2d9b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l493_c8_2d9b]
signal result_u8_value_MUX_uxn_opcodes_h_l493_c8_2d9b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l493_c8_2d9b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l493_c8_2d9b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l493_c8_2d9b_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l493_c8_2d9b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_2d9b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_2d9b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_2d9b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_2d9b_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l493_c8_2d9b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_2d9b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_2d9b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_2d9b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_2d9b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l493_c8_2d9b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_2d9b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_2d9b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_2d9b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_2d9b_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l493_c8_2d9b]
signal current_dei_phase_MUX_uxn_opcodes_h_l493_c8_2d9b_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l493_c8_2d9b_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l493_c8_2d9b_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l493_c8_2d9b_return_output : unsigned(7 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l493_c8_2d9b]
signal has_written_to_n_MUX_uxn_opcodes_h_l493_c8_2d9b_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l493_c8_2d9b_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l493_c8_2d9b_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l493_c8_2d9b_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l500_c13_1cb7]
signal UNARY_OP_NOT_uxn_opcodes_h_l500_c13_1cb7_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l500_c13_1cb7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l500_c8_5bce]
signal result_u8_value_MUX_uxn_opcodes_h_l500_c8_5bce_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l500_c8_5bce_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l500_c8_5bce_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l500_c8_5bce_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l500_c8_5bce]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_5bce_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_5bce_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_5bce_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_5bce_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l500_c8_5bce]
signal result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_5bce_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_5bce_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_5bce_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_5bce_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l500_c8_5bce]
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_5bce_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_5bce_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_5bce_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_5bce_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l500_c8_5bce]
signal has_written_to_n_MUX_uxn_opcodes_h_l500_c8_5bce_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l500_c8_5bce_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l500_c8_5bce_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l500_c8_5bce_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l482_l487_DUPLICATE_9185
signal UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l482_l487_DUPLICATE_9185_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l482_l487_DUPLICATE_9185_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_bcca( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned;
 ref_toks_11 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.device_ram_address := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.is_vram_write := ref_toks_8;
      base.u8_value := ref_toks_9;
      base.stack_address_sp_offset := ref_toks_10;
      base.is_device_ram_write := ref_toks_11;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l455_c6_9525
BIN_OP_EQ_uxn_opcodes_h_l455_c6_9525 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l455_c6_9525_left,
BIN_OP_EQ_uxn_opcodes_h_l455_c6_9525_right,
BIN_OP_EQ_uxn_opcodes_h_l455_c6_9525_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_b19f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_b19f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_b19f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_b19f_return_output);

-- dei_param_MUX_uxn_opcodes_h_l455_c2_ea0e
dei_param_MUX_uxn_opcodes_h_l455_c2_ea0e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l455_c2_ea0e_cond,
dei_param_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue,
dei_param_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse,
dei_param_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l455_c2_ea0e
has_written_to_t_MUX_uxn_opcodes_h_l455_c2_ea0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l455_c2_ea0e_cond,
has_written_to_t_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l455_c2_ea0e
device_in_result_MUX_uxn_opcodes_h_l455_c2_ea0e : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l455_c2_ea0e_cond,
device_in_result_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue,
device_in_result_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse,
device_in_result_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output);

-- t8_MUX_uxn_opcodes_h_l455_c2_ea0e
t8_MUX_uxn_opcodes_h_l455_c2_ea0e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l455_c2_ea0e_cond,
t8_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue,
t8_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse,
t8_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e
is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_ea0e
result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_ea0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_ea0e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_ea0e
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_ea0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_ea0e_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e
result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_ea0e
result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_ea0e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_ea0e_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_ea0e
result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_ea0e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_ea0e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_ea0e
result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_ea0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_ea0e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_ea0e
result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_ea0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_ea0e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_ea0e
result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_ea0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l455_c2_ea0e
result_u8_value_MUX_uxn_opcodes_h_l455_c2_ea0e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l455_c2_ea0e_cond,
result_u8_value_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_ea0e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_ea0e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_ea0e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e
result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l455_c2_ea0e
current_dei_phase_MUX_uxn_opcodes_h_l455_c2_ea0e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l455_c2_ea0e_cond,
current_dei_phase_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l455_c2_ea0e
has_written_to_n_MUX_uxn_opcodes_h_l455_c2_ea0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l455_c2_ea0e_cond,
has_written_to_n_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e
is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l475_c11_7afe
BIN_OP_EQ_uxn_opcodes_h_l475_c11_7afe : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l475_c11_7afe_left,
BIN_OP_EQ_uxn_opcodes_h_l475_c11_7afe_right,
BIN_OP_EQ_uxn_opcodes_h_l475_c11_7afe_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_59b9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_59b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_59b9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_59b9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_59b9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_59b9_return_output);

-- dei_param_MUX_uxn_opcodes_h_l475_c7_b19f
dei_param_MUX_uxn_opcodes_h_l475_c7_b19f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l475_c7_b19f_cond,
dei_param_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue,
dei_param_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse,
dei_param_MUX_uxn_opcodes_h_l475_c7_b19f_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l475_c7_b19f
has_written_to_t_MUX_uxn_opcodes_h_l475_c7_b19f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l475_c7_b19f_cond,
has_written_to_t_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l475_c7_b19f_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l475_c7_b19f
device_in_result_MUX_uxn_opcodes_h_l475_c7_b19f : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l475_c7_b19f_cond,
device_in_result_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue,
device_in_result_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse,
device_in_result_MUX_uxn_opcodes_h_l475_c7_b19f_return_output);

-- t8_MUX_uxn_opcodes_h_l475_c7_b19f
t8_MUX_uxn_opcodes_h_l475_c7_b19f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l475_c7_b19f_cond,
t8_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue,
t8_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse,
t8_MUX_uxn_opcodes_h_l475_c7_b19f_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f
is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_b19f
result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_b19f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_b19f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_b19f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_b19f
result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_b19f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_b19f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_b19f_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_b19f
result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_b19f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_b19f_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_b19f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_b19f
result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_b19f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_b19f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_b19f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_b19f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_b19f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_b19f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_b19f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l475_c7_b19f
result_u8_value_MUX_uxn_opcodes_h_l475_c7_b19f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l475_c7_b19f_cond,
result_u8_value_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l475_c7_b19f_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l475_c7_b19f
current_dei_phase_MUX_uxn_opcodes_h_l475_c7_b19f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l475_c7_b19f_cond,
current_dei_phase_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l475_c7_b19f_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l475_c7_b19f
has_written_to_n_MUX_uxn_opcodes_h_l475_c7_b19f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l475_c7_b19f_cond,
has_written_to_n_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l475_c7_b19f_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f
is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f_return_output);

-- sp_relative_shift_uxn_opcodes_h_l476_c30_fe7b
sp_relative_shift_uxn_opcodes_h_l476_c30_fe7b : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l476_c30_fe7b_ins,
sp_relative_shift_uxn_opcodes_h_l476_c30_fe7b_x,
sp_relative_shift_uxn_opcodes_h_l476_c30_fe7b_y,
sp_relative_shift_uxn_opcodes_h_l476_c30_fe7b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l480_c9_db30
BIN_OP_EQ_uxn_opcodes_h_l480_c9_db30 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l480_c9_db30_left,
BIN_OP_EQ_uxn_opcodes_h_l480_c9_db30_right,
BIN_OP_EQ_uxn_opcodes_h_l480_c9_db30_return_output);

-- MUX_uxn_opcodes_h_l480_c9_271b
MUX_uxn_opcodes_h_l480_c9_271b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l480_c9_271b_cond,
MUX_uxn_opcodes_h_l480_c9_271b_iftrue,
MUX_uxn_opcodes_h_l480_c9_271b_iffalse,
MUX_uxn_opcodes_h_l480_c9_271b_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l481_c35_3087
BIN_OP_PLUS_uxn_opcodes_h_l481_c35_3087 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l481_c35_3087_left,
BIN_OP_PLUS_uxn_opcodes_h_l481_c35_3087_right,
BIN_OP_PLUS_uxn_opcodes_h_l481_c35_3087_return_output);

-- MUX_uxn_opcodes_h_l481_c15_7f1f
MUX_uxn_opcodes_h_l481_c15_7f1f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l481_c15_7f1f_cond,
MUX_uxn_opcodes_h_l481_c15_7f1f_iftrue,
MUX_uxn_opcodes_h_l481_c15_7f1f_iffalse,
MUX_uxn_opcodes_h_l481_c15_7f1f_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l482_c49_9d08
UNARY_OP_NOT_uxn_opcodes_h_l482_c49_9d08 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l482_c49_9d08_expr,
UNARY_OP_NOT_uxn_opcodes_h_l482_c49_9d08_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l482_c29_f1e5
BIN_OP_AND_uxn_opcodes_h_l482_c29_f1e5 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l482_c29_f1e5_left,
BIN_OP_AND_uxn_opcodes_h_l482_c29_f1e5_right,
BIN_OP_AND_uxn_opcodes_h_l482_c29_f1e5_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l482_c8_d82a
BIN_OP_OR_uxn_opcodes_h_l482_c8_d82a : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l482_c8_d82a_left,
BIN_OP_OR_uxn_opcodes_h_l482_c8_d82a_right,
BIN_OP_OR_uxn_opcodes_h_l482_c8_d82a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_08b4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_08b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_08b4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_08b4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_08b4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_08b4_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l482_c3_624d
has_written_to_t_MUX_uxn_opcodes_h_l482_c3_624d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l482_c3_624d_cond,
has_written_to_t_MUX_uxn_opcodes_h_l482_c3_624d_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l482_c3_624d_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l482_c3_624d_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l482_c3_624d
device_in_result_MUX_uxn_opcodes_h_l482_c3_624d : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l482_c3_624d_cond,
device_in_result_MUX_uxn_opcodes_h_l482_c3_624d_iftrue,
device_in_result_MUX_uxn_opcodes_h_l482_c3_624d_iffalse,
device_in_result_MUX_uxn_opcodes_h_l482_c3_624d_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_624d
is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_624d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_624d_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_624d_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_624d_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_624d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_624d
result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_624d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_624d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_624d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_624d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_624d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_624d
result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_624d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_624d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_624d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_624d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_624d_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_624d
result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_624d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_624d_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_624d_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_624d_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_624d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_624d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_624d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_624d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_624d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_624d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_624d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l482_c3_624d
result_u8_value_MUX_uxn_opcodes_h_l482_c3_624d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l482_c3_624d_cond,
result_u8_value_MUX_uxn_opcodes_h_l482_c3_624d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l482_c3_624d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l482_c3_624d_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l482_c3_624d
current_dei_phase_MUX_uxn_opcodes_h_l482_c3_624d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l482_c3_624d_cond,
current_dei_phase_MUX_uxn_opcodes_h_l482_c3_624d_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l482_c3_624d_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l482_c3_624d_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l482_c3_624d
has_written_to_n_MUX_uxn_opcodes_h_l482_c3_624d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l482_c3_624d_cond,
has_written_to_n_MUX_uxn_opcodes_h_l482_c3_624d_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l482_c3_624d_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l482_c3_624d_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_624d
is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_624d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_624d_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_624d_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_624d_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_624d_return_output);

-- device_in_uxn_opcodes_h_l483_c23_bd44
device_in_uxn_opcodes_h_l483_c23_bd44 : entity work.device_in_0CLK_85463cfa port map (
clk,
device_in_uxn_opcodes_h_l483_c23_bd44_CLOCK_ENABLE,
device_in_uxn_opcodes_h_l483_c23_bd44_device_address,
device_in_uxn_opcodes_h_l483_c23_bd44_phase,
device_in_uxn_opcodes_h_l483_c23_bd44_previous_device_ram_read,
device_in_uxn_opcodes_h_l483_c23_bd44_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l486_c4_3413
BIN_OP_PLUS_uxn_opcodes_h_l486_c4_3413 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l486_c4_3413_left,
BIN_OP_PLUS_uxn_opcodes_h_l486_c4_3413_right,
BIN_OP_PLUS_uxn_opcodes_h_l486_c4_3413_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l487_c9_ecb0
BIN_OP_AND_uxn_opcodes_h_l487_c9_ecb0 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l487_c9_ecb0_left,
BIN_OP_AND_uxn_opcodes_h_l487_c9_ecb0_right,
BIN_OP_AND_uxn_opcodes_h_l487_c9_ecb0_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e
is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e
is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0cae
is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0cae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0cae_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0cae_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0cae_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0cae_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l493_c13_7753
UNARY_OP_NOT_uxn_opcodes_h_l493_c13_7753 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l493_c13_7753_expr,
UNARY_OP_NOT_uxn_opcodes_h_l493_c13_7753_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l493_c8_2d9b
has_written_to_t_MUX_uxn_opcodes_h_l493_c8_2d9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l493_c8_2d9b_cond,
has_written_to_t_MUX_uxn_opcodes_h_l493_c8_2d9b_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l493_c8_2d9b_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l493_c8_2d9b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l493_c8_2d9b
result_u8_value_MUX_uxn_opcodes_h_l493_c8_2d9b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l493_c8_2d9b_cond,
result_u8_value_MUX_uxn_opcodes_h_l493_c8_2d9b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l493_c8_2d9b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l493_c8_2d9b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_2d9b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_2d9b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_2d9b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_2d9b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_2d9b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_2d9b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_2d9b
result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_2d9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_2d9b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_2d9b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_2d9b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_2d9b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_2d9b
result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_2d9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_2d9b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_2d9b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_2d9b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_2d9b_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l493_c8_2d9b
current_dei_phase_MUX_uxn_opcodes_h_l493_c8_2d9b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l493_c8_2d9b_cond,
current_dei_phase_MUX_uxn_opcodes_h_l493_c8_2d9b_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l493_c8_2d9b_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l493_c8_2d9b_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l493_c8_2d9b
has_written_to_n_MUX_uxn_opcodes_h_l493_c8_2d9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l493_c8_2d9b_cond,
has_written_to_n_MUX_uxn_opcodes_h_l493_c8_2d9b_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l493_c8_2d9b_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l493_c8_2d9b_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l500_c13_1cb7
UNARY_OP_NOT_uxn_opcodes_h_l500_c13_1cb7 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l500_c13_1cb7_expr,
UNARY_OP_NOT_uxn_opcodes_h_l500_c13_1cb7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l500_c8_5bce
result_u8_value_MUX_uxn_opcodes_h_l500_c8_5bce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l500_c8_5bce_cond,
result_u8_value_MUX_uxn_opcodes_h_l500_c8_5bce_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l500_c8_5bce_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l500_c8_5bce_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_5bce
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_5bce : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_5bce_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_5bce_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_5bce_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_5bce_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_5bce
result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_5bce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_5bce_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_5bce_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_5bce_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_5bce_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_5bce
result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_5bce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_5bce_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_5bce_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_5bce_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_5bce_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l500_c8_5bce
has_written_to_n_MUX_uxn_opcodes_h_l500_c8_5bce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l500_c8_5bce_cond,
has_written_to_n_MUX_uxn_opcodes_h_l500_c8_5bce_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l500_c8_5bce_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l500_c8_5bce_return_output);

-- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l482_l487_DUPLICATE_9185
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l482_l487_DUPLICATE_9185 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l482_l487_DUPLICATE_9185_expr,
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l482_l487_DUPLICATE_9185_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l455_c6_9525_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_b19f_return_output,
 dei_param_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output,
 device_in_result_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output,
 t8_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l475_c11_7afe_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_59b9_return_output,
 dei_param_MUX_uxn_opcodes_h_l475_c7_b19f_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l475_c7_b19f_return_output,
 device_in_result_MUX_uxn_opcodes_h_l475_c7_b19f_return_output,
 t8_MUX_uxn_opcodes_h_l475_c7_b19f_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_b19f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_b19f_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_b19f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_b19f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_b19f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l475_c7_b19f_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l475_c7_b19f_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l475_c7_b19f_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f_return_output,
 sp_relative_shift_uxn_opcodes_h_l476_c30_fe7b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l480_c9_db30_return_output,
 MUX_uxn_opcodes_h_l480_c9_271b_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l481_c35_3087_return_output,
 MUX_uxn_opcodes_h_l481_c15_7f1f_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l482_c49_9d08_return_output,
 BIN_OP_AND_uxn_opcodes_h_l482_c29_f1e5_return_output,
 BIN_OP_OR_uxn_opcodes_h_l482_c8_d82a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_08b4_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l482_c3_624d_return_output,
 device_in_result_MUX_uxn_opcodes_h_l482_c3_624d_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_624d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_624d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_624d_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_624d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_624d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l482_c3_624d_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l482_c3_624d_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l482_c3_624d_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_624d_return_output,
 device_in_uxn_opcodes_h_l483_c23_bd44_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l486_c4_3413_return_output,
 BIN_OP_AND_uxn_opcodes_h_l487_c9_ecb0_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0cae_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l493_c13_7753_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l493_c8_2d9b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l493_c8_2d9b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_2d9b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_2d9b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_2d9b_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l493_c8_2d9b_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l493_c8_2d9b_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l500_c13_1cb7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l500_c8_5bce_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_5bce_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_5bce_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_5bce_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l500_c8_5bce_return_output,
 UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l482_l487_DUPLICATE_9185_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_9525_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_9525_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_9525_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_b19f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_b19f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l475_c7_b19f_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l455_c2_ea0e_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l475_c7_b19f_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l455_c2_ea0e_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue : device_in_result_t;
 variable VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l455_c2_ea0e_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l475_c7_b19f_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l455_c2_ea0e_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l475_c7_b19f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l455_c2_ea0e_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_b19f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_ea0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l455_c2_ea0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_ea0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l455_c2_ea0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_b19f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_ea0e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l464_c3_a520 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_b19f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_ea0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_b19f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_ea0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l455_c2_ea0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_ea0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l455_c2_ea0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c7_b19f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l455_c2_ea0e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l470_c3_85d2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_b19f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_ea0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l455_c2_ea0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l463_c3_5fcd : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c7_b19f_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l455_c2_ea0e_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l475_c7_b19f_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l455_c2_ea0e_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_7afe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_7afe_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_7afe_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_59b9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_59b9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_59b9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_59b9_iffalse : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l475_c7_b19f_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l482_c3_624d_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l475_c7_b19f_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l482_c3_624d_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l475_c7_b19f_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l475_c7_b19f_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_624d_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_624d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_b19f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_624d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_b19f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_624d_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_b19f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l479_c3_1aeb : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_b19f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_624d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_b19f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l482_c3_624d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c7_b19f_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l482_c3_624d_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c7_b19f_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l482_c3_624d_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l475_c7_b19f_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_624d_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l476_c30_fe7b_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l476_c30_fe7b_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l476_c30_fe7b_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l476_c30_fe7b_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l480_c9_271b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c9_db30_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c9_db30_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c9_db30_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l480_c9_271b_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l480_c9_271b_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l480_c9_271b_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l481_c15_7f1f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l481_c15_7f1f_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l481_c15_7f1f_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l481_c35_3087_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l481_c35_3087_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l481_c35_3087_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l481_c15_7f1f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l482_c8_d82a_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l482_c29_f1e5_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l482_c49_9d08_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l482_c49_9d08_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l482_c29_f1e5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l482_c29_f1e5_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l482_c8_d82a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l482_c8_d82a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_08b4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_08b4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_08b4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_08b4_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l482_c3_624d_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l482_c3_624d_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l493_c8_2d9b_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l482_c3_624d_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l482_c3_624d_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l482_c3_624d_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l482_c3_624d_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_624d_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_624d_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_624d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_624d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_624d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_2d9b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_624d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_624d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_624d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_2d9b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_624d_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_624d_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_624d_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_624d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_624d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_624d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_2d9b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_624d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l482_c3_624d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l482_c3_624d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l493_c8_2d9b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l482_c3_624d_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l482_c3_624d_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l486_c4_3ab9 : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l482_c3_624d_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l493_c8_2d9b_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l482_c3_624d_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l482_c3_624d_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l482_c3_624d_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l493_c8_2d9b_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l482_c3_624d_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_624d_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_624d_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_624d_cond : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l483_c23_bd44_device_address : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l483_c23_bd44_phase : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l483_c23_bd44_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l483_c23_bd44_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l483_c23_bd44_return_output : device_in_result_t;
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l484_c32_8382_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l486_c4_3413_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l486_c4_3413_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l486_c4_3413_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l487_c9_ecb0_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l487_c9_ecb0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l487_c9_ecb0_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0cae_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0cae_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0cae_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0cae_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l493_c13_7753_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l493_c13_7753_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l493_c8_2d9b_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l493_c8_2d9b_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l493_c8_2d9b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l493_c8_2d9b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l493_c8_2d9b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c8_5bce_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l493_c8_2d9b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_2d9b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l496_c4_dab3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_2d9b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_5bce_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_2d9b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_2d9b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_2d9b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_5bce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_2d9b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_2d9b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_2d9b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_5bce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_2d9b_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l493_c8_2d9b_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l494_c4_c677 : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l493_c8_2d9b_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l493_c8_2d9b_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l493_c8_2d9b_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l493_c8_2d9b_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l500_c8_5bce_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l493_c8_2d9b_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l500_c13_1cb7_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l500_c13_1cb7_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c8_5bce_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c8_5bce_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c8_5bce_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_5bce_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l501_c4_0582 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_5bce_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_5bce_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_5bce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_5bce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_5bce_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_5bce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_5bce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_5bce_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l500_c8_5bce_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l500_c8_5bce_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l500_c8_5bce_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l455_l475_l482_DUPLICATE_c712_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l455_l475_l500_l482_DUPLICATE_f5ab_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l493_l475_l500_l482_DUPLICATE_535d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l475_l500_DUPLICATE_e0f2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l475_l500_l482_DUPLICATE_fb78_return_output : unsigned(3 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l482_l487_DUPLICATE_9185_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l482_l487_DUPLICATE_9185_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l489_l487_DUPLICATE_c444_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l497_l502_DUPLICATE_d934_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_bcca_uxn_opcodes_h_l511_l449_DUPLICATE_f6ec_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c9_db30_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_2d9b_iftrue := to_unsigned(1, 1);
     VAR_current_dei_phase_uxn_opcodes_h_l494_c4_c677 := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l493_c8_2d9b_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l494_c4_c677;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_5bce_iffalse := to_unsigned(0, 1);
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l476_c30_fe7b_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l479_c3_1aeb := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse := VAR_result_sp_relative_shift_uxn_opcodes_h_l479_c3_1aeb;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l464_c3_a520 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l464_c3_a520;
     VAR_current_dei_phase_uxn_opcodes_h_l463_c3_5fcd := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l463_c3_5fcd;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l486_c4_3413_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_59b9_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l501_c4_0582 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_5bce_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l501_c4_0582;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l496_c4_dab3 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_2d9b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l496_c4_dab3;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l481_c35_3087_right := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue := to_unsigned(0, 1);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue := to_unsigned(0, 1);
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l500_c8_5bce_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_08b4_iffalse := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l476_c30_fe7b_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_7afe_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_624d_iftrue := to_unsigned(0, 1);
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue := to_unsigned(0, 1);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l493_c8_2d9b_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l470_c3_85d2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l470_c3_85d2;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_9525_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_5bce_iffalse := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue := to_unsigned(0, 1);
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue := to_unsigned(0, 1);
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0cae_iftrue := to_unsigned(1, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l486_c4_3413_left := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l493_c8_2d9b_iffalse := current_dei_phase;
     VAR_device_in_uxn_opcodes_h_l483_c23_bd44_phase := current_dei_phase;
     VAR_dei_param_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue := dei_param;
     VAR_dei_param_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue := dei_param;
     VAR_device_in_result_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l482_c3_624d_iffalse := device_in_result;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l500_c13_1cb7_expr := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l482_c3_624d_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l493_c8_2d9b_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l500_c8_5bce_iffalse := has_written_to_n;
     VAR_BIN_OP_AND_uxn_opcodes_h_l482_c29_f1e5_left := has_written_to_t;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l493_c13_7753_expr := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l482_c3_624d_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l493_c8_2d9b_iffalse := has_written_to_t;
     VAR_sp_relative_shift_uxn_opcodes_h_l476_c30_fe7b_ins := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l481_c15_7f1f_cond := is_first_dei_done;
     VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l482_l487_DUPLICATE_9185_expr := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_624d_iffalse := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e_iffalse := is_first_dei_done;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l482_c49_9d08_expr := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_624d_iffalse := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0cae_iffalse := is_second_dei_done;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_9525_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_7afe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c9_db30_left := VAR_phase;
     VAR_device_in_uxn_opcodes_h_l483_c23_bd44_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_MUX_uxn_opcodes_h_l480_c9_271b_iftrue := VAR_previous_stack_read;
     VAR_MUX_uxn_opcodes_h_l480_c9_271b_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l480_c9_db30] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l480_c9_db30_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c9_db30_left;
     BIN_OP_EQ_uxn_opcodes_h_l480_c9_db30_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c9_db30_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c9_db30_return_output := BIN_OP_EQ_uxn_opcodes_h_l480_c9_db30_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l500_c13_1cb7] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l500_c13_1cb7_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l500_c13_1cb7_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l500_c13_1cb7_return_output := UNARY_OP_NOT_uxn_opcodes_h_l500_c13_1cb7_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l476_c30_fe7b] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l476_c30_fe7b_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l476_c30_fe7b_ins;
     sp_relative_shift_uxn_opcodes_h_l476_c30_fe7b_x <= VAR_sp_relative_shift_uxn_opcodes_h_l476_c30_fe7b_x;
     sp_relative_shift_uxn_opcodes_h_l476_c30_fe7b_y <= VAR_sp_relative_shift_uxn_opcodes_h_l476_c30_fe7b_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l476_c30_fe7b_return_output := sp_relative_shift_uxn_opcodes_h_l476_c30_fe7b_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l475_l500_l482_DUPLICATE_fb78 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l475_l500_l482_DUPLICATE_fb78_return_output := result.stack_address_sp_offset;

     -- device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6[uxn_opcodes_h_l455_c2_ea0e] LATENCY=0
     VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l455_c2_ea0e_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6(
     device_in_result,
     to_unsigned(0, 1));

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l455_c2_ea0e] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l455_c2_ea0e_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l497_l502_DUPLICATE_d934 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l497_l502_DUPLICATE_d934_return_output := device_in_result.dei_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l455_c6_9525] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l455_c6_9525_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_9525_left;
     BIN_OP_EQ_uxn_opcodes_h_l455_c6_9525_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_9525_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_9525_return_output := BIN_OP_EQ_uxn_opcodes_h_l455_c6_9525_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l475_c11_7afe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l475_c11_7afe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_7afe_left;
     BIN_OP_EQ_uxn_opcodes_h_l475_c11_7afe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_7afe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_7afe_return_output := BIN_OP_EQ_uxn_opcodes_h_l475_c11_7afe_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l475_l500_DUPLICATE_e0f2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l475_l500_DUPLICATE_e0f2_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l493_l475_l500_l482_DUPLICATE_535d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l493_l475_l500_l482_DUPLICATE_535d_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l455_l475_l482_DUPLICATE_c712 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l455_l475_l482_DUPLICATE_c712_return_output := result.device_ram_address;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l455_c2_ea0e] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l455_c2_ea0e_return_output := result.is_pc_updated;

     -- result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l455_c2_ea0e] LATENCY=0
     VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l455_c2_ea0e_return_output := result.is_device_ram_write;

     -- UNARY_OP_NOT[uxn_opcodes_h_l482_c49_9d08] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l482_c49_9d08_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l482_c49_9d08_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l482_c49_9d08_return_output := UNARY_OP_NOT_uxn_opcodes_h_l482_c49_9d08_return_output;

     -- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l482_l487_DUPLICATE_9185 LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l482_l487_DUPLICATE_9185_expr <= VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l482_l487_DUPLICATE_9185_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l482_l487_DUPLICATE_9185_return_output := UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l482_l487_DUPLICATE_9185_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l455_l475_l500_l482_DUPLICATE_f5ab LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l455_l475_l500_l482_DUPLICATE_f5ab_return_output := result.u8_value;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l455_c2_ea0e] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l455_c2_ea0e_return_output := result.is_stack_index_flipped;

     -- UNARY_OP_NOT[uxn_opcodes_h_l493_c13_7753] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l493_c13_7753_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l493_c13_7753_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l493_c13_7753_return_output := UNARY_OP_NOT_uxn_opcodes_h_l493_c13_7753_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l486_c4_3413] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l486_c4_3413_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l486_c4_3413_left;
     BIN_OP_PLUS_uxn_opcodes_h_l486_c4_3413_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l486_c4_3413_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l486_c4_3413_return_output := BIN_OP_PLUS_uxn_opcodes_h_l486_c4_3413_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l455_c2_ea0e] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l455_c2_ea0e_return_output := result.is_vram_write;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_b19f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_9525_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l455_c2_ea0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_9525_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l455_c2_ea0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_9525_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l455_c2_ea0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_9525_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l455_c2_ea0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_9525_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l455_c2_ea0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_9525_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_9525_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_9525_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_ea0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_9525_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_9525_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_ea0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_9525_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_ea0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_9525_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_9525_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_ea0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_9525_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_ea0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_9525_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_9525_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_ea0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_9525_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_ea0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_9525_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l455_c2_ea0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_9525_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l455_c2_ea0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_9525_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_59b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_7afe_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c7_b19f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_7afe_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l475_c7_b19f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_7afe_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l475_c7_b19f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_7afe_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l475_c7_b19f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_7afe_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l475_c7_b19f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_7afe_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_7afe_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_7afe_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_b19f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_7afe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_b19f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_7afe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_b19f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_7afe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_b19f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_7afe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_b19f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_7afe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c7_b19f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_7afe_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l475_c7_b19f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_7afe_return_output;
     VAR_MUX_uxn_opcodes_h_l480_c9_271b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c9_db30_return_output;
     VAR_current_dei_phase_uxn_opcodes_h_l486_c4_3ab9 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l486_c4_3413_return_output, 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l493_l475_l500_l482_DUPLICATE_535d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_624d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l493_l475_l500_l482_DUPLICATE_535d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_2d9b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l493_l475_l500_l482_DUPLICATE_535d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_5bce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l493_l475_l500_l482_DUPLICATE_535d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l475_l500_DUPLICATE_e0f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_5bce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l475_l500_DUPLICATE_e0f2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l475_l500_l482_DUPLICATE_fb78_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_624d_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l475_l500_l482_DUPLICATE_fb78_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_5bce_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l475_l500_l482_DUPLICATE_fb78_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l493_c8_2d9b_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l497_l502_DUPLICATE_d934_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c8_5bce_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l497_l502_DUPLICATE_d934_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l455_l475_l482_DUPLICATE_c712_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l455_l475_l482_DUPLICATE_c712_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_624d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l455_l475_l482_DUPLICATE_c712_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l455_l475_l500_l482_DUPLICATE_f5ab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l455_l475_l500_l482_DUPLICATE_f5ab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l482_c3_624d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l455_l475_l500_l482_DUPLICATE_f5ab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c8_5bce_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l455_l475_l500_l482_DUPLICATE_f5ab_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l482_c29_f1e5_right := VAR_UNARY_OP_NOT_uxn_opcodes_h_l482_c49_9d08_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l493_c8_2d9b_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l493_c13_7753_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l493_c8_2d9b_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l493_c13_7753_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l493_c8_2d9b_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l493_c13_7753_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_2d9b_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l493_c13_7753_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_2d9b_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l493_c13_7753_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_2d9b_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l493_c13_7753_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l493_c8_2d9b_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l493_c13_7753_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l500_c8_5bce_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l500_c13_1cb7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_5bce_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l500_c13_1cb7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_5bce_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l500_c13_1cb7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_5bce_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l500_c13_1cb7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c8_5bce_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l500_c13_1cb7_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l487_c9_ecb0_left := VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l482_l487_DUPLICATE_9185_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l482_c8_d82a_left := VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l482_l487_DUPLICATE_9185_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue := VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l455_c2_ea0e_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse := VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l455_c2_ea0e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l455_c2_ea0e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l455_c2_ea0e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l455_c2_ea0e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l455_c2_ea0e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l476_c30_fe7b_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l482_c3_624d_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l486_c4_3ab9;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l500_c8_5bce] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_5bce_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_5bce_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_5bce_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_5bce_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_5bce_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_5bce_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_5bce_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_5bce_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l482_c29_f1e5] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l482_c29_f1e5_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l482_c29_f1e5_left;
     BIN_OP_AND_uxn_opcodes_h_l482_c29_f1e5_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l482_c29_f1e5_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l482_c29_f1e5_return_output := BIN_OP_AND_uxn_opcodes_h_l482_c29_f1e5_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l493_c8_2d9b] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l493_c8_2d9b_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l493_c8_2d9b_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l493_c8_2d9b_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l493_c8_2d9b_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l493_c8_2d9b_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l493_c8_2d9b_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l493_c8_2d9b_return_output := current_dei_phase_MUX_uxn_opcodes_h_l493_c8_2d9b_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l455_c2_ea0e] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_ea0e_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_ea0e_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l455_c2_ea0e] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l455_c2_ea0e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l500_c8_5bce] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_5bce_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_5bce_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_5bce_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_5bce_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_5bce_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_5bce_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_5bce_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_5bce_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l500_c8_5bce] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l500_c8_5bce_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c8_5bce_cond;
     result_u8_value_MUX_uxn_opcodes_h_l500_c8_5bce_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c8_5bce_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l500_c8_5bce_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c8_5bce_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c8_5bce_return_output := result_u8_value_MUX_uxn_opcodes_h_l500_c8_5bce_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l475_c7_b19f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_b19f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_b19f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_b19f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_b19f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l475_c7_b19f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_b19f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_b19f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_b19f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_b19f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l455_c2_ea0e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_ea0e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_ea0e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output;

     -- MUX[uxn_opcodes_h_l480_c9_271b] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l480_c9_271b_cond <= VAR_MUX_uxn_opcodes_h_l480_c9_271b_cond;
     MUX_uxn_opcodes_h_l480_c9_271b_iftrue <= VAR_MUX_uxn_opcodes_h_l480_c9_271b_iftrue;
     MUX_uxn_opcodes_h_l480_c9_271b_iffalse <= VAR_MUX_uxn_opcodes_h_l480_c9_271b_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l480_c9_271b_return_output := MUX_uxn_opcodes_h_l480_c9_271b_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l455_c2_ea0e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l493_c8_2d9b] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l493_c8_2d9b_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l493_c8_2d9b_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l493_c8_2d9b_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l493_c8_2d9b_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l493_c8_2d9b_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l493_c8_2d9b_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l493_c8_2d9b_return_output := has_written_to_t_MUX_uxn_opcodes_h_l493_c8_2d9b_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l500_c8_5bce] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l500_c8_5bce_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l500_c8_5bce_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l500_c8_5bce_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l500_c8_5bce_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l500_c8_5bce_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l500_c8_5bce_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l500_c8_5bce_return_output := has_written_to_n_MUX_uxn_opcodes_h_l500_c8_5bce_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l500_c8_5bce] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_5bce_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_5bce_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_5bce_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_5bce_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_5bce_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_5bce_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_5bce_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_5bce_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_opcodes_h_l482_c8_d82a_right := VAR_BIN_OP_AND_uxn_opcodes_h_l482_c29_f1e5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_59b9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_b19f_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l481_c35_3087_left := VAR_MUX_uxn_opcodes_h_l480_c9_271b_return_output;
     VAR_MUX_uxn_opcodes_h_l481_c15_7f1f_iffalse := VAR_MUX_uxn_opcodes_h_l480_c9_271b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse := VAR_MUX_uxn_opcodes_h_l480_c9_271b_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l482_c3_624d_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l493_c8_2d9b_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l493_c8_2d9b_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l500_c8_5bce_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l482_c3_624d_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l493_c8_2d9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_2d9b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_5bce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_2d9b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_5bce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_b19f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_2d9b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_5bce_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l493_c8_2d9b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c8_5bce_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l493_c8_2d9b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_2d9b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_2d9b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_2d9b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_2d9b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_2d9b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_2d9b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_2d9b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_2d9b_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l493_c8_2d9b] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l493_c8_2d9b_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l493_c8_2d9b_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l493_c8_2d9b_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l493_c8_2d9b_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l493_c8_2d9b_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l493_c8_2d9b_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l493_c8_2d9b_return_output := has_written_to_n_MUX_uxn_opcodes_h_l493_c8_2d9b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l455_c2_ea0e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_ea0e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_ea0e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l482_c8_d82a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l482_c8_d82a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l482_c8_d82a_left;
     BIN_OP_OR_uxn_opcodes_h_l482_c8_d82a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l482_c8_d82a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l482_c8_d82a_return_output := BIN_OP_OR_uxn_opcodes_h_l482_c8_d82a_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l481_c35_3087] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l481_c35_3087_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l481_c35_3087_left;
     BIN_OP_PLUS_uxn_opcodes_h_l481_c35_3087_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l481_c35_3087_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l481_c35_3087_return_output := BIN_OP_PLUS_uxn_opcodes_h_l481_c35_3087_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l478_c1_59b9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_59b9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_59b9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_59b9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_59b9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_59b9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_59b9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_59b9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_59b9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l493_c8_2d9b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l493_c8_2d9b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l493_c8_2d9b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l493_c8_2d9b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l493_c8_2d9b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l493_c8_2d9b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l493_c8_2d9b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l493_c8_2d9b_return_output := result_u8_value_MUX_uxn_opcodes_h_l493_c8_2d9b_return_output;

     -- t8_MUX[uxn_opcodes_h_l475_c7_b19f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l475_c7_b19f_cond <= VAR_t8_MUX_uxn_opcodes_h_l475_c7_b19f_cond;
     t8_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue;
     t8_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l475_c7_b19f_return_output := t8_MUX_uxn_opcodes_h_l475_c7_b19f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l493_c8_2d9b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_2d9b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_2d9b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_2d9b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_2d9b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_2d9b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_2d9b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_2d9b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_2d9b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l493_c8_2d9b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_2d9b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_2d9b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_2d9b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_2d9b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_2d9b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_2d9b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_2d9b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_2d9b_return_output;

     -- Submodule level 3
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_08b4_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l482_c8_d82a_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l482_c3_624d_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l482_c8_d82a_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l482_c3_624d_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l482_c8_d82a_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l482_c3_624d_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l482_c8_d82a_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l482_c3_624d_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l482_c8_d82a_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_624d_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l482_c8_d82a_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_624d_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l482_c8_d82a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_624d_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l482_c8_d82a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_624d_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l482_c8_d82a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_624d_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l482_c8_d82a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_624d_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l482_c8_d82a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l482_c3_624d_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l482_c8_d82a_return_output;
     VAR_MUX_uxn_opcodes_h_l481_c15_7f1f_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l481_c35_3087_return_output, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_08b4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_59b9_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l482_c3_624d_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l493_c8_2d9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_624d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_2d9b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_624d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_2d9b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_624d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_2d9b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l482_c3_624d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l493_c8_2d9b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse := VAR_t8_MUX_uxn_opcodes_h_l475_c7_b19f_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l482_c3_624d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_624d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_624d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_624d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_624d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_624d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_624d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_624d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_624d_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l482_c3_624d] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l482_c3_624d_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l482_c3_624d_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l482_c3_624d_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l482_c3_624d_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l482_c3_624d_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l482_c3_624d_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l482_c3_624d_return_output := has_written_to_n_MUX_uxn_opcodes_h_l482_c3_624d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l482_c1_08b4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_08b4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_08b4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_08b4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_08b4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_08b4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_08b4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_08b4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_08b4_return_output;

     -- t8_MUX[uxn_opcodes_h_l455_c2_ea0e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l455_c2_ea0e_cond <= VAR_t8_MUX_uxn_opcodes_h_l455_c2_ea0e_cond;
     t8_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue;
     t8_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output := t8_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l482_c3_624d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_624d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_624d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_624d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_624d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_624d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_624d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_624d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_624d_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l482_c3_624d] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l482_c3_624d_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l482_c3_624d_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l482_c3_624d_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l482_c3_624d_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l482_c3_624d_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l482_c3_624d_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l482_c3_624d_return_output := has_written_to_t_MUX_uxn_opcodes_h_l482_c3_624d_return_output;

     -- MUX[uxn_opcodes_h_l481_c15_7f1f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l481_c15_7f1f_cond <= VAR_MUX_uxn_opcodes_h_l481_c15_7f1f_cond;
     MUX_uxn_opcodes_h_l481_c15_7f1f_iftrue <= VAR_MUX_uxn_opcodes_h_l481_c15_7f1f_iftrue;
     MUX_uxn_opcodes_h_l481_c15_7f1f_iffalse <= VAR_MUX_uxn_opcodes_h_l481_c15_7f1f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l481_c15_7f1f_return_output := MUX_uxn_opcodes_h_l481_c15_7f1f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l482_c3_624d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_624d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_624d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_624d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_624d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_624d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_624d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_624d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_624d_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l482_c3_624d] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l482_c3_624d_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l482_c3_624d_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l482_c3_624d_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l482_c3_624d_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l482_c3_624d_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l482_c3_624d_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l482_c3_624d_return_output := current_dei_phase_MUX_uxn_opcodes_h_l482_c3_624d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l482_c3_624d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l482_c3_624d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l482_c3_624d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l482_c3_624d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l482_c3_624d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l482_c3_624d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l482_c3_624d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l482_c3_624d_return_output := result_u8_value_MUX_uxn_opcodes_h_l482_c3_624d_return_output;

     -- Submodule level 4
     VAR_dei_param_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse := VAR_MUX_uxn_opcodes_h_l481_c15_7f1f_return_output;
     VAR_device_in_uxn_opcodes_h_l483_c23_bd44_device_address := VAR_MUX_uxn_opcodes_h_l481_c15_7f1f_return_output;
     VAR_device_in_uxn_opcodes_h_l483_c23_bd44_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_08b4_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l482_c3_624d_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l482_c3_624d_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l482_c3_624d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_624d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_624d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_624d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l482_c3_624d_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output;
     -- has_written_to_n_MUX[uxn_opcodes_h_l475_c7_b19f] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l475_c7_b19f_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l475_c7_b19f_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l475_c7_b19f_return_output := has_written_to_n_MUX_uxn_opcodes_h_l475_c7_b19f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l475_c7_b19f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_b19f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_b19f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_b19f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_b19f_return_output;

     -- device_in[uxn_opcodes_h_l483_c23_bd44] LATENCY=0
     -- Clock enable
     device_in_uxn_opcodes_h_l483_c23_bd44_CLOCK_ENABLE <= VAR_device_in_uxn_opcodes_h_l483_c23_bd44_CLOCK_ENABLE;
     -- Inputs
     device_in_uxn_opcodes_h_l483_c23_bd44_device_address <= VAR_device_in_uxn_opcodes_h_l483_c23_bd44_device_address;
     device_in_uxn_opcodes_h_l483_c23_bd44_phase <= VAR_device_in_uxn_opcodes_h_l483_c23_bd44_phase;
     device_in_uxn_opcodes_h_l483_c23_bd44_previous_device_ram_read <= VAR_device_in_uxn_opcodes_h_l483_c23_bd44_previous_device_ram_read;
     -- Outputs
     VAR_device_in_uxn_opcodes_h_l483_c23_bd44_return_output := device_in_uxn_opcodes_h_l483_c23_bd44_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l475_c7_b19f] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l475_c7_b19f_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c7_b19f_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c7_b19f_return_output := current_dei_phase_MUX_uxn_opcodes_h_l475_c7_b19f_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l475_c7_b19f] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l475_c7_b19f_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l475_c7_b19f_cond;
     dei_param_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue;
     dei_param_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l475_c7_b19f_return_output := dei_param_MUX_uxn_opcodes_h_l475_c7_b19f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l475_c7_b19f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_b19f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_b19f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_b19f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_b19f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l475_c7_b19f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_b19f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_b19f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_b19f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_b19f_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l475_c7_b19f] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l475_c7_b19f_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l475_c7_b19f_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l475_c7_b19f_return_output := has_written_to_t_MUX_uxn_opcodes_h_l475_c7_b19f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l475_c7_b19f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l475_c7_b19f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c7_b19f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c7_b19f_return_output := result_u8_value_MUX_uxn_opcodes_h_l475_c7_b19f_return_output;

     -- Submodule level 5
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c7_b19f_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse := VAR_dei_param_MUX_uxn_opcodes_h_l475_c7_b19f_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l482_c3_624d_iftrue := VAR_device_in_uxn_opcodes_h_l483_c23_bd44_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l475_c7_b19f_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l475_c7_b19f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_b19f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_b19f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_b19f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c7_b19f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l455_c2_ea0e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_ea0e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_ea0e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l455_c2_ea0e] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l455_c2_ea0e_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l455_c2_ea0e_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output := has_written_to_t_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l482_c3_624d] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l482_c3_624d_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l482_c3_624d_cond;
     device_in_result_MUX_uxn_opcodes_h_l482_c3_624d_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l482_c3_624d_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l482_c3_624d_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l482_c3_624d_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l482_c3_624d_return_output := device_in_result_MUX_uxn_opcodes_h_l482_c3_624d_return_output;

     -- CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d[uxn_opcodes_h_l484_c32_8382] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l484_c32_8382_return_output := VAR_device_in_uxn_opcodes_h_l483_c23_bd44_return_output.device_ram_address;

     -- has_written_to_n_MUX[uxn_opcodes_h_l455_c2_ea0e] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l455_c2_ea0e_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l455_c2_ea0e_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output := has_written_to_n_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output;

     -- CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l489_l487_DUPLICATE_c444 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l489_l487_DUPLICATE_c444_return_output := VAR_device_in_uxn_opcodes_h_l483_c23_bd44_return_output.is_dei_done;

     -- current_dei_phase_MUX[uxn_opcodes_h_l455_c2_ea0e] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l455_c2_ea0e_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l455_c2_ea0e_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output := current_dei_phase_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l455_c2_ea0e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l455_c2_ea0e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l455_c2_ea0e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output := result_u8_value_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l455_c2_ea0e] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l455_c2_ea0e_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l455_c2_ea0e_cond;
     dei_param_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue;
     dei_param_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output := dei_param_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l455_c2_ea0e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_ea0e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_ea0e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l455_c2_ea0e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_ea0e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_ea0e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output;

     -- Submodule level 6
     VAR_BIN_OP_AND_uxn_opcodes_h_l487_c9_ecb0_right := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l489_l487_DUPLICATE_c444_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0cae_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l489_l487_DUPLICATE_c444_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_624d_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l484_c32_8382_return_output;
     REG_VAR_current_dei_phase := VAR_current_dei_phase_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output;
     REG_VAR_dei_param := VAR_dei_param_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l482_c3_624d_return_output;
     REG_VAR_has_written_to_n := VAR_has_written_to_n_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output;
     REG_VAR_has_written_to_t := VAR_has_written_to_t_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l482_c3_624d] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_624d_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_624d_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_624d_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_624d_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_624d_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_624d_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_624d_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_624d_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l489_c11_0cae] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0cae_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0cae_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0cae_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0cae_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0cae_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0cae_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0cae_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0cae_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l475_c7_b19f] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l475_c7_b19f_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l475_c7_b19f_cond;
     device_in_result_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l475_c7_b19f_return_output := device_in_result_MUX_uxn_opcodes_h_l475_c7_b19f_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l487_c9_ecb0] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l487_c9_ecb0_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l487_c9_ecb0_left;
     BIN_OP_AND_uxn_opcodes_h_l487_c9_ecb0_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l487_c9_ecb0_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l487_c9_ecb0_return_output := BIN_OP_AND_uxn_opcodes_h_l487_c9_ecb0_return_output;

     -- Submodule level 7
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e_cond := VAR_BIN_OP_AND_uxn_opcodes_h_l487_c9_ecb0_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e_cond := VAR_BIN_OP_AND_uxn_opcodes_h_l487_c9_ecb0_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l475_c7_b19f_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0cae_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_624d_return_output;
     -- is_first_dei_done_MUX[uxn_opcodes_h_l487_c4_3e8e] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l455_c2_ea0e] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l455_c2_ea0e_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l455_c2_ea0e_cond;
     device_in_result_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output := device_in_result_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l487_c4_3e8e] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l475_c7_b19f] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_b19f_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_b19f_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_b19f_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_b19f_return_output;

     -- Submodule level 8
     REG_VAR_device_in_result := VAR_device_in_result_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_624d_iftrue := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_624d_iftrue := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_3e8e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_b19f_return_output;
     -- is_first_dei_done_MUX[uxn_opcodes_h_l482_c3_624d] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_624d_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_624d_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_624d_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_624d_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_624d_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_624d_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_624d_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_624d_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l455_c2_ea0e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_ea0e_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_ea0e_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l482_c3_624d] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_624d_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_624d_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_624d_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_624d_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_624d_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_624d_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_624d_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_624d_return_output;

     -- Submodule level 9
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_624d_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_624d_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_bcca_uxn_opcodes_h_l511_l449_DUPLICATE_f6ec LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_bcca_uxn_opcodes_h_l511_l449_DUPLICATE_f6ec_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_bcca(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output);

     -- is_second_dei_done_MUX[uxn_opcodes_h_l475_c7_b19f] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l475_c7_b19f] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f_return_output;

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_bcca_uxn_opcodes_h_l511_l449_DUPLICATE_f6ec_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_bcca_uxn_opcodes_h_l511_l449_DUPLICATE_f6ec_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_b19f_return_output;
     -- is_first_dei_done_MUX[uxn_opcodes_h_l455_c2_ea0e] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l455_c2_ea0e] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output;

     -- Submodule level 11
     REG_VAR_is_first_dei_done := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output;
     REG_VAR_is_second_dei_done := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_ea0e_return_output;
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
